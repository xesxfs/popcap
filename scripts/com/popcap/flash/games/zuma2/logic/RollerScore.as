package com.popcap.flash.games.zuma2.logic
{
   import flash.display.Bitmap;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   
   public class RollerScore
   {
       
      
      public var mRollerBitmap:Bitmap;
      
      public var mCurrNum:int;
      
      public var mTargetNum:int;
      
      public var mRollerSprite:Sprite;
      
      public var mTarget:Array;
      
      public var mGauntletMode:Boolean;
      
      public var mAtTarget:Boolean;
      
      public var mDigits:Array;
      
      public var mApp:Zuma2App;
      
      public var mNumbersImage:Bitmap;
      
      public function RollerScore(app:Zuma2App, gauntlet_mode:Boolean = false)
      {
         this.mDigits = new Array();
         this.mTarget = new Array();
         super();
         this.mApp = app;
         this.Reset(gauntlet_mode);
      }
      
      public function ForceScore(score:int) : void
      {
         var i:int = 0;
         var denom:int = 0;
         var p:int = 0;
         if(score > 999999)
         {
            score = 999999;
         }
         for(i = 0; i < 6; i++)
         {
            this.mDigits[i].mNum = -1;
            this.mDigits[i].mVY = 0;
            this.mDigits[i].mY = -7;
            this.mDigits[i].mDelay = this.mDigits[i].mBounceState = 0;
         }
         for(i = 0; i < 6; i++)
         {
            denom = int(Math.pow(10,i));
            p = int(Math.pow(10,i + 1));
            this.mDigits[i].mNum = int(score % p / denom);
            if(int(score / p) == 0)
            {
               break;
            }
         }
         for(i = 0; i < 6; i++)
         {
            this.mTarget[i].mNum = this.mDigits[i].mNum;
            this.mTarget[i].mX = this.mDigits[i].mX;
            this.mTarget[i].mY = this.mDigits[i].mY;
            this.mTarget[i].mVY = this.mDigits[i].mVY;
            this.mTarget[i].mDelay = this.mDigits[i].mDelay;
            this.mTarget[i].mBounceState = this.mDigits[i].mBounceState;
            this.mTarget[i].mRestingY = this.mDigits[i].mRestingY;
         }
         this.mTargetNum = this.mCurrNum = score;
         this.mAtTarget = true;
      }
      
      public function SetTargetScore(num:int) : void
      {
         var i:int = 0;
         var denom:int = 0;
         var p:int = 0;
         var d:int = 0;
         var max_speed:Number = NaN;
         if(num > 999999)
         {
            num = 999999;
         }
         if(num == this.mCurrNum)
         {
            return;
         }
         var diff:int = num - this.mCurrNum;
         var num_digits:int = 1;
         while(diff > 0)
         {
            diff = diff / 10;
            if(diff > 0)
            {
               num_digits++;
            }
         }
         this.mTargetNum = num;
         var idx:int = 0;
         while(true)
         {
            denom = int(Math.pow(10,idx));
            p = int(Math.pow(10,idx + 1));
            d = num % p / denom;
            this.mTarget[idx].mNum = d;
            if(this.mDigits[idx].mNum != d)
            {
               this.mDigits[idx].mDelay = Math.random() * 15;
               if(this.mGauntletMode)
               {
                  this.mDigits[idx].mVY = 1 * num_digits + Math.random() * 2;
                  max_speed = 3;
                  if(this.mDigits[idx].mVY > max_speed)
                  {
                     this.mDigits[idx].mVY = max_speed;
                  }
               }
               else
               {
                  this.mDigits[idx].mVY = 1 + Math.random() * 0;
               }
               this.mDigits[idx].mBounceState = 0;
            }
            if(int(num / p) == 0)
            {
               break;
            }
            idx++;
         }
         for(i = idx + 1; i < 6; i++)
         {
            this.mTarget[i].mNum = -1;
         }
         this.mAtTarget = false;
      }
      
      public function Draw() : void
      {
         var d:RollerDigit = null;
         var ch:int = this.mNumbersImage.height;
         var clipx:int = 11 * Zuma2App.SHRINK_PERCENT;
         var clipy:int = 8 * Zuma2App.SHRINK_PERCENT + 12;
         for(var i:int = 0; i < 6; i++)
         {
            d = this.mDigits[i];
            d.mNumberImage.mFrame = this.GetCel(d.mNum);
            d.mNumberBitmap.bitmapData = d.mNumberImage.pixels;
            d.mNumberBitmap.y = d.mY + clipy;
            if(d.mY != 0)
            {
               d.mNumberImage.mFrame = d.mNum == -1?int(this.GetCel(0)):int(this.GetCel(d.mNum + 1));
               d.mNextNumberBitmap.bitmapData = d.mNumberImage.pixels;
               d.mNextNumberBitmap.y = d.mY + clipy - ch;
            }
         }
      }
      
      public function Update() : void
      {
         var d:RollerDigit = null;
         var td:RollerTarget = null;
         if(this.mAtTarget)
         {
            return;
         }
         var ch:int = this.mNumbersImage.height;
         var same:Boolean = true;
         for(var i:int = 5; i >= 0; i--)
         {
            d = this.mDigits[i];
            td = this.mTarget[i];
            if(--d.mDelay > 0)
            {
               same = false;
            }
            else
            {
               d.mDelay = 0;
               if(d.mVY == 0)
               {
                  if(d.mNum != td.mNum)
                  {
                     same = false;
                  }
               }
               else if(d.mVY != 0)
               {
                  d.mY = d.mY + d.mVY;
                  if(d.mY >= ch && d.mBounceState == 0)
                  {
                     d.mNum = d.mNum == -1?1:int((d.mNum + 1) % 10);
                     if(d.mNum == td.mNum)
                     {
                        if(0)
                        {
                           d.mVY = 1 + Math.random() * 2;
                        }
                        d.mY = 0;
                        d.mBounceState = 1;
                        same = false;
                     }
                     else
                     {
                        same = false;
                        d.mY = ch - d.mY;
                     }
                  }
                  else if(d.mBounceState == 1 && d.mY >= 4)
                  {
                     same = false;
                     d.mBounceState++;
                     d.mVY = d.mVY * -1;
                  }
                  else if(d.mBounceState == 2 && d.mY <= -8)
                  {
                     same = false;
                     d.mBounceState++;
                     d.mVY = d.mVY * -1;
                     d.mRestingY = -8 + Math.random() * 0;
                  }
                  else if(d.mBounceState == 3 && d.mY >= d.mRestingY)
                  {
                     d.mVY = 0;
                     d.mBounceState = 0;
                  }
                  else
                  {
                     same = false;
                  }
               }
            }
         }
         this.mAtTarget = same;
      }
      
      public function GetTargetScore() : int
      {
         return this.mTargetNum;
      }
      
      public function Reset(gauntlet_mode:Boolean) : void
      {
         var digit:RollerDigit = null;
         this.mGauntletMode = gauntlet_mode;
         this.mNumbersImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_SCORENUMBERS));
         this.mRollerBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_SCOREBAR),PixelSnapping.NEVER,true);
         this.mRollerSprite = new Sprite();
         this.mRollerSprite.addChild(this.mRollerBitmap);
         this.mApp.mLayers[3].mForeground.addChild(this.mRollerSprite);
         this.mRollerSprite.x = 8 * Zuma2App.SHRINK_PERCENT;
         this.mRollerSprite.y = 11 * Zuma2App.SHRINK_PERCENT;
         var add:Number = 8;
         var xsep:Number = 2;
         var xoff:int = 10;
         for(var i:int = 5; i >= 0; i--)
         {
            digit = new RollerDigit(this.mApp);
            this.mDigits[i] = digit;
            this.mDigits[i].mX = xoff + (this.mNumbersImage.width + add) * (5 - i);
            this.mDigits[i].mNumberSprite.x = this.mDigits[i].mX;
            this.mDigits[i].mVY = 0;
            this.mDigits[i].mNum = -1;
            this.mDigits[i].mY = 0;
            this.mDigits[i].mNumberSprite.y = this.mDigits[i].mY;
            this.mDigits[i].mDelay = 0;
            this.mDigits[i].mBounceState = 0;
            this.mTarget[i] = new RollerTarget(this.mApp);
         }
         this.mDigits[0].mNum = this.mTarget[0].mNum = -1;
         this.mTargetNum = this.mCurrNum = 0;
         this.mAtTarget = true;
      }
      
      public function GetCurrentScore() : int
      {
         var d:RollerDigit = null;
         if(this.mCurrNum == this.mTargetNum)
         {
            return this.mCurrNum;
         }
         this.mCurrNum = 0;
         for(var i:int = 0; i < 6; i++)
         {
            d = this.mDigits[i];
            if(d.mNum == -1)
            {
               break;
            }
            this.mCurrNum = this.mCurrNum + Math.pow(10,i) * this.mDigits[i].mNum;
         }
         return this.mCurrNum;
      }
      
      public function Reload() : void
      {
         this.mApp.mLayers[3].mForeground.addChild(this.mRollerSprite);
         for(var i:int = 0; i < this.mDigits.length; i++)
         {
            this.mDigits[i].Reload();
         }
      }
      
      public function GetCel(num:int) : int
      {
         if(num < 0)
         {
            return 0;
         }
         if(num % 10 > 0)
         {
            return num;
         }
         return 10;
      }
   }
}
