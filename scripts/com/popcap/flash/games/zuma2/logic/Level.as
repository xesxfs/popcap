package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import de.polygonal.ds.DListIterator;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class Level
   {
       
      
      public var mMoveSpeed:int = 25;
      
      public var mHoleMgr:HoleMgr;
      
      public var mTunnelImages:Vector.<String>;
      
      public var mHaveReachedTarget:Boolean;
      
      public var mDrawCurves:Boolean;
      
      public var mUpdateCount:int;
      
      public var mPotPct:Number;
      
      public var mLilyPadSprite:Sprite;
      
      public var mOffscreenClearBonus:Boolean = false;
      
      public var mCurveMgr:Array;
      
      public var mMoveType:String;
      
      public var mTreasurePoints:Vector.<TreasurePoint>;
      
      public var mPowerupRegions:Vector.<PowerupRegion>;
      
      public var mTimeToComplete:int;
      
      public var mNumFrogPoints:int;
      
      public var mId:String;
      
      public var mHasReachedCruisingSpeed:Boolean;
      
      public var mHurryToRolloutAmt:Number;
      
      public var mApp:Zuma2App;
      
      public var mTargetBarSize:int;
      
      public var mBoard:GameBoardWidget;
      
      public var mIsEndless:Boolean;
      
      public var mTunnelData:Array;
      
      public var mLoopAtEnd:Boolean;
      
      public var mPostZumaTimeSpeedInc:Number;
      
      public var mLilyPadBitmap:Bitmap;
      
      public var mPostZumaTimeSlowInc:Number;
      
      public var mNumCurves:int;
      
      public var mBackgroundImage:String;
      
      public var mCurBarSize:int;
      
      public var mFurthestBallDistance:int;
      
      public var mFrog:Gun;
      
      public var mDisplayName:String;
      
      public var mTempSpeedupTimer:int;
      
      public var mFrogX:Array;
      
      public var mFrogY:Array;
      
      public var mAllCurvesAtRolloutPoint:Boolean;
      
      public var mFireSpeed:int;
      
      public var mTreasureFreq:int;
      
      public var mTimer:int;
      
      public var mNum:int;
      
      public var mSkullOverride:Vector.<Number>;
      
      public var mParTime:int;
      
      public var mLilyPadUpBitmap1:Bitmap;
      
      public var mLilyPadUpBitmap2:Bitmap;
      
      public var mCurFrogPoint:int;
      
      public function Level(app:Zuma2App)
      {
         this.mFrogX = new Array();
         this.mFrogY = new Array();
         this.mTreasurePoints = new Vector.<TreasurePoint>();
         this.mTunnelData = new Array();
         this.mTunnelImages = new Vector.<String>();
         this.mSkullOverride = new Vector.<Number>();
         this.mPowerupRegions = new Vector.<PowerupRegion>();
         super();
         this.mApp = app;
         this.mCurveMgr = new Array();
         this.mTimer = this.mTimeToComplete = -1;
         this.mPotPct = 1;
         this.mNumFrogPoints = 0;
         this.mCurFrogPoint = 0;
         this.mFireSpeed = 8;
         for(var i:int = 0; i < 4; i++)
         {
            this.mSkullOverride[i] = 0;
         }
         this.Reset();
      }
      
      public function ReInit() : void
      {
         var i:int = 0;
         for(i = 0; i < this.mNumCurves; i++)
         {
            this.mCurveMgr[i].SetFarthestBall(0);
         }
         this.mHaveReachedTarget = false;
         this.mAllCurvesAtRolloutPoint = false;
         this.mHasReachedCruisingSpeed = false;
         this.mPotPct = 1;
         this.mFurthestBallDistance = 0;
         this.Reset();
         for(i = 0; i < this.mNumCurves; i++)
         {
            this.mCurveMgr[i].Reset();
         }
      }
      
      public function UpdatePlaying() : void
      {
         var i:int = 0;
         var pct:int = 0;
         var tspeed:Boolean = this.mHasReachedCruisingSpeed;
         var was_at_rollout:Boolean = this.mAllCurvesAtRolloutPoint;
         this.mHasReachedCruisingSpeed = true;
         this.mAllCurvesAtRolloutPoint = true;
         var any_have_sparkles:Boolean = false;
         for(i = 0; i < this.mNumCurves; i++)
         {
            if(this.mCurveMgr[i].UpdatePlaying() && i + 1 < this.mNumCurves)
            {
               this.mCurveMgr[i + 1].mInitialPathHilite = true;
            }
            if(this.mCurveMgr[i].mSparkles.length > 0)
            {
               any_have_sparkles = true;
            }
            if(!this.mCurveMgr[i].HasReachedCruisingSpeed())
            {
               this.mHasReachedCruisingSpeed = false;
            }
            if(!this.mCurveMgr[i].HasReachedRolloutPoint())
            {
               this.mAllCurvesAtRolloutPoint = false;
            }
            if(this.mTempSpeedupTimer == 1)
            {
               this.mCurveMgr[i].mOverrideSpeed = -1;
            }
            pct = this.mCurveMgr[i].GetFarthestBallPercent();
            if(pct > this.mFurthestBallDistance)
            {
               this.mFurthestBallDistance = pct;
            }
         }
         if(!this.mApp.gAddBalls && !any_have_sparkles && !this.mBoard.mPreventBallAdvancement)
         {
            this.mApp.gAddBalls = true;
            for(i = 0; i < this.mNumCurves; i++)
            {
               this.mCurveMgr[i].mInitialPathHilite = false;
            }
         }
      }
      
      public function SetFrog(frog:Gun) : void
      {
         this.mFrog = frog;
      }
      
      public function BulletHit(b:Bullet) : void
      {
      }
      
      public function CanFireBall() : Boolean
      {
         var count:int = 0;
         for(var i:int = 0; i < this.mNumCurves; i++,count++)
         {
            if(!this.mCurveMgr[i].IsWinning())
            {
               break;
            }
         }
         if(count == this.mNumCurves)
         {
            return false;
         }
         return true;
      }
      
      public function Reset() : void
      {
         this.mHaveReachedTarget = false;
         this.mAllCurvesAtRolloutPoint = false;
         this.mHasReachedCruisingSpeed = false;
         this.mCurFrogPoint = 0;
         this.mFurthestBallDistance = 0;
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            this.mCurveMgr[i].Reset();
         }
      }
      
      public function DrawGunPoints() : void
      {
         if(this.mNumFrogPoints > 1)
         {
            if(this.mLilyPadBitmap == null || this.mLilyPadSprite == null || this.mLilyPadUpBitmap1 == null || this.mLilyPadUpBitmap2 == null)
            {
               this.mLilyPadUpBitmap1 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP));
               this.mLilyPadUpBitmap2 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP));
               this.mLilyPadUpBitmap1.x = this.mFrogX[0] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap1.width / 2;
               this.mLilyPadUpBitmap1.y = this.mFrogY[0] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap1.height / 2;
               this.mLilyPadUpBitmap2.x = this.mFrogX[1] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap2.width / 2;
               this.mLilyPadUpBitmap2.y = this.mFrogY[1] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap2.height / 2;
               this.mApp.mLayers[0].mBackground.addChild(this.mLilyPadUpBitmap2);
               this.mApp.mLayers[0].mBackground.addChild(this.mLilyPadUpBitmap1);
               this.mLilyPadBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER));
               this.mLilyPadBitmap.x = -this.mLilyPadBitmap.width / 2;
               this.mLilyPadBitmap.y = -this.mLilyPadBitmap.height / 2;
               this.mLilyPadSprite = new Sprite();
               this.mLilyPadSprite.addChild(this.mLilyPadBitmap);
               this.mApp.mLayers[2].mBackground.addChild(this.mLilyPadSprite);
            }
            if(this.mLilyPadUpBitmap1 != null && this.mLilyPadUpBitmap1.stage == null)
            {
               this.mApp.mLayers[0].mBackground.addChild(this.mLilyPadUpBitmap1);
            }
            if(this.mLilyPadUpBitmap2 != null && this.mLilyPadUpBitmap2.stage == null)
            {
               this.mApp.mLayers[0].mBackground.addChild(this.mLilyPadUpBitmap2);
            }
            if(this.mBoard.mMouseOverGunPos == -1)
            {
               this.mLilyPadSprite.visible = false;
            }
            else
            {
               this.mApp.mLayers[2].mBackground.addChild(this.mLilyPadSprite);
               this.mLilyPadSprite.x = this.mFrogX[this.mBoard.mMouseOverGunPos] * Zuma2App.SHRINK_PERCENT;
               this.mLilyPadSprite.y = this.mFrogY[this.mBoard.mMouseOverGunPos] * Zuma2App.SHRINK_PERCENT;
               this.mLilyPadSprite.visible = true;
            }
         }
      }
      
      public function SkipInitialPathHilite() : void
      {
         var j:int = 0;
         var had_any:Boolean = false;
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            if(this.mCurveMgr[i].mSparkles.length > 0 || this.mCurveMgr[i].mInitialPathHilite)
            {
               had_any = true;
               for(j = 0; j < this.mCurveMgr[i].mSparkles.length; j++)
               {
                  this.mCurveMgr[i].mSparkles[j].Delete();
               }
               this.mCurveMgr[i].mSparkles = new Vector.<PathSparkle>();
               this.mCurveMgr[i].mInitialPathHilite = false;
            }
         }
         if(had_any)
         {
            this.mApp.gAddBalls = true;
            this.mApp.soundManager.stopAll();
         }
      }
      
      public function CurvesAtRest() : Boolean
      {
         if(this.mBoard.HasFiredBullets() || this.mBoard.GetGun().IsFiring())
         {
            return false;
         }
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            if(!this.mCurveMgr[i].AtRest())
            {
               return false;
            }
         }
         return true;
      }
      
      public function CheckFruitActivation(curve_num:int) : Boolean
      {
         var cstart:int = 0;
         var cend:int = 0;
         var ball_pct:int = 0;
         var i:int = 0;
         var tp:TreasurePoint = null;
         if(this.mBoard.mPreventBallAdvancement || this.mBoard.HasAchievedZuma())
         {
            return false;
         }
         var freq:int = this.mTreasureFreq;
         if(!this.mApp.gForceFruit)
         {
            if(this.mBoard.mCurTreasure != null || int(Math.random() * freq) != 0)
            {
               return false;
            }
         }
         var treasure_pts:Vector.<int> = new Vector.<int>();
         if(curve_num == -1)
         {
            cstart = 0;
            cend = this.mNumCurves;
         }
         else
         {
            cstart = cend = curve_num;
         }
         for(var cnum:int = cstart; cnum < cend; cnum++)
         {
            ball_pct = this.mCurveMgr[cnum].GetFarthestBallPercent();
            for(i = 0; i < this.mTreasurePoints.length; i++)
            {
               tp = this.mTreasurePoints[i];
               if(tp.mCurveDist[cnum] > 0 && ball_pct >= tp.mCurveDist[cnum])
               {
                  treasure_pts.push(i);
               }
            }
         }
         if(treasure_pts.length == 0)
         {
            return false;
         }
         var idx:int = Math.random() * treasure_pts.length;
         this.mBoard.mCurTreasureNum = treasure_pts[idx];
         this.mBoard.mCurTreasure = this.mTreasurePoints[treasure_pts[idx]];
         this.mBoard.mCurTreasure.x = this.mTreasurePoints[treasure_pts[idx]].x;
         this.mBoard.mCurTreasure.y = this.mTreasurePoints[treasure_pts[idx]].y;
         this.mBoard.mMinTreasureY = this.mBoard.mMaxTreasureY = Number.MAX_VALUE;
         return true;
      }
      
      public function GetFarthestBallPercent(farthest_curve:int = 0, ignore_gaps:Boolean = false) : int
      {
         var tmp:int = 0;
         var p:int = 0;
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            tmp = this.mCurveMgr[i].GetFarthestBallPercent(ignore_gaps);
            if(tmp > p)
            {
               if(farthest_curve != 0)
               {
                  farthest_curve = i;
               }
               p = tmp;
            }
         }
         return p;
      }
      
      public function Draw(canvas:Canvas) : void
      {
         this.mHoleMgr.Draw(canvas);
      }
      
      public function StartLevel() : void
      {
         var j:int = 0;
         this.mHoleMgr = new HoleMgr(this.mApp);
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            this.mCurveMgr[i].mBoard = this.mBoard;
            this.mCurveMgr[i].LoadCurve();
            this.mCurveMgr[i].StartLevel();
            if(i == 0)
            {
               this.mCurveMgr[i].mInitialPathHilite = true;
            }
         }
         for(i = 0; i < this.mHoleMgr.mHoles.length; i++)
         {
            for(j = 0; j < 4; j++)
            {
               if(this.mHoleMgr.mHoles[i].mCurveNum == j)
               {
                  if(this.mSkullOverride[j] != 0)
                  {
                     this.mHoleMgr.mHoles[i].SetRotation(this.mSkullOverride[j]);
                  }
                  break;
               }
            }
         }
         this.SetupHiddenHoles();
         this.mApp.gAddBalls = false;
      }
      
      public function GetRandomFrogBulletColor(max_curve_colors:int, color_num:int) : Number
      {
         return 1 / Number(max_curve_colors);
      }
      
      public function GetPowerIncPct() : int
      {
         return 0;
      }
      
      public function GetBallAtXY(x:int, y:int) : Ball
      {
         var anItr:DListIterator = null;
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            anItr = this.mCurveMgr[i].mBallList.getListIterator();
            anItr.start();
            while(anItr.valid())
            {
               if(anItr.data.Contains(x,y))
               {
                  return anItr.data;
               }
               anItr.forth();
            }
         }
         return null;
      }
      
      public function DoingInitialPathHilite() : Boolean
      {
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            if(this.mCurveMgr[i].mInitialPathHilite)
            {
               return true;
            }
         }
         return false;
      }
      
      public function EndLevel() : void
      {
         if(this.mHoleMgr != null)
         {
            this.mHoleMgr.Delete();
         }
         for(var i:int = 0; i < this.mCurveMgr.length; i++)
         {
            this.mCurveMgr[i].mWarningLights = null;
         }
      }
      
      public function SetupHiddenHoles() : void
      {
         var h:Hole = null;
         var vis_h:Hole = null;
         var vis_idx:int = 0;
         var invis_rect:Rectangle = null;
         var vis_rect:Rectangle = null;
         if(this.mHoleMgr.mNumHoles < 2)
         {
            return;
         }
         var idx:int = 0;
         while((h = this.mHoleMgr.mHoles[idx]) != null)
         {
            if(!h.mVisible)
            {
               vis_idx = 0;
               invis_rect = new Rectangle(h.mX,h.mY,65,65);
               invis_rect.inflate(-4,-4);
               while((vis_h = this.mHoleMgr.mHoles[vis_idx]) != null)
               {
                  if(!vis_h.mVisible)
                  {
                     vis_idx++;
                  }
                  else
                  {
                     vis_rect = new Rectangle(vis_h.mX,vis_h.mY,65,65);
                     vis_rect.inflate(-4,-4);
                     if(vis_rect.intersects(invis_rect))
                     {
                        h.mShared.push(vis_idx);
                     }
                     vis_idx++;
                  }
               }
            }
            idx++;
         }
      }
      
      public function GetRandomPendingBallColor(max_curve_colors:int) : int
      {
         return int(Math.random() * max_curve_colors);
      }
      
      public function HasPowerup(p:int) : Boolean
      {
         for(var i:int = 0; i < this.mNumCurves; i++)
         {
            if(this.mCurveMgr[i].HasPowerup(p))
            {
               return true;
            }
         }
         return false;
      }
      
      public function GetBarPercent() : Number
      {
         return Number(this.mCurBarSize) / Number(this.mTargetBarSize);
      }
      
      public function AllowPointsFromBalls() : Boolean
      {
         return true;
      }
      
      public function CanAdvanceBalls() : Boolean
      {
         return true;
      }
      
      public function GetGunPointFromPos(x:int, y:int) : int
      {
         var dx:int = 0;
         var dy:int = 0;
         for(var i:int = 0; i < this.mNumFrogPoints; i++)
         {
            dx = x - this.mFrogX[i];
            dy = y - this.mFrogY[i];
            if(dx * dx + dy * dy < 56 * 56)
            {
               return i;
            }
         }
         return -1;
      }
      
      public function UpdateZumaProgress() : void
      {
         var i:int = 0;
         if(!this.mHaveReachedTarget && !this.mBoard.GauntletMode() && this.mBoard.mScore >= this.mBoard.mScoreTarget)
         {
            this.mHaveReachedTarget = true;
            for(i = 0; i < this.mNumCurves; i++)
            {
               this.mCurveMgr[i].ZumaAchieved(true);
            }
         }
      }
      
      public function Update(f:Number) : void
      {
         this.mUpdateCount++;
         if(this.mTimer > 0)
         {
            this.mTimer--;
         }
         this.mHoleMgr.Update();
      }
   }
}
