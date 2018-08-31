package com.popcap.flash.games.zuma2.states
{
   import com.popcap.flash.framework.BaseAppStateMachine;
   import com.popcap.flash.framework.IAppState;
   import com.popcap.flash.framework.ads.AdAPIEvent;
   import flash.display.Sprite;
   
   public class MainState extends Sprite implements IAppState
   {
      
      public static const STATE_TITLE_SCREEN:String = "TitleScreen";
      
      public static const STATE_LEVEL_INTRO:String = "LevelIntro";
      
      public static const STATE_MAIN_MENU:String = "MainMenu";
      
      public static const STATE_LOADING:String = "Loading";
      
      public static const STATE_PLAY_LEVEL:String = "PlayLevel";
       
      
      private var mStateMachine:BaseAppStateMachine;
      
      private var mPlayState:PlayLevelState;
      
      private var mApp:Zuma2App;
      
      public var mPaused:Boolean;
      
      public function MainState(app:Zuma2App)
      {
         super();
         this.mApp = app;
         this.mPaused = false;
         this.mPlayState = new PlayLevelState(app);
         this.mStateMachine = new BaseAppStateMachine();
         this.mApp.mAdAPI.addEventListener(AdAPIEvent.PAUSE,this.handlePause);
         this.mApp.mAdAPI.addEventListener(AdAPIEvent.UNPAUSE,this.handleUnpause);
      }
      
      public function onMouseUp(x:Number, y:Number) : void
      {
         this.mApp.widgets.onMouseUp(x,y);
      }
      
      public function togglePause(paused:Boolean) : void
      {
         this.mPaused = paused;
      }
      
      public function draw(elapsed:int) : void
      {
         if(this.mPaused)
         {
            return;
         }
         this.mApp.widgets.draw(this.mApp.canvas);
      }
      
      public function onEnter() : void
      {
      }
      
      public function update() : void
      {
         if(this.mPaused)
         {
            return;
         }
         this.mApp.widgets.update();
      }
      
      public function onKeyUp(keyCode:int) : void
      {
         this.mApp.widgets.onKeyUp(keyCode);
      }
      
      public function onMouseDown(x:Number, y:Number) : void
      {
         this.mApp.widgets.onMouseDown(x,y);
      }
      
      public function onKeyDown(keyCode:int) : void
      {
         this.mApp.widgets.onKeyDown(keyCode);
      }
      
      public function onPush() : void
      {
      }
      
      public function onExit() : void
      {
      }
      
      public function handlePause(e:AdAPIEvent) : void
      {
         this.togglePause(true);
         this.mApp.soundManager.mute();
      }
      
      public function onPop() : void
      {
      }
      
      public function handleUnpause(e:AdAPIEvent) : void
      {
         this.togglePause(false);
         this.mApp.soundManager.unmute();
      }
      
      public function onMouseMove(x:Number, y:Number) : void
      {
         this.mApp.widgets.onMouseMove(x,y);
      }
   }
}
