package com.popcap.flash.games.zuma2.logic
{
   import flash.display.Bitmap;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   
   public class ZumaBar extends TimerBar
   {
       
      
      public var mZumaCurrent:int;
      
      public var mZumaGoal:int;
      
      public function ZumaBar(app:Zuma2App)
      {
         super(app);
         mApp = app;
      }
      
      override public function Init() : void
      {
         mInited = true;
         mTimerBarEmptyBitmap = new Bitmap(mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_TIMERBAR_EMPTY),PixelSnapping.NEVER,true);
         mTimerBarFillBitmap = new Bitmap(mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_TIMERBAR_FULL),PixelSnapping.NEVER,true);
         mTimerBarSprite = new Sprite();
         mTimerBarMask = new Sprite();
         mTimerBarMask.graphics.beginFill(16777215);
         mTimerBarMask.graphics.drawRect(0,0,225,21);
         mTimerBarFillBitmap.mask = mTimerBarMask;
         mTimerBarSprite.addChild(mTimerBarEmptyBitmap);
         mTimerBarSprite.addChild(mTimerBarFillBitmap);
         mTimerBarSprite.addChild(mTimerBarMask);
         mTimerBarSprite.x = 163;
         mTimerBarSprite.y = 3;
         mApp.mLayers[3].mBalls.addChild(mTimerBarSprite);
      }
      
      override public function Draw() : void
      {
         var barPct:Number = this.mZumaCurrent / this.mZumaGoal;
         var maskWidth:Number = barPct * BAR_WIDTH;
         mTimerBarMask.width = maskWidth;
         mTimerBarFillBitmap.mask = mTimerBarMask;
      }
      
      override public function Update() : void
      {
         if(!mInited)
         {
            this.Init();
         }
      }
   }
}
