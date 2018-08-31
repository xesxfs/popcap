package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class DeathSkull
   {
      
      public static const STARTING_SIZE:Number = 0.31;
      
      public static const Draw_Both:int = 2;
      
      public static const MAX_SIZE:Number = 2.2;
      
      public static const Draw_BG:int = 0;
      
      public static const MIN_MOUTH_OPEN:Number = 0.3;
      
      public static const Draw_FG:int = 1;
       
      
      public var mCurAngle:Number;
      
      public var mStartX:Number;
      
      public var mStartY:Number;
      
      public var mStartingAngle:Number;
      
      public var mDestX:Number;
      
      public var mDestY:Number;
      
      public var mX:Number;
      
      public var mY:Number;
      
      public var mAngleInc:Number;
      
      public var mUpdateCount:int;
      
      public var mMouthOpenDelay:int;
      
      public var mLargeMiddleBitmap:Bitmap;
      
      public var mMoveFrames:int;
      
      public var mFrogClipHeight:Number;
      
      public var mOpeningRate:Number;
      
      public var mLastFrogAngle:Number;
      
      public var mApp:Zuma2App;
      
      public var mLargeBottomBitmap:Bitmap;
      
      public var mDone:Boolean;
      
      public var mAngleOutInc:Number;
      
      public var mLargeMiddleSprite:Sprite;
      
      public var mLargeTopBitmap:Bitmap;
      
      public var mCloseDelay:int;
      
      public var mText:TextField;
      
      public var mTextAlpha:Number;
      
      public var mLargeBottomSprite:Sprite;
      
      public var mLargeTopSprite:Sprite;
      
      public var mShowText:Boolean;
      
      public var mOpeningMouth:Boolean;
      
      public var mLargeBlackBitmap:Bitmap;
      
      public var mVX:Number;
      
      public var mFrames:Vector.<SkullFrame>;
      
      public var mFrogTX:int;
      
      public var mFrogTY:int;
      
      public var mVY:Number;
      
      public var mBoard:GameBoardWidget;
      
      public var mDisappearing:Boolean;
      
      public var mLargeBlackSprite:Sprite;
      
      public function DeathSkull(app:Zuma2App, board:GameBoardWidget)
      {
         this.mFrames = new Vector.<SkullFrame>();
         super();
         this.mApp = app;
         this.mBoard = board;
         this.mUpdateCount = 0;
         this.mLargeBottomBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_LARGE_BOTTOM));
         this.mLargeBottomBitmap.x = -this.mLargeBottomBitmap.width / 2;
         this.mLargeBottomBitmap.y = 18;
         this.mLargeBottomBitmap.smoothing = true;
         this.mLargeBottomSprite = new Sprite();
         this.mLargeBottomSprite.x = -500;
         this.mLargeBottomSprite.y = -500;
         this.mLargeBottomSprite.addChild(this.mLargeBottomBitmap);
         this.mLargeTopBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_LARGE_TOP));
         this.mLargeTopBitmap.x = -this.mLargeTopBitmap.width / 2;
         this.mLargeTopBitmap.y = -this.mLargeTopBitmap.height / 2;
         this.mLargeTopBitmap.smoothing = true;
         this.mLargeTopSprite = new Sprite();
         this.mLargeTopSprite.x = -500;
         this.mLargeTopSprite.y = -500;
         this.mLargeTopSprite.addChild(this.mLargeTopBitmap);
         this.mLargeMiddleBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_LARGE_MIDDLE));
         this.mLargeMiddleBitmap.x = -this.mLargeMiddleBitmap.width / 2;
         this.mLargeMiddleBitmap.y = 100;
         this.mLargeMiddleBitmap.smoothing = true;
         this.mLargeMiddleSprite = new Sprite();
         this.mLargeMiddleSprite.x = -500;
         this.mLargeMiddleSprite.y = -500;
         this.mLargeMiddleSprite.addChild(this.mLargeMiddleBitmap);
         this.mLargeBlackBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DEATHSKULL_LARGE_BLACK));
         this.mLargeBlackBitmap.x = -this.mLargeBlackBitmap.width / 2;
         this.mLargeBlackBitmap.y = 0;
         this.mLargeBlackBitmap.smoothing = true;
         this.mLargeBlackSprite = new Sprite();
         this.mLargeBlackSprite.x = -500;
         this.mLargeBlackSprite.y = -500;
         this.mLargeBlackSprite.addChild(this.mLargeBlackBitmap);
         this.mText = new TextField();
         var aTimeUpTextFormat:TextFormat = new TextFormat();
         aTimeUpTextFormat.font = "TimeUpText";
         aTimeUpTextFormat.align = TextFormatAlign.CENTER;
         aTimeUpTextFormat.color = 16777215;
         aTimeUpTextFormat.size = 55;
         var aGlow:DropShadowFilter = new DropShadowFilter();
         aGlow.strength = 50;
         this.mText = new TextField();
         this.mText.embedFonts = true;
         this.mText.defaultTextFormat = aTimeUpTextFormat;
         this.mText.filters = [aGlow];
         this.mText.textColor = 16711680;
         this.mText.width = 400;
         this.mText.height = 100;
         this.mText.x = 75;
         this.mText.y = 100;
         this.mText.alpha = 1;
         this.mText.selectable = false;
         this.mText.multiline = true;
         this.mText.wordWrap = true;
         this.mApp.mLayers[1].mBackground.addChild(this.mLargeBlackSprite);
         this.mApp.mLayers[1].mBackground.addChild(this.mLargeBottomSprite);
         this.mApp.mLayers[1].mBackground.addChild(this.mLargeMiddleSprite);
         this.mApp.mLayers[1].mBackground.addChild(this.mLargeTopSprite);
         this.mApp.mLayers[2].mForeground.addChild(this.mText);
      }
      
      public function AceModF(x:Number, y:Number) : Number
      {
         if(x < 0)
         {
            return y - -x % y;
         }
         return x % y;
      }
      
      public function RotatePoint2(pAngle:Number, pVector:Point, pCenter:Point) : Point
      {
         var ox:Number = pVector.x - pCenter.x;
         var oy:Number = pVector.y - pCenter.y;
         var x:Number = pCenter.x + ox * Math.cos(pAngle) + oy * Math.sin(pAngle);
         var y:Number = pCenter.y + oy * Math.cos(pAngle) - ox * Math.sin(pAngle);
         return new Point(x,y);
      }
      
      public function GetCanonicalAngleRad(theRad:Number) : Number
      {
         if(theRad >= 0 && theRad < 2 * Zuma2App.MY_PI)
         {
            return theRad;
         }
         return this.AceModF(theRad,2 * Zuma2App.MY_PI);
      }
      
      public function Delete() : void
      {
         if(this.mLargeBlackSprite.parent != null)
         {
            this.mLargeBlackSprite.parent.removeChild(this.mLargeBlackSprite);
         }
         if(this.mLargeTopSprite.parent != null)
         {
            this.mLargeTopSprite.parent.removeChild(this.mLargeTopSprite);
         }
         if(this.mLargeBottomSprite.parent != null)
         {
            this.mLargeBottomSprite.parent.removeChild(this.mLargeBottomSprite);
         }
         if(this.mLargeMiddleSprite.parent != null)
         {
            this.mLargeMiddleSprite.parent.removeChild(this.mLargeMiddleSprite);
         }
      }
      
      public function Init(start_angle:Number, sx:Number, sy:Number, dx:Number, dy:Number) : void
      {
         this.mFrogTX = this.mFrogTY = -1;
         this.mLastFrogAngle = 0;
         this.mMouthOpenDelay = 1;
         this.mOpeningRate = 0.016;
         this.mCurAngle = this.mStartingAngle = start_angle;
         this.mX = this.mStartX = sx * Zuma2App.SHRINK_PERCENT + 5;
         this.mY = this.mStartY = sy * Zuma2App.SHRINK_PERCENT;
         this.mDestX = dx * Zuma2App.SHRINK_PERCENT;
         this.mDestY = dy * Zuma2App.SHRINK_PERCENT - 250 * Zuma2App.SHRINK_PERCENT;
         this.mOpeningMouth = false;
         this.mCloseDelay = 0;
         this.mTextAlpha = 255;
         this.mDone = false;
         this.mShowText = false;
         this.mFrogClipHeight = 0;
         this.mMoveFrames = 50;
         this.mVX = (this.mDestX - this.mX) / this.mMoveFrames;
         this.mVY = (this.mDestY - this.mY) / this.mMoveFrames;
         this.mDisappearing = false;
         var a:Number = this.GetCanonicalAngleRad(this.mCurAngle);
         if(Zuma2App.MY_PI * 2 - a < a)
         {
            this.mAngleInc = (Zuma2App.MY_PI * 2 - a) / this.mMoveFrames;
            this.mAngleOutInc = a / this.mMoveFrames;
         }
         else
         {
            this.mAngleInc = -a / this.mMoveFrames;
            this.mAngleOutInc = -(Zuma2App.MY_PI * 2 - a) / this.mMoveFrames;
         }
      }
      
      public function RotatePoint(pAngle:Number, aPoint:Point, cx:Number, cy:Number) : void
      {
         var p:Point = this.RotatePoint2(pAngle,new Point(aPoint.x,aPoint.y),new Point(cx,cy));
         aPoint.x = p.x;
         aPoint.y = p.y;
      }
      
      public function DrawFrogItem(s:SkullFrame, frog_draw_mode:int) : void
      {
         var idx:int = 0;
         var max_idx:int = 0;
         var t:Matrix = null;
         var src:Rectangle = null;
         var xoff:Number = NaN;
         var yoff:Number = NaN;
         var h:Number = NaN;
         var aPoint:Point = null;
         var max_h:Number = NaN;
         var range:Number = NaN;
         var pct:Number = NaN;
         var xoffs:Array = new Array(0,0,0,0);
         var yoffs:Array = new Array(0,0,0,0);
         var bitmapYoffs:Number = 25;
         var imgs:Vector.<Sprite> = new Vector.<Sprite>();
         imgs.push(this.mLargeBottomSprite,this.mLargeBlackSprite,this.mLargeMiddleSprite,this.mLargeTopSprite);
         if(0)
         {
         }
         for(idx = 0,max_idx = 4; idx < max_idx; )
         {
            t = new Matrix();
            t.scale(s.mSize,s.mSize);
            t.rotate(s.mAngle);
            src = new Rectangle(imgs[idx].x,imgs[idx].y,imgs[idx].width,imgs[idx].height);
            xoff = xoffs[idx] * Zuma2App.SHRINK_PERCENT;
            yoff = yoffs[idx] * Zuma2App.SHRINK_PERCENT;
            h = 0;
            if(idx == 2 && (!s.mIsFinalFrame || s.mAlpha < 254))
            {
               max_h = 0;
               range = 1 - MIN_MOUTH_OPEN;
               pct = 1 - (s.mPctOpen - MIN_MOUTH_OPEN) / range;
               h = max_h * pct;
               src.y = h;
               src.height = src.height - h;
               yoff = yoff + h;
               bitmapYoffs = bitmapYoffs + h;
            }
            xoff = xoff * s.mSize;
            yoff = yoff * s.mSize;
            if(idx == 1 || idx == 2)
            {
               yoff = yoff * s.mPctOpen;
               bitmapYoffs = bitmapYoffs * s.mPctOpen;
            }
            aPoint = new Point(xoff,yoff);
            this.RotatePoint(s.mAngle,aPoint,0,0);
            t.translate(aPoint.x + s.mX,aPoint.y + s.mY);
            imgs[idx].transform.matrix = t;
            imgs[idx].alpha = s.mAlpha / 255;
            if(idx == 1 && s.mAlpha < 254)
            {
               imgs[idx].alpha = 0;
            }
            if(idx == 2)
            {
               if(bitmapYoffs < 2.26)
               {
                  bitmapYoffs = -25;
               }
               this.mLargeMiddleBitmap.y = bitmapYoffs;
            }
            idx++;
         }
      }
      
      public function DrawAboveFrog() : void
      {
         var final_idx:int = 0;
         var i:int = 0;
         if(!this.mOpeningMouth && this.mMouthOpenDelay <= 0)
         {
            final_idx = -1;
            for(i = 0; i < this.mFrames.length; i++)
            {
               if(this.mFrames[i].mIsFinalFrame)
               {
                  final_idx = i;
                  break;
               }
            }
            if(final_idx != -1)
            {
               this.DrawFrogItem(this.mFrames[final_idx],Draw_FG);
            }
         }
         if(this.mShowText && this.mTextAlpha > 0)
         {
            this.mText.alpha = this.mTextAlpha / 255;
         }
      }
      
      public function Update() : void
      {
         var s:SkullFrame = null;
         var l:int = 0;
         var min_open:Number = NaN;
         if(this.mDone)
         {
            return;
         }
         if(this.mCloseDelay > 0)
         {
            this.mCloseDelay--;
         }
         else if(++this.mUpdateCount == this.mMoveFrames && this.mDisappearing && !this.mShowText)
         {
            if(this.mBoard.GauntletMode())
            {
               this.mDone = true;
               return;
            }
            this.mShowText = true;
            this.mTextAlpha = 500;
            l = this.mBoard.GetNumLives() - 1;
            if(l <= 0)
            {
               this.mText.text = "GAME OVER!";
            }
            else if(l > 1)
            {
               this.mText.text = l + " Lives Left";
            }
            else if(l == 1)
            {
               this.mText.text = "1 Life Left";
            }
            else
            {
               this.mShowText = false;
               this.mDone = true;
               return;
            }
         }
         if(this.mBoard.GetNumLives() == 0 && this.mTextAlpha <= 0)
         {
            this.mDone = true;
         }
         if(this.mShowText && this.mTextAlpha > 0)
         {
            this.mTextAlpha = this.mTextAlpha - 3.2;
            if(this.mTextAlpha < 0)
            {
               this.mTextAlpha = 0;
               this.mDone = true;
            }
         }
         if(this.mCloseDelay <= 0)
         {
            this.mCurAngle = this.mCurAngle + this.mAngleInc;
         }
         var pct:Number = this.mUpdateCount / this.mMoveFrames;
         if(this.mUpdateCount < this.mMoveFrames && this.mCloseDelay <= 0)
         {
            this.mX = this.mX + this.mVX;
            this.mY = this.mY + this.mVY;
         }
         if(this.mUpdateCount % 2 == 0 && this.mUpdateCount < this.mMoveFrames && this.mCloseDelay <= 0)
         {
            this.mFrames.push(new SkullFrame());
            s = this.mFrames[this.mFrames.length - 1];
            s.mAngle = this.mCurAngle;
            if(!this.mDisappearing)
            {
               s.mPctOpen = MIN_MOUTH_OPEN;
               s.mSize = STARTING_SIZE + (MAX_SIZE - STARTING_SIZE) * pct;
            }
            else
            {
               s.mPctOpen = MIN_MOUTH_OPEN;
               s.mSize = MAX_SIZE - (MAX_SIZE - STARTING_SIZE) * pct;
            }
            s.mAlpha = 128;
            s.mX = this.mX;
            s.mY = this.mY;
         }
         if(this.mUpdateCount >= this.mMoveFrames && (this.mFrames.length == 0 || !this.mFrames[this.mFrames.length - 1].mIsFinalFrame) && !this.mDisappearing)
         {
            this.mFrames.push(new SkullFrame());
            s = this.mFrames[this.mFrames.length - 1];
            s.mIsFinalFrame = true;
            s.mPctOpen = MIN_MOUTH_OPEN;
            s.mAngle = this.mCurAngle = 0;
            this.mAngleInc = 0;
            s.mSize = MAX_SIZE;
            s.mAlpha = 255;
            s.mX = this.mX;
            s.mY = this.mY;
         }
         for(var i:int = 0; i < this.mFrames.length; i++)
         {
            s = this.mFrames[i];
            if((!s.mIsFinalFrame || this.mDisappearing) && this.mCloseDelay <= 0)
            {
               s.mAlpha = s.mAlpha - 10;
               if(s.mAlpha <= 0)
               {
                  this.mFrames.splice(i,1);
                  i--;
               }
            }
            else if(this.mMouthOpenDelay > 0 && --this.mMouthOpenDelay == 0)
            {
               this.mOpeningMouth = true;
            }
            else if(this.mOpeningMouth)
            {
               this.mOpeningRate = this.mOpeningRate - 0.00007;
               s.mPctOpen = s.mPctOpen + this.mOpeningRate;
               if(s.mPctOpen >= 1)
               {
                  s.mPctOpen = 1;
                  this.mOpeningMouth = false;
                  this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_DEATHSKULL_CHOMP);
               }
            }
            else if(this.mMouthOpenDelay <= 0 && !this.mOpeningMouth)
            {
               this.mApp.mLayers[3].mBackground.addChild(this.mLargeBlackSprite);
               this.mApp.mLayers[3].mBackground.addChild(this.mLargeMiddleSprite);
               this.mApp.mLayers[3].mBackground.addChild(this.mLargeTopSprite);
               min_open = MIN_MOUTH_OPEN - 0.01;
               if(s.mPctOpen > min_open)
               {
                  s.mPctOpen = s.mPctOpen - 0.12;
               }
               if(s.mPctOpen < 0.65)
               {
                  this.mApp.mLayers[3].mBackground.addChild(this.mLargeBottomSprite);
               }
               if(s.mPctOpen < min_open)
               {
                  s.mPctOpen = min_open;
                  this.mDestX = this.mStartX;
                  this.mDestY = this.mStartY;
                  this.mVX = (this.mDestX - this.mX) / this.mMoveFrames;
                  this.mVY = (this.mDestY - this.mY) / this.mMoveFrames;
                  this.mUpdateCount = 0;
                  this.mCloseDelay = 25;
                  this.mAngleInc = this.mAngleOutInc;
                  this.mDisappearing = true;
                  this.mBoard.mFrog.SetPos(-50,-50);
                  this.mBoard.mFrog.update();
               }
               else
               {
                  this.mFrogClipHeight = this.mFrogClipHeight - 40;
               }
            }
         }
      }
      
      public function DrawBelowFrog() : void
      {
         var s:SkullFrame = null;
         var dm:int = 0;
         var final_idx:int = -1;
         var i:int = !!this.mDisappearing?int(this.mFrames.length - 1):0;
         if(this.mDisappearing)
         {
            while(i >= 0)
            {
               s = this.mFrames[i];
               if(s.mIsFinalFrame)
               {
                  final_idx = i;
               }
               else
               {
                  this.DrawFrogItem(s,Draw_Both);
               }
               i--;
            }
         }
         else if(!this.mDisappearing)
         {
            while(i < this.mFrames.length)
            {
               s = this.mFrames[i];
               if(s.mIsFinalFrame)
               {
                  final_idx = i;
               }
               else
               {
                  this.DrawFrogItem(s,Draw_Both);
               }
               i++;
            }
         }
         if(final_idx != -1)
         {
            s = this.mFrames[final_idx];
            dm = !this.mOpeningMouth && this.mMouthOpenDelay <= 0?int(Draw_BG):int(Draw_Both);
            this.DrawFrogItem(s,dm);
         }
      }
   }
}
