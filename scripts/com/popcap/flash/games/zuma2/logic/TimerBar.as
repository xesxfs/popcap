package com.popcap.flash.games.zuma2.logic
{
   import flash.display.Bitmap;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class TimerBar
   {
      
      public static const GAME_TIME:int = 18000;
      
      public static const BAR_WIDTH:int = 225;
       
      
      public var mTimerBarSprite:Sprite;
      
      public var mTimerBarEmptyBitmap:Bitmap;
      
      public var mTimerText:String;
      
      public var mTimerNumber:int;
      
      public var mTimerBarFillBitmap:Bitmap;
      
      public var mTextFormat:TextFormat;
      
      public var mApp:Zuma2App;
      
      public var mTimerTextField:TextField;
      
      public var mTimerBarMask:Sprite;
      
      public var mInited:Boolean = false;
      
      public function TimerBar(app:Zuma2App)
      {
         super();
         this.mApp = app;
      }
      
      public function Draw() : void
      {
         var barPct:Number = this.mTimerNumber / GAME_TIME;
         var maskWidth:Number = barPct * BAR_WIDTH;
         this.mTimerBarMask.width = maskWidth;
         this.mTimerBarFillBitmap.mask = this.mTimerBarMask;
      }
      
      public function Update() : void
      {
         if(!this.mInited)
         {
            this.Init();
         }
         this.mTimerNumber--;
         if(this.mTimerNumber < 0)
         {
            this.mTimerNumber = 0;
         }
         this.mTimerText = this.GetTimeText();
         this.mTimerTextField.text = this.mTimerText;
      }
      
      public function Init() : void
      {
         this.mInited = true;
         this.mTimerNumber = GAME_TIME;
         this.mTextFormat = new TextFormat();
         this.mTextFormat.font = "TimerText";
         this.mTextFormat.align = TextFormatAlign.CENTER;
         this.mTextFormat.color = 12641891;
         this.mTextFormat.size = 20;
         var aGlow:GlowFilter = new GlowFilter(0,1,2,2,200);
         this.mTimerTextField = new TextField();
         this.mTimerTextField.antiAliasType = AntiAliasType.ADVANCED;
         this.mTimerTextField.embedFonts = true;
         this.mTimerTextField.defaultTextFormat = this.mTextFormat;
         this.mTimerTextField.filters = [aGlow];
         this.mTimerTextField.width = 120;
         this.mTimerTextField.height = 20;
         this.mTimerTextField.x = 50;
         this.mTimerTextField.y = -1;
         this.mTimerTextField.alpha = 1;
         this.mTimerTextField.selectable = false;
         this.mTimerTextField.text = "3:00";
         this.mTimerBarEmptyBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_TIMERBAR_EMPTY),PixelSnapping.NEVER,true);
         this.mTimerBarFillBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_TIMERBAR_FULL),PixelSnapping.NEVER,true);
         this.mTimerBarSprite = new Sprite();
         this.mTimerBarMask = new Sprite();
         this.mTimerBarMask.graphics.beginFill(16777215);
         this.mTimerBarMask.graphics.drawRect(0,0,225,21);
         this.mTimerBarFillBitmap.mask = this.mTimerBarMask;
         this.mTimerBarSprite.addChild(this.mTimerBarEmptyBitmap);
         this.mTimerBarSprite.addChild(this.mTimerBarFillBitmap);
         this.mTimerBarSprite.addChild(this.mTimerBarMask);
         this.mTimerBarSprite.addChild(this.mTimerTextField);
         this.mTimerBarSprite.x = 163;
         this.mTimerBarSprite.y = 3;
         this.mApp.mLayers[0].mBalls.addChild(this.mTimerBarSprite);
      }
      
      public function GetTimeText() : String
      {
         var minute:String = String(int(this.mTimerNumber / 6000));
         var seconds:String = String(int(this.mTimerNumber % 6000 / 100));
         if(seconds.length == 1)
         {
            seconds = "0" + seconds;
         }
         var time:String = minute + ":" + seconds;
         return time;
      }
   }
}
