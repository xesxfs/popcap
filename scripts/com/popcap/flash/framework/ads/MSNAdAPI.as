package com.popcap.flash.framework.ads
{
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Timer;
   
   public class MSNAdAPI extends EventDispatcher
   {
      
      public static const DEFAULT_LOAD_BROADCAST_RATE:Number = 3000;
      
      private static const MILLIS_PER_UPDATE:Number = 10;
      
      public static const DEFAULT_SCORE_BROADCAST_RATE:Number = 3000;
      
      public static const MIN_BROADCAST_RATE:Number = 1000;
       
      
      private var _loadBroadcastRate:Number = 3000;
      
      private var _score:Number = 0;
      
      private var _isPlaying:Boolean = false;
      
      private var _isLoading:Boolean = true;
      
      private var _gameTime:Number = 0;
      
      public var _isEnabled:Boolean = false;
      
      private var _loadPercent:Number = 0;
      
      private var _timer:Timer;
      
      private var _updateTime:Number = 0;
      
      private var _scoreBroadcastRate:Number = 3000;
      
      private var _numBreaks:Number = 0;
      
      public function MSNAdAPI()
      {
         super();
         this._timer = new Timer(10);
         this._timer.addEventListener(TimerEvent.TIMER,this.HandleTimer);
      }
      
      private function onGamePause(str:String) : void
      {
         var isPaused:Boolean = this.OnOffAsBoolean(str);
         this.TogglePause(isPaused);
      }
      
      private function OnOffAsBoolean(str:String) : Boolean
      {
         if(str == "on")
         {
            return true;
         }
         return false;
      }
      
      private function onCustomReturn(sXML:String = null) : void
      {
         this.DispatchAdEvent(AdAPIEvent.CUSTOM_RETURN);
      }
      
      public function CustomEvent(data:XML) : void
      {
         if(!this._isEnabled || !ExternalInterface.available)
         {
            this.DispatchAdEvent(AdAPIEvent.CUSTOM_RETURN);
            return;
         }
         var xml:String = "<data>DeluxeDownload</data>";
         ExternalInterface.call("CustomEvent",xml);
      }
      
      public function PauseBroadcast() : void
      {
         this._isPlaying = false;
      }
      
      public function GameBreak(levelCompleted:Number) : void
      {
         this._isPlaying = false;
         this._numBreaks = this._numBreaks + 1;
         if(!this._isEnabled || !ExternalInterface.available)
         {
            this._isPlaying = true;
            this.DispatchAdEvent(AdAPIEvent.GAME_CONTINUE);
            return;
         }
         var xml:* = "<data><breakpoint>" + this._numBreaks + "</breakpoint></data>";
         ExternalInterface.call("GameBreak",xml);
      }
      
      public function init() : void
      {
         var result:Boolean = false;
         this._isEnabled = true;
         this._loadBroadcastRate = DEFAULT_LOAD_BROADCAST_RATE;
         this._scoreBroadcastRate = DEFAULT_SCORE_BROADCAST_RATE;
         if(!this._isEnabled)
         {
            return;
         }
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("onGameMenu",this.onGameMenu);
            ExternalInterface.addCallback("onGameMute",this.onGameMute);
            ExternalInterface.addCallback("onMuteOn",this.onMuteOn);
            ExternalInterface.addCallback("onMuteOff",this.onMuteOff);
            ExternalInterface.addCallback("onGamePause",this.onGamePause);
            ExternalInterface.addCallback("onPauseOn",this.onPauseOn);
            ExternalInterface.addCallback("onPauseOff",this.onPauseOff);
            ExternalInterface.addCallback("onGameContinue",this.onGameContinue);
            ExternalInterface.addCallback("onGameStart",this.onGameStart);
            ExternalInterface.addCallback("onSessionStart",this.onSessionStart);
            ExternalInterface.addCallback("onCustomReturn",this.onCustomReturn);
            result = ExternalInterface.call("isProxyReady");
            if(result == true)
            {
               ExternalInterface.call("setSWFIsReady");
            }
            else
            {
               this._isEnabled = false;
            }
         }
         this._timer.start();
      }
      
      public function GameError(str:String) : void
      {
         if(!this._isEnabled || !ExternalInterface.available)
         {
            return;
         }
         ExternalInterface.call("GameError",str);
      }
      
      private function onMuteOn() : void
      {
         this.ToggleMute(true);
      }
      
      private function onPauseOff() : void
      {
         this.TogglePause(false);
      }
      
      private function onPauseOn() : void
      {
         this.TogglePause(true);
      }
      
      private function onGameMute(str:String) : void
      {
         this.ToggleMute(this.OnOffAsBoolean(str));
      }
      
      private function ToggleMute(isMuted:Boolean) : void
      {
         if(isMuted)
         {
            this.DispatchAdEvent(AdAPIEvent.MUTE);
         }
         else
         {
            this.DispatchAdEvent(AdAPIEvent.UNMUTE);
         }
      }
      
      private function onMuteOff() : void
      {
         this.ToggleMute(false);
      }
      
      private function onGameContinue(sXML:String = null) : void
      {
         this.DispatchAdEvent(AdAPIEvent.GAME_CONTINUE);
      }
      
      public function ScoreSubmit() : void
      {
         if(!this._isEnabled || !ExternalInterface.available)
         {
            return;
         }
         var xml:* = "<game><score>" + this._score + "</score><time>" + int(this._gameTime / 1000) + "</time></game>";
         ExternalInterface.call("ScoreSubmit",xml);
      }
      
      private function DispatchAdEvent(type:String) : void
      {
         var event:AdAPIEvent = new AdAPIEvent(type);
         dispatchEvent(event);
      }
      
      public function GameReady(mode:Number, level:Number) : void
      {
         this._gameTime = 0;
         if(!this._isEnabled || !ExternalInterface.available)
         {
            this._gameTime = 0;
            this._isPlaying = true;
            this.DispatchAdEvent(AdAPIEvent.GAME_START);
            return;
         }
         var xml:* = "<data><mode>" + mode + "</mode><startlevel>" + level + "</startlevel></data>";
         ExternalInterface.call("GameReady",xml);
      }
      
      public function SessionReady() : void
      {
         this._isLoading = false;
         var xml:* = "<data><percentcomplete>" + this._loadPercent + "</percentcomplete></data>";
         if(!this._isEnabled || !ExternalInterface.available)
         {
            this.DispatchAdEvent(AdAPIEvent.SESSION_START);
            return;
         }
         ExternalInterface.call("LoadBroadcast",xml);
         ExternalInterface.call("SessionReady","<data></data>");
      }
      
      public function SetLoadPercent(loadPercent:Number) : void
      {
         this._loadPercent = loadPercent < 0?Number(0):Number(loadPercent);
         this._loadPercent = this._loadPercent > 100?Number(100):Number(this._loadPercent);
         this._loadPercent = int(this._loadPercent);
      }
      
      private function TogglePause(isPaused:Boolean) : void
      {
         if(isPaused)
         {
            this.DispatchAdEvent(AdAPIEvent.PAUSE);
         }
         else
         {
            this.DispatchAdEvent(AdAPIEvent.UNPAUSE);
         }
      }
      
      private function HandleTimer(e:TimerEvent) : void
      {
         this.Update();
      }
      
      private function Update() : void
      {
         var xml:* = null;
         var isLoadBroadcastTime:* = false;
         var isTime:* = false;
         if(!this._isEnabled)
         {
            return;
         }
         this._updateTime = this._updateTime + MILLIS_PER_UPDATE;
         if(this._isLoading)
         {
            isLoadBroadcastTime = this._updateTime % this._loadBroadcastRate == 0;
            if(isLoadBroadcastTime)
            {
               xml = "<data><percentcomplete>" + this._loadPercent + "</percentcomplete></data>";
               if(ExternalInterface.available)
               {
                  ExternalInterface.call("LoadBroadcast",xml);
               }
            }
         }
         if(this._isPlaying)
         {
            this._gameTime = this._gameTime + MILLIS_PER_UPDATE;
            isTime = this._gameTime % this._scoreBroadcastRate == 0;
            if(isTime)
            {
               xml = "<game><score>" + this._score + "</score><time>" + int(this._gameTime / 1000) + "</time></game>";
               if(ExternalInterface.available)
               {
                  ExternalInterface.call("ScoreBroadcast",xml);
               }
            }
         }
      }
      
      private function onSessionStart() : void
      {
         this.DispatchAdEvent(AdAPIEvent.SESSION_START);
      }
      
      private function onGameMenu() : void
      {
         this.DispatchAdEvent(AdAPIEvent.MENU);
      }
      
      private function onGameStart() : void
      {
         this._gameTime = 0;
         this.DispatchAdEvent(AdAPIEvent.GAME_START);
      }
      
      public function ResumeBroadcast() : void
      {
         this._isPlaying = true;
      }
      
      public function GameEnd() : void
      {
         this._isPlaying = false;
         if(!this._isEnabled || !ExternalInterface.available)
         {
            return;
         }
         ExternalInterface.call("GameEnd","<gamedata></gamedata>");
      }
      
      public function SetScore(score:Number) : void
      {
         this._score = score;
      }
   }
}
