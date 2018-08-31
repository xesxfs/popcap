package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   import com.popcap.flash.framework.resources.images.ImageInst;
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import de.polygonal.ds.DLinkedList;
   import de.polygonal.ds.DListIterator;
   import flash.display.Bitmap;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class Ball
   {
      
      public static var mIdGen:int = 0;
       
      
      public var mComboScore:int;
      
      public var mExplodeAlpha:Number = 1.0;
      
      public var mExplodeFrame:int;
      
      public var mPowerupIconSprite:Sprite;
      
      public var mExplodingFromLightning:Boolean;
      
      public var mIsCannon:Boolean;
      
      public var mIconAppearScale:Number;
      
      public var mBallBitmap:Bitmap;
      
      public var mHilightSprite:Sprite;
      
      public var mComboCount:int;
      
      public var mPowerupIconImage:ImageInst;
      
      public var p:SexyVector3;
      
      public var mDead:Boolean;
      
      public var mApp:Zuma2App;
      
      public var mGapBonus:int;
      
      public var mId:int;
      
      public var mStartFrame:int;
      
      public var mCollidesWithNext:Boolean;
      
      public var mLastPowerType:int;
      
      public var mExplodingInTunnel:Boolean;
      
      public var mCurve:CurveMgr;
      
      public var mLastFrame:int;
      
      public var mNeedCheckCollision:Boolean;
      
      private var mMatrix:Matrix;
      
      public var mPowerupIconBitmap:Bitmap;
      
      public var mCel:int;
      
      public var mPowerupBallImage:ImageInst;
      
      public var mList:DLinkedList;
      
      public var mBallImage:ImageInst;
      
      public var mBallExplodeBitmap:Bitmap;
      
      public var mPulseState:int;
      
      public var mRotationInc:Number;
      
      public var mHilightBitmap:Bitmap;
      
      public var mHilightPulse:Boolean;
      
      public var mSuckCount:int;
      
      public var mRotation:Number;
      
      public var mBackwardsSpeed:Number;
      
      public var mShrinkClear:Boolean;
      
      public var mUpdateCount:int;
      
      public var mShouldRemove:Boolean;
      
      public var mBallExplodeImage:ImageInst;
      
      public var mPriority:int;
      
      public var mPowerFade:int;
      
      public var mSuckPending:Boolean;
      
      public var mDestRotation:Number;
      
      public var mColorType:int;
      
      public var mPowerCount:int;
      
      public var mRadius:Number;
      
      public var mSuckFromCompacting:Boolean;
      
      public var mIconScaleRate:Number;
      
      public var mWayPoint:Number;
      
      public var mExploding:Boolean;
      
      public var mPulseTimer:int;
      
      public var mInTunnel:Boolean;
      
      public var mX:Number;
      
      public var mY:Number;
      
      public var mPowerupBallBitmap:Bitmap;
      
      public var mFrog:Gun;
      
      public var mCannonFrame:int;
      
      public var mBackwardsCount:int;
      
      public var mBullet:Bullet;
      
      public var mNumGaps:int;
      
      public var mSuckBack:Boolean;
      
      public var mSpeedy:Boolean;
      
      public var mPowerGracePeriod:int;
      
      public var mIconCel:int;
      
      public var mDestPowerType:int;
      
      public var mBallSprite:Sprite;
      
      public var mPowerType:int;
      
      public var mListItr:DListIterator;
      
      public function Ball(app:Zuma2App)
      {
         this.mMatrix = new Matrix();
         this.p = new SexyVector3(0,0,0);
         super();
         this.mApp = app;
         this.mDead = false;
         this.mId = ++mIdGen;
         this.mBallSprite = new Sprite();
         this.mHilightSprite = new Sprite();
         this.mHilightBitmap = new Bitmap();
         this.mBallImage = this.mApp.imageManager.getImageInst(this.PickBallColor());
         this.mBallImage.mFrame = Math.random() * 60;
         this.mMatrix.translate(-13,-13);
         this.mBallSprite = new Sprite();
         this.mBallSprite.graphics.beginBitmapFill(this.mBallImage.pixels,this.mMatrix,false,true);
         this.mBallSprite.graphics.drawRect(-13,-13,26,26);
         this.mBallSprite.graphics.endFill();
         this.mBallSprite.x = -50;
         this.mBallSprite.y = -50;
         this.mApp.mLayers[0].mBalls.addChild(this.mBallSprite);
         this.mApp.mLayers[0].mBalls.addChild(this.mHilightSprite);
         this.mPriority = 0;
         this.mFrog = null;
         this.mInTunnel = false;
         this.mCurve = null;
         this.mUpdateCount = 0;
         this.mSuckFromCompacting = false;
         this.mX = 0;
         this.mY = 0;
         this.mSuckBack = true;
         this.mBullet = null;
         this.mCel = 0;
         this.mShouldRemove = false;
         this.mLastFrame = 0;
         this.mIsCannon = false;
         this.mSpeedy = false;
         this.mList = null;
         this.mCollidesWithNext = false;
         this.mSuckCount = 0;
         this.mBackwardsCount = 0;
         this.mBackwardsSpeed = 0;
         this.mComboCount = 0;
         this.mComboScore = 0;
         this.mRotation = 0;
         this.mRotationInc = 0;
         this.mNeedCheckCollision = false;
         this.mSuckPending = false;
         this.mShrinkClear = false;
         this.mIconCel = -1;
         this.mIconAppearScale = 1;
         this.mIconScaleRate = 0;
         this.mStartFrame = 0;
         this.mWayPoint = 0;
         this.mPowerType = PowerType.PowerType_None;
         this.mDestPowerType = PowerType.PowerType_None;
         this.mPowerCount = 0;
         this.mPowerFade = 0;
         this.mGapBonus = 0;
         this.mNumGaps = 0;
         this.mExplodeFrame = 0;
         this.mPowerGracePeriod = 0;
         this.mLastPowerType = PowerType.PowerType_None;
         this.mExplodingFromLightning = false;
         this.mExploding = this.mExplodingInTunnel = false;
         this.mRadius = 18;
      }
      
      public function SetComboCount(theCount:int, theScore:int) : void
      {
         this.mComboCount = theCount;
         this.mComboScore = theScore;
      }
      
      public function GetX() : Number
      {
         return this.mX;
      }
      
      public function SetPriority(p:int) : void
      {
         if(p > this.mPriority)
         {
            this.mApp.mLayers[1].mBalls.addChild(this.mBallSprite);
            this.mApp.mLayers[1].mBalls.addChild(this.mHilightSprite);
            if(this.mPowerupIconSprite != null)
            {
               this.mApp.mLayers[1].mForeground.addChild(this.mPowerupIconSprite);
            }
         }
         if(p < this.mPriority)
         {
            this.mApp.mLayers[0].mBalls.addChild(this.mBallSprite);
            this.mApp.mLayers[0].mBalls.addChild(this.mHilightSprite);
            if(this.mPowerupIconSprite != null)
            {
               this.mApp.mLayers[0].mForeground.addChild(this.mPowerupIconSprite);
            }
         }
         this.mPriority = p;
      }
      
      public function GetBackwardsSpeed() : int
      {
         return this.mBackwardsSpeed;
      }
      
      public function GetIsCannon() : Boolean
      {
         return this.mIsCannon;
      }
      
      public function SetBackwardsSpeed(speed:Number) : void
      {
         this.mBackwardsSpeed = speed;
      }
      
      public function GetExplosionColor() : String
      {
         var imageString:String = null;
         switch(this.mColorType)
         {
            case 0:
               imageString = Zuma2Images.IMAGE_BALL_BLUE_EXPLOSION;
               break;
            case 1:
               imageString = Zuma2Images.IMAGE_BALL_YELLOW_EXPLOSION;
               break;
            case 2:
               imageString = Zuma2Images.IMAGE_BALL_RED_EXPLOSION;
               break;
            case 3:
               imageString = Zuma2Images.IMAGE_BALL_GREEN_EXPLOSION;
               break;
            case 4:
               imageString = Zuma2Images.IMAGE_BALL_PURPLE_EXPLOSION;
               break;
            case 5:
               imageString = Zuma2Images.IMAGE_BALL_WHITE_EXPLOSION;
               break;
            default:
               imageString = Zuma2Images.IMAGE_BALL_BLUE_EXPLOSION;
         }
         return imageString;
      }
      
      public function GetPrevBall(mustCollide:Boolean = false) : Ball
      {
         if(this.mList == null)
         {
            return null;
         }
         var anItr:DListIterator = this.mListItr;
         if(anItr.node == this.mList.head)
         {
            return null;
         }
         if(!mustCollide)
         {
            return anItr.node.prev.data;
         }
         var aBall:Ball = anItr.node.prev.data;
         if(aBall.GetCollidesWithNext())
         {
            return aBall;
         }
         return null;
      }
      
      public function RemoveFromList() : void
      {
         if(this.mList != null)
         {
            this.mList.remove(this.mListItr);
            this.mList = null;
            this.mListItr = null;
         }
      }
      
      public function UpdateExplosion() : void
      {
         if(!this.mExploding)
         {
            return;
         }
         if(!this.mExplodingFromLightning && this.mUpdateCount % 4 == 0)
         {
            this.mExplodeFrame++;
            this.mExplodeAlpha = this.mExplodeAlpha - 0.15;
         }
         if(this.mExplodeFrame >= 10)
         {
            this.mShouldRemove = true;
         }
      }
      
      public function GetIsExploding() : Boolean
      {
         return this.mExploding;
      }
      
      public function GetGapBonus() : int
      {
         return this.mGapBonus;
      }
      
      public function SetWayPoint(thePoint:Number, in_tunnel:Boolean) : void
      {
         this.mWayPoint = thePoint;
         this.mInTunnel = in_tunnel;
         if(thePoint > 100)
         {
         }
      }
      
      public function Contains(x:int, y:int) : Boolean
      {
         x = x - this.mX;
         y = y - this.mY;
         var r:int = this.GetRadius() - 3;
         if(x * x + y * y < r * r)
         {
            return true;
         }
         return false;
      }
      
      public function SetSuckPending(pending:Boolean, compact:Boolean = false) : void
      {
         this.mSuckPending = pending;
         this.mSuckFromCompacting = compact;
      }
      
      public function SetCollidesWithNext(collidesWithNext:Boolean) : void
      {
         this.mCollidesWithNext = collidesWithNext;
      }
      
      public function GetSuckCount() : int
      {
         return this.mSuckCount;
      }
      
      public function SetBallImage(color:int) : void
      {
         var imageString:String = null;
         switch(color)
         {
            case 0:
               imageString = Zuma2Images.IMAGE_BALL_BLUE;
               break;
            case 1:
               imageString = Zuma2Images.IMAGE_BALL_YELLOW;
               break;
            case 2:
               imageString = Zuma2Images.IMAGE_BALL_RED;
               break;
            case 3:
               imageString = Zuma2Images.IMAGE_BALL_GREEN;
               break;
            case 4:
               imageString = Zuma2Images.IMAGE_BALL_PURPLE;
               break;
            case 5:
               imageString = Zuma2Images.IMAGE_BALL_WHITE;
               break;
            default:
               imageString = Zuma2Images.IMAGE_BALL_BLUE;
         }
         this.mBallImage = this.mApp.imageManager.getImageInst(imageString);
         this.mBallImage.mFrame = Math.random() * 60;
         this.mBallSprite.graphics.clear();
         this.mBallSprite.graphics.beginBitmapFill(this.mBallImage.pixels,this.mMatrix,false,true);
         this.mBallSprite.graphics.drawRect(-13,-13,26,26);
         this.mBallSprite.graphics.endFill();
      }
      
      public function GetCollidesWithPrev() : Boolean
      {
         var aPrevBall:Ball = this.GetPrevBall();
         if(aPrevBall != null)
         {
            return aPrevBall.GetCollidesWithNext();
         }
         return false;
      }
      
      public function GetShouldRemove() : Boolean
      {
         return this.mShouldRemove;
      }
      
      public function CollidesWith(ball:Ball, thePad:int = 0) : Boolean
      {
         return Math.abs(int(this.mWayPoint) - int(ball.mWayPoint)) < (this.mRadius + thePad) * 2;
      }
      
      public function UpdateCollisionInfo(thePad:int = 0) : void
      {
         var aPrevBall:Ball = this.GetPrevBall();
         var aNextBall:Ball = this.GetNextBall();
         if(aPrevBall != null)
         {
            aPrevBall.SetCollidesWithNext(aPrevBall.CollidesWith(this,thePad));
         }
         if(aNextBall != null)
         {
            this.SetCollidesWithNext(aNextBall.CollidesWith(this,thePad));
         }
         else
         {
            this.SetCollidesWithNext(false);
         }
      }
      
      public function GetColorType() : Number
      {
         return this.mColorType;
      }
      
      public function SetPos(x:Number, y:Number) : void
      {
         this.mX = x;
         this.mY = y;
      }
      
      public function Explode(in_tunnel:Boolean, from_lightning_frog:Boolean) : void
      {
         var p:PowerEffect = null;
         if(this.mExploding)
         {
            return;
         }
         this.mExplodeAlpha = 1;
         this.mBallSprite.graphics.clear();
         this.mHilightSprite.graphics.clear();
         if(this.mPowerupIconSprite != null)
         {
            this.mPowerupIconSprite.graphics.clear();
         }
         this.mExploding = true;
         this.mExplodingInTunnel = in_tunnel;
         if(!this.mExplodingInTunnel)
         {
            this.mExplodeFrame = 0;
            this.mBallExplodeImage = this.mApp.imageManager.getImageInst(this.GetExplosionColor());
            this.mBallExplodeImage.mFrame = this.mExplodeFrame;
            this.mBallExplodeBitmap = new Bitmap(this.mBallExplodeImage.pixels);
            this.mBallExplodeBitmap.x = -this.mBallExplodeBitmap.width / 2;
            this.mBallExplodeBitmap.y = -this.mBallExplodeBitmap.height / 2;
            this.mBallSprite.addChild(this.mBallExplodeBitmap);
         }
         var b:GameBoardWidget = this.mCurve.mBoard;
         if(this.GetPowerOrDestType() == PowerType.PowerType_ProximityBomb)
         {
            p = new PowerEffect(this.mApp,this.mX,this.mY);
            p.AddDefaultEffectType(PowerEffect.PowerEffect_Bomb,this.mColorType,this.mRotation);
            b.AddPowerEffect(p);
            b.AddProxBombExplosion(this.GetX(),this.GetY());
         }
         else if(this.GetPowerOrDestType() == PowerType.PowerType_Accuracy)
         {
            p = new PowerEffect(this.mApp,this.mX,this.mY);
            p.AddDefaultEffectType(PowerEffect.PowerEffect_Accuracy,this.mColorType,this.mRotation);
            b.AddPowerEffect(p);
         }
         else if(this.GetPowerOrDestType() == PowerType.PowerType_MoveBackwards)
         {
            p = new ReversePowerEffect(this.mApp,this,this.mX,this.mY);
            p.AddDefaultEffectType(PowerEffect.PowerEffect_Reverse,this.mColorType,this.mRotation);
            b.AddPowerEffect(p);
         }
         else if(this.GetPowerOrDestType() == PowerType.PowerType_SlowDown)
         {
            p = new PowerEffect(this.mApp,this.mX,this.mY);
            p.AddDefaultEffectType(PowerEffect.PowerEffect_Stop,this.mColorType,this.mRotation);
            b.AddPowerEffect(p);
         }
         else if(this.GetPowerOrDestType() != PowerType.PowerType_Cannon)
         {
            if(this.GetPowerOrDestType() == PowerType.PowerType_Laser)
            {
            }
         }
         if(this.GetPowerOrDestType() != PowerType.PowerType_None)
         {
         }
      }
      
      public function SetSuckCount(theCount:int, suck_back:Boolean = true) : void
      {
         this.mSuckCount = theCount;
         this.mSuckBack = suck_back;
      }
      
      public function GetPowerOrDestType(include_grace_period:Boolean = true) : int
      {
         if(this.mPowerType != PowerType.PowerType_None)
         {
            return this.mPowerType;
         }
         if(this.mPowerGracePeriod > 0 && this.mLastPowerType != PowerType.PowerType_None)
         {
            return this.mLastPowerType;
         }
         return this.mDestPowerType;
      }
      
      public function GetRotation() : Number
      {
         return this.mRotation;
      }
      
      public function GetBackwardsCount() : int
      {
         return this.mBackwardsCount;
      }
      
      public function GetSuckPending() : Boolean
      {
         return this.mSuckPending;
      }
      
      public function SetBackwardsCount(theCount:int) : void
      {
         this.mBackwardsCount = theCount;
      }
      
      public function GetNextBall(mustCollide:Boolean = false) : Ball
      {
         if(this.mList == null)
         {
            return null;
         }
         var anItr:DListIterator = this.mListItr;
         if(anItr.node.next == null)
         {
            return null;
         }
         if(!mustCollide || this.GetCollidesWithNext())
         {
            return anItr.node.next.data;
         }
         return null;
      }
      
      public function Update(theAmount:Number = 1) : void
      {
         var imageString:String = null;
         this.mUpdateCount++;
         if(this.mPowerFade > 0)
         {
            this.mIconAppearScale = this.mIconAppearScale - this.mIconScaleRate;
            if(this.mIconAppearScale < 1)
            {
               this.mIconAppearScale = 1;
            }
            this.mPowerFade--;
            if(this.mPowerFade == 0)
            {
               this.mPowerType = this.mDestPowerType;
               if(this.mPowerType == PowerType.PowerType_None)
               {
                  return;
               }
               this.mDestPowerType = PowerType.PowerType_None;
               if(this.mPowerType != PowerType.PowerType_None && this.mPowerCount <= 0)
               {
                  this.mPowerCount = 2000;
               }
               imageString = this.GetPowerupImage();
               this.mPowerupBallImage = this.mApp.imageManager.getImageInst(imageString);
               this.mPowerupBallImage.mFrame = this.mIconCel;
               this.mPowerupIconSprite.graphics.beginBitmapFill(this.mPowerupBallImage.pixels,this.mMatrix,false,true);
               this.mPowerupIconSprite.graphics.drawRect(-13,-13,26,26);
               this.mPowerupIconSprite.graphics.endFill();
               this.mIconAppearScale = 1;
               if(this.mPowerType == PowerType.PowerType_MoveBackwards)
               {
                  this.mPowerupIconImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_POWERUP_REVERSE_PULSE);
                  this.mPowerupIconImage.mFrame = 0;
                  this.mPowerupIconBitmap.bitmapData = this.mPowerupIconImage.pixels;
                  this.mPowerupIconBitmap.x = -this.mPowerupIconBitmap.width / 2;
                  this.mPowerupIconBitmap.y = -this.mPowerupIconBitmap.height / 2;
                  this.mPowerupIconBitmap.smoothing = true;
                  this.mPowerupIconSprite.addChild(this.mPowerupIconBitmap);
               }
               this.mBallSprite.visible = false;
               this.mIconCel = -1;
            }
         }
         if(this.mPowerCount > 0 && !this.mExploding)
         {
            if(--this.mPowerCount <= 0)
            {
               this.mPowerGracePeriod = 150;
               this.mLastPowerType = this.GetPowerOrDestType();
               this.SetPowerType(PowerType.PowerType_None);
            }
         }
         if(this.mPowerGracePeriod > 0 && --this.mPowerGracePeriod == 0)
         {
            this.mLastPowerType = PowerType.PowerType_None;
         }
         if(this.mPowerType != PowerType.PowerType_None)
         {
            if(!this.mExploding)
            {
               this.mPulseTimer++;
               if(this.mPulseState == 0 && this.mPulseTimer >= 30)
               {
                  this.mPulseState++;
                  this.mPulseTimer = 0;
               }
               else if(this.mPulseState == 1 && this.mPulseTimer >= 128)
               {
                  this.mPulseTimer = 0;
                  this.mPulseState++;
               }
               else if(this.mPulseState == 2 && this.mPulseTimer >= 25)
               {
                  this.mPulseState = 0;
                  this.mPulseTimer = 0;
               }
            }
         }
         if(this.mPowerType == PowerType.PowerType_MoveBackwards && this.mUpdateCount % 4 == 0)
         {
            this.mCel = this.mCel == 0?21:int(this.mCel - 1);
         }
         this.UpdateRotation();
      }
      
      public function GetNumGaps() : int
      {
         return this.mNumGaps;
      }
      
      public function GetId() : int
      {
         return this.mId;
      }
      
      public function SetColorType(theType:int) : void
      {
         this.mColorType = theType;
         this.SetBallImage(this.mColorType);
      }
      
      public function SetNeedCheckCollision(needCheck:Boolean) : void
      {
         this.mNeedCheckCollision = needCheck;
      }
      
      public function GetListItr() : DListIterator
      {
         return this.mListItr;
      }
      
      public function GetWayPoint() : Number
      {
         return this.mWayPoint;
      }
      
      public function GetPowerupImage() : String
      {
         var imageString:String = null;
         switch(this.mColorType)
         {
            case 0:
               imageString = Zuma2Images.IMAGE_POWERUP_BLUE;
               break;
            case 1:
               imageString = Zuma2Images.IMAGE_POWERUP_YELLOW;
               break;
            case 2:
               imageString = Zuma2Images.IMAGE_POWERUP_RED;
               break;
            case 3:
               imageString = Zuma2Images.IMAGE_POWERUP_GREEN;
               break;
            case 4:
               imageString = Zuma2Images.IMAGE_POWERUP_PURPLE;
               break;
            case 5:
               imageString = Zuma2Images.IMAGE_POWERUP_WHITE;
               break;
            default:
               imageString = Zuma2Images.IMAGE_POWERUP_BLUE;
         }
         return imageString;
      }
      
      public function DrawAboveBalls() : void
      {
         var angle_off:Number = NaN;
         var alpha:Number = NaN;
         if(this.mPowerupIconSprite != null && this.mPowerupIconSprite.parent != null)
         {
            angle_off = -Zuma2App.MY_PI / 2;
            this.mPowerupIconSprite.rotation = (angle_off + -this.mRotation) * Zuma2App.RAD_TO_DEG;
            this.mPowerupIconSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
            this.mPowerupIconSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
            this.mPowerupIconSprite.scaleX = this.mIconAppearScale;
            this.mPowerupIconSprite.scaleY = this.mIconAppearScale;
            if(this.mPowerType == PowerType.PowerType_MoveBackwards)
            {
            }
            if(this.mIconAppearScale == 1)
            {
               if(this.mPowerType == PowerType.PowerType_MoveBackwards)
               {
                  this.mPowerupIconImage.mFrame = this.mCel;
                  this.mPowerupIconBitmap.bitmapData = this.mPowerupIconImage.pixels;
               }
               else if(this.mPulseState < 2)
               {
                  alpha = (255 - this.mPulseTimer * (this.mPulseState == 0?4:2)) / 255;
                  this.mPowerupIconBitmap.alpha = alpha;
               }
            }
         }
         else if(this.mIconCel == -1 || this.mIconAppearScale <= 1)
         {
         }
      }
      
      public function GetCollidesWithNext() : Boolean
      {
         return this.mCollidesWithNext;
      }
      
      public function GetPowerType() : int
      {
         return this.mPowerType;
      }
      
      public function SetGapBonus(theBonus:int, theNumGaps:int) : void
      {
         this.mGapBonus = theBonus;
         this.mNumGaps = theNumGaps;
      }
      
      public function Intersects(p1:SexyVector3, v1:SexyVector3, theT2:Point) : Boolean
      {
         this.p.x = p1.x - this.mX;
         this.p.y = p1.y - this.mY;
         this.p.z = 0;
         var r:Number = this.mRadius - 1;
         var a:Number = v1.Dot(v1);
         var b:Number = 2 * this.p.Dot(v1);
         var c:Number = this.p.Dot(this.p) - r * 2 * (r * 2);
         var disc:Number = b * b - 4 * a * c;
         if(disc < 0)
         {
            return false;
         }
         disc = Math.sqrt(disc);
         theT2.x = (-b - disc) / (2 * a);
         return true;
      }
      
      public function PickBallColor() : String
      {
         var imageString:String = null;
         var color:int = Math.random() * 5;
         switch(color)
         {
            case 0:
               imageString = Zuma2Images.IMAGE_BALL_BLUE;
               break;
            case 1:
               imageString = Zuma2Images.IMAGE_BALL_YELLOW;
               break;
            case 2:
               imageString = Zuma2Images.IMAGE_BALL_RED;
               break;
            case 3:
               imageString = Zuma2Images.IMAGE_BALL_GREEN;
               break;
            case 4:
               imageString = Zuma2Images.IMAGE_BALL_PURPLE;
               break;
            case 5:
               imageString = Zuma2Images.IMAGE_BALL_WHITE;
               break;
            default:
               imageString = Zuma2Images.IMAGE_BALL_BLUE;
         }
         this.mColorType = color;
         return imageString;
      }
      
      public function GetRadius() : Number
      {
         return this.mRadius;
      }
      
      public function Hide(hide:Boolean) : void
      {
         if(this.mBallSprite != null)
         {
            this.mBallSprite.visible = !hide;
         }
         if(this.mPowerupIconSprite != null)
         {
            this.mPowerupIconSprite.visible = !hide;
         }
      }
      
      public function Draw(canvas:Canvas) : void
      {
         this.mBallSprite.x = (this.mX - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
         this.mBallSprite.y = (this.mY - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
         this.mBallSprite.rotation = -this.mRotation * Zuma2App.RAD_TO_DEG;
         if(!this.mExploding)
         {
            this.mBallImage.mFrame = this.GetFrame();
            this.mBallImage.mIsSmoothed = true;
            this.mBallSprite.graphics.clear();
            this.mBallSprite.graphics.beginBitmapFill(this.mBallImage.pixels,this.mMatrix,false,true);
            this.mBallSprite.graphics.drawRect(-13,-13,26,26);
            this.mBallSprite.graphics.endFill();
            this.mHilightSprite.graphics.clear();
            if(this.mHilightPulse && this.mPowerType == PowerType.PowerType_None || this.mCurve.mPostZumaFlashTimer > 0)
            {
               this.mHilightSprite.x = (this.mX - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
               this.mHilightSprite.y = (this.mY - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
               this.mHilightSprite.rotation = -this.mRotation * Zuma2App.RAD_TO_DEG;
               this.mHilightSprite.blendMode = BlendMode.ADD;
               this.mHilightSprite.graphics.beginBitmapFill(this.mBallImage.pixels,this.mMatrix,false,true);
               this.mHilightSprite.graphics.drawRect(-13,-13,26,26);
               this.mHilightSprite.graphics.endFill();
            }
         }
         else if(this.mExploding && this.mBallExplodeImage != null)
         {
            this.mBallExplodeImage.mFrame = this.mExplodeFrame;
            this.mBallExplodeBitmap.bitmapData = this.mBallExplodeImage.pixels;
            this.mBallSprite.alpha = this.mExplodeAlpha;
         }
         this.DrawAboveBalls();
      }
      
      public function CollidesWithPhysically(theBall:Ball, thePad:int = 0) : Boolean
      {
         var dx:Number = theBall.GetX() - this.GetX();
         var dy:Number = theBall.GetY() - this.GetY();
         var r:Number = Number(theBall.GetRadius() + thePad * 2 + this.GetRadius());
         if(!Boolean(dx * dx + dy * dy < r * r))
         {
         }
         return dx * dx + dy * dy < r * r;
      }
      
      public function GetComboScore() : int
      {
         return this.mComboScore;
      }
      
      public function UpdateRotation() : void
      {
         if(this.mRotationInc != 0)
         {
            this.mRotation = this.mRotation + this.mRotationInc;
            if(this.mRotationInc > 0 && this.mRotation > this.mDestRotation || this.mRotationInc < 0 && this.mRotation < this.mDestRotation)
            {
               this.mRotation = this.mDestRotation;
               this.mRotationInc = 0;
            }
         }
      }
      
      public function SetCollidesWithPrev(collidesWithPrev:Boolean) : void
      {
         var aPrevBall:Ball = this.GetPrevBall();
         if(aPrevBall != null)
         {
            return aPrevBall.SetCollidesWithNext(collidesWithPrev);
         }
      }
      
      public function InsertInList(list:DLinkedList, itr:DListIterator, cm:CurveMgr) : DListIterator
      {
         this.mList = list;
         if(itr.node == null)
         {
            this.mList.insertAfter(itr,this);
         }
         else
         {
            this.mList.insertBefore(itr,this);
         }
         this.mListItr = this.mList.nodeOf(this);
         if(this.mListItr.node == null)
         {
            trace("Iterator node is null");
         }
         this.mCurve = cm;
         return this.mListItr;
      }
      
      public function GetSuckBack() : Boolean
      {
         return this.mSuckBack;
      }
      
      public function SetPowerType(theType:int, delay:Boolean = true) : void
      {
         var aColor:ColorTransform = null;
         var color:int = 0;
         if(theType == this.mPowerType)
         {
            return;
         }
         this.mPulseState = 0;
         this.mPulseTimer = 0;
         this.mIconCel = -1;
         if(theType != PowerType.PowerType_None)
         {
            this.mPowerGracePeriod = 0;
            this.mLastPowerType = PowerType.PowerType_None;
         }
         if(delay)
         {
            this.mDestPowerType = theType;
            if(theType == PowerType.PowerType_None && this.mPowerType == PowerType.PowerType_GauntletMultBall)
            {
               this.mPowerFade = 300;
            }
            else
            {
               this.mPowerFade = 100;
            }
            switch(theType)
            {
               case PowerType.PowerType_Accuracy:
                  this.mIconCel = 0;
                  break;
               case PowerType.PowerType_ColorNuke:
                  this.mIconCel = 1;
                  break;
               case PowerType.PowerType_SlowDown:
                  this.mIconCel = 2;
                  break;
               case PowerType.PowerType_ProximityBomb:
                  this.mIconCel = 3;
                  break;
               case PowerType.PowerType_MoveBackwards:
                  this.mIconCel = 4;
                  break;
               case PowerType.PowerType_Cannon:
                  this.mIconCel = 5;
                  break;
               case PowerType.PowerType_Laser:
                  this.mIconCel = 6;
            }
            if(theType != PowerType.PowerType_None)
            {
               if(theType != PowerType.PowerType_GauntletMultBall)
               {
                  this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_POWERUP_APPEARS2);
               }
            }
            else if(this.GetPowerOrDestType() != PowerType.PowerType_None)
            {
               if(this.GetPowerOrDestType() != PowerType.PowerType_GauntletMultBall)
               {
                  this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_POWERUP_DISAPPEARS);
               }
            }
            if(this.mIconCel != -1)
            {
               this.mPowerupIconImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_POWERUP_POWERPULSES);
               this.mPowerupIconImage.mFrame = this.mIconCel;
               this.mPowerupIconBitmap = new Bitmap(this.mPowerupIconImage.pixels,PixelSnapping.NEVER,true);
               this.mPowerupIconBitmap.x = -this.mPowerupIconBitmap.width / 2;
               this.mPowerupIconBitmap.y = -this.mPowerupIconBitmap.height / 2;
               this.mPowerupIconBitmap.blendMode = BlendMode.ADD;
               aColor = this.mPowerupIconBitmap.transform.colorTransform;
               color = this.mApp.gBallColors[this.mColorType];
               aColor.redMultiplier = ((color & 16711680) >> 16) / 255;
               aColor.greenMultiplier = ((color & 65280) >> 8) / 255;
               aColor.blueMultiplier = ((color & 255) >> 0) / 255;
               this.mPowerupIconBitmap.transform.colorTransform = aColor;
               if(this.mPowerupIconSprite == null)
               {
                  this.mPowerupIconSprite = new Sprite();
                  this.mPowerupIconSprite.addChild(this.mPowerupIconBitmap);
               }
               else
               {
                  this.mPowerupIconSprite.addChild(this.mPowerupIconBitmap);
               }
               this.mApp.mLayers[this.mPriority].mForeground.addChild(this.mPowerupIconSprite);
               this.mIconAppearScale = 5;
               this.mIconScaleRate = (this.mIconAppearScale - 1) / Number(this.mPowerFade);
            }
            else if(this.mIconCel == -1 && this.mPowerupIconSprite.parent != null)
            {
               this.mPowerupIconSprite.parent.removeChild(this.mPowerupIconSprite);
               this.mPowerupIconSprite = null;
               this.mBallSprite.visible = true;
            }
         }
         else
         {
            this.mDestPowerType = PowerType.PowerType_None;
            this.mPowerType = theType;
         }
         if(theType != PowerType.PowerType_None)
         {
         }
      }
      
      public function GetDestPowerType() : int
      {
         return this.mDestPowerType;
      }
      
      public function Delete() : void
      {
         if(this.mBallSprite.parent != null)
         {
            this.mBallSprite.parent.removeChild(this.mBallSprite);
         }
         if(this.mHilightSprite != null)
         {
            if(this.mHilightSprite.parent != null)
            {
               this.mHilightSprite.parent.removeChild(this.mHilightSprite);
            }
         }
         if(this.mPowerupIconSprite != null)
         {
            if(this.mPowerupIconSprite.parent != null)
            {
               this.mPowerupIconSprite.parent.removeChild(this.mPowerupIconSprite);
            }
         }
      }
      
      public function GetFrame() : int
      {
         var aFrame:int = 0;
         var div:int = 1;
         var aNumFrames:int = 60;
         var aPoint:int = this.mWayPoint;
         aFrame = (aPoint / div + this.mStartFrame) % aNumFrames;
         if(aFrame < 0)
         {
            aFrame = -aFrame;
         }
         else if(aFrame >= aNumFrames)
         {
            aFrame = aNumFrames - 1;
         }
         return aFrame;
      }
      
      public function GetBullet() : Bullet
      {
         if(this.mBullet != null)
         {
         }
         return this.mBullet;
      }
      
      public function SetRotation(theRot:Number, immediate:Boolean = true) : void
      {
         if(immediate)
         {
            this.mRotation = theRot;
         }
         else
         {
            if(Math.abs(theRot - this.mRotation) <= 0.001)
            {
               return;
            }
            while(Math.abs(theRot - this.mRotation) > Zuma2App.MY_PI)
            {
               if(theRot > this.mRotation)
               {
                  theRot = theRot - 2 * Zuma2App.MY_PI;
               }
               else
               {
                  theRot = theRot + 2 * Zuma2App.MY_PI;
               }
            }
            this.mDestRotation = theRot;
            this.mRotationInc = Zuma2App.MY_PI / 30;
            if(theRot < this.mRotation)
            {
               this.mRotationInc = -this.mRotationInc;
            }
         }
      }
      
      public function GetY() : Number
      {
         return this.mY;
      }
      
      public function GetSpeedy() : Boolean
      {
         return this.mSpeedy;
      }
      
      public function GetSuckFromCompacting() : Boolean
      {
         return this.mSuckFromCompacting;
      }
      
      public function SetBullet(theBullet:Bullet) : void
      {
         this.mBullet = theBullet;
      }
      
      public function SetSpeedy(speedy:Boolean) : void
      {
         this.mSpeedy = speedy;
      }
      
      public function GetComboCount() : int
      {
         return this.mComboCount;
      }
   }
}
