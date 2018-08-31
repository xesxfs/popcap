package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class Bullet extends Ball
   {
       
      
      public var mHitDX:Number = 0;
      
      public var mHitBall:Ball;
      
      private var mDestX:Number = 0;
      
      private var mDestY:Number = 0;
      
      public var mSkip:Boolean;
      
      private var mMatrix:Matrix;
      
      public var mHaveSetPrevBall:Boolean;
      
      public var mAngleFired:Number;
      
      public var mHitX:Number = 0;
      
      public var mHitY:Number = 0;
      
      public var mMergeSpeed:Number = 0;
      
      private var mHitInFront:Boolean;
      
      public var mCurCurvePoint:Array;
      
      public var mVelX:Number = 0;
      
      public var mVelY:Number = 0;
      
      public var mJustFired:Boolean;
      
      public var mDoNewMerge:Boolean;
      
      public var mHitDY:Number = 0;
      
      public var mGapInfo:Vector.<GapInfo>;
      
      public var mHitPercent:Number = 0;
      
      public function Bullet(app:Zuma2App)
      {
         this.mGapInfo = new Vector.<GapInfo>();
         this.mMatrix = new Matrix();
         this.mCurCurvePoint = new Array();
         super(app);
         mApp = app;
         this.mVelX = 0;
         this.mVelY = 0;
         mX = 0;
         mY = 0;
         this.mAngleFired = 0;
         mDead = false;
         this.mJustFired = false;
         this.mSkip = false;
         this.mHitBall = null;
         this.mHitPercent = 0;
         this.mMergeSpeed = 0.025;
         this.mDoNewMerge = false;
         mUpdateCount = 0;
         this.mHitDX = 0;
         this.mHitDY = 0;
         this.mMatrix.translate(-13,-13);
         mBallSprite = new Sprite();
         mApp.mLayers[1].mBalls.addChild(mBallSprite);
         mPriority = 0;
      }
      
      public function GetCurGapBall(theCurveNum:int) : int
      {
         var aCurGapBall:int = 0;
         for(var i:int = 0; i < this.mGapInfo.length; i++)
         {
            if(this.mGapInfo[i].mCurve == theCurveNum)
            {
               aCurGapBall = this.mGapInfo[i].mBallId;
            }
         }
         return aCurGapBall;
      }
      
      public function GetHitPercent() : Number
      {
         return this.mHitPercent;
      }
      
      public function GetPushBall() : Ball
      {
         if(this.mHitBall == null)
         {
            return null;
         }
         var aPushBall:Ball = null;
         aPushBall = !!this.mHitInFront?this.mHitBall.GetNextBall():this.mHitBall;
         if(aPushBall != null)
         {
            if(this.mDoNewMerge || aPushBall.CollidesWithPhysically(this))
            {
               return aPushBall;
            }
         }
         return null;
      }
      
      public function SetHitBall(theBall:Ball, hitInFront:Boolean) : void
      {
         this.SetBallInfo(null);
         this.mHaveSetPrevBall = false;
         this.mHitBall = theBall;
         this.mHitX = mX;
         this.mHitY = mY;
         this.mHitDX = mX - theBall.GetX();
         this.mHitDY = mY - theBall.GetY();
         this.mHitPercent = 0;
         this.mHitInFront = hitInFront;
         this.SetBallInfo(this);
      }
      
      public function MergeFully() : void
      {
         this.mHitPercent = 1;
         this.Update();
      }
      
      public function CheckSetHitBallToPrevBall() : void
      {
         if(this.mHaveSetPrevBall || this.mHitBall == null)
         {
            return;
         }
         var aPrevBall:Ball = this.mHitBall.GetPrevBall();
         if(aPrevBall == null)
         {
            return;
         }
         if(aPrevBall.CollidesWithPhysically(this) && !aPrevBall.GetIsExploding())
         {
            this.mHaveSetPrevBall = true;
            this.SetBallInfo(null);
            this.mHitBall = aPrevBall;
            this.mHitInFront = true;
            this.mHitX = mX;
            this.mHitY = mY;
            this.mHitDX = mX - aPrevBall.GetX();
            this.mHitDY = mY - aPrevBall.GetY();
            this.mHitPercent = 0;
            this.SetBallInfo(this);
         }
      }
      
      public function UpdateHitPos() : void
      {
         this.mHitX = mX;
         this.mHitY = mY;
      }
      
      public function GetHitBall() : Ball
      {
         return this.mHitBall;
      }
      
      public function SetCurCurvePoint(theCurveNum:int, thePoint:int) : void
      {
         this.mCurCurvePoint[theCurveNum] = thePoint;
      }
      
      public function SetIsCannon(isCannon:Boolean) : void
      {
         mIsCannon = isCannon;
         mCannonFrame = 0;
         if(mIsCannon)
         {
            mBallImage = mApp.imageManager.getImageInst(Zuma2Images.IMAGE_BALL_CANNON);
            this.mMatrix.tx = -8.5;
            this.mMatrix.ty = -15;
            mBallSprite.graphics.clear();
            mBallSprite.graphics.beginBitmapFill(mBallImage.pixels,this.mMatrix,false,true);
            mBallSprite.graphics.drawRect(-8.5,-15,19,19);
            mBallSprite.graphics.endFill();
         }
         else if(!mIsCannon)
         {
            this.SetBallImage(mColorType);
            this.mMatrix.tx = -13;
            this.mMatrix.ty = -13;
            mBallSprite.graphics.clear();
            mBallSprite.graphics.beginBitmapFill(mBallImage.pixels,this.mMatrix,false,true);
            mBallSprite.graphics.drawRect(-13,-13,26,26);
            mBallSprite.graphics.endFill();
         }
      }
      
      public function GetCurCurvePoint(theCurveNum:int) : int
      {
         return this.mCurCurvePoint[theCurveNum];
      }
      
      public function SetDestPos(x:Number, y:Number) : void
      {
         this.mDestX = x;
         this.mDestY = y;
      }
      
      public function SetBallInfo(theBullet:Bullet) : void
      {
         if(this.mHitBall != null)
         {
            this.mHitBall.SetBullet(theBullet);
         }
      }
      
      public function SetVelocity(vx:Number, vy:Number) : void
      {
         this.mVelX = vx;
         this.mVelY = vy;
      }
      
      public function GetMinGapDist() : int
      {
         var aMinDist:int = 0;
         for(var i:int = 0; i < this.mGapInfo.length; i++)
         {
            if(aMinDist == 0 || this.mGapInfo[i].mDist < aMinDist)
            {
               aMinDist = this.mGapInfo[i].mDist;
            }
         }
         return aMinDist;
      }
      
      public function GetHitInFront() : Boolean
      {
         return this.mHitInFront;
      }
      
      override public function Delete() : void
      {
         this.SetBallInfo(null);
         if(mBallSprite.parent != null)
         {
            mBallSprite.parent.removeChild(mBallSprite);
         }
      }
      
      public function GetJustFired() : Boolean
      {
         return this.mJustFired;
      }
      
      public function SetJustFired(fired:Boolean) : void
      {
         this.mJustFired = fired;
      }
      
      public function SetMergeSpeed(theSpeed:Number) : void
      {
         this.mMergeSpeed = theSpeed;
      }
      
      override public function GetX() : Number
      {
         return mX;
      }
      
      override public function GetY() : Number
      {
         return mY;
      }
      
      override public function Update(theAmount:Number = 1) : void
      {
         var vx:Number = NaN;
         var vy:Number = NaN;
         mUpdateCount++;
         if(this.mHitBall == null)
         {
            vx = this.mVelX * theAmount;
            vy = this.mVelY * theAmount;
            mX = mX + vx;
            mY = mY + vy;
            if(mX < 100)
            {
            }
         }
         else if(!mExploding)
         {
            this.mHitPercent = this.mHitPercent + this.mMergeSpeed;
            if(this.mHitPercent > 1)
            {
               this.mHitPercent = 1;
            }
            if(!this.mDoNewMerge)
            {
               mX = this.mHitX + this.mHitPercent * (this.mDestX - this.mHitX);
               mY = this.mHitY + this.mHitPercent * (this.mDestY - this.mHitY);
            }
         }
         UpdateRotation();
      }
      
      override public function PickBallColor() : String
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
         mColorType = color;
         return imageString;
      }
      
      override public function Draw(canvas:Canvas) : void
      {
         mBallSprite.x = mX * Zuma2App.SHRINK_PERCENT;
         mBallSprite.y = mY * Zuma2App.SHRINK_PERCENT;
         mBallSprite.rotation = mRotation * Zuma2App.RAD_TO_DEG - 90;
      }
      
      override public function GetNumGaps() : int
      {
         return this.mGapInfo.length;
      }
      
      public function RemoveGapInfoForBall(theBallId:int) : void
      {
         var i:int = 0;
         for(i = 0; i < this.mGapInfo.length; i++)
         {
            if(this.mGapInfo[i].mBallId == theBallId)
            {
               this.mGapInfo.splice(i,1);
            }
         }
      }
      
      public function AddGapInfo(theCurve:int, theDist:int, theBallId:int) : Boolean
      {
         for(var i:int = 0; i < this.mGapInfo.length; i++)
         {
            if(this.mGapInfo[i].mBallId == theBallId)
            {
               return false;
            }
         }
         this.mGapInfo.push(new GapInfo());
         var anInfo:GapInfo = this.mGapInfo[this.mGapInfo.length - 1];
         anInfo.mBallId = theBallId;
         anInfo.mDist = theDist;
         anInfo.mCurve = theCurve;
         return true;
      }
      
      override public function SetBallImage(color:int) : void
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
         mBallImage = mApp.imageManager.getImageInst(imageString);
         mBallSprite.graphics.clear();
         mBallSprite.graphics.beginBitmapFill(mBallImage.pixels,this.mMatrix,false,true);
         mBallSprite.graphics.drawRect(-13,-13,26,26);
         mBallSprite.graphics.endFill();
      }
   }
}
