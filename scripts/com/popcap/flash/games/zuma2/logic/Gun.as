package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   import com.popcap.flash.framework.resources.images.ImageInst;
   import com.popcap.flash.framework.widgets.Widget;
   import com.popcap.flash.framework.widgets.WidgetContainer;
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import flash.display.Bitmap;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class Gun extends WidgetContainer implements Widget
   {
      
      public static const GunState_Firing:int = 1;
      
      public static const FrogType_Normal:int = 0;
      
      public static const FROG_WIDTH:int = 147;
      
      public static const NUM_CHEVRONS:int = 5;
      
      public static const TONGUE_Y1:int = 5;
      
      public static const TONGUE_Y2:int = 3;
      
      public static const FrogType_Cannon:int = 1;
      
      public static const FROG_HEIGHT:int = 134;
      
      public static const TONGUE_YNOBALL:int = 7;
      
      public static const DEG_TO_RAD:Number = Zuma2App.MY_PI / 180;
      
      public static const RAD_TO_DEG:Number = 180 / Zuma2App.MY_PI;
      
      public static const GunState_Reloading:int = 2;
      
      public static const GunState_Normal:int = 0;
       
      
      public var mBallXOff:int;
      
      private var mIsInited:Boolean = false;
      
      public var mFirePoint:int;
      
      public var mCurrentBody:FrogBody;
      
      private var mEyesSprite:Sprite;
      
      public var mUpdateCount:int;
      
      private var mFrogBottomSprite:Sprite;
      
      private var mNextBullet:Bullet;
      
      public var mDestTime:int;
      
      private var mState:int;
      
      public var mCurX:Number = 0;
      
      public var mCurY:Number = 0;
      
      private var mEyesImage:ImageInst;
      
      public var mChevronSize:Vector.<Number>;
      
      public var mCannonAngle:Number;
      
      private var mFrogTopBitmap:Bitmap;
      
      private var mCannonBlastBitmap:Bitmap;
      
      public var mRecoilAmt:int;
      
      public var mChevrons:Array;
      
      public var mType:int;
      
      private var mFireVel:int;
      
      private var mTongueBitmap:Bitmap;
      
      public var mBallYOff:int;
      
      public var mDestAngle:Number = 0;
      
      public var mCannonCount:int;
      
      private var mFrogCenter:Point;
      
      public var mBlinkCount:int;
      
      public var mAngle:Number = 0;
      
      private var mApp:Zuma2App;
      
      public var mCenterX:Number = 0;
      
      public var mCenterY:Number = 0;
      
      public var mBoard:GameBoardWidget;
      
      public var mBulletSprite:Sprite;
      
      public var mFarthestDistance:Number;
      
      private var mStatePercent:Number = 0;
      
      public var mBX:Number = 0;
      
      public var mBY:Number = 0;
      
      private var mEyesBitmap:Bitmap;
      
      public var mCannonBullets:Vector.<Bullet>;
      
      private var mDotSprite:Sprite;
      
      public var mX:Number = 0;
      
      public var mY:Number = 0;
      
      public var mDoingCannonBlast:Boolean = false;
      
      public var mChevronPos:Vector.<Number>;
      
      private var mCenterPoint:Point;
      
      public var mBlinkTimer:int;
      
      private var mFrogBottomBitmap:Bitmap;
      
      public var mCannonRuneColor:int;
      
      public var mDestCount:int;
      
      public var mCannonRuneAlpha:int;
      
      private var mCannonBlastImage:ImageInst;
      
      private var mCannonBlastSprite:Sprite;
      
      public var mShowNextBall:Boolean;
      
      public var mCannonLightness:int;
      
      private var mFrogTopSprite:Sprite;
      
      public var mReloadPoint:int;
      
      private var mBullet:Bullet;
      
      public var mDestX2:Number = 0;
      
      public var mDoingHop:Boolean;
      
      public var mDestX1:Number = 0;
      
      public var mBallPoint:int;
      
      public var mCannonState:int;
      
      private var mDotBitmap:Bitmap;
      
      private var mTongueSprite:Sprite;
      
      public var mDestY2:Number = 0;
      
      public var mFrogBody:FrogBody;
      
      public var mDestY1:Number = 0;
      
      public function Gun(app:Zuma2App, board:GameBoardWidget)
      {
         this.mFrogCenter = new Point();
         this.mCenterPoint = new Point();
         this.mCannonBullets = new Vector.<Bullet>();
         this.mChevrons = new Array();
         this.mChevronPos = new Vector.<Number>();
         this.mChevronSize = new Vector.<Number>();
         super();
         this.mApp = app;
         this.mBoard = board;
         this.init();
      }
      
      public function SetDotColor() : void
      {
         var imageString:String = null;
         if(this.mNextBullet != null)
         {
            switch(this.mNextBullet.mColorType)
            {
               case 0:
                  imageString = Zuma2Images.IMAGE_DOT_BLUE;
                  break;
               case 1:
                  imageString = Zuma2Images.IMAGE_DOT_YELLOW;
                  break;
               case 2:
                  imageString = Zuma2Images.IMAGE_DOT_RED;
                  break;
               case 3:
                  imageString = Zuma2Images.IMAGE_DOT_GREEN;
                  break;
               case 4:
                  imageString = Zuma2Images.IMAGE_DOT_PURPLE;
                  break;
               case 5:
                  imageString = Zuma2Images.IMAGE_DOT_WHITE;
                  break;
               default:
                  imageString = Zuma2Images.IMAGE_DOT_BLACK;
            }
         }
         else
         {
            imageString = Zuma2Images.IMAGE_DOT_BLACK;
         }
         this.mDotBitmap.bitmapData = this.mApp.imageManager.getBitmapData(imageString);
         this.mDotBitmap.smoothing = true;
         this.mDotBitmap.x = -(this.mDotBitmap.width / 2);
         this.mDotBitmap.y = -25;
      }
      
      public function init() : void
      {
         var j:int = 0;
         this.mIsInited = true;
         this.mState = GunState_Normal;
         this.mStatePercent = 0;
         this.mFireVel = 8;
         this.mBlinkCount = -1;
         this.mBlinkTimer = 0;
         for(var i:int = 0; i < NUM_CHEVRONS; i++)
         {
            this.mChevronSize[i] = i * 0.08 + 0.3;
            this.mChevronPos[i] = i * 80 + 10;
            this.mChevrons[i] = new Array();
            for(j = 0; j < 3; j++)
            {
               this.mChevrons[i][j] = null;
            }
         }
         this.mCurrentBody = new FrogBody();
         this.SetFrogType(FrogType_Normal,true);
         this.mBulletSprite = new Sprite();
         this.mDotSprite = new Sprite();
         this.mDotBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DOT_BLACK),PixelSnapping.NEVER,true);
         this.mDotBitmap.x = -this.mDotBitmap.width / 2;
         this.mDotBitmap.y = -25;
         this.mDotSprite.addChild(this.mDotBitmap);
         this.MakeNormalFrog();
         this.mApp.mLayers[1].mBalls.addChild(this.mFrogBottomSprite);
         this.mApp.mLayers[1].mBalls.addChild(this.mTongueSprite);
         this.mApp.mLayers[1].mForeground.addChild(this.mDotSprite);
         this.mApp.mLayers[1].mForeground.addChild(this.mFrogTopSprite);
         this.mApp.mLayers[1].mForeground.addChild(this.mEyesSprite);
      }
      
      public function KillChevrons() : void
      {
         var j:int = 0;
         if(this.mChevrons == null)
         {
            return;
         }
         for(var i:int = 0; i < NUM_CHEVRONS; i++)
         {
            if(this.mChevrons[i] != null)
            {
               for(j = 0; j < 3; j++)
               {
                  if(this.mChevrons[i][j] != null)
                  {
                     if(this.mChevrons[i][j].parent != null)
                     {
                        this.mChevrons[i][j].parent.removeChild(this.mChevrons[i][j]);
                        this.mChevrons[i][j] = null;
                     }
                  }
               }
            }
         }
      }
      
      public function SetBulletType(theType:int) : void
      {
         if(this.mBullet != null && theType != -1)
         {
            this.mBullet.SetColorType(theType);
         }
      }
      
      override public function draw(canvas:Canvas) : void
      {
         var rad:Number = NaN;
         var rad_min:Number = NaN;
         var rad_max:Number = NaN;
         var vxmin:Number = NaN;
         var vymin:Number = NaN;
         var vxmax:Number = NaN;
         var vymax:Number = NaN;
         var startx:int = 0;
         var starty:int = 0;
         var vels:Vector.<Point> = null;
         var i:int = 0;
         var v:int = 0;
         this.mFrogBottomSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mFrogBottomSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mFrogTopSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mFrogTopSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mFrogBottomSprite.rotation = this.mAngle * RAD_TO_DEG - 90;
         this.mFrogTopSprite.rotation = this.mAngle * RAD_TO_DEG - 90;
         if(this.mCannonState > 0)
         {
            this.mFrogBottomBitmap.y = 5 - this.mRecoilAmt;
         }
         else
         {
            this.mFrogBottomBitmap.y = 13 - this.mRecoilAmt;
         }
         this.mFrogTopBitmap.y = -(this.mFrogTopBitmap.height / 2) - this.mRecoilAmt;
         this.mDotSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mDotSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mDotSprite.rotation = this.mAngle * RAD_TO_DEG - 90;
         this.mDotBitmap.y = -25 - this.mRecoilAmt;
         this.DrawTongue();
         this.mEyesSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mEyesSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mEyesSprite.rotation = this.mAngle * RAD_TO_DEG - 90;
         this.mEyesBitmap.y = -9 - this.mRecoilAmt;
         if(this.mState != GunState_Normal || this.mBlinkCount >= 0)
         {
            this.DrawEyes();
         }
         else
         {
            this.mEyesSprite.visible = false;
         }
         if(this.mBullet != null)
         {
            this.mBullet.Draw(canvas);
         }
         if(this.mType == FrogType_Cannon && !this.mBoard.IsPaused())
         {
            rad = -this.mDestAngle;
            rad_min = rad - this.mCannonAngle;
            rad_max = rad + this.mCannonAngle;
            vxmin = Math.cos(rad_min);
            vymin = -Math.sin(rad_min);
            vxmax = Math.cos(rad_max);
            vymax = -Math.sin(rad_max);
            startx = (this.mBullet.GetX() + this.mBallXOff) * Zuma2App.SHRINK_PERCENT;
            starty = (this.mBullet.GetY() + this.mBallYOff) * Zuma2App.SHRINK_PERCENT;
            vels = new Vector.<Point>();
            vels[0] = new Point(vxmin,vymin);
            vels[1] = new Point(Math.cos(rad),-Math.sin(rad));
            vels[2] = new Point(vxmax,vymax);
            for(i = 0; i < NUM_CHEVRONS; i++)
            {
               for(v = 0; v < 3; v++)
               {
                  this.mChevrons[i][v].x = startx + vels[v].x * this.mChevronPos[i] * Zuma2App.SHRINK_PERCENT;
                  this.mChevrons[i][v].y = starty + vels[v].y * this.mChevronPos[i] * Zuma2App.SHRINK_PERCENT;
                  this.mChevrons[i][v].rotation = this.mDestAngle * Zuma2App.RAD_TO_DEG + 90;
                  this.mChevrons[i][v].scaleX = this.mChevronSize[i];
                  this.mChevrons[i][v].scaleY = this.mChevronSize[i];
               }
            }
         }
      }
      
      public function GetAngle() : Number
      {
         return this.mAngle;
      }
      
      public function IsFiring() : Boolean
      {
         return this.mState == GunState_Firing;
      }
      
      public function LevelReset() : void
      {
         this.SetFrogType(FrogType_Normal,true);
         this.mState = GunState_Normal;
         this.SetDotColor();
         this.init();
      }
      
      public function SetDestAngle(theAngle:Number) : void
      {
         while(this.mAngle < 0)
         {
            this.mAngle = this.mAngle + 2 * Zuma2App.MY_PI;
         }
         while(this.mAngle > 2 * Zuma2App.MY_PI)
         {
            this.mAngle = this.mAngle - 2 * Zuma2App.MY_PI;
         }
         var dist:Number = Math.abs(theAngle - this.mAngle);
         if(dist > Zuma2App.MY_PI)
         {
            if(theAngle < this.mAngle)
            {
               theAngle = theAngle + 2 * Zuma2App.MY_PI;
            }
            else
            {
               theAngle = theAngle - 2 * Zuma2App.MY_PI;
            }
         }
         this.mDestAngle = theAngle;
      }
      
      public function SetFrogType(t:int, current:Boolean) : void
      {
         var i:int = 0;
         var j:int = 0;
         var aChevron:Bitmap = null;
         var fb:FrogBody = this.mCurrentBody;
         if(current)
         {
            fb = this.mCurrentBody;
            fb.mAlpha = 255;
         }
         fb.mTongueX = 52;
         fb.mCX = FROG_WIDTH / 2;
         fb.mCY = FROG_HEIGHT / 2;
         this.mReloadPoint = -20;
         this.mFirePoint = 8;
         this.mBallPoint = 40;
         this.mBallXOff = this.mBallYOff = 0;
         fb.mNextBallX = 62;
         fb.mNextBallY = 25;
         fb.mType = t;
         if(this.mBullet != null && !this.mBullet.GetJustFired())
         {
            this.mBullet.SetIsCannon(false);
         }
         if(this.mNextBullet != null && !this.mNextBullet.GetJustFired())
         {
            this.mNextBullet.SetIsCannon(false);
         }
         if(t == FrogType_Normal)
         {
            this.mType = FrogType_Normal;
            this.KillChevrons();
            this.MakeNormalFrog();
            this.mTongueSprite.visible = true;
            if(this.mBullet != null)
            {
               this.mBullet.Hide(false);
            }
            fb.mMouthOffset = new Point(26,t == FrogType_Normal?Number(79):Number(82));
            if(t == FrogType_Normal)
            {
               fb.mLegsOffset = new Point(2,38);
               this.mBallYOff = 0;
            }
            else
            {
               fb.mLegsOffset = new Point(1,41);
            }
            fb.mBodyOffset = new Point(16,4);
            fb.mEyesOffset = new Point(32,47);
            this.mCannonState = -1;
         }
         else if(t == FrogType_Cannon)
         {
            this.mType = FrogType_Cannon;
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_CANNON_POWERUP);
            this.MakeCannonFrog();
            this.mTongueSprite.visible = false;
            for(i = 0; i < 5; i++)
            {
               for(j = 0; j < 3; j++)
               {
                  aChevron = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_CANNON_CHEVRONS));
                  aChevron.x = -aChevron.width / 2;
                  aChevron.y = -aChevron.height / 2;
                  aChevron.smoothing = true;
                  this.mChevrons[i][j] = new Sprite();
                  this.mChevrons[i][j].addChild(aChevron);
                  this.mChevrons[i][j].alpha = 160 / 255;
                  this.mApp.mLayers[2].addChild(this.mChevrons[i][j]);
               }
            }
         }
         else
         {
            trace("Invalid frog type");
         }
      }
      
      public function SetCannonCount(c:int, stack:Boolean, color_type:int, cannon_angle:Number = -100) : void
      {
         if(cannon_angle < 0)
         {
            this.mCannonAngle = this.mApp.mLevelMgr.mCannonAngle;
         }
         else
         {
            this.mCannonAngle = cannon_angle;
         }
         if(c != 0)
         {
            if(this.mCannonCount == 0)
            {
               this.mCannonRuneColor = color_type;
               this.mCannonState = 1;
               this.mCannonRuneAlpha = this.mCannonLightness = 0;
            }
            if(stack)
            {
               this.mCannonCount = this.mCannonCount + (c - 1);
            }
            else
            {
               this.mCannonCount = c - 1;
            }
         }
         else
         {
            this.mCannonCount = 0;
         }
         if(c == 0)
         {
            if(this.mBullet != null)
            {
               this.mBullet.SetIsCannon(false);
            }
            if(this.mNextBullet != null)
            {
               this.mNextBullet.SetIsCannon(false);
            }
         }
         else if(this.mBullet != null)
         {
            if(!this.mBullet.GetIsCannon())
            {
               this.SetFrogType(FrogType_Cannon,false);
               this.mBoard.DoAccuracy(false);
               if(!this.mBullet.GetJustFired())
               {
                  this.mBullet.SetIsCannon(true);
               }
               else if(!this.mNextBullet.GetJustFired())
               {
                  this.mNextBullet.SetIsCannon(true);
               }
               else
               {
                  this.mCannonCount++;
               }
            }
            else if(this.mNextBullet != null && !this.mNextBullet.GetIsCannon() && this.mState != GunState_Normal)
            {
               this.SetFrogType(FrogType_Cannon,false);
               this.mNextBullet.SetIsCannon(true);
            }
            else if(this.mState != GunState_Normal)
            {
               this.mCannonCount++;
            }
         }
      }
      
      public function GetFiredBullet() : Bullet
      {
         var aBullet:Bullet = null;
         if(this.mState == GunState_Firing && this.mStatePercent >= 0.9)
         {
            if(this.mBullet.mSkip)
            {
               this.mBullet.mSkip = false;
               return null;
            }
            aBullet = this.mBullet;
            if(this.mCannonBullets.length > 0)
            {
               this.mBullet = this.mCannonBullets[0];
               this.mCannonBullets.splice(0,1);
            }
            else
            {
               this.mState = GunState_Normal;
               if(aBullet.GetIsCannon())
               {
                  aBullet = new Bullet(this.mApp);
                  aBullet.mFrog = this;
                  aBullet.mX = this.mBullet.mX;
                  aBullet.mY = this.mBullet.mY;
                  aBullet.mVelX = this.mBullet.mVelX;
                  aBullet.mVelY = this.mBullet.mVelY;
                  aBullet.mJustFired = this.mBullet.mJustFired;
                  aBullet.mSkip = this.mBullet.mSkip;
                  aBullet.SetIsCannon(true);
                  this.mBullet.mSkip = true;
                  this.mBullet.SetJustFired(false);
                  this.mBullet.SetIsCannon(false);
               }
               else
               {
                  this.mBullet = null;
               }
            }
            return aBullet;
         }
         return null;
      }
      
      public function CalcAngle() : void
      {
         if(this.mBullet == null)
         {
            return;
         }
         var aPoint:Point = new Point();
         var start:Number = this.mCurY + this.mReloadPoint;
         var start2:Number = this.mCurY + this.mFirePoint;
         var end:Number = this.mCurY + this.mBallPoint;
         aPoint.x = this.mCurX - 2;
         if(this.mState == GunState_Normal)
         {
            aPoint.y = end;
         }
         else if(this.mState == GunState_Reloading)
         {
            aPoint.y = start + (end - start) * this.mStatePercent;
         }
         else if(this.mStatePercent <= 0.6)
         {
            aPoint.y = end + (start2 - end) * this.mStatePercent / 0.6;
         }
         else
         {
            return;
         }
         this.RotateXY(aPoint,this.mCurX,this.mCurY,-this.mAngle);
         if(this.mState == GunState_Reloading && this.mApp.gSuckMode)
         {
            if(this.mBX != 0 || this.mBY != 0)
            {
               aPoint.x = x * this.mStatePercent + this.mBX * (1 - this.mStatePercent);
               aPoint.y = y * this.mStatePercent + this.mBY * (1 - this.mStatePercent);
            }
         }
         this.mBullet.SetPos(aPoint.x,aPoint.y);
         this.mBullet.SetRotation(this.mAngle);
      }
      
      public function CannonMode() : Boolean
      {
         return this.mCannonCount > 0;
      }
      
      public function SwapBullets(playSound:Boolean = true) : void
      {
         var tmp:Bullet = null;
         if(this.mState != GunState_Normal)
         {
            return;
         }
         if(this.mApp.gSuckMode)
         {
            if(playSound)
            {
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BALL_SWAP);
            }
            tmp = this.mBullet;
            this.mBullet = this.mNextBullet;
            this.mNextBullet = tmp;
            this.mBullet.Hide(false);
            this.mNextBullet.Hide(true);
            this.mBullet.SetIsCannon(this.mNextBullet.GetIsCannon());
            this.mNextBullet.SetIsCannon(false);
            this.SetDotColor();
            this.CalcAngle();
            return;
         }
         if(this.mBullet == null || this.mNextBullet == null)
         {
            return;
         }
         if(this.mBullet.GetColorType() == this.mNextBullet.GetColorType())
         {
            return;
         }
         if(playSound)
         {
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BALL_SWAP);
         }
         tmp = this.mBullet;
         this.mBullet = this.mNextBullet;
         this.mNextBullet = tmp;
         this.mBullet.Hide(false);
         this.mNextBullet.Hide(true);
         this.mBullet.SetIsCannon(this.mNextBullet.GetIsCannon());
         this.mNextBullet.SetIsCannon(false);
         this.SetDotColor();
         this.CalcAngle();
      }
      
      public function DrawTongue() : void
      {
         var tongueY:int = 0;
         this.mTongueSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mTongueSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mTongueSprite.rotation = this.mAngle * RAD_TO_DEG - 90;
         switch(this.mState)
         {
            case GunState_Normal:
               tongueY = TONGUE_Y2;
               break;
            case GunState_Firing:
               tongueY = TONGUE_Y1 * this.mStatePercent + TONGUE_Y2 * (1 - this.mStatePercent);
               break;
            case GunState_Reloading:
               tongueY = TONGUE_Y2 * this.mStatePercent + TONGUE_Y1 * (1 - this.mStatePercent);
         }
         if(this.mBullet == null)
         {
            tongueY = TONGUE_YNOBALL;
         }
         this.mTongueBitmap.y = -5 + tongueY - this.mRecoilAmt;
      }
      
      public function SetNextBulletType(theType:int) : void
      {
         if(this.mNextBullet != null && theType != -1)
         {
            this.mNextBullet.SetColorType(theType);
            this.SetDotColor();
         }
      }
      
      public function GetCenterX() : int
      {
         return this.mCenterX;
      }
      
      public function PlayerDied() : void
      {
         this.mState = GunState_Normal;
         this.mRecoilAmt = 0;
         this.mStatePercent = 1;
         this.mBullet.Hide(true);
      }
      
      public function NeedsReload() : Boolean
      {
         return this.mNextBullet == null || this.mBullet == null;
      }
      
      public function SetAngleToDestAngle() : void
      {
         while(this.mDestAngle < 0)
         {
            this.mDestAngle = this.mDestAngle + 2 * Zuma2App.MY_PI;
         }
         while(this.mDestAngle > 2 * Zuma2App.MY_PI)
         {
            this.mDestAngle = this.mDestAngle - 2 * Zuma2App.MY_PI;
         }
         this.mAngle = this.mDestAngle;
      }
      
      public function GetCenterY() : int
      {
         return this.mCenterY;
      }
      
      public function SetFireSpeed(theSpeed:Number) : void
      {
         this.mFireVel = theSpeed;
      }
      
      public function Reload2(theType:int, delay:Boolean, thePower:int, bx:int, by:int) : void
      {
         var aBullet:Bullet = new Bullet(this.mApp);
         aBullet.mFrog = this;
         aBullet.SetColorType(theType);
         aBullet.SetPowerType(thePower,false);
         this.mBX = bx;
         this.mBY = by;
         this.mStatePercent = 0;
         this.mBullet.Delete();
         this.mBullet = aBullet;
         this.mState = GunState_Reloading;
         if(!delay)
         {
            this.mStatePercent = 1;
            this.mState = GunState_Normal;
         }
         this.SetDotColor();
         this.CalcAngle();
      }
      
      public function Reload3() : void
      {
         if(this.mBullet == null && this.mNextBullet != null)
         {
            this.mBX = 0;
            this.mBY = 0;
            this.mBullet = this.mNextBullet;
            this.mNextBullet = null;
            this.mStatePercent = 0;
            this.mState = GunState_Reloading;
            this.SetDotColor();
            this.CalcAngle();
         }
      }
      
      public function GetNextBullet() : Bullet
      {
         return this.mNextBullet;
      }
      
      public function SetDestPos(x:int, y:int, theSpeed:int, doingHop:Boolean = false) : void
      {
         this.mDoingHop = doingHop;
         this.mDestX1 = this.mCenterX;
         this.mDestY1 = this.mCenterY;
         this.mDestX2 = x;
         this.mDestY2 = y;
         var x2:Number = (this.mDestX2 - this.mDestX1) * (this.mDestX2 - this.mDestX1);
         var y2:Number = (this.mDestY2 - this.mDestY1) * (this.mDestY2 - this.mDestY1);
         var aMag:Number = Math.sqrt(x2 + y2);
         this.mDestCount = aMag / theSpeed;
         if(this.mDestCount < 1)
         {
            this.mDestCount = 1;
         }
         this.mDestTime = this.mDestCount;
      }
      
      public function SetAngle(theAngle:Number) : void
      {
         this.mAngle = this.mDestAngle = theAngle;
         this.CalcAngle();
      }
      
      public function SetPos(theX:int, theY:int) : void
      {
         this.mCenterY = theX;
         this.mCenterY = theY;
         this.mDestCount = 0;
         this.mCurX = theX;
         this.mCurY = theY;
         this.CalcAngle();
         var edgex:int = this.GetCenterX() > 800 - this.GetCenterX()?0:800;
         var edgey:int = this.GetCenterY() > 600 - this.GetCenterY()?0:600;
         var point1:Point = new Point(this.GetCenterX(),this.GetCenterY());
         var point2:Point = new Point(edgex,edgey);
         this.mFarthestDistance = Point.distance(point1,point2);
      }
      
      public function Reload(theType:int, delay:Boolean, thePower:int) : void
      {
         var aBullet:Bullet = new Bullet(this.mApp);
         aBullet.mFrog = this;
         aBullet.SetColorType(theType);
         aBullet.SetPowerType(thePower,false);
         this.mStatePercent = 0;
         if(this.mBullet != null)
         {
            this.mBullet.Delete();
         }
         this.mBullet = this.mNextBullet;
         if(this.mBullet != null)
         {
            this.mBullet.Hide(false);
         }
         if(this.mCannonCount > 0 && this.mBullet && !this.mBullet.GetIsCannon())
         {
            this.mBullet.SetIsCannon(true);
            this.mCannonCount--;
         }
         this.mNextBullet = aBullet;
         this.mState = GunState_Reloading;
         if(!delay)
         {
            this.mStatePercent = 1;
            this.mState = GunState_Normal;
         }
         this.SetDotColor();
         this.CalcAngle();
      }
      
      public function StartFire() : Boolean
      {
         var i:int = 0;
         var radmod:Number = NaN;
         var cannon_bullet:Bullet = null;
         if(this.mState != GunState_Normal)
         {
            return false;
         }
         if(this.mBullet == null)
         {
            return false;
         }
         this.mStatePercent = 0;
         this.mState = GunState_Firing;
         var aBullet:Bullet = this.mBullet;
         aBullet.SetJustFired(true);
         if(this.mCannonCount > 0 && !aBullet.GetIsCannon())
         {
            aBullet.SetIsCannon(true);
            this.mCannonCount--;
         }
         if(aBullet.GetIsCannon())
         {
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_CANNON_BLAST);
            this.mDoingCannonBlast = true;
            this.mCannonBlastImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_CANNON_BLAST);
            this.mCannonBlastBitmap = new Bitmap(this.mCannonBlastImage.pixels);
            this.mCannonBlastBitmap.x = -this.mCannonBlastBitmap.width / 2;
            this.mCannonBlastBitmap.y = -this.mCannonBlastBitmap.height / 2 + 60;
            this.mCannonBlastSprite = new Sprite();
            this.mCannonBlastSprite.addChild(this.mCannonBlastBitmap);
            this.mCannonBlastSprite.x = this.mCenterX * Zuma2App.SHRINK_PERCENT;
            this.mCannonBlastSprite.y = this.mCenterY * Zuma2App.SHRINK_PERCENT;
            this.mCannonBlastSprite.rotation = this.mAngle * Zuma2App.RAD_TO_DEG - 90;
            this.mApp.mLayers[0].mForeground.addChild(this.mCannonBlastSprite);
         }
         var rad:Number = this.mAngle;
         var vx:Number = Math.cos(rad);
         var vy:Number = Math.sin(rad);
         var vel:Number = this.mFireVel;
         this.mBullet.SetVelocity(vx * vel,vy * vel);
         if(aBullet.GetIsCannon() && this.mCannonAngle != 0)
         {
            for(i = 0; i < 2; i++)
            {
               radmod = (i == 0?-1:1) * this.mCannonAngle;
               vx = Math.cos(rad + radmod);
               vy = Math.sin(rad + radmod);
               cannon_bullet = new Bullet(this.mApp);
               cannon_bullet.mFrog = this;
               cannon_bullet.mX = this.mBullet.mX;
               cannon_bullet.mY = this.mBullet.mY;
               cannon_bullet.mJustFired = this.mBullet.mJustFired;
               cannon_bullet.mAngleFired = rad + radmod;
               cannon_bullet.SetVelocity(vel * vx,vel * vy);
               cannon_bullet.SetIsCannon(true);
               this.mCannonBullets.push(cannon_bullet);
            }
         }
         if(aBullet.GetIsCannon() && !this.CannonMode())
         {
            this.SetFrogType(FrogType_Normal,false);
         }
         this.CalcAngle();
         return true;
      }
      
      public function GetDestAngle() : Number
      {
         return this.mDestAngle;
      }
      
      public function DeleteBullet() : void
      {
         if(this.mBullet != null)
         {
            this.mBullet.Delete();
            this.mBullet = this.mNextBullet;
            this.mNextBullet = null;
         }
      }
      
      public function RotateXY(aPoint:Point, cx:Number, cy:Number, rad:Number) : void
      {
         var ox:Number = aPoint.x - cx;
         var oy:Number = aPoint.y - cy;
         rad = rad + Zuma2App.MY_PI / 2;
         aPoint.x = cx + ox * Math.cos(rad) + oy * Math.sin(rad);
         aPoint.y = cy + oy * Math.cos(rad) - ox * Math.sin(rad);
      }
      
      override public function update() : void
      {
         var v:Number = NaN;
         var amount:Number = NaN;
         var old_angle:Number = NaN;
         var t:Number = NaN;
         var i:int = 0;
         if(!this.mIsInited)
         {
            this.init();
         }
         this.mUpdateCount++;
         this.mCurX = this.mCenterX;
         this.mCurY = this.mCenterY;
         this.mX = this.mCenterX;
         this.mY = this.mCenterY;
         if(this.mBullet != null)
         {
            this.mBullet.Update();
         }
         if(this.mNextBullet != null)
         {
            this.mNextBullet.Update();
         }
         if(this.mBlinkCount >= 0 && --this.mBlinkTimer == 0)
         {
            this.mBlinkCount--;
            this.mBlinkTimer = 15;
         }
         if(this.mAngle != this.mDestAngle)
         {
            v = 100;
            amount = v;
            old_angle = this.mAngle;
            if(this.mAngle < this.mDestAngle)
            {
               this.mAngle = this.mAngle + amount;
               if(this.mAngle > this.mDestAngle)
               {
                  this.SetAngleToDestAngle();
               }
            }
            else
            {
               this.mAngle = this.mAngle - amount;
               if(this.mAngle < this.mDestAngle)
               {
                  this.SetAngleToDestAngle();
               }
            }
         }
         if(this.mDestCount > 0)
         {
            this.mDestCount--;
            t = Number(this.mDestCount) / this.mDestTime;
            this.mCenterX = t * this.mDestX1 + (1 - t) * this.mDestX2;
            this.mCenterY = t * this.mDestY1 + (1 - t) * this.mDestY2;
            if(this.mDestCount == 0)
            {
               this.mDoingHop = false;
            }
         }
         var slow_mod:Number = 1;
         if(this.mState == GunState_Firing)
         {
            this.mStatePercent = this.mStatePercent + 0.15;
            if(this.mStatePercent > 0.6)
            {
               this.mBullet.Update();
               this.mRecoilAmt = this.mRecoilAmt + 2.33;
            }
         }
         else
         {
            this.mStatePercent = this.mStatePercent + 0.07 / slow_mod;
            if(this.mState == GunState_Reloading)
            {
               if((this.mRecoilAmt = this.mRecoilAmt - 0.7 / slow_mod) < 0)
               {
                  this.mRecoilAmt = 0;
               }
            }
         }
         if(this.mStatePercent > 1)
         {
            this.mStatePercent = 1;
            if(this.mState == GunState_Reloading)
            {
               this.mState = GunState_Normal;
               this.mRecoilAmt = 0;
            }
         }
         if(this.mState == GunState_Normal && this.mRecoilAmt > 0)
         {
            if((this.mRecoilAmt = this.mRecoilAmt - 0.7) / slow_mod < 0)
            {
               this.mRecoilAmt = 0;
            }
         }
         if(this.mDoingCannonBlast)
         {
            if(this.mUpdateCount % 2 == 0)
            {
               this.mCannonBlastImage.mFrame++;
               this.mCannonBlastBitmap.bitmapData = this.mCannonBlastImage.pixels;
               if(this.mCannonBlastImage.mFrame >= 14)
               {
                  this.mDoingCannonBlast = false;
                  if(this.mCannonBlastSprite.parent != null)
                  {
                     this.mCannonBlastSprite.parent.removeChild(this.mCannonBlastSprite);
                     this.mCannonBlastSprite = null;
                     this.mCannonBlastImage = null;
                     this.mCannonBlastBitmap = null;
                  }
               }
            }
         }
         if(this.mBullet != null)
         {
            if(this.mBullet.GetIsCannon())
            {
               for(i = 0; i < NUM_CHEVRONS; i++)
               {
                  this.mChevronSize[i] = this.mChevronSize[i] + 0.001;
                  this.mChevronPos[i] = this.mChevronPos[i] + 1;
                  if(i == 0)
                  {
                  }
                  if(this.mChevronPos[i] > 420)
                  {
                     this.mChevronSize[i] = 0.3;
                     this.mChevronPos[i] = 10;
                  }
               }
            }
         }
         this.CalcAngle();
      }
      
      public function MakeNormalFrog() : void
      {
         if(this.mEyesSprite == null)
         {
            this.mEyesSprite = new Sprite();
            this.mEyesImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_FROG_EYES);
            this.mEyesImage.mFrame = 0;
            this.mEyesBitmap = new Bitmap(this.mEyesImage.pixels,PixelSnapping.NEVER,true);
            this.mEyesSprite.addChild(this.mEyesBitmap);
         }
         if(this.mFrogTopSprite == null)
         {
            this.mFrogTopSprite = new Sprite();
            this.mFrogTopBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_TOP));
            this.mFrogTopSprite.addChild(this.mFrogTopBitmap);
         }
         if(this.mFrogBottomSprite == null)
         {
            this.mFrogBottomSprite = new Sprite();
            this.mFrogBottomBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_BOTTOM));
            this.mFrogBottomSprite.addChild(this.mFrogBottomBitmap);
         }
         if(this.mTongueSprite == null)
         {
            this.mTongueSprite = new Sprite();
            this.mTongueBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_TONGUE));
            this.mTongueSprite.addChild(this.mTongueBitmap);
         }
         this.mEyesImage.mFrame = 0;
         this.mEyesImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_FROG_EYES);
         this.mEyesBitmap.bitmapData = this.mEyesImage.pixels;
         this.mEyesBitmap.smoothing = true;
         this.mEyesBitmap.x = -this.mEyesBitmap.width / 2;
         this.mEyesBitmap.y = -9;
         this.mEyesSprite.visible = false;
         this.mFrogTopBitmap.bitmapData = this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_TOP);
         this.mFrogTopBitmap.smoothing = true;
         this.mFrogTopBitmap.x = -(this.mFrogTopBitmap.width / 2);
         this.mFrogTopBitmap.y = -(this.mFrogTopBitmap.height / 2);
         this.mFrogTopSprite.x = this.mX;
         this.mFrogTopSprite.y = this.mY;
         this.mTongueBitmap.bitmapData = this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_TONGUE);
         this.mTongueBitmap.smoothing = true;
         this.mTongueBitmap.x = -(this.mTongueBitmap.width / 2);
         this.mTongueBitmap.y = -5;
         this.mTongueSprite.x = this.mX;
         this.mTongueSprite.y = this.mY;
         this.mFrogBottomBitmap.bitmapData = this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_BOTTOM);
         this.mFrogBottomBitmap.smoothing = true;
         this.mFrogBottomBitmap.x = -(this.mFrogBottomBitmap.width / 2);
         this.mFrogBottomBitmap.y = 13;
         this.mFrogBottomSprite.x = this.mX;
         this.mFrogBottomSprite.y = this.mY;
      }
      
      public function EmptyBullets(reset_frog_type:Boolean = true) : void
      {
         if(reset_frog_type)
         {
            this.SetFrogType(FrogType_Normal,true);
         }
         if(this.mNextBullet != null)
         {
            this.mNextBullet.Delete();
            this.mNextBullet = null;
         }
         if(this.mBullet != null)
         {
            this.mBullet.Delete();
            this.mBullet = null;
         }
         for(var i:int = 0; i < this.mCannonBullets.length; i++)
         {
            this.mCannonBullets[i].Delete();
         }
         this.mCannonBullets = new Vector.<Bullet>();
      }
      
      public function GetX() : Number
      {
         return this.mX;
      }
      
      public function GetY() : Number
      {
         return this.mY;
      }
      
      public function DrawEyes() : void
      {
         var cel:int = 0;
         if(this.mBlinkCount >= 0)
         {
            cel = this.mBlinkCount % 2 == 0?-1:1;
         }
         else if(this.mState != GunState_Firing)
         {
            cel = 1;
         }
         if(cel >= 0)
         {
            this.mEyesImage.mFrame = cel;
            this.mEyesBitmap.bitmapData = this.mEyesImage.pixels;
            this.mEyesSprite.visible = true;
         }
      }
      
      public function GetBullet() : Bullet
      {
         return this.mBullet;
      }
      
      public function Move(x:Number, y:Number) : void
      {
         var dx:Number = x - this.mFrogTopSprite.x;
         var dy:Number = y - this.mFrogTopSprite.y;
         var angle:Number = Math.atan2(dy,dx);
         this.mFrogTopSprite.rotation = angle * RAD_TO_DEG - 90;
         this.mFrogBottomSprite.rotation = angle * RAD_TO_DEG - 90;
         this.mDotSprite.x = this.mX - 50 * Math.cos(angle);
         this.mDotSprite.y = this.mY - 50 * Math.sin(angle);
         this.mAngle = angle;
      }
      
      public function ForceX(x:int) : void
      {
         this.mCenterX = this.mCurX = x;
      }
      
      public function ForceY(y:int) : void
      {
         this.mCenterY = this.mCurY = y;
      }
      
      public function MakeCannonFrog() : void
      {
         if(this.mEyesSprite == null)
         {
            this.mEyesSprite = new Sprite();
         }
         if(this.mFrogTopSprite == null)
         {
            this.mFrogTopSprite = new Sprite();
         }
         if(this.mFrogBottomSprite == null)
         {
            this.mFrogBottomSprite = new Sprite();
         }
         if(this.mTongueSprite == null)
         {
            this.mTongueSprite = new Sprite();
         }
         this.mEyesImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_FROG_CANNON_EYES);
         this.mEyesImage.mFrame = 0;
         this.mEyesBitmap.bitmapData = this.mEyesImage.pixels;
         this.mEyesBitmap.x = -this.mEyesBitmap.width / 2;
         this.mEyesBitmap.y = -9;
         this.mEyesSprite.visible = false;
         this.mFrogTopBitmap.bitmapData = this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_CANNON_TOP);
         this.mFrogTopBitmap.smoothing = true;
         this.mFrogTopBitmap.x = -(this.mFrogTopBitmap.width / 2);
         this.mFrogTopBitmap.y = -(this.mFrogTopBitmap.height / 2);
         this.mFrogTopSprite.x = this.mX;
         this.mFrogTopSprite.y = this.mY;
         this.mFrogBottomBitmap.bitmapData = this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FROG_CANNON_BOTTOM);
         this.mFrogBottomBitmap.smoothing = true;
         this.mFrogBottomBitmap.x = -(this.mFrogBottomBitmap.width / 2);
         this.mFrogBottomBitmap.y = 10;
         this.mFrogBottomSprite.x = this.mX;
         this.mFrogBottomSprite.y = this.mY;
      }
   }
}
