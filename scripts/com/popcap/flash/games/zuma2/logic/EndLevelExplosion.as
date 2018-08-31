package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.resources.images.ImageInst;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class EndLevelExplosion
   {
       
      
      public var mX:int;
      
      private var mExplosionSprite:Sprite;
      
      private var mExplosionImage:ImageInst;
      
      private var mApp:Zuma2App;
      
      public var mPlaySound:Boolean;
      
      private var mExplosionBitmap:Bitmap;
      
      private var mUpdateCount:int;
      
      public var mY:int;
      
      public var mDelay:int;
      
      public function EndLevelExplosion(app:Zuma2App)
      {
         super();
         this.mApp = app;
         this.mExplosionImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_PATH_EXPLOSION);
         this.mExplosionImage.mFrame = 0;
         this.mExplosionBitmap = new Bitmap(this.mExplosionImage.pixels);
         this.mExplosionBitmap.x = -this.mExplosionBitmap.width / 2;
         this.mExplosionBitmap.y = -this.mExplosionBitmap.height / 2;
         this.mExplosionSprite = new Sprite();
         this.mExplosionSprite.addChild(this.mExplosionBitmap);
         this.mExplosionSprite.scaleX = 0.5;
         this.mExplosionSprite.scaleY = 0.5;
         this.mApp.mLayers[3].mForeground.addChild(this.mExplosionSprite);
         this.mPlaySound = false;
         this.mUpdateCount = 0;
      }
      
      public function SetPos(x:int, y:int) : void
      {
         this.mExplosionSprite.x = x * Zuma2App.SHRINK_PERCENT;
         this.mExplosionSprite.y = y * Zuma2App.SHRINK_PERCENT;
      }
      
      public function Delete() : void
      {
         if(this.mExplosionSprite.parent != null)
         {
            this.mExplosionSprite.parent.removeChild(this.mExplosionSprite);
         }
         this.mExplosionSprite = null;
      }
      
      public function Update() : void
      {
         this.mUpdateCount++;
         if(this.mUpdateCount % 3 == 0)
         {
            this.mExplosionImage.mFrame++;
            this.mExplosionBitmap.bitmapData = this.mExplosionImage.pixels;
         }
      }
      
      public function IsActive() : Boolean
      {
         if(this.mExplosionImage.mFrame >= 14)
         {
            return false;
         }
         return true;
      }
   }
}
