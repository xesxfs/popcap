package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   import com.popcap.flash.framework.resources.sounds.SoundResource;
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import de.polygonal.ds.DLinkedList;
   import de.polygonal.ds.DListIterator;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class CurveMgr
   {
      
      public static const MAX_GAP_SIZE:int = 300;
      
      public static const PROXIMITY_BOMB_RADIUS:int = 56;
       
      
      public var mNumPowerUpsThisLevel:Array;
      
      public var mPendingBalls:DLinkedList;
      
      public var mBulletList:DLinkedList;
      
      public var mLevel:Level;
      
      public var mNumPowerupsActivated:Array;
      
      public var mInitialPathHilite:Boolean;
      
      public var mPath:String;
      
      public var mCurveDesc:CurveDesc;
      
      public var mInDanger:Boolean;
      
      public var mSkullHilite:Number = 0;
      
      public var mBallObj:Object;
      
      public var mLastClearedBallPoint:int;
      
      public var mPlayedSparkleSound:Boolean;
      
      public var mIsLoaded:Boolean;
      
      public var mHaveSets:Boolean;
      
      public var mProxBombCounter:int;
      
      public var mWarningLights:Vector.<WarningLight>;
      
      public var mOverrideSpeed:Number;
      
      public var mHasReachedCruisingSpeed:Boolean;
      
      public var mNumBallsCreated:int;
      
      public var mPathLightEndFrame:int;
      
      public var mBoard:GameBoardWidget;
      
      public var mApp:Zuma2App;
      
      public var mStopTime:int;
      
      public var mBallColorHasPowerup:Array;
      
      public var mBackwardCount:int;
      
      public var mDangerPoint:int;
      
      public var mChainFromSuck:Boolean = false;
      
      public var mSpeedScale:Number;
      
      public var mCanCheckForSpeedup:Boolean;
      
      public var mSlowCount:int;
      
      public var mStopAddingBalls:Boolean;
      
      public var mCurveNum:int;
      
      public var mSparkles:Vector.<PathSparkle>;
      
      public var mHasReachedRolloutPoint:Boolean;
      
      public var mPostZumaFlashTimer:int;
      
      public var mLastPowerupTime:int;
      
      public var mFirstChainEnd:int;
      
      public var mLastPathShowTick:int;
      
      public var mTotalBalls:int;
      
      public var mDoingClearCurveRollout:Boolean;
      
      public var mLastSpawnedPowerUpFrame:Array;
      
      public var mLastPathHilitePitch:int;
      
      public var mBallList:DLinkedList;
      
      public var mSkullHiliteDir:Number = 0;
      
      public var mLastPathHiliteWP:int;
      
      public var mWayPointMgr:WayPointMgr;
      
      public var mNeedsSpeedup:Boolean;
      
      public var mLastCompletedPowerUpFrame:Array;
      
      public var mHadPowerUp:Boolean;
      
      public var mAdvanceSpeed:Number;
      
      public var mFirstBallMovedBackwards:Boolean;
      
      public function CurveMgr(app:Zuma2App, curve_num:int)
      {
         this.mBallList = new DLinkedList();
         this.mBulletList = new DLinkedList();
         this.mPendingBalls = new DLinkedList();
         this.mSparkles = new Vector.<PathSparkle>();
         this.mBallObj = new Object();
         this.mWarningLights = new Vector.<WarningLight>();
         this.mBallColorHasPowerup = new Array();
         this.mLastSpawnedPowerUpFrame = new Array();
         this.mLastCompletedPowerUpFrame = new Array();
         this.mNumPowerUpsThisLevel = new Array();
         this.mNumPowerupsActivated = new Array();
         super();
         this.mApp = app;
         this.mCurveNum = curve_num;
         this.mWayPointMgr = new WayPointMgr(app);
         this.mCurveDesc = new CurveDesc(app);
         this.Reset();
      }
      
      public function GetBoardTickCount() : int
      {
         return this.GetBoardStateCount() * 10;
      }
      
      public function CanFire() : Boolean
      {
         if(this.mBallList.isEmpty())
         {
            return true;
         }
         return this.mBallList.tail.data.GetWayPoint() < this.mWayPointMgr.GetEndPoint();
      }
      
      public function AdvanceBullets() : void
      {
         var aBulletItr:DListIterator = this.mBulletList.getListIterator();
         while(aBulletItr.valid())
         {
            this.AdvanceMergingBullet(aBulletItr);
         }
      }
      
      public function GetPoint(thePoint:int, s:PathSparkle) : void
      {
         var aList:Vector.<WayPoint> = this.mWayPointMgr.mWayPoints;
         if(thePoint < 0)
         {
            thePoint = 0;
         }
         if(thePoint >= aList.length)
         {
            thePoint = aList.length - 1;
         }
         var aPoint:WayPoint = aList[thePoint];
         s.mX = aPoint.x;
         s.mY = aPoint.y;
         s.mPri = aPoint.mPriority;
      }
      
      public function UpdatePlaying() : Boolean
      {
         var i:int = 0;
         var s:PathSparkle = null;
         var soundString:String = null;
         var do_clear:Boolean = false;
         var b:Ball = null;
         var rit:DListIterator = null;
         var edge_wp:int = 0;
         var x:Number = NaN;
         var y:Number = NaN;
         var aPoint:Point = null;
         var Rect:Rectangle = null;
         var tunnel_wp:int = 0;
         var wp_list:Vector.<WayPoint> = null;
         if(this.mStopAddingBalls && this.mPostZumaFlashTimer > 0)
         {
            this.mPostZumaFlashTimer--;
         }
         var ret:Boolean = false;
         var wp:int = !!this.mBallList.isEmpty()?0:int(this.mBallList.tail.data.GetWayPoint());
         var ballsAtBeginning:Boolean = this.mBallList.isEmpty() || wp < this.mCurveDesc.mCutoffPoint;
         if(this.mStopTime > 0)
         {
            this.mStopTime--;
            if(ballsAtBeginning)
            {
               this.mStopTime = 0;
            }
            if(this.mStopTime == 0)
            {
               if(!this.mDoingClearCurveRollout)
               {
                  this.mAdvanceSpeed = 0;
               }
            }
         }
         if(this.mInitialPathHilite && !this.mBoard.mPreventBallAdvancement && this.mLastPathHiliteWP < this.mWayPointMgr.GetNumPoints() && this.mSkullHiliteDir == 0)
         {
            this.mSparkles.push(new PathSparkle(this.mApp));
            s = this.mSparkles[this.mSparkles.length - 1];
            this.GetPoint(this.mLastPathHiliteWP,s);
            this.mLastPathHiliteWP = this.mLastPathHiliteWP + 10;
            if(this.mLastPathHiliteWP >= this.mWayPointMgr.GetNumPoints())
            {
               ret = true;
               this.mSkullHiliteDir = 12;
            }
            if(this.mBoard.mUpdateCnt % 25 == 0)
            {
               if(this.mCurveNum != 1 && this.mLastPathHilitePitch > -20)
               {
                  this.mLastPathHilitePitch--;
               }
               else if(this.mCurveNum == 1 && this.mLastPathHilitePitch < 0)
               {
                  this.mLastPathHilitePitch++;
               }
            }
            if(!this.mPlayedSparkleSound && this.mCurveNum == 0)
            {
               this.mPlayedSparkleSound = true;
               soundString = "SOUND_SPARKLE_START" + String(this.mBoard.mLevelNum % 5 + 1);
               this.mApp.soundManager.playSound(soundString);
            }
         }
         for(i = 0; i < this.mSparkles.length; i++)
         {
            s = this.mSparkles[i];
            s.mUpdateCount++;
            if(s.mUpdateCount % 3 == 0)
            {
               if(++s.mCel >= 14)
               {
                  this.mSparkles.splice(i,1);
                  i--;
                  s.Delete();
               }
            }
         }
         this.mSkullHilite = this.mSkullHilite + this.mSkullHiliteDir;
         if(this.mSkullHiliteDir > 0 && this.mSkullHilite >= 255)
         {
            this.mSkullHilite = 255;
            this.mSkullHiliteDir = this.mSkullHiliteDir * -1;
         }
         else if(this.mSkullHiliteDir < 0 && this.mSkullHilite <= 0)
         {
            this.mSkullHilite = this.mSkullHiliteDir = 0;
         }
         var pulse_next:Boolean = false;
         for(i = 0; i < this.mWarningLights.length; i++)
         {
            if(pulse_next)
            {
               this.mWarningLights[i].mPulseRate = -this.mWarningLights[i - 1].mPulseRate;
            }
            pulse_next = this.mWarningLights[i].Update();
            if(this.mInitialPathHilite)
            {
               this.mWarningLights[i].mPulseAlpha = this.mWarningLights[i].mPulseAlpha - 5;
               if(this.mWarningLights[i].mPulseAlpha < 0)
               {
                  this.mWarningLights[i].mPulseAlpha = 0;
               }
            }
         }
         if(this.mInitialPathHilite)
         {
            return ret;
         }
         if(this.mSlowCount > 0)
         {
            this.mSlowCount--;
            if(ballsAtBeginning && !this.mStopAddingBalls)
            {
               this.mSlowCount = 0;
            }
         }
         if(this.mBackwardCount > 0)
         {
            this.mBackwardCount--;
            if(ballsAtBeginning && !this.mStopAddingBalls)
            {
               this.mBackwardCount = 0;
            }
         }
         if(this.mApp.gAddBalls)
         {
            this.AddBall();
         }
         this.UpdateBalls();
         this.AdvanceBullets();
         this.UpdateSuckingBalls();
         if(!this.mDoingClearCurveRollout && !this.mBoard.HasAchievedZuma() && !this.mLevel.mIsEndless && this.mHasReachedCruisingSpeed && !this.mInitialPathHilite && !this.mBoard.mPreventBallAdvancement)
         {
            do_clear = this.mBallList.isEmpty();
            if(do_clear)
            {
               trace("Ball list is empty, doing clear curve");
            }
            if(!do_clear)
            {
               b = null;
               rit = this.mBallList.getListIterator();
               rit.end();
               while(rit.valid())
               {
                  if(!rit.data.GetIsExploding())
                  {
                     b = rit.data;
                     break;
                  }
                  rit.back();
               }
               if(b != null)
               {
                  edge_wp = b.GetWayPoint() + b.GetRadius();
                  aPoint = new Point();
                  if(this.GetXYFromWaypoint(edge_wp,aPoint))
                  {
                     Rect = new Rectangle(0,0,800,600);
                     if(!Rect.containsPoint(aPoint))
                     {
                        do_clear = true;
                        trace("Rectangle contains point");
                     }
                     else if(!this.mLevel.mOffscreenClearBonus)
                     {
                        tunnel_wp = -1;
                        wp_list = this.mWayPointMgr.mWayPoints;
                        for(i = 0; i < wp_list.length; )
                        {
                           if(wp_list[i].mInTunnel)
                           {
                              tunnel_wp = i;
                              i++;
                              continue;
                           }
                           break;
                        }
                        if(tunnel_wp != -1 && edge_wp <= tunnel_wp)
                        {
                           do_clear = true;
                        }
                     }
                  }
               }
               else
               {
                  do_clear = true;
               }
            }
            if(do_clear)
            {
               this.mDoingClearCurveRollout = true;
               this.mBoard.DoClearCurveBonus(this.mCurveNum);
               this.mSlowCount = 0;
               this.mBackwardCount = 0;
               this.mAdvanceSpeed = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale * this.mApp.mLevelMgr.mClearCurveSpeedMult;
            }
         }
         this.AdvanceBalls();
         this.AdvanceBackwardBalls();
         this.RemoveBallsAtFront();
         this.RemoveBallsAtEnd();
         this.UpdateSets();
         this.UpdatePowerUps();
         if(!this.mBallList.isEmpty())
         {
            this.SetFarthestBall(this.mBallList.tail.data.GetWayPoint());
         }
         else
         {
            this.SetFarthestBall(0);
         }
         if(!this.mHasReachedCruisingSpeed)
         {
            if(this.mAdvanceSpeed - this.mCurveDesc.mVals.mSpeed * this.mSpeedScale < 0.1)
            {
               this.mHasReachedCruisingSpeed = true;
            }
         }
         return ret;
      }
      
      public function GetNumInARow(theBall:Ball, theColor:int, ballObj:Object) : int
      {
         var aPrevEnd:Ball = null;
         var aNextBall:Ball = null;
         var aPrevBall:Ball = null;
         if(theBall.GetColorType() != theColor)
         {
            return 0;
         }
         var aBall:Ball = theBall;
         var aNextEnd:Ball = aBall;
         var aColor:int = theColor;
         var aCount:int = 1;
         while(true)
         {
            aNextBall = aNextEnd.GetNextBall(true);
            if(aNextBall == null)
            {
               break;
            }
            if(aNextBall.GetColorType() != aColor)
            {
               break;
            }
            aNextEnd = aNextBall;
            aCount++;
         }
         aPrevEnd = aBall;
         while(true)
         {
            aPrevBall = aPrevEnd.GetPrevBall(true);
            if(aPrevBall == null)
            {
               break;
            }
            if(aPrevBall.GetColorType() != aColor)
            {
               break;
            }
            aPrevEnd = aPrevBall;
            aCount++;
         }
         ballObj.aNextEnd = aNextEnd;
         ballObj.aPrevEnd = aPrevEnd;
         return aCount;
      }
      
      public function HideBalls(hide:Boolean) : void
      {
         var ball:Ball = null;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            ball = aBallItr.data;
            ball.Hide(hide);
            aBallItr.forth();
         }
      }
      
      public function AdvanceMergingBullet(theBulletItr:DListIterator) : void
      {
         var aHitBall:Ball = null;
         var anItr:DListIterator = null;
         var hitInFront:Boolean = false;
         var aNewBall:Ball = null;
         var aGapDist:int = 0;
         var aNumGaps:int = 0;
         var aPrevBall:Ball = null;
         var aNextBall:Ball = null;
         var aMaxGapBonus:int = 0;
         var aBonus:int = 0;
         var aBullet:Bullet = theBulletItr.data;
         this.DoMerge(aBullet);
         if(aBullet.GetHitPercent() >= 1)
         {
            aHitBall = aBullet.GetHitBall();
            anItr = new DListIterator(this.mBallList,aHitBall.mListItr.node);
            hitInFront = aBullet.GetHitInFront();
            if(hitInFront)
            {
               anItr.forth();
            }
            aNewBall = new Ball(this.mApp);
            aNewBall.SetRotation(aBullet.GetRotation());
            aNewBall.SetColorType(aBullet.GetColorType());
            aNewBall.SetPowerType(aBullet.GetPowerType());
            this.mWayPointMgr.SetWayPoint(aNewBall,aBullet.GetWayPoint(),this.mLevel.mLoopAtEnd);
            aNewBall.InsertInList(this.mBallList,anItr,this);
            aGapDist = aBullet.GetMinGapDist();
            aNumGaps = aBullet.GetNumGaps();
            aBullet.Delete();
            this.mBulletList.remove(theBulletItr);
            this.mTotalBalls++;
            aPrevBall = aNewBall.GetPrevBall();
            aNextBall = aNewBall.GetNextBall();
            aNewBall.UpdateCollisionInfo(5);
            aNewBall.SetNeedCheckCollision(true);
            if(aPrevBall != null && aNewBall.GetCollidesWithPrev())
            {
               aPrevBall.SetNeedCheckCollision(true);
            }
            if(aGapDist > 0)
            {
               aGapDist = aGapDist - 64;
               if(aGapDist < 0)
               {
                  aGapDist = 0;
               }
               aMaxGapBonus = 500;
               aBonus = aMaxGapBonus * (MAX_GAP_SIZE - aGapDist) / MAX_GAP_SIZE;
               aBonus = int(aBonus / 10) * 10;
               if(aBonus < 10)
               {
                  aBonus = 10;
               }
               if(aBonus > 0)
               {
                  if(aNumGaps > 1)
                  {
                     aBonus = aBonus * aNumGaps;
                  }
                  aNewBall.SetGapBonus(aBonus,aNumGaps);
               }
            }
            if(!this.CheckSet(aNewBall))
            {
               if(aPrevBall != null && !aPrevBall.GetCollidesWithNext() && aPrevBall.GetColorType() == aNewBall.GetColorType() && aPrevBall.GetBullet() == null && !aPrevBall.GetIsExploding())
               {
                  aNewBall.SetSuckPending(true);
                  aNewBall.SetSuckCount(1);
               }
               else if(aNextBall != null && !aNewBall.GetCollidesWithNext() && aNextBall.GetColorType() == aNewBall.GetColorType() && aNextBall.GetBullet() == null && !aNextBall.GetIsExploding())
               {
                  aNewBall.SetSuckPending(true);
                  if(aNextBall.GetSuckCount() <= 0)
                  {
                     aNextBall.SetSuckCount(1);
                  }
               }
               else
               {
                  this.mBoard.ResetInARowBonus();
                  aNewBall.SetGapBonus(0,0);
               }
            }
            else
            {
               this.mBoard.IncNumClearsInARow(1);
            }
         }
         else
         {
            this.mBoard.mBallColorMap[aBullet.GetColorType()]++;
            theBulletItr.forth();
         }
      }
      
      public function IsInDanger() : Boolean
      {
         return this.mInDanger;
      }
      
      public function GetDangerDistance() : int
      {
         return this.mWayPointMgr.GetNumPoints() - this.mDangerPoint;
      }
      
      public function DrawSkullPath() : void
      {
         var w:WarningLight = null;
         for(var i:int = 0; i < this.mWarningLights.length; i++)
         {
            w = this.mWarningLights[i];
            w.Draw();
         }
      }
      
      public function AdvanceBalls() : void
      {
         var aSpeed:Number = NaN;
         var sd:int = 0;
         var aMix:Number = NaN;
         var rit:DListIterator = null;
         var b:Ball = null;
         var aNext:Ball = null;
         var aDist:Number = NaN;
         var aNextBall:Ball = null;
         var aNextWayPoint:Number = NaN;
         var collides:Boolean = false;
         var aPrev:Ball = null;
         var aTick:int = 0;
         var pct:Number = NaN;
         var aMaxTime:int = 0;
         var aFrame:int = 0;
         var farthest_curve:int = 0;
         var idx:int = 0;
         var i:int = 0;
         var w:WarningLight = null;
         var minalpha:Number = NaN;
         if(this.mBallList.isEmpty())
         {
            return;
         }
         var can_advance:Boolean = this.mLevel.CanAdvanceBalls();
         var aWarningPoint:int = this.mDangerPoint;
         var aMaxSpeed:Number = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale;
         if(this.mCurveDesc.mVals.mAccelerationRate != 0)
         {
            this.mCurveDesc.mCurAcceleration = this.mCurveDesc.mCurAcceleration + this.mCurveDesc.mVals.mAccelerationRate;
            aMaxSpeed = aMaxSpeed + this.mCurveDesc.mCurAcceleration;
            if(aMaxSpeed > this.mCurveDesc.mVals.mMaxSpeed)
            {
               aMaxSpeed = this.mCurveDesc.mVals.mMaxSpeed;
            }
         }
         if(this.mSlowCount > 0)
         {
            aMaxSpeed = aMaxSpeed / 4;
         }
         var slowfactor:Number = this.mCurveDesc.mVals.mSlowFactor;
         var pzt_speed:Number = this.mLevel.mPostZumaTimeSpeedInc * aMaxSpeed + aMaxSpeed;
         var pzt_slow:Number = slowfactor - this.mLevel.mPostZumaTimeSlowInc * this.mCurveDesc.mVals.mSlowFactor;
         if(pzt_slow < 1)
         {
            pzt_slow = 1;
         }
         if(this.mApp.mLevelMgr.mPostZumaTime == 0 || !this.mBoard.HasAchievedZuma())
         {
            pzt_speed = aMaxSpeed;
            pzt_slow = slowfactor;
         }
         if(this.mApp.gDieAtEnd)
         {
            if(this.mFirstChainEnd < this.mDangerPoint - this.mCurveDesc.mVals.mSlowDistance || !this.mHasReachedCruisingSpeed)
            {
               aMaxSpeed = pzt_speed;
            }
            else if(this.mFirstChainEnd < this.mDangerPoint)
            {
               aMix = Number(this.mFirstChainEnd - (this.mDangerPoint - this.mCurveDesc.mVals.mSlowDistance)) / this.mCurveDesc.mVals.mSlowDistance;
               aMaxSpeed = (1 - aMix) * pzt_speed + aMix * pzt_speed / pzt_slow;
            }
            else
            {
               aMaxSpeed = aMaxSpeed / pzt_slow;
               this.mBoard.SetRollingInDangerZone();
            }
         }
         var end_clear_curve:Boolean = false;
         if(this.mDoingClearCurveRollout)
         {
            rit = this.mBallList.getListIterator();
            rit.end();
            while(rit.valid())
            {
               b = rit.data;
               if(!b.GetIsExploding())
               {
                  if(b.GetWayPoint() / Number(this.mWayPointMgr.GetEndPoint()) >= this.mApp.mLevelMgr.mClearCurveRolloutPct)
                  {
                     end_clear_curve = true;
                  }
                  break;
               }
               rit.back();
            }
         }
         if(this.mAdvanceSpeed > aMaxSpeed && !this.mBoard.mPreventBallAdvancement && (!this.mDoingClearCurveRollout || end_clear_curve))
         {
            this.mDoingClearCurveRollout = false;
            this.mAdvanceSpeed = this.mAdvanceSpeed - 0.1;
         }
         else if(this.mAdvanceSpeed <= aMaxSpeed && end_clear_curve)
         {
            this.mDoingClearCurveRollout = false;
         }
         if(this.mAdvanceSpeed < aMaxSpeed)
         {
            this.mAdvanceSpeed = this.mAdvanceSpeed + 0.005;
            if(this.mAdvanceSpeed >= aMaxSpeed)
            {
               this.mAdvanceSpeed = aMaxSpeed;
            }
         }
         aSpeed = !!can_advance?Number(this.mAdvanceSpeed):Number(0);
         if(this.mOverrideSpeed >= 0)
         {
            aSpeed = aSpeed + this.mOverrideSpeed;
         }
         if(this.mBoard.mPreventBallAdvancement)
         {
            aSpeed = 0;
         }
         var aBall:Ball = this.mBallList.head.data;
         var aWayPoint:Number = aBall.GetWayPoint();
         var aDiff:Number = 0;
         if(!this.mFirstBallMovedBackwards && !this.mStopTime)
         {
            aDiff = aSpeed;
            this.mWayPointMgr.SetWayPoint(aBall,aWayPoint + aSpeed,this.mLevel.mLoopAtEnd);
         }
         if(this.mApp.gSuckMode && this.mStopAddingBalls && !this.mBallList.isEmpty())
         {
            aBall = this.mBallList.head.data;
            this.mAdvanceSpeed = aMaxSpeed;
            if(aBall.GetSpeedy())
            {
               aNext = aBall.GetNextBall();
               if(aNext != null)
               {
                  if(aNext.GetSpeedy())
                  {
                     this.mAdvanceSpeed = 20;
                  }
                  else
                  {
                     aDist = aNext.GetWayPoint() - aBall.GetWayPoint();
                     this.mAdvanceSpeed = aDist / 10;
                  }
                  if(this.mAdvanceSpeed > 20)
                  {
                     this.mAdvanceSpeed = 20;
                  }
                  else if(this.mAdvanceSpeed < aMaxSpeed)
                  {
                     this.mAdvanceSpeed = aMaxSpeed;
                  }
               }
            }
         }
         var speedup_possible:Boolean = false;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         var aFirstChainEnd:Ball = null;
         while(aBallItr.valid())
         {
            aBall = aBallItr.data;
            aNextBall = null;
            aBallItr.forth();
            if(!aBallItr.hasNext())
            {
               break;
            }
            aNextBall = aBallItr.data;
            aNextWayPoint = aNextBall.GetWayPoint();
            aWayPoint = aBall.GetWayPoint();
            collides = false;
            if(aWayPoint > aNextWayPoint - aBall.GetRadius() - aNextBall.GetRadius())
            {
               this.mWayPointMgr.SetWayPoint(aNextBall,aWayPoint + aBall.GetRadius() + aNextBall.GetRadius(),this.mLevel.mLoopAtEnd);
               collides = true;
            }
            if(collides)
            {
               if(!aBall.GetCollidesWithNext())
               {
                  if(aBall.GetSpeedy() && !aNextBall.GetSpeedy())
                  {
                     aPrev = aBall;
                     while(aPrev != null)
                     {
                        aPrev.SetSpeedy(false);
                        aPrev = aPrev.GetPrevBall(true);
                     }
                  }
                  aBall.SetCollidesWithNext(true);
                  this.mBoard.PlayBallClick(Zuma2Sounds.SOUND_BALL_CLICK1);
               }
               aDiff = aNextBall.GetWayPoint() - aNextWayPoint;
               aBall.SetNeedCheckCollision(false);
            }
            else
            {
               aDiff = 0;
            }
            if(aFirstChainEnd == null && !aBall.GetCollidesWithNext())
            {
               aFirstChainEnd = aBall;
               sd = this.mCurveDesc.mVals.mStartDistance;
               if(aFirstChainEnd.GetWayPoint() < sd / 100 * this.GetCurveLength())
               {
                  speedup_possible = true;
               }
            }
         }
         if(!speedup_possible && this.mLevel.mTempSpeedupTimer <= 0)
         {
            this.mCanCheckForSpeedup = true;
            this.mOverrideSpeed = -1;
         }
         sd = this.mCurveDesc.mVals.mStartDistance;
         if(!this.mHasReachedRolloutPoint && this.mBackwardCount <= 0 && this.mBallList.tail.data.GetWayPoint() >= sd / 100 * this.GetCurveLength())
         {
            this.mHasReachedRolloutPoint = true;
         }
         if(aFirstChainEnd == null)
         {
            aFirstChainEnd = this.mBallList.tail.data;
            this.mCanCheckForSpeedup = true;
            if(this.HasReachedCruisingSpeed())
            {
               speedup_possible = true;
            }
         }
         this.mFirstChainEnd = aFirstChainEnd.GetWayPoint();
         if(speedup_possible && this.mCanCheckForSpeedup && this.mLevel.mHurryToRolloutAmt > 0)
         {
            sd = this.mCurveDesc.mVals.mStartDistance;
            if(this.mFirstChainEnd < sd / 100 * this.GetCurveLength())
            {
               this.mCanCheckForSpeedup = false;
               this.mOverrideSpeed = this.mLevel.mHurryToRolloutAmt;
            }
            else
            {
               this.mCanCheckForSpeedup = true;
               this.mOverrideSpeed = -1;
            }
         }
         var newWarning:* = this.mFirstChainEnd >= aWarningPoint;
         if(newWarning && this.mApp.gDieAtEnd)
         {
            aTick = this.GetBoardTickCount();
            pct = Number(this.GetCurveLength() - this.mFirstChainEnd) / Number(this.GetCurveLength() - this.mDangerPoint);
            aMaxTime = 100 + 4000 * pct;
            aFrame = this.mBoard.GetStateCount();
            if(aFrame >= this.mPathLightEndFrame && aTick - this.mLastPathShowTick >= aMaxTime)
            {
               farthest_curve = this.mLevel.GetFarthestBallPercent(farthest_curve,false);
               if(farthest_curve == this.mCurveNum)
               {
                  this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_WARNING1);
               }
               this.mLastPathShowTick = aTick;
               this.mPathLightEndFrame = aFrame;
               if(this.mWarningLights.length > 0)
               {
                  idx = this.mWarningLights.length;
                  for(i = 0; i < this.mWarningLights.length; i++)
                  {
                     w = this.mWarningLights[i];
                     if(w.mWaypoint + 18 > this.mFirstChainEnd)
                     {
                        idx = i;
                        break;
                     }
                  }
                  if(idx < this.mWarningLights.length)
                  {
                     this.mWarningLights[idx].mPulseRate = 30 * (1 - pct);
                     minalpha = 10;
                     if(this.mWarningLights[idx].mPulseRate < minalpha)
                     {
                        this.mWarningLights[idx].mPulseRate = minalpha;
                     }
                  }
               }
            }
         }
         var was_in_danger:Boolean = this.mInDanger;
         this.mInDanger = this.mBallList.tail.data.GetWayPoint() >= this.mDangerPoint && this.mApp.gDieAtEnd;
         if(was_in_danger != this.mInDanger && this.mWarningLights.length > 0)
         {
            for(i = 0; i < this.mWarningLights.length; i++)
            {
               this.mWarningLights[i].mState = !!this.mInDanger?1:-1;
            }
         }
      }
      
      public function GetXYFromWaypoint(waypoint:int, aPoint:Point) : Boolean
      {
         var wpl:Vector.<WayPoint> = this.mWayPointMgr.mWayPoints;
         if(waypoint >= wpl.length)
         {
            return false;
         }
         var p:WayPoint = wpl[waypoint];
         aPoint.x = p.x;
         aPoint.y = p.y;
         return true;
      }
      
      public function GetNumPendingSingles(theNumGroups:int) : int
      {
         var aColor:int = 0;
         var aNumGroups:int = 0;
         var aPrevColor:int = -1;
         var aNumSingles:int = 0;
         var aGroupCount:int = 0;
         var anRItr:DListIterator = this.mPendingBalls.getListIterator();
         anRItr.end();
         while(anRItr.valid() && aNumGroups <= theNumGroups)
         {
            aColor = anRItr.data.GetColorType();
            if(aColor != aPrevColor)
            {
               if(aGroupCount == 1)
               {
                  aNumSingles++;
               }
               aGroupCount = 1;
               aNumGroups++;
               aPrevColor = aColor;
            }
            else
            {
               aGroupCount++;
            }
            anRItr.back();
         }
         var anItr:DListIterator = this.mBallList.getListIterator();
         anItr.start();
         while(anItr.valid() && aNumGroups <= theNumGroups)
         {
            aColor = anItr.data.GetColorType();
            if(aColor != aPrevColor)
            {
               if(aGroupCount == 1)
               {
                  aNumSingles++;
               }
               aGroupCount = 1;
               aNumGroups++;
               aPrevColor = aColor;
            }
            else
            {
               aGroupCount++;
            }
            anItr.forth();
         }
         return aNumSingles;
      }
      
      public function AddBall() : void
      {
         var aWayPoint:Number = NaN;
         if(!this.mApp.gAddBalls || this.mLevel.mNum == int.MAX_VALUE && this.mBoard.mPreventBallAdvancement)
         {
            return;
         }
         if(this.mPendingBalls.isEmpty())
         {
            if(!this.mStopAddingBalls)
            {
               this.AddPendingBall();
            }
            else
            {
               return;
            }
         }
         var aBall:Ball = this.mPendingBalls.head.data;
         this.mWayPointMgr.SetWayPoint(aBall,1,this.mLevel.mLoopAtEnd);
         var aFrontBall:Ball = null;
         if(!this.mBallList.isEmpty())
         {
            aFrontBall = this.mBallList.head.data;
            if(this.mAdvanceSpeed > aFrontBall.GetRadius() && aFrontBall.GetWayPoint() >= 0)
            {
               if(aFrontBall.GetWayPoint() - this.mAdvanceSpeed < 5)
               {
                  aWayPoint = aFrontBall.GetWayPoint() - aFrontBall.GetRadius() - aBall.GetRadius() - 0.001;
                  aBall.SetWayPoint(aWayPoint,this.mWayPointMgr.InTunnel(aWayPoint));
               }
            }
            else if(aBall.GetWayPoint() > aFrontBall.GetWayPoint() || aBall.CollidesWith(aFrontBall))
            {
               return;
            }
         }
         var anItr:DListIterator = this.mBallList.getListIterator();
         anItr.start();
         aBall.InsertInList(this.mBallList,anItr,this);
         aBall.UpdateCollisionInfo(5 + this.mAdvanceSpeed);
         aBall.SetNeedCheckCollision(true);
         aBall.SetRotation(this.mWayPointMgr.GetRotationForPoint(aBall.GetWayPoint()));
         aBall.SetBackwardsCount(0);
         aBall.SetSuckCount(0);
         aBall.SetGapBonus(0,0);
         aBall.SetComboCount(0,0);
         this.mPendingBalls.removeHead();
         if(aBall.GetWayPoint() > 1)
         {
            this.AddBall();
         }
      }
      
      public function CheckCollision(theBullet:Bullet, should_add:Boolean = true) : Boolean
      {
         var aBullet2:Bullet = null;
         var aPrevBall:Ball = null;
         var aNextBall:Ball = null;
         var aBallCenter:SexyVector3 = null;
         var aBulletCenter:SexyVector3 = null;
         var aPerp:SexyVector3 = null;
         var aCross:SexyVector3 = null;
         var aWayPoint:Number = NaN;
         var rad:int = 0;
         var aBullet:Bullet = theBullet;
         var aBall:Ball = null;
         var hitInFront:* = false;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         var aBulletItr:DListIterator = this.mBulletList.getListIterator();
         aBulletItr.start();
         while(aBulletItr.valid())
         {
            aBullet2 = aBulletItr.data;
            if(theBullet.CollidesWithPhysically(aBullet2))
            {
               aBullet2.Update();
               this.AdvanceMergingBullet(aBulletItr);
               break;
            }
            aBulletItr.forth();
         }
         var remove_at_next:Boolean = false;
         aBallItr.start();
         while(true)
         {
            if(aBallItr.valid())
            {
               aBall = aBallItr.data;
               if(aBall.mId == 1)
               {
               }
               if(aBall.CollidesWithPhysically(aBullet,0) && aBall.GetBullet() == null && !aBall.GetIsExploding())
               {
                  aPrevBall = aBall.GetPrevBall(true);
                  if(aPrevBall == null || aPrevBall.GetBullet() == null)
                  {
                     aNextBall = aBall.GetNextBall(true);
                     if(aNextBall == null || aNextBall.GetBullet() == null)
                     {
                        aBallCenter = new SexyVector3(aBall.GetX(),aBall.GetY(),0);
                        aBulletCenter = new SexyVector3(aBullet.GetX(),aBullet.GetY(),0);
                        aPerp = this.mWayPointMgr.CalcPerpendicular(aBall.GetWayPoint());
                        aCross = aBulletCenter.Sub(aBallCenter).Cross(aPerp);
                        hitInFront = aCross.z < 0;
                        if(!this.mWayPointMgr.InTunnel2(aBall,hitInFront))
                        {
                           if(theBullet.GetIsCannon())
                           {
                              this.mBoard.IncScore(10,true);
                              this.StartExploding(aBall);
                              this.mBoard.PlaySmallExplosionSound();
                           }
                        }
                     }
                  }
               }
               if(remove_at_next)
               {
                  break;
               }
               aBallItr.forth();
               continue;
            }
            if(aBallItr.node != null)
            {
               if(theBullet.GetIsCannon())
               {
                  return true;
               }
               aBullet.SetHitBall(aBall,hitInFront);
               aBullet.SetMergeSpeed(this.mCurveDesc.mMergeSpeed);
               aNextBall = aBall.GetNextBall();
               if(!hitInFront)
               {
                  aBullet.RemoveGapInfoForBall(aBall.GetId());
               }
               else if(aNextBall != null)
               {
                  aBullet.RemoveGapInfoForBall(aNextBall.GetId());
               }
               if(this.mApp.gStopSuckbackImmediately)
               {
                  if(hitInFront && aNextBall != null && aNextBall.GetSuckBack() && aNextBall.GetSuckCount() > 0 && aNextBall.GetColorType() != aBullet.GetColorType())
                  {
                     aNextBall.SetSuckCount(0);
                  }
                  else if(!hitInFront && aBall != null && aBall.GetSuckBack() && aBall.GetSuckCount() > 0 && aBall.GetColorType() != aBullet.GetColorType())
                  {
                     aBall.SetSuckCount(0);
                  }
               }
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BALL_CLICK2);
               aWayPoint = aBall.GetWayPoint();
               rad = 80;
               if(this.mWayPointMgr.CheckDiscontinuity(aWayPoint - rad,2 * rad))
               {
                  aBullet.mDoNewMerge = true;
               }
               this.mBulletList.append(aBullet);
               return true;
            }
            return false;
         }
         return true;
      }
      
      public function GetNumPendingMatches() : int
      {
         var t:int = 0;
         var b:Ball = null;
         if(this.mPendingBalls.size == 0 && this.mBallList.size == 0)
         {
            return 0;
         }
         t = this.mPendingBalls.size > 0?int(this.mPendingBalls.tail.data.GetColorType()):int(this.mBallList.head.data.GetColorType());
         var num:int = 0;
         var rit:DListIterator = this.mPendingBalls.getListIterator();
         rit.end();
         while(rit.valid())
         {
            b = rit.data;
            if(b.GetColorType() == t)
            {
               num++;
               rit.back();
               continue;
            }
            break;
         }
         if(this.mPendingBalls.size > 0)
         {
            return num;
         }
         var it:DListIterator = this.mBallList.getListIterator();
         it.start();
         while(it.valid())
         {
            b = it.data;
            if(b.GetColorType() == t)
            {
               num++;
               it.forth();
               continue;
            }
            break;
         }
         return num;
      }
      
      public function Reset() : void
      {
         var i:int = 0;
         this.mChainFromSuck = false;
         this.mPlayedSparkleSound = false;
         this.mHasReachedCruisingSpeed = false;
         this.mNumBallsCreated = 0;
         this.mNeedsSpeedup = false;
         this.mOverrideSpeed = -1;
         this.mProxBombCounter = -1;
         this.mHasReachedRolloutPoint = false;
         this.mCanCheckForSpeedup = false;
         this.mLastPowerupTime = 0;
         this.mLastPathHiliteWP = 0;
         this.mLastPathHilitePitch = this.mCurveNum == 1?-20:0;
         this.mInitialPathHilite = false;
         this.mSkullHilite = 0;
         this.mDoingClearCurveRollout = false;
         this.mSkullHiliteDir = 0;
         for(i = 0; i < PowerType.PowerType_Max; i++)
         {
            this.mNumPowerUpsThisLevel[i] = 0;
            this.mNumPowerupsActivated[i] = 0;
         }
         for(i = 0; i < 6; i++)
         {
            this.mBallColorHasPowerup[i] = 0;
         }
         for(var j:int = 0; j < this.mWarningLights.length; j++)
         {
            this.mWarningLights[j].mState = -1;
            if(this.mWarningLights[j].mPulseRate > 0)
            {
               this.mWarningLights[j].mPulseRate = this.mWarningLights[j].mPulseRate * -1;
            }
         }
      }
      
      public function CheckBallIntersection(p1:SexyVector3, v1:SexyVector3, theT:Point, skip_exploding:Boolean = false) : Ball
      {
         var aBall:Ball = null;
         var t2:Number = NaN;
         var theT2:Point = null;
         var anIntersectBall:Ball = null;
         var idx:int = 0;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            aBall = aBallItr.data;
            if(!this.mWayPointMgr.InTunnel(aBall.GetWayPoint()))
            {
               theT2 = new Point();
               if((!aBall.GetIsExploding() || !skip_exploding) && aBall.Intersects(p1,v1,theT2))
               {
                  t2 = theT2.x;
                  if(t2 < theT.x && t2 > 0)
                  {
                     anIntersectBall = aBall;
                     theT.x = t2;
                  }
               }
            }
            aBallItr.forth();
            idx++;
         }
         return anIntersectBall;
      }
      
      public function StartExploding(theBall:Ball, from_lightning_frog:Boolean = false, record_levelstats:Boolean = true) : void
      {
         if(theBall.GetIsExploding())
         {
            return;
         }
         if(record_levelstats)
         {
            this.mBoard.mLevelStats.mNumBallsCleared++;
            this.mBoard.IncNumCleared(1);
         }
         this.mLastClearedBallPoint = theBall.GetWayPoint();
         if(theBall.GetSuckPending())
         {
            theBall.SetSuckPending(false);
         }
         theBall.Explode(this.mWayPointMgr.InTunnel(theBall.GetWayPoint()),from_lightning_frog);
         if(theBall.GetPowerOrDestType() != PowerType.PowerType_None)
         {
            this.mNumPowerupsActivated[theBall.GetPowerOrDestType()]++;
            this.mBoard.ActivatePowerBall(theBall);
            this.mLastCompletedPowerUpFrame[theBall.GetPowerOrDestType()] = this.mBoard.GetStateCount();
            this.mHadPowerUp = true;
         }
      }
      
      public function CanRestart() : Boolean
      {
         return this.mBallList.isEmpty();
      }
      
      public function DeleteBalls() : void
      {
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         var aBulletItr:DListIterator = this.mBulletList.getListIterator();
         var aPendingItr:DListIterator = this.mPendingBalls.getListIterator();
         aBulletItr.start();
         while(aBulletItr.valid())
         {
            aBulletItr.data.Delete();
            aBulletItr.forth();
         }
         aBallItr.start();
         while(aBallItr.valid())
         {
            aBallItr.data.Delete();
            aBallItr.forth();
         }
         aPendingItr.start();
         while(aPendingItr.valid())
         {
            aPendingItr.data.Delete();
            aPendingItr.forth();
         }
         this.mBallList.clear();
         this.mPendingBalls.clear();
         this.mBulletList.clear();
      }
      
      public function DoMerge(theBullet:Bullet) : void
      {
         var aPercent:Number = NaN;
         var aPad:int = 0;
         var w1:Number = NaN;
         var aMaxGapSpace:Number = NaN;
         var w2:Number = NaN;
         var aNextBall:Ball = null;
         var hitInFront:Boolean = false;
         var aBullet:Bullet = theBullet;
         aBullet.CheckSetHitBallToPrevBall();
         var aHitBall:Ball = aBullet.GetHitBall();
         var aRotation:Number = aBullet.GetRotation();
         this.mWayPointMgr.SetWayPoint(aBullet,aHitBall.GetWayPoint(),this.mLevel.mLoopAtEnd);
         this.mWayPointMgr.FindFreeWayPoint(aHitBall,aBullet,aBullet.GetHitInFront(),this.mLevel.mLoopAtEnd);
         aBullet.SetDestPos(aBullet.GetX(),aBullet.GetY());
         aBullet.SetRotation(aRotation,true);
         aBullet.SetRotation(this.mWayPointMgr.GetRotationForPoint(aBullet.GetWayPoint()),false);
         aBullet.Update();
         var aPushBall:Ball = aBullet.GetPushBall();
         if(aPushBall != null)
         {
            aPercent = 1 - aBullet.GetHitPercent();
            aPad = int(-aBullet.GetRadius() * aPercent / 2);
            w1 = aPushBall.GetWayPoint();
            aMaxGapSpace = aBullet.GetHitPercent() * aBullet.GetHitPercent() * (aPushBall.GetRadius() + aBullet.GetRadius());
            this.mWayPointMgr.FindFreeWayPoint(aBullet,aBullet.GetPushBall(),true,this.mLevel.mLoopAtEnd,aPad);
            if(aPushBall.GetWayPoint() - aBullet.GetWayPoint() > aMaxGapSpace)
            {
               w2 = aBullet.GetWayPoint() + aMaxGapSpace;
               if(w2 > w1)
               {
                  this.mWayPointMgr.SetWayPoint(aPushBall,w2,this.mLevel.mLoopAtEnd);
               }
               else
               {
                  this.mWayPointMgr.SetWayPoint(aPushBall,w1,this.mLevel.mLoopAtEnd);
               }
            }
            aPushBall.SetNeedCheckCollision(true);
            if(!this.mApp.gStopSuckbackImmediately)
            {
               aNextBall = aHitBall.GetNextBall();
               hitInFront = aBullet.GetHitInFront();
               if(hitInFront && aNextBall != null && aNextBall.GetSuckBack() && aNextBall.GetSuckCount() > 0 && aNextBall.GetColorType() != aBullet.GetColorType())
               {
                  aNextBall.SetSuckCount(0);
               }
               else if(!hitInFront && aHitBall != null && aHitBall.GetSuckBack() && aHitBall.GetSuckCount() > 0 && aHitBall.GetColorType() != aBullet.GetColorType())
               {
                  aHitBall.SetSuckCount(0);
               }
            }
         }
      }
      
      public function DrawBalls(canvas:Canvas) : void
      {
         var aBall:Ball = null;
         var aBullet:Bullet = null;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            aBall = aBallItr.data;
            aBall.Draw(canvas);
            aBallItr.forth();
         }
         var aBulletItr:DListIterator = this.mBulletList.getListIterator();
         aBulletItr.start();
         while(aBulletItr.valid())
         {
            aBullet = aBulletItr.data;
            aBullet.Draw(canvas);
            aBulletItr.forth();
         }
      }
      
      public function CanSpawnPowerUp(ptype:int) : Boolean
      {
         var maxnum:int = this.mCurveDesc.mVals.mMaxNumPowerUps[ptype];
         if(ptype == PowerType.PowerType_Cannon && this.mBoard.HasAchievedZuma())
         {
            return false;
         }
         if(this.mLevel.HasPowerup(ptype))
         {
            return false;
         }
         if(ptype == PowerType.PowerType_ColorNuke || ptype == PowerType.PowerType_Laser)
         {
            return false;
         }
         return !!this.mApp.mLevelMgr.mCapAffectsPowerupsSpawned?this.mNumPowerUpsThisLevel[ptype] < maxnum:this.mNumPowerupsActivated[ptype] < maxnum;
      }
      
      public function CheckSet(theBall:Ball) : Boolean
      {
         var i:int = 0;
         var aGapBonus:int = 0;
         var aNumGaps:int = 0;
         var anEndBall:Ball = null;
         var aBallItr:Ball = null;
         var anItr:DListIterator = null;
         var destroySound:SoundResource = null;
         var soundString:String = null;
         var aSound:SoundResource = null;
         var aVolume:Number = NaN;
         this.mHadPowerUp = false;
         this.mBallObj.aNextEnd = null;
         this.mBallObj.aPrevEnd = null;
         var aComboCount:int = theBall.GetComboCount();
         var aCount:int = this.GetNumInARow(theBall,theBall.GetColorType(),this.mBallObj);
         if(aCount >= 3)
         {
            this.mBoard.SetNumCleared(0);
            this.mBoard.SetCurComboCount(aComboCount);
            this.mBoard.SetCurComboScore(theBall.GetComboScore());
            this.mBoard.mNeedComboCount.clear();
            for(i = 0; i < PowerType.PowerType_Max; i++)
            {
               this.mApp.gGotPowerUp[i] = false;
            }
            aGapBonus = 0;
            aNumGaps = 0;
            anEndBall = this.mBallObj.aNextEnd.GetNextBall();
            aBallItr = this.mBallObj.aPrevEnd;
            while(aBallItr != anEndBall)
            {
               if(aBallItr.GetSuckPending())
               {
                  aBallItr.SetSuckPending(false);
                  this.mBoard.IncNumClearsInARow(1);
                  this.mChainFromSuck = true;
               }
               this.StartExploding(aBallItr);
               aGapBonus = aGapBonus + aBallItr.GetGapBonus();
               if(aBallItr.GetNumGaps() > aNumGaps)
               {
                  aNumGaps = aBallItr.GetNumGaps();
               }
               aBallItr.SetGapBonus(0,0);
               aBallItr = aBallItr.GetNextBall();
            }
            this.DoScoring(theBall,this.mBoard.GetNumCleared(),aComboCount,aGapBonus,aNumGaps);
            if(this.mBoard.GetCurComboCount() > this.mBoard.mLevelStats.mMaxCombo || this.mBoard.GetCurComboCount() == this.mBoard.mLevelStats.mMaxCombo && this.mBoard.GetCurComboScore() >= this.mBoard.mLevelStats.mMaxComboScore)
            {
               this.mBoard.mLevelStats.mMaxCombo = this.mBoard.GetCurComboCount();
               this.mBoard.mLevelStats.mMaxComboScore = this.mBoard.GetCurComboScore();
            }
            aBallItr = this.mBallObj.aPrevEnd;
            while(aBallItr != anEndBall)
            {
               aBallItr.SetComboCount(aComboCount,this.mBoard.GetCurComboScore());
               aBallItr = aBallItr.GetNextBall();
            }
            anItr = this.mBoard.mNeedComboCount.getListIterator();
            anItr.start();
            while(anItr.valid())
            {
               anItr.data.SetComboCount(aComboCount,this.mBoard.GetCurComboScore());
               anItr.forth();
            }
            this.mBoard.mNeedComboCount.clear();
            if(!this.mHadPowerUp)
            {
               switch(aComboCount)
               {
                  case 0:
                     destroySound = this.mApp.soundManager.getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED1);
                     break;
                  case 1:
                     destroySound = this.mApp.soundManager.getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED2);
                     break;
                  case 2:
                     destroySound = this.mApp.soundManager.getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED3);
                     break;
                  case 3:
                     destroySound = this.mApp.soundManager.getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED4);
                     break;
                  default:
                     destroySound = this.mApp.soundManager.getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED5);
               }
               destroySound.setVolume(0.5);
               destroySound.play(1);
               soundString = "SOUND_BALL_COMBO" + (aComboCount + 1);
               aSound = this.mApp.soundManager.getSoundResource(soundString);
               if(aSound != null)
               {
                  aVolume = 0.4 + 0.2 * aComboCount;
                  if(aVolume > 1)
                  {
                     aVolume = 1;
                  }
                  aSound.play(1);
               }
            }
            this.mBoard.SetCurComboCount(0);
            this.mBoard.SetCurComboScore(0);
            return true;
         }
         return false;
      }
      
      public function RollBallsIn() : void
      {
         this.mHasReachedCruisingSpeed = false;
         var s1:Number = this.mCurveDesc.mVals.mSpeed;
         var aStartDistance:int = this.mCurveDesc.mVals.mStartDistance;
         var k:Number = this.GetCurveLength() * aStartDistance / 100;
         if(this.mFirstChainEnd > 0)
         {
            k = k - Number(this.mFirstChainEnd / this.GetCurveLength());
            if(k <= 0)
            {
               this.mAdvanceSpeed = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale;
               return;
            }
         }
         var b:Number = 20 * s1 + 1;
         var c:Number = -20 * k;
         var numFrames:int = (-b + Math.sqrt(b * b - 4 * c)) / 2;
         this.mAdvanceSpeed = s1 + numFrames * 0.1;
         if(!this.mApp.gAddBalls)
         {
            this.mHasReachedCruisingSpeed = true;
            this.mAdvanceSpeed = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale;
         }
      }
      
      public function UpdateSuckingBalls() : void
      {
         var aFirstBall:Ball = null;
         var aSuckCount:int = 0;
         var aMoveAmount:Number = NaN;
         var aBall:Ball = null;
         var anEndBall:Ball = null;
         var aPrevBall:Ball = null;
         var b:Boolean = false;
         var aBullet:Bullet = null;
         var aPushBall:Ball = null;
         var collide:Boolean = false;
         var aMaxWayPoint:Number = NaN;
         var aBackwardsCount:int = 0;
         var doBackwards:Boolean = false;
         var aBackwardsSpeed:Number = NaN;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            aFirstBall = aBallItr.data;
            if(!aFirstBall.GetSuckBack() && aFirstBall.GetSuckCount() > 0)
            {
               this.UpdateForwardSuckingBalls();
               return;
            }
            aSuckCount = aFirstBall.GetSuckCount();
            aMoveAmount = (aSuckCount >> 3) * this.mSpeedScale;
            if(aFirstBall.GetSuckCount() > 0)
            {
               aBall = null;
               while(aBallItr.valid())
               {
                  aBall = aBallItr.data;
                  aBallItr.forth();
                  aBall.SetSuckCount(0);
                  this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() - aMoveAmount,this.mLevel.mLoopAtEnd);
                  aBullet = aBall.GetBullet();
                  if(aBullet != null && !aBullet.mDoNewMerge)
                  {
                     aPushBall = aBullet.GetPushBall();
                     if(aPushBall != null)
                     {
                        this.mWayPointMgr.FindFreeWayPoint(aPushBall,aBullet,false,this.mLevel.mLoopAtEnd);
                     }
                     aBullet.UpdateHitPos();
                  }
                  if(!aBall.GetCollidesWithNext())
                  {
                     break;
                  }
               }
               anEndBall = aBall;
               aFirstBall.SetSuckCount(aSuckCount + 1);
               aPrevBall = aFirstBall.GetPrevBall();
               if(aPrevBall != null && aPrevBall.GetColorType() == aFirstBall.GetColorType() && aPrevBall.GetIsExploding())
               {
                  while(aPrevBall != null)
                  {
                     aPrevBall = aPrevBall.GetPrevBall();
                     if(aPrevBall != null && !aPrevBall.GetIsExploding())
                     {
                        break;
                     }
                  }
               }
               b = aPrevBall != null && aPrevBall.GetColorType() == aFirstBall.GetColorType();
               if(b)
               {
                  collide = false;
                  aMaxWayPoint = aFirstBall.GetWayPoint() - aFirstBall.GetRadius() - aPrevBall.GetRadius();
                  if(aPrevBall.GetWayPoint() > aMaxWayPoint)
                  {
                     this.mWayPointMgr.SetWayPoint(aPrevBall,aMaxWayPoint,this.mLevel.mLoopAtEnd);
                     collide = true;
                  }
                  if(collide)
                  {
                     this.mBoard.PlayBallClick(Zuma2Sounds.SOUND_BALL_CLICK1);
                     aPrevBall.SetCollidesWithNext(true);
                     aFirstBall.SetSuckCount(0);
                     aBackwardsCount = 5 + 5 * aFirstBall.GetComboCount();
                     doBackwards = true;
                     if(!this.CheckSet(aFirstBall) || aFirstBall.GetSuckFromCompacting())
                     {
                        aFirstBall.SetComboCount(0,0);
                     }
                     if(aBackwardsCount > 40)
                     {
                        aBackwardsCount = 40;
                     }
                     aBackwardsCount = aBackwardsCount * 3;
                     if(doBackwards)
                     {
                        if(anEndBall.GetBackwardsCount() == 0)
                        {
                           anEndBall.SetBackwardsCount(30);
                           aBackwardsSpeed = aFirstBall.GetComboCount() * 1.5;
                           if(aBackwardsSpeed <= 1)
                           {
                              aBackwardsSpeed = 1;
                           }
                           anEndBall.SetBackwardsSpeed(aBackwardsSpeed);
                        }
                     }
                     this.ClearPendingSucks(anEndBall);
                  }
               }
               else
               {
                  aFirstBall.SetSuckCount(0);
               }
            }
            else
            {
               aBallItr.forth();
            }
         }
      }
      
      public function DeleteBall(theBall:Ball) : void
      {
         var anItr:DListIterator = null;
         var aBullet:Bullet = theBall.GetBullet();
         if(aBullet != null)
         {
            aBullet.MergeFully();
            anItr = this.mBulletList.nodeOf(aBullet);
            if(anItr.valid())
            {
               this.AdvanceMergingBullet(anItr.data);
            }
         }
         this.DeleteBullet(theBall.GetBullet());
         theBall.SetCollidesWithPrev(false);
         theBall.Delete();
      }
      
      public function DrawMisc() : void
      {
         for(var i:int = 0; i < this.mSparkles.length; i++)
         {
            this.mSparkles[i].Update();
         }
      }
      
      public function RemoveBallsAtEnd() : void
      {
         var aBall:Ball = null;
         if(this.mApp.gDieAtEnd || this.mLevel.mLoopAtEnd)
         {
            return;
         }
         if(this.mBallList.isEmpty())
         {
            return;
         }
         var anEndPoint:int = this.mWayPointMgr.GetEndPoint();
         var anItr:DListIterator = this.mBallList.getListIterator();
         anItr.end();
         var done:Boolean = false;
         while(!done)
         {
            aBall = anItr.data;
            if(aBall.GetWayPoint() >= anEndPoint)
            {
               if(!this.mLevel.mLoopAtEnd || aBall.GetIsExploding())
               {
                  if(anItr.node != this.mBallList.head)
                  {
                     anItr.back();
                  }
                  else
                  {
                     done = true;
                  }
                  this.DeleteBullet(aBall.GetBullet());
                  aBall.RemoveFromList();
                  aBall.mDead = true;
                  this.DeleteBall(aBall);
               }
               continue;
            }
            break;
         }
      }
      
      public function GetFarthestBallPercent(ignore_gaps:Boolean = true) : int
      {
         var it:DListIterator = null;
         var b:Ball = null;
         if(this.mBallList.isEmpty())
         {
            return 0;
         }
         var aWayPoint:int = this.mBallList.tail.data.GetWayPoint();
         if(!ignore_gaps)
         {
            it = this.mBallList.getListIterator();
            it.start();
            while(it.valid())
            {
               b = it.data;
               if(!b.GetCollidesWithNext())
               {
                  aWayPoint = b.GetWayPoint();
                  break;
               }
               it.forth();
            }
         }
         return int(aWayPoint * 100 / this.mWayPointMgr.GetNumPoints());
      }
      
      public function SetLosing() : void
      {
         var aBall:Ball = null;
         var aBulletItr:DListIterator = this.mBulletList.getListIterator();
         aBulletItr.start();
         while(aBulletItr.valid())
         {
            aBulletItr.data.Delete();
            aBulletItr.forth();
         }
         this.mBulletList = new DLinkedList();
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            aBall = aBallItr.data;
            aBall.SetSuckCount(this.mAdvanceSpeed * 4);
            aBallItr.forth();
         }
      }
      
      public function DoBackwards() : void
      {
         if(!this.mBallList.isEmpty())
         {
            this.mBackwardCount = 300;
         }
      }
      
      public function ActivateProximityBomb(theBall:Ball) : void
      {
         var aBall:Ball = null;
         var radius:int = PROXIMITY_BOMB_RADIUS;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            aBall = aBallItr.data;
            if(!aBall.GetIsExploding() && aBall.CollidesWithPhysically(theBall,radius))
            {
               aBall.SetComboCount(this.mBoard.GetCurComboCount(),this.mBoard.GetCurComboScore());
               this.mBoard.mNeedComboCount.append(aBall);
               this.StartExploding(aBall);
            }
            aBallItr.forth();
         }
      }
      
      public function SetPath(path:String) : void
      {
         this.mPath = path;
      }
      
      public function LoadCurve() : void
      {
         var aHoleX:int = 0;
         var aHoleY:int = 0;
         var aPoint:WayPoint = null;
         var pt:Point = null;
         var midpoint:SexyVector3 = null;
         var perp:SexyVector3 = null;
         var p1:SexyVector3 = null;
         this.mWarningLights = new Vector.<WarningLight>();
         this.mSpeedScale = 1;
         this.mWayPointMgr.LoadCurve(this.mPath,this.mCurveDesc);
         var aRotation:Number = this.mCurveDesc.mVals.mSkullRotation;
         if(aRotation >= 0)
         {
            aRotation = Zuma2App.DEG_TO_RAD * aRotation;
         }
         var len:int = this.mWayPointMgr.mWayPoints.length;
         if(len > 0)
         {
            this.mWayPointMgr.CalcPerpendicularForPoint(int(len - 1));
            aPoint = this.mWayPointMgr.mWayPoints[len - 1];
            aHoleX = aPoint.x;
            aHoleY = aPoint.y;
            if(aRotation < 0)
            {
               aRotation = aPoint.mRotation;
            }
         }
         this.mLevel.mHoleMgr.PlaceHole(this.mCurveNum,aHoleX,aHoleY,aRotation,true);
         this.mDangerPoint = this.mWayPointMgr.mWayPoints.length - this.mCurveDesc.mDangerDistance;
         if(this.mDangerPoint >= this.mWayPointMgr.mWayPoints.length)
         {
            this.mDangerPoint = this.mWayPointMgr.mWayPoints.length - 1;
         }
         var point_spacing:int = 0;
         for(var wp:int = this.mDangerPoint * this.mLevel.mPotPct; wp <= this.mWayPointMgr.GetEndPoint() - 50; wp = wp + 50)
         {
            pt = this.mWayPointMgr.GetPointPos(wp);
            midpoint = new SexyVector3(pt.x,pt.y,0);
            perp = this.mWayPointMgr.CalcPerpendicular(wp).Mult(point_spacing);
            p1 = midpoint.Add(perp);
            this.mWarningLights.push(new WarningLight(this.mApp,p1.x,p1.y));
            this.mWarningLights[this.mWarningLights.length - 1].SetAngle(this.mWayPointMgr.GetRotationForPoint(wp));
            this.mWarningLights[this.mWarningLights.length - 1].mWaypoint = wp;
            this.mWarningLights[this.mWarningLights.length - 1].mPriority = this.mWayPointMgr.GetPriority(wp);
         }
         this.mIsLoaded = true;
      }
      
      public function HasReachedCruisingSpeed() : Boolean
      {
         return this.mHasReachedCruisingSpeed;
      }
      
      public function RemoveBallsAtFront() : void
      {
         var aBall:Ball = null;
         if(!this.mHasReachedCruisingSpeed)
         {
            return;
         }
         var anItr:DListIterator = this.mBallList.getListIterator();
         anItr.start();
         while(anItr.valid())
         {
            aBall = anItr.data;
            if(aBall.GetWayPoint() < this.mCurveDesc.mCutoffPoint && this.mStopAddingBalls || aBall.GetWayPoint() < 1)
            {
               anItr.forth();
               this.DeleteBullet(aBall.GetBullet());
               aBall.RemoveFromList();
               if(!aBall.GetIsExploding() && !this.mStopAddingBalls)
               {
                  this.mPendingBalls.append(aBall);
               }
               else
               {
                  if(!this.mStopAddingBalls)
                  {
                  }
                  aBall.mDead = true;
                  this.DeleteBall(aBall);
                  if(this.mBallList.size == 0 && this.mStopAddingBalls)
                  {
                     this.mLastClearedBallPoint = 0;
                  }
               }
               continue;
            }
            break;
         }
      }
      
      public function StartLevel() : void
      {
         var i:int = 0;
         this.mPathLightEndFrame = 0;
         this.mLastPathShowTick = Math.min(0,this.GetBoardTickCount() - 1000000);
         this.mLastClearedBallPoint = 0;
         for(i = 0; i < PowerType.PowerType_Max; i++)
         {
            this.mLastSpawnedPowerUpFrame[i] = this.mBoard.GetStateCount() - 1000;
            this.mLastCompletedPowerUpFrame[i] = this.mBoard.GetStateCount() - 1000;
         }
         this.DeleteBalls();
         var aNumBalls:int = this.mCurveDesc.mVals.mNumBalls > 0 && this.mCurveDesc.mVals.mNumBalls < 10?int(this.mCurveDesc.mVals.mNumBalls):10;
         for(i = 0; i < aNumBalls; i++)
         {
            this.AddPendingBall();
         }
         this.mStopTime = 0;
         this.mSlowCount = 0;
         this.mBackwardCount = 0;
         this.mTotalBalls = aNumBalls;
         this.mNumBallsCreated = this.mPendingBalls.size;
         this.mStopAddingBalls = false;
         this.mInDanger = false;
         this.mFirstChainEnd = 0;
         this.mFirstBallMovedBackwards = false;
         this.mApp.gDieAtEnd = !!this.mLevel.mLoopAtEnd?false:Boolean(this.mCurveDesc.mVals.mDieAtEnd);
         this.RollBallsIn();
      }
      
      public function CheckGapShot(theBullet:Bullet) : Boolean
      {
         var dx:Number = NaN;
         var dy:Number = NaN;
         var aPoint:WayPoint = null;
         var aGapSize:int = 0;
         var aGapBallId:int = 0;
         var anItr:DListIterator = null;
         var aBall:Ball = null;
         var aPrevBall:Ball = null;
         var it2:DListIterator = null;
         var valid:Boolean = false;
         var b:Ball = null;
         var aDiameter:int = theBullet.GetRadius() * 2;
         var r:Number = theBullet.GetRadius();
         var checkDist:Number = r * r;
         var x:Number = theBullet.GetX();
         var y:Number = theBullet.GetY();
         var aList:Vector.<WayPoint> = this.mWayPointMgr.mWayPoints;
         var aSize:int = aList.length;
         var aCurCurvePoint:int = theBullet.GetCurCurvePoint(this.mCurveNum);
         if(aCurCurvePoint > 0 && aCurCurvePoint < aSize)
         {
            aPoint = aList[aCurCurvePoint];
            dx = aPoint.x - x;
            dy = aPoint.y - y;
            if(dx * dx + dy * dy < checkDist)
            {
               return false;
            }
            theBullet.SetCurCurvePoint(this.mCurveNum,0);
         }
         for(var i:int = 1; i < aSize; i = i + aDiameter)
         {
            aPoint = aList[i];
            if(!aPoint.mInTunnel)
            {
               dx = aPoint.x - x;
               dy = aPoint.y - y;
               if(dx * dx + dy * dy < checkDist)
               {
                  theBullet.SetCurCurvePoint(this.mCurveNum,i);
                  aGapSize = 0;
                  aGapBallId = 0;
                  anItr = this.mBallList.getListIterator();
                  anItr.start();
                  while(anItr.valid())
                  {
                     aBall = anItr.data;
                     if(aBall.GetWayPoint() > i)
                     {
                        aPrevBall = aBall.GetPrevBall();
                        if(aPrevBall != null)
                        {
                           if(aBall.GetIsExploding())
                           {
                              it2 = new DListIterator(this.mBallList,anItr.node);
                              it2.forth();
                              valid = false;
                              while(it2.valid())
                              {
                                 b = it2.data;
                                 if(!b.GetIsExploding())
                                 {
                                    valid = true;
                                    break;
                                 }
                                 it2.forth();
                              }
                              if(!valid)
                              {
                                 break;
                              }
                           }
                           aGapSize = aBall.GetWayPoint() - aPrevBall.GetWayPoint();
                           aGapBallId = aBall.GetId();
                        }
                        break;
                     }
                     anItr.forth();
                  }
                  if(aGapSize > 0)
                  {
                     return theBullet.AddGapInfo(this.mCurveNum,aGapSize,aGapBallId);
                  }
                  return false;
               }
            }
         }
         return false;
      }
      
      public function HasPowerup(p:int) : Boolean
      {
         var b:Ball = null;
         var it:DListIterator = this.mBallList.getListIterator();
         it.start();
         while(it.valid())
         {
            b = it.data;
            if(b.GetPowerOrDestType() == p)
            {
               return true;
            }
            it.forth();
         }
         return false;
      }
      
      public function UpdateForwardSuckingBalls() : void
      {
         var aFirstBall:Ball = null;
         var aSuckCount:int = 0;
         var aMoveAmount:Number = NaN;
         var aBall:Ball = null;
         var anEndBall:Ball = null;
         var aNextBall:Ball = null;
         var aBullet:Bullet = null;
         var aPushBall:Ball = null;
         var collide:Boolean = false;
         var aMaxWayPoint:Number = NaN;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.end();
         while(true)
         {
            aFirstBall = aBallItr.data;
            aSuckCount = aFirstBall.GetSuckCount();
            aMoveAmount = (aSuckCount >> 3) * this.mSpeedScale;
            if(aFirstBall.GetSuckCount() > 0)
            {
               while(true)
               {
                  aBall = aBallItr.data;
                  aBall.SetSuckCount(0,false);
                  this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() + aMoveAmount,this.mLevel.mLoopAtEnd);
                  aBullet = aBall.GetBullet();
                  if(aBullet != null && !aBullet.mDoNewMerge)
                  {
                     aPushBall = aBullet.GetPushBall();
                     if(aPushBall != null)
                     {
                        this.mWayPointMgr.FindFreeWayPoint(aPushBall,aBullet,false,this.mLevel.mLoopAtEnd);
                     }
                     aBullet.UpdateHitPos();
                  }
                  if(!aBall.GetCollidesWithPrev())
                  {
                     break;
                  }
                  if(aBallItr.node == this.mBallList.head)
                  {
                     break;
                  }
                  aBallItr.back();
               }
               anEndBall = aBall;
               aFirstBall.SetSuckCount(aSuckCount + 1,false);
               aNextBall = aFirstBall.GetNextBall();
               if(aNextBall != null)
               {
                  collide = false;
                  aMaxWayPoint = aFirstBall.GetWayPoint() + aFirstBall.GetRadius() + aNextBall.GetRadius();
                  if(aNextBall.GetWayPoint() < aMaxWayPoint)
                  {
                     this.mWayPointMgr.SetWayPoint(aNextBall,aMaxWayPoint,this.mLevel.mLoopAtEnd);
                     collide = true;
                  }
                  if(collide)
                  {
                     this.mBoard.PlayBallClick(Zuma2Sounds.SOUND_BALL_CLICK1);
                     aNextBall.SetCollidesWithPrev(true);
                     aFirstBall.SetSuckCount(0,true);
                     if(!this.CheckSet(aFirstBall))
                     {
                        aFirstBall.SetComboCount(0,0);
                     }
                     this.ClearPendingSucks(anEndBall);
                  }
               }
               else
               {
                  aFirstBall.SetSuckCount(0,true);
               }
               continue;
            }
            if(aBallItr.node != this.mBallList.head)
            {
               aBallItr.back();
               continue;
            }
            break;
         }
      }
      
      public function ZumaAchieved(stop:Boolean) : void
      {
         var anItr:DListIterator = null;
         if(this.mStopAddingBalls == stop)
         {
            return;
         }
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_LEVEL_ZUMA);
         this.mBackwardCount = this.mCurveDesc.mVals.mZumaBack;
         if(!this.mBoard.GauntletMode())
         {
            this.mSlowCount = this.mCurveDesc.mVals.mZumaSlow;
         }
         if(!this.mBoard.GauntletMode())
         {
            this.mStopAddingBalls = stop;
            this.mPostZumaFlashTimer = 50;
            if(stop)
            {
               anItr = this.mPendingBalls.getListIterator();
               anItr.start();
               while(anItr.valid())
               {
                  anItr.data.Delete();
                  anItr.forth();
               }
               this.mPendingBalls.clear();
            }
         }
         else
         {
            this.mHasReachedCruisingSpeed = false;
            this.mHasReachedRolloutPoint = false;
            this.mCanCheckForSpeedup = false;
         }
      }
      
      public function GetCurveLength() : int
      {
         return this.mWayPointMgr.mWayPoints.length;
      }
      
      public function GetBoardStateCount() : int
      {
         return !!this.mBoard?int(this.mBoard.GetStateCount()):0;
      }
      
      public function IsLosing() : Boolean
      {
         if(this.mHaveSets || this.mBallList.isEmpty() || this.mLevel.mLoopAtEnd || this.mBallList.tail.data.GetWayPoint() < this.mWayPointMgr.GetEndPoint() || !this.mBulletList.isEmpty() || this.mBackwardCount > 0)
         {
            return false;
         }
         var aBall:Ball = this.mBallList.tail.data;
         while(aBall != null)
         {
            if(aBall.GetSuckCount() > 0)
            {
               return false;
            }
            aBall = aBall.GetPrevBall(true);
         }
         return true;
      }
      
      public function DeleteBullet(theBullet:Bullet) : void
      {
         if(theBullet == null)
         {
            return;
         }
         var aBulletItr:DListIterator = this.mBulletList.nodeOf(theBullet);
         if(aBulletItr.valid())
         {
            this.mBulletList.remove(aBulletItr);
         }
         theBullet.Delete();
      }
      
      public function ActivatePower(theBall:Ball) : void
      {
         var aPower:int = theBall.GetPowerOrDestType();
         this.mApp.gGotPowerUp[aPower] = true;
         if(aPower == PowerType.PowerType_ProximityBomb)
         {
            this.ActivateProximityBomb(theBall);
         }
         else if(aPower == PowerType.PowerType_MoveBackwards)
         {
            this.DoBackwards();
         }
         else if(aPower == PowerType.PowerType_SlowDown)
         {
            this.DoSlowdown();
         }
      }
      
      public function AtRest() : Boolean
      {
         var b:Ball = null;
         if(this.mBallList.size == 0)
         {
            return true;
         }
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            b = aBallItr.data;
            if(b.GetIsExploding() || b.GetSuckCount() > 0 || b.GetBullet() != null)
            {
               return false;
            }
            aBallItr.forth();
         }
         return true;
      }
      
      public function AddPowerUp(thePower:int) : Ball
      {
         var i:int = 0;
         var available_balls:Vector.<Ball> = null;
         var valid_indices:Vector.<int> = null;
         var b:Ball = null;
         var idx:int = 0;
         var color_type:int = 0;
         var it:DListIterator = null;
         var aBall:Ball = null;
         var pr:PowerupRegion = null;
         var min_wp:Number = NaN;
         var max_wp:Number = NaN;
         var region_b:Ball = null;
         if(!this.mApp.mLevelMgr.mUniquePowerupColor && thePower != PowerType.PowerType_GauntletMultBall)
         {
            return null;
         }
         available_balls = new Vector.<Ball>();
         valid_indices = new Vector.<int>();
         for(i = 0; i < this.mCurveDesc.mVals.mNumColors; i++)
         {
            if(this.mBallColorHasPowerup[i] == 0 || thePower == PowerType.PowerType_GauntletMultBall)
            {
               valid_indices.push(i);
            }
         }
         b = null;
         while(valid_indices.length > 0 && b == null)
         {
            idx = Math.random() * valid_indices.length;
            color_type = valid_indices[idx];
            it = this.mBallList.getListIterator();
            it.start();
            while(it.valid())
            {
               aBall = it.data;
               if(aBall.GetPowerType() == PowerType.PowerType_None && aBall.GetDestPowerType() == PowerType.PowerType_None && aBall.GetColorType() == color_type && !aBall.GetIsExploding())
               {
                  if(thePower != PowerType.PowerType_GauntletMultBall || thePower == PowerType.PowerType_GauntletMultBall && !this.mWayPointMgr.InTunnel2(aBall,true) && !this.mWayPointMgr.InTunnel2(aBall,false) && aBall.GetWayPoint() / this.mWayPointMgr.GetEndPoint() >= this.mApp.mLevelMgr.mMinMultBallDistance)
                  {
                     available_balls.push(aBall);
                  }
                  else if(thePower == PowerType.PowerType_GauntletMultBall)
                  {
                  }
               }
               it.forth();
            }
            if(this.mLevel.mPowerupRegions.length > 0)
            {
               for(i = 0; i < this.mLevel.mPowerupRegions.length; i++)
               {
                  pr = this.mLevel.mPowerupRegions[i];
                  if(pr.mCurveNum == this.mCurveNum && int(Math.random() * pr.mChance) == 0)
                  {
                     min_wp = pr.mCurvePctStart * this.mWayPointMgr.GetNumPoints();
                     max_wp = pr.mCurvePctEnd * this.mWayPointMgr.GetNumPoints();
                     for(idx = 0; idx < available_balls.length; idx++)
                     {
                        region_b = available_balls[idx];
                        if(region_b.GetWayPoint() >= min_wp && region_b.GetWayPoint() <= max_wp)
                        {
                           b = region_b;
                           break;
                        }
                     }
                     break;
                  }
               }
            }
            if(available_balls.length == 0)
            {
               valid_indices.splice(idx,1);
            }
            else if(b == null)
            {
               b = available_balls[int(Math.random() * available_balls.length)];
            }
         }
         if(b != null)
         {
            b.SetPowerType(thePower);
         }
         return b;
      }
      
      public function UpdateLosing() : void
      {
         var aBall:Ball = null;
         var aSuckCount:int = 0;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         var anEndPoint:int = this.mWayPointMgr.GetEndPoint();
         while(aBallItr.valid())
         {
            aBall = aBallItr.data;
            if(aBall.GetWayPoint() >= anEndPoint)
            {
               aSuckCount = aBall.GetSuckCount();
               if(aSuckCount < 0)
               {
                  aBall.SetSuckCount(aSuckCount + 1);
               }
               else
               {
                  aBall.Delete();
                  this.mBallList.remove(aBallItr);
                  aBallItr.forth();
                  continue;
               }
            }
            else
            {
               this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() + (aBall.GetSuckCount() >> 2),this.mLevel.mLoopAtEnd);
               aBall.SetSuckCount(aBall.GetSuckCount() + 1);
               if(aBall.GetWayPoint() >= anEndPoint)
               {
                  aBall.SetSuckCount(0);
               }
            }
            aBallItr.forth();
         }
         if(!this.mBallList.isEmpty())
         {
            this.SetFarthestBall(this.mBallList.tail.data.GetWayPoint());
         }
      }
      
      public function DoScoring(theBall:Ball, theNumBalls:int, theComboCount:int, theGapBonus:int, theNumGaps:int) : void
      {
         var p:int = 0;
         var soundString:String = null;
         if(theNumBalls == 0)
         {
            return;
         }
         var max_bulge:Number = 1.5;
         var bulge:Number = 1;
         var aNumPoints:int = theNumBalls * 10 + theGapBonus + theComboCount * 100;
         var inARow:Boolean = false;
         var aChainBonusStart:int = !!this.mApp.gSuckMode?10:4;
         var aRowBonus:int = 0;
         if(this.mBoard.GetNumClearsInARow() > aChainBonusStart && theComboCount == 0)
         {
            inARow = true;
            aRowBonus = (!!this.mApp.gSuckMode?10:100) + 10 * (this.mBoard.GetNumClearsInARow() - (aChainBonusStart + 1));
            aNumPoints = aNumPoints + aRowBonus;
            if(this.mLevel.AllowPointsFromBalls())
            {
               this.mBoard.IncCurInARowBonus(aRowBonus);
            }
         }
         if(this.mLevel.AllowPointsFromBalls())
         {
            this.mBoard.IncCurComboScore(aNumPoints);
            this.mBoard.IncScore(aNumPoints,true);
            if(theComboCount > 0)
            {
               this.mBoard.mLevelStats.mNumCombos++;
            }
            if(theGapBonus > 0)
            {
               this.mBoard.mLevelStats.mNumGaps++;
            }
         }
         var scoreString:* = "";
         if(this.mLevel.AllowPointsFromBalls())
         {
            scoreString = "+" + aNumPoints;
         }
         if(theComboCount > 0)
         {
            if(this.mLevel.AllowPointsFromBalls())
            {
               max_bulge = 1.5;
               bulge = 1 + (max_bulge - 1) / 10 * (theComboCount + 1);
               if(bulge < 1)
               {
                  bulge = 1;
               }
               scoreString = scoreString + ("\rCOMBO x" + (theComboCount + 1));
            }
         }
         if(theGapBonus > 0)
         {
            if(this.mLevel.AllowPointsFromBalls())
            {
               if(theNumGaps > 1)
               {
                  if(theNumGaps > 3)
                  {
                     scoreString = scoreString + "\rQUAD GAP BONUS!!!!";
                  }
                  else if(theNumGaps > 2)
                  {
                     scoreString = scoreString + "\rTRIPLE GAP BONUS!!!";
                  }
                  else
                  {
                     scoreString = scoreString + "\rDOUBLE GAP BONUS!!";
                  }
               }
               else
               {
                  scoreString = scoreString + "\rGAP BONUS!";
               }
            }
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_GAPBONUS1);
         }
         if(inARow && this.mLevel.AllowPointsFromBalls())
         {
            max_bulge = 1.5;
            bulge = 1 + (max_bulge - 1) / 10 * (this.mBoard.GetNumClearsInARow() + 1 - aChainBonusStart);
            if(bulge < 1)
            {
               bulge = 1;
            }
            if(bulge > 1.5)
            {
               bulge = 1.5;
            }
            if(this.mChainFromSuck)
            {
               scoreString = scoreString + ("\rCHAIN BONUS x" + this.mBoard.GetNumClearsInARow());
               this.mChainFromSuck = false;
            }
            else
            {
               scoreString = scoreString + ("\rCHAIN BONUS x" + (this.mBoard.GetNumClearsInARow() + 1));
            }
            p = this.mBoard.GetNumClearsInARow() - 5;
            if(p > 10)
            {
               p = 10;
            }
            soundString = "SOUND_CHAIN" + p;
            this.mApp.soundManager.playSound(soundString);
         }
         this.mBoard.AddText(scoreString,theBall.GetX(),theBall.GetY(),theBall.GetColorType(),bulge);
      }
      
      public function ClearPendingSucks(theEndBall:Ball) : void
      {
         var aBallItr:Ball = theEndBall;
         var firstChain:Boolean = true;
         while(aBallItr != null)
         {
            if(aBallItr.GetSuckPending())
            {
               aBallItr.SetSuckPending(false);
               this.mBoard.ResetInARowBonus();
               aBallItr.SetGapBonus(0,0);
            }
            aBallItr = aBallItr.GetPrevBall();
            if(aBallItr == null)
            {
               break;
            }
            if(!aBallItr.GetCollidesWithNext())
            {
               firstChain = false;
            }
            if(!firstChain && aBallItr.GetSuckCount())
            {
               break;
            }
         }
      }
      
      public function UpdateSets() : void
      {
         var aBall:Ball = null;
         var exploding:Boolean = false;
         var aNextBall:Ball = null;
         var aPrevBall:Ball = null;
         this.mHaveSets = false;
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.start();
         while(aBallItr.valid())
         {
            aBall = aBallItr.data;
            exploding = aBall.GetIsExploding();
            if(exploding)
            {
               this.mHaveSets = true;
            }
            if(aBall.GetShouldRemove())
            {
               aNextBall = aBall.GetNextBall();
               aPrevBall = aBall.GetPrevBall();
               if(aNextBall != null && !aNextBall.GetIsExploding())
               {
                  if(aPrevBall != null && !aPrevBall.GetShouldRemove() && aNextBall.GetColorType() == aPrevBall.GetColorType())
                  {
                     aNextBall.SetSuckCount(10);
                     aNextBall.SetComboCount(aBall.GetComboCount() + 1,aBall.GetComboScore());
                  }
               }
               if(aBallItr.node == this.mBallList.head)
               {
                  if(!this.mDoingClearCurveRollout)
                  {
                     this.mAdvanceSpeed = 0;
                  }
                  if(this.mStopTime < 40)
                  {
                     this.mStopTime = 40;
                  }
               }
               this.DeleteBall(aBall);
               this.mBallList.remove(aBallItr);
            }
            else
            {
               if(exploding)
               {
                  aBall.UpdateExplosion();
               }
               else
               {
                  this.mBoard.mBallColorMap[aBall.GetColorType()]++;
               }
               aBallItr.forth();
            }
         }
      }
      
      public function SetFarthestBall(thePoint:int) : void
      {
         if(this.mBoard.GetGameState() == GameBoardWidget.GameState_Losing)
         {
            return;
         }
         var aLastPoint:int = this.mDangerPoint;
         if(aLastPoint < 0)
         {
            aLastPoint = 0;
         }
         var aPercentOpen:Number = 0;
         if(thePoint >= aLastPoint)
         {
            aPercentOpen = Number(thePoint - aLastPoint) / (this.mWayPointMgr.GetNumPoints() - aLastPoint);
         }
         this.mLevel.mHoleMgr.SetPctOpen(this.mCurveNum,aPercentOpen);
      }
      
      public function IsWinning() : Boolean
      {
         var is_empty:Boolean = this.mBallList.isEmpty() && this.mPendingBalls.isEmpty();
         if(is_empty)
         {
            return true;
         }
         return false;
      }
      
      public function UpdateBalls() : void
      {
         var b:Ball = null;
         var itr:DListIterator = this.mBallList.getListIterator();
         var i:int = 0;
         itr.start();
         while(itr.valid())
         {
            i++;
            b = itr.data;
            b.Update();
            itr.forth();
         }
         itr = this.mBulletList.getListIterator();
         itr.start();
         while(itr.valid())
         {
            itr.data.Update();
            itr.forth();
         }
      }
      
      public function DoSlowdown() : void
      {
         if(this.mSlowCount < 1000)
         {
            this.mSlowCount = 800;
         }
      }
      
      public function AddPendingBall() : void
      {
         var aNewColor:int = 0;
         var aPrevColor:int = 0;
         var aBall:Ball = new Ball(this.mApp);
         var aNumColors:int = this.mCurveDesc.mVals.mNumColors;
         if(!this.mPendingBalls.isEmpty())
         {
            aPrevColor = this.mPendingBalls.tail.data.GetColorType();
         }
         else if(!this.mBallList.isEmpty())
         {
            aPrevColor = this.mBallList.head.data.GetColorType();
         }
         else
         {
            aPrevColor = this.mLevel.GetRandomPendingBallColor(aNumColors);
         }
         if(aPrevColor >= aNumColors)
         {
            aPrevColor = this.mLevel.GetRandomPendingBallColor(aNumColors);
         }
         var num_matches:int = this.GetNumPendingMatches();
         var start:int = 33;
         var start_w:int = 4;
         var aMaxSingle:int = this.mCurveDesc.mVals.mMaxSingle;
         if(this.mApp.mRand.Next() * 100 <= this.mCurveDesc.mVals.mBallRepeat && num_matches < this.mCurveDesc.mVals.mMaxClumpSize)
         {
            aNewColor = aPrevColor;
         }
         else if(aMaxSingle < 10 && this.GetNumPendingSingles(1) == 1 && (aMaxSingle == 0 || this.GetNumPendingSingles(10) > aMaxSingle))
         {
            aNewColor = aPrevColor;
         }
         else
         {
            do
            {
               aNewColor = this.mLevel.GetRandomPendingBallColor(aNumColors);
            }
            while(aNewColor == aPrevColor);
            
         }
         aBall.SetColorType(aNewColor);
         aNewColor = aBall.GetColorType();
         this.mPendingBalls.append(aBall);
         this.mNumBallsCreated++;
         if(this.mCurveDesc.mVals.mNumBalls > 0 && this.mNumBallsCreated >= this.mCurveDesc.mVals.mNumBalls)
         {
            this.mStopAddingBalls = true;
         }
      }
      
      public function AdvanceBackwardBalls() : void
      {
         var aBall:Ball = null;
         var aBackwardsCount:int = 0;
         var aPrevBall:Ball = null;
         var aMaxWayPoint:Number = NaN;
         this.mFirstBallMovedBackwards = false;
         if(this.mBallList.isEmpty())
         {
            return;
         }
         var aBallItr:DListIterator = this.mBallList.getListIterator();
         aBallItr.end();
         var ballMoved:Boolean = false;
         var aDiff:Number = 0;
         if(this.mBackwardCount)
         {
            this.mBallList.tail.data.SetBackwardsSpeed(1 * this.mSpeedScale);
            this.mBallList.tail.data.SetBackwardsCount(1);
         }
         while(true)
         {
            aBall = aBallItr.data;
            aBackwardsCount = aBall.GetBackwardsCount();
            if(aBackwardsCount > 0)
            {
               aDiff = aBall.GetBackwardsSpeed();
               this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() - aDiff,this.mLevel.mLoopAtEnd);
               aBall.SetBackwardsCount(aBackwardsCount - 1);
               ballMoved = true;
            }
            if(aBallItr.node == this.mBallList.head)
            {
               break;
            }
            aBallItr.back();
            aPrevBall = aBallItr.data;
            if(ballMoved)
            {
               if(aPrevBall.GetCollidesWithNext())
               {
                  this.mWayPointMgr.SetWayPoint(aPrevBall,aPrevBall.GetWayPoint() - aDiff,this.mLevel.mLoopAtEnd);
               }
               else
               {
                  aMaxWayPoint = aBall.GetWayPoint() - aBall.GetRadius() - aPrevBall.GetRadius();
                  if(aPrevBall.GetWayPoint() > aMaxWayPoint)
                  {
                     ballMoved = true;
                     if(!aPrevBall.GetCollidesWithNext())
                     {
                        aPrevBall.SetCollidesWithNext(true);
                        this.mBoard.PlayBallClick(Zuma2Sounds.SOUND_BALL_CLICK1);
                     }
                     aDiff = aPrevBall.GetWayPoint() - aMaxWayPoint;
                     aPrevBall.SetWayPoint(aMaxWayPoint,this.mWayPointMgr.InTunnel(aMaxWayPoint));
                  }
                  else
                  {
                     ballMoved = false;
                  }
               }
            }
         }
         if(ballMoved)
         {
            this.mFirstBallMovedBackwards = true;
            if(this.mStopTime < 20)
            {
               this.mStopTime = 20;
            }
         }
      }
      
      public function HasReachedRolloutPoint() : Boolean
      {
         return this.mHasReachedRolloutPoint;
      }
      
      public function UpdatePowerUps() : void
      {
         var i:int = 0;
         var num_nonzero:int = 0;
         var total:int = 0;
         var rand_val:int = 0;
         var num:int = 0;
         var freq:int = 0;
         var old_spawn_frame:int = 0;
         var allow_dupes:Boolean = false;
         var cooldown_amt:int = 0;
         if(this.mBallList.isEmpty() || this.mBoard.mPreventBallAdvancement)
         {
            return;
         }
         var aStateCount:int = this.mBoard.GetStateCount();
         if(aStateCount < this.mApp.mLevelMgr.mPowerDelay)
         {
            return;
         }
         var psd:int = this.mApp.mLevelMgr.mPowerupSpawnDelay;
         if(psd > 0 && aStateCount - this.mLastPowerupTime < psd)
         {
            return;
         }
         var chance:int = this.mCurveDesc.mVals.mPowerUpChance;
         if(chance == 0)
         {
            return;
         }
         chance = chance - chance * this.mLevel.GetPowerIncPct();
         if(chance <= 0)
         {
            chance = 1;
         }
         if(this.mApp.mLevelMgr.mUniquePowerupColor)
         {
            num_nonzero = 0;
            for(i = 0; i < this.mCurveDesc.mVals.mNumColors; i++)
            {
               if(this.mBallColorHasPowerup[i] > 0)
               {
                  num_nonzero++;
               }
            }
            if(num_nonzero == this.mCurveDesc.mVals.mNumColors)
            {
               return;
            }
         }
         if(int(Math.random() * chance) == 0)
         {
            total = 0;
            for(i = 0; i < PowerType.PowerType_Max; i++)
            {
               if(this.CanSpawnPowerUp(i))
               {
                  total = total + this.mCurveDesc.mVals.mPowerUpFreq[i];
               }
            }
            if(total == 0)
            {
               return;
            }
            rand_val = Math.random() * total;
            num = 0;
            for(i = 0; i < PowerType.PowerType_Max; i++)
            {
               if(this.CanSpawnPowerUp(i))
               {
                  freq = this.mCurveDesc.mVals.mPowerUpFreq[i];
                  if(rand_val < num + freq)
                  {
                     old_spawn_frame = this.mLastSpawnedPowerUpFrame[i];
                     allow_dupes = false;
                     cooldown_amt = this.mApp.mLevelMgr.mPowerCooldown;
                     if(aStateCount - old_spawn_frame < cooldown_amt)
                     {
                        return;
                     }
                     if(aStateCount - this.mLastCompletedPowerUpFrame[i] < cooldown_amt && this.mLastCompletedPowerUpFrame[i] > 0)
                     {
                        return;
                     }
                     this.AddPowerUp(i);
                     this.mLastPowerupTime = aStateCount;
                     this.mLastSpawnedPowerUpFrame[i] = aStateCount;
                     this.mNumPowerUpsThisLevel[i]++;
                     break;
                  }
                  num = num + freq;
               }
            }
         }
      }
      
      public function GetDistanceToDeath() : int
      {
         if(!this.mInDanger || this.mBallList.isEmpty())
         {
            return -1;
         }
         var d:int = this.mWayPointMgr.GetNumPoints() - this.mBallList.tail.data.GetWayPoint();
         if(d < 0)
         {
            d = 0;
         }
         return d;
      }
   }
}
