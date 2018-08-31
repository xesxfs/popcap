package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class Hole
   {
       
      
      public var mFrame:int;
      
      public var mPercentOpen:Number;
      
      public var mSkullBaseSprite:Sprite;
      
      public var mSkullHeadBitmapData:BitmapData;
      
      public var mX:int;
      
      public var mY:int;
      
      public var mCurve:CurveMgr;
      
      public var mDeathAlpha:Number;
      
      public var mUpdateCount:int;
      
      public var mRotation:Number;
      
      public var mSkullHoleBitmap:Bitmap;
      
      public var mCurveNum:int;
      
      public var mDoDeathFade:Boolean;
      
      public var mSkullHoleSprite:Sprite;
      
      public var mShared:Vector.<int>;
      
      public var mRing:Array;
      
      public var mSkullHeadBitmap:Bitmap;
      
      public var mVisible:Boolean;
      
      public var mPercentTarget:Number;
      
      public var mSkullHeadMatrix:Matrix;
      
      public var mSkullHeadSprite:Sprite;
      
      public var mSkullSprite:Sprite;
      
      public var mSkullJawBitmap:Bitmap;
      
      public var mSkullBaseBitmap:Bitmap;
      
      public var mApp:Zuma2App;
      
      public var mSkullJawSprite:Sprite;
      
      public var mSkullMask:Sprite;
      
      public function Hole(app:Zuma2App)
      {
         this.mSkullHeadMatrix = new Matrix();
         super();
         this.mApp = app;
         this.mFrame = 0;
         this.mVisible = true;
         this.mPercentOpen = 0;
         this.mPercentTarget = -1;
         this.mUpdateCount = 0;
         this.mCurveNum = -1;
         this.mDoDeathFade = false;
         this.mDeathAlpha = 0;
         this.mShared = new Vector.<int>();
         this.mRing = new Array();
         this.mRing[0] = new FireRing(this.mApp);
         this.mRing[1] = new FireRing(this.mApp);
         this.mRing[1].mCel = -1;
         this.mRing[2] = new FireRing(this.mApp);
         this.mRing[2].mCel = -1;
         this.mSkullSprite = new Sprite();
         this.mSkullHeadSprite = new Sprite();
         this.mSkullBaseSprite = new Sprite();
         this.mSkullHoleSprite = new Sprite();
         this.mSkullJawSprite = new Sprite();
         this.mSkullHoleBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_HOLE));
         this.mSkullJawBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_JAW));
         this.mSkullHeadBitmapData = this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_HEAD);
         this.mSkullHeadBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_HEAD));
         this.mSkullBaseBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_BASE));
         this.mSkullHoleBitmap.smoothing = true;
         this.mSkullJawBitmap.smoothing = true;
         this.mSkullBaseBitmap.smoothing = true;
         this.mSkullJawBitmap.x = -(this.mSkullJawBitmap.width / 2);
         this.mSkullJawBitmap.y = -(this.mSkullJawBitmap.height / 2) + 10;
         this.mSkullHeadMatrix.translate(-this.mSkullHeadBitmapData.width / 2,-this.mSkullHeadBitmapData.height / 2 - 3);
         this.mSkullBaseBitmap.x = -(this.mSkullBaseBitmap.width / 2);
         this.mSkullBaseBitmap.y = -(this.mSkullBaseBitmap.height / 2);
         this.mSkullHoleBitmap.x = -(this.mSkullHoleBitmap.width / 2);
         this.mSkullHoleBitmap.y = -(this.mSkullHoleBitmap.height / 2);
         this.mSkullMask = new Sprite();
         this.mSkullMask.graphics.beginFill(0);
         this.mSkullMask.graphics.drawCircle(0,0,29);
         this.mSkullMask.graphics.endFill();
         this.mSkullHeadBitmap.x = -this.mSkullHeadBitmap.width / 2;
         this.mSkullHeadBitmap.y = -20;
         this.mSkullHeadBitmap.smoothing = true;
         this.mSkullHeadBitmap.pixelSnapping = PixelSnapping.NEVER;
         this.mSkullHeadBitmap.mask = this.mSkullMask;
         this.mSkullHeadSprite.addChild(this.mSkullHeadBitmap);
         this.mSkullHoleSprite.addChild(this.mSkullHoleBitmap);
         this.mSkullJawSprite.addChild(this.mSkullJawBitmap);
         this.mSkullBaseSprite.addChild(this.mSkullBaseBitmap);
         this.mApp.mLayers[0].mBackground.addChild(this.mSkullHoleSprite);
         this.mApp.mLayers[0].mBackground.addChild(this.mSkullJawSprite);
         this.mApp.mLayers[0].mBackground.addChild(this.mSkullHeadSprite);
         this.mApp.mLayers[0].mBackground.addChild(this.mSkullBaseSprite);
         this.mApp.mLayers[0].mBackground.addChild(this.mSkullMask);
         this.mApp.mLayers[0].mBackground.addChild(this.mRing[0].mFireSprite);
         this.mApp.mLayers[0].mBackground.addChild(this.mRing[1].mFireSprite);
         this.mApp.mLayers[0].mBackground.addChild(this.mRing[2].mFireSprite);
      }
      
      public function SetPctOpen(pct:Number) : void
      {
         if(pct < this.mPercentOpen && this.mVisible)
         {
            this.mPercentTarget = pct;
         }
         else
         {
            this.mPercentOpen = pct;
            this.mPercentTarget = -1;
         }
      }
      
      public function GetPctOpen() : Number
      {
         return this.mPercentOpen;
      }
      
      public function SetPos() : void
      {
         this.mSkullBaseSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mSkullBaseSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mSkullJawSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mSkullJawSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mSkullHoleSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mSkullHoleSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mSkullHeadSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mSkullHeadSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mSkullMask.x = this.mSkullHeadSprite.x;
         this.mSkullMask.y = this.mSkullHeadSprite.y;
         this.mSkullBaseSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         this.mSkullHeadSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         this.mSkullJawSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         this.mSkullHoleSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         for(var i:int = 0; i < 3; i++)
         {
            this.mRing[i].mFireSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
            this.mRing[i].mFireSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
            this.mRing[i].mFireSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         }
      }
      
      public function DrawMain(canvas:Canvas, is_gray:Boolean = false) : void
      {
      }
      
      public function DrawRings() : void
      {
         var fr:FireRing = null;
         var a:int = 0;
         var i:int = 0;
         if(this.mDeathAlpha >= 255 || !this.mDoDeathFade && this.mDeathAlpha != 0)
         {
            for(i = 0; i < 3; i++)
            {
            }
            return;
         }
         for(i = 0; i < 3; i++)
         {
            this.mRing[1].mFireSprite.visible = true;
         }
         for(i = 0; i < 3; i++)
         {
            fr = this.mRing[i];
            if(!(fr.mCel == -1 || fr.mAlpha == 0))
            {
               a = fr.mAlpha;
               if(this.mDoDeathFade)
               {
                  a = Math.min(a,255 - this.mDeathAlpha);
               }
               fr.mFireImage.mFrame = fr.mCel;
               fr.mFireBitmap.bitmapData = fr.mFireImage.pixels;
               fr.mFireSprite.alpha = a / 255;
            }
         }
      }
      
      public function Delete() : void
      {
         this.mRing = null;
      }
      
      public function SetRotation(rot:Number) : void
      {
         this.mRotation = rot;
         this.mSkullBaseSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         this.mSkullHeadSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         this.mSkullJawSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         this.mSkullHoleSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         for(var i:int = 0; i < 3; i++)
         {
            this.mRing[i].mFireSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
         }
      }
      
      public function Update() : void
      {
         var anim_rate:int = 0;
         var num_cels:int = 0;
         var alpha_inc1:Number = NaN;
         var alpha_inc2:Number = NaN;
         var all_done:Boolean = false;
         var i:int = 0;
         if(this.mDoDeathFade)
         {
            this.mDeathAlpha = this.mDeathAlpha + 2;
            if(this.mDeathAlpha > 255)
            {
               this.mDeathAlpha = 255;
            }
         }
         else if(this.mDeathAlpha > 0)
         {
            this.mDeathAlpha = this.mDeathAlpha - 1;
            if(this.mDeathAlpha < 0)
            {
               this.mDeathAlpha = 0;
            }
         }
         this.mUpdateCount++;
         if(this.mPercentOpen > this.mPercentTarget && this.mPercentTarget >= 0)
         {
            this.mPercentOpen = this.mPercentOpen - 0.01;
            if(this.mPercentOpen < this.mPercentTarget)
            {
               this.mPercentOpen = this.mPercentTarget;
               this.mPercentTarget = -1;
            }
         }
         if(this.mPercentOpen > 0 && this.mVisible)
         {
            num_cels = 36;
            anim_rate = 7 - this.mPercentOpen * 4;
            if(anim_rate < 3)
            {
               anim_rate = 3;
            }
            else if(anim_rate > 7)
            {
               anim_rate = 7;
            }
            alpha_inc1 = 255 / (6 * Number(num_cels));
            if(this.mRing[0].mCel != -1)
            {
               this.mRing[0].mAlpha = this.mRing[0].mAlpha + alpha_inc1;
               if(this.mRing[0].mAlpha >= 255)
               {
                  this.mRing[0].mAlpha = 255;
               }
               if(this.mUpdateCount % anim_rate == 0)
               {
                  if(++this.mRing[0].mCel >= num_cels)
                  {
                     this.mRing[0].mCel = -1;
                  }
               }
            }
            alpha_inc2 = 128 / (Number(anim_rate) * 10);
            if(this.mRing[1].mAlpha == 0 && this.mRing[0].mCel == 21)
            {
               this.mRing[1].mCel = 0;
               this.mRing[1].mAlpha = 128;
            }
            else if(this.mRing[1].mCel != -1)
            {
               this.mRing[1].mAlpha = this.mRing[1].mAlpha + alpha_inc2;
               if(this.mRing[1].mAlpha >= 255)
               {
                  this.mRing[1].mAlpha = 255;
               }
               if(this.mUpdateCount % anim_rate == 0)
               {
                  if(++this.mRing[1].mCel >= num_cels)
                  {
                     this.mRing[1].mCel = 0;
                     this.mRing[1].mAlpha = 128;
                  }
               }
            }
            if(this.mRing[2].mAlpha == 0 && this.mRing[1].mCel == num_cels / 2)
            {
               this.mRing[2].mCel = 0;
               this.mRing[2].mAlpha = 128;
            }
            else if(this.mRing[2].mCel != -1)
            {
               this.mRing[2].mAlpha = this.mRing[2].mAlpha + alpha_inc2;
               if(this.mRing[2].mAlpha >= 255)
               {
                  this.mRing[2].mAlpha = 255;
               }
               if(this.mUpdateCount % anim_rate == 0)
               {
                  if(++this.mRing[2].mCel >= num_cels)
                  {
                     this.mRing[2].mCel = 0;
                     this.mRing[2].mAlpha = 128;
                  }
               }
            }
         }
         else if(this.mVisible)
         {
            all_done = true;
            anim_rate = 7 - this.mPercentOpen * 4;
            if(anim_rate < 3)
            {
               anim_rate = 3;
            }
            else if(anim_rate > 7)
            {
               anim_rate = 7;
            }
            i = 0;
            for(i = 0; i < 3; i++)
            {
               if(this.mRing[i].mAlpha > 0)
               {
                  if(this.mUpdateCount % anim_rate == 0)
                  {
                     if(++this.mRing[i].mCel >= 36)
                     {
                     }
                  }
                  this.mRing[i].mCel = 0;
                  this.mRing[i].mAlpha = this.mRing[i].mAlpha - 2;
                  if(this.mRing[i].mAlpha <= 0)
                  {
                     this.mRing[i].mAlpha = 0;
                  }
                  else
                  {
                     all_done = false;
                  }
               }
            }
            if(all_done)
            {
               for(i = 0; i < 3; i++)
               {
                  this.mRing[i].mCel = i == 0?0:-1;
                  this.mRing[i].mAlpha = 0;
               }
            }
         }
      }
      
      public function Draw(canvas:Canvas, hilite_override:Number = 0) : void
      {
         this.mSkullHeadBitmap.y = -20 - 20 * this.mPercentOpen;
         this.DrawMain(canvas,false);
         if(this.mDeathAlpha > 0)
         {
            this.DrawMain(canvas,true);
         }
         if(this.mVisible)
         {
            this.DrawRings();
         }
      }
   }
}
