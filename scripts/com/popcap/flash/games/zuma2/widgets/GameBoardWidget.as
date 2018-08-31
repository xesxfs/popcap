package com.popcap.flash.games.zuma2.widgets
{
   import com.popcap.flash.framework.Canvas;
   import com.popcap.flash.framework.resources.images.ImageInst;
   import com.popcap.flash.framework.widgets.Widget;
   import com.popcap.flash.framework.widgets.WidgetContainer;
   import com.popcap.flash.games.zuma2.logic.Ball;
   import com.popcap.flash.games.zuma2.logic.Bouncy;
   import com.popcap.flash.games.zuma2.logic.Bullet;
   import com.popcap.flash.games.zuma2.logic.CurveMgr;
   import com.popcap.flash.games.zuma2.logic.DeathSkull;
   import com.popcap.flash.games.zuma2.logic.EndLevelExplosion;
   import com.popcap.flash.games.zuma2.logic.GameStats;
   import com.popcap.flash.games.zuma2.logic.Gun;
   import com.popcap.flash.games.zuma2.logic.Hole;
   import com.popcap.flash.games.zuma2.logic.Level;
   import com.popcap.flash.games.zuma2.logic.OptionsMenu;
   import com.popcap.flash.games.zuma2.logic.PathSparkle;
   import com.popcap.flash.games.zuma2.logic.PowerEffect;
   import com.popcap.flash.games.zuma2.logic.PowerType;
   import com.popcap.flash.games.zuma2.logic.QRand;
   import com.popcap.flash.games.zuma2.logic.RollerScore;
   import com.popcap.flash.games.zuma2.logic.ScoreBlip;
   import com.popcap.flash.games.zuma2.logic.SexyVector3;
   import com.popcap.flash.games.zuma2.logic.StatsScreen;
   import com.popcap.flash.games.zuma2.logic.TimerBar;
   import com.popcap.flash.games.zuma2.logic.TreasurePoint;
   import com.popcap.flash.games.zuma2.logic.Upsell;
   import com.popcap.flash.games.zuma2.logic.Zuma2Images;
   import com.popcap.flash.games.zuma2.logic.Zuma2Sounds;
   import com.popcap.flash.games.zuma2.logic.ZumaBar;
   import de.polygonal.ds.DLinkedList;
   import de.polygonal.ds.DListIterator;
   import flash.display.Bitmap;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class GameBoardWidget extends WidgetContainer implements Widget
   {
      
      public static const GameState_BeatLevelBonus:int = 6;
      
      public static const GameState_LevelBegin:int = 5;
      
      public static const GameState_Stats:int = 8;
      
      public static const GameState_TimeUp:int = 7;
      
      public static const TREASURE_LIFE:int = 1000;
      
      public static const GameState_Playing:int = 1;
      
      public static const PROXIMITY_BOMB_RADIUS:int = 56;
      
      public static const GameState_BossDead:int = 4;
      
      public static const GameState_Losing:int = 2;
      
      public static const GameState_None:int = 0;
      
      public static const GameState_LevelUp:int = 3;
       
      
      public var mDoGuide:Boolean;
      
      public var mAccuracyBackupCount:int;
      
      public var mShowGuide:Boolean;
      
      public var mTreasureAccel:Number = 0;
      
      public var aCenter:SexyVector3;
      
      public var mRollerScore:RollerScore;
      
      public var mScoreTarget:int;
      
      public var mTimerBar:TimerBar;
      
      public var mLastBallClickTick:int;
      
      public var mScore:int;
      
      public var mRecalcGuide:Boolean;
      
      public var mAccuracyCount:int = 0;
      
      public var mFruitGlowBitmap:Bitmap;
      
      public var mStatScreen:StatsScreen;
      
      public var mBambooTopBitmap:Bitmap;
      
      public var mGuideSprite:Sprite;
      
      public var mTimeUpTextField:TextField;
      
      public var mZumaBar:ZumaBar;
      
      public var mNumClearsInARow:int;
      
      public var mBambooOpening:Boolean;
      
      public var mCurTreasure:TreasurePoint;
      
      public var mMinTreasureY:Number = 0;
      
      public var mGauntletMode:Boolean;
      
      public var mTreasureCel:int;
      
      public var mLastExplosionTick:int;
      
      public var mDisplayingStats:Boolean;
      
      private var mApp:Zuma2App;
      
      public var mLevelStarting:Boolean;
      
      public var mTimeUpTextFormat:TextFormat;
      
      public var gDrawGuideFrame:int = -1;
      
      public var mScoreBlips:Vector.<ScoreBlip>;
      
      public var mOptionsMenu:OptionsMenu;
      
      public var mSpaceBarDown:Boolean = false;
      
      public var mPauseOverlay:Sprite;
      
      public var mBackgroundBitmap:Bitmap;
      
      public var mLazerGuideCenter:SexyVector3;
      
      public var mLastSmallExplosionTick:int;
      
      public var mGuide:Vector.<Number>;
      
      public var mClickToContinueTextField:TextField;
      
      public var mCurComboScore:int;
      
      public var mLives:int;
      
      private var mBulletListIterator:DListIterator;
      
      public var v1:SexyVector3;
      
      public var mBestTimesOn:Boolean;
      
      public var mLevelsFrame:Bitmap;
      
      public var g1:SexyVector3;
      
      public var g2:SexyVector3;
      
      public var mRollingInDangerZone:Boolean;
      
      public var mClearCurvePoints:int;
      
      public var mFullScreenBlack:Sprite;
      
      public var mRecalcLazerGuide:Boolean;
      
      public var mUpsellLevelCount:int;
      
      public var gPt1:Point;
      
      public var gPt2:Point;
      
      public var mTreasureStarAngle:Number = 0;
      
      public var mLastMouseX:Number;
      
      public var mLastMouseY:Number;
      
      public var mTreasureYBob:Number = 0;
      
      public var mWasPerfectLevel:Boolean;
      
      public var mBambooWait:int;
      
      public var mLivesText:TextField;
      
      public var mLevelText:TextField;
      
      public var mLevelNum:int;
      
      public var mLivesFrame:Bitmap;
      
      public var mTreasureGlowAlpha:int;
      
      public var mNumDeathsCurLevel:int = 0;
      
      public var guide_center:SexyVector3;
      
      public var mChuteBitmap:Vector.<Bitmap>;
      
      private var mIsInited:Boolean = false;
      
      private var mBulletList:DLinkedList;
      
      public var mWidget:GameWidget;
      
      public var mMenuBarBitmap:Bitmap;
      
      public var mLevel:Level;
      
      public var mCurComboCount:int;
      
      public var aGuide:SexyVector3;
      
      public var mNeedComboCount:DLinkedList;
      
      public var mBallColorMap:Array;
      
      public var mGuideBall:Ball;
      
      public var mBambooBottomSprite:Sprite;
      
      public var mOverMenuButton:Boolean;
      
      public var mPreventBallAdvancement:Boolean;
      
      public var mUpsell:Upsell;
      
      public var mMouseOverGunPos:int = -1;
      
      public var mHasDoneIntroSounds:Boolean;
      
      public var l1:SexyVector3;
      
      public var mTreasureWasHit:Boolean;
      
      public var mStateCount:int;
      
      public var mFruitSprite:Sprite;
      
      public var l2:SexyVector3;
      
      public var mTreasureStarAlpha:int;
      
      public var mPowerEffects:Vector.<PowerEffect>;
      
      public var mLazerGuide:Array;
      
      public var mLivesFrog:Bitmap;
      
      public var mAdventureMode:Boolean;
      
      public var mTreasureGlowAlphaRate:int;
      
      public var mLazerHitTreasure:Boolean;
      
      public var mFruitBounceEffect:Bouncy;
      
      public var mBestTimesDebug:TextField;
      
      public var mLevelBeginning:Boolean;
      
      public var mBombExplosionSprite:Sprite;
      
      public var mNumCleared:int = 0;
      
      public var mEndLevelExplosions:Vector.<EndLevelExplosion>;
      
      public var mDeathSkull:DeathSkull;
      
      public var mMaxTreasureY:Number = 0;
      
      public var mBambooBottomBitmap:Bitmap;
      
      public var gCenter:Point;
      
      public var mGuideT:Number;
      
      public var gNewStyleBallChooser:Boolean = true;
      
      public var mGuideLines:Vector.<int>;
      
      public var mFrog:Gun;
      
      public var mTreasureEndFrame:int;
      
      public var mFruitBitmap:Bitmap;
      
      public var mFruitGlowSprite:Sprite;
      
      public var mBambooClosing:Boolean;
      
      public var mCurInARowBonus:int;
      
      public var mMenuButton:SimpleButton;
      
      public var mIgnoreCount:int;
      
      public var p3:SexyVector3;
      
      public var mGuideCenter:SexyVector3;
      
      public var mLevelStats:GameStats;
      
      public var mQRand:QRand;
      
      public var mCurTreasureNum:int;
      
      public var mBambooTopSprite:Sprite;
      
      public var mGameState:int;
      
      public var mFruitGlow:Bitmap;
      
      public var mBombExplosionImage:ImageInst;
      
      public var mPointsLeftForExtraLife:int;
      
      public var mGameStats:GameStats;
      
      public var mTunnels:Array;
      
      public var mFruitGlowImage:ImageInst;
      
      public var mTreasureDefaultVY:Number = 0;
      
      public var mUpdateCnt:int;
      
      public var mFruitImage:ImageInst;
      
      public var mBombExplosionBitmap:Bitmap;
      
      public var mLevelBeginScore:int;
      
      public var mPaused:Boolean;
      
      public var mTreasureVY:Number = 0;
      
      public function GameBoardWidget(app:Zuma2App)
      {
         this.mBallColorMap = new Array();
         this.mChuteBitmap = new Vector.<Bitmap>();
         this.mTunnels = new Array();
         this.mPowerEffects = new Vector.<PowerEffect>();
         this.mScoreBlips = new Vector.<ScoreBlip>();
         this.mGuide = new Vector.<Number>();
         this.mLazerGuide = new Array();
         this.mGuideLines = new Vector.<int>();
         this.mNeedComboCount = new DLinkedList();
         this.aCenter = new SexyVector3(0,0,0);
         this.g1 = new SexyVector3(0,0,0);
         this.g2 = new SexyVector3(0,0,0);
         this.v1 = new SexyVector3(0,0,0);
         this.l1 = new SexyVector3(0,0,0);
         this.l2 = new SexyVector3(0,0,0);
         this.p3 = new SexyVector3(0,0,0);
         this.aGuide = new SexyVector3(0,0,0);
         this.guide_center = new SexyVector3(0,0,0);
         this.mEndLevelExplosions = new Vector.<EndLevelExplosion>();
         super();
         this.mApp = app;
         this.mApp.RegisterCommand("RedBall",this.RedBall);
         this.mApp.RegisterCommand("YellowBall",this.YellowBall);
         this.mApp.RegisterCommand("GreenBall",this.GreenBall);
         this.mApp.RegisterCommand("BlueBall",this.BlueBall);
         this.mApp.RegisterCommand("PurpleBall",this.PurpleBall);
         this.mApp.RegisterCommand("WhiteBall",this.WhiteBall);
         this.mApp.RegisterCommand("Bomb",this.Bomb);
         this.mApp.RegisterCommand("Stop",this.Stop);
         this.mApp.RegisterCommand("Reverse",this.Reverse);
         this.mApp.RegisterCommand("Cannon",this.Cannon);
         this.mApp.RegisterCommand("PauseBalls",this.PauseBalls);
         this.mApp.RegisterCommand("ForceFruit",this.ForceFruit);
         this.mApp.RegisterCommand("DeleteBall",this.DeleteBall);
         this.mApp.RegisterCommand("ForceTimeUp",this.ForceTimeUp);
         this.mApp.RegisterCommand("ForwardLevel",this.ForwardLevel);
         this.mApp.RegisterCommand("BackwardLevel",this.BackwardLevel);
         this.mApp.RegisterCommand("ToggleFPS",this.ToggleFPS);
         this.mApp.RegisterCommand("ShowStatsScreen",this.ShowStatsScreen);
         this.mApp.RegisterCommand("FillZumaBar",this.FillZumaBar);
         this.mApp.RegisterCommand("GivePoints",this.GivePoints);
         this.mApp.RegisterCommand("BestTimes",this.BestTimes);
         this.mBestTimesOn = false;
         this.mApp.stage.addEventListener(FocusEvent.FOCUS_OUT,this.handleLostFocus);
         this.mApp.stage.addEventListener(FocusEvent.FOCUS_IN,this.handleGotFocus);
         this.mApp.stage.focus = this.mApp.stage;
      }
      
      public function PurpleBall(args:Array = null) : void
      {
         this.ChangeBallColor(Zuma2App.Purple_Ball);
      }
      
      public function handleGotFocus(e:FocusEvent) : void
      {
      }
      
      public function ForceFruit(args:Array = null) : void
      {
         this.mApp.gForceFruit = !this.mApp.gForceFruit;
      }
      
      public function RedBall(args:Array = null) : void
      {
         this.ChangeBallColor(Zuma2App.Red_Ball);
      }
      
      public function HideBalls(hide:Boolean) : void
      {
         for(var i:int = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].HideBalls(hide);
         }
      }
      
      public function PauseBalls(args:Array = null) : void
      {
         this.mApp.gUpdateBalls = !this.mApp.gUpdateBalls;
      }
      
      override public function contains(x:Number, y:Number) : Boolean
      {
         if(x > 0 && x < 540 && y > 0 && y < 405)
         {
            return true;
         }
         return false;
      }
      
      public function UpdateBombExplosion() : void
      {
         if(this.mBombExplosionImage == null)
         {
            return;
         }
         if(this.mUpdateCnt % 3 == 0)
         {
            this.mBombExplosionImage.mFrame++;
            if(this.mBombExplosionImage.mFrame >= 28)
            {
               if(this.mBombExplosionSprite.parent != null)
               {
                  this.mBombExplosionSprite.parent.removeChild(this.mBombExplosionSprite);
                  return;
               }
            }
            if(this.mBombExplosionImage.mFrame <= 29)
            {
               this.mBombExplosionBitmap.bitmapData = this.mBombExplosionImage.pixels;
            }
         }
      }
      
      public function handleMenuButtonOver(e:MouseEvent) : void
      {
         this.mOverMenuButton = true;
      }
      
      public function DrawGuide() : void
      {
         var anAlpha:int = 0;
         var aColor:uint = 0;
         var aDarkColor:uint = 0;
         var t:int = 0;
         if(this.mFrog.GetBullet() == null || this.mAccuracyCount <= 0 || this.IsPaused())
         {
            this.mGuideSprite.visible = false;
            return;
         }
         this.mGuideSprite.visible = true;
         this.gDrawGuideFrame = this.mUpdateCnt;
         if(this.mShowGuide || this.mApp.gSuckMode || this.mAccuracyCount > 0)
         {
            anAlpha = 128;
            if(this.mAccuracyCount >= 0 && this.mAccuracyCount <= 300)
            {
               anAlpha = 120 * this.mAccuracyCount / 300 + 8;
            }
            if(this.mApp.gSuckMode)
            {
               anAlpha = 128;
            }
            aColor = 65535;
            aDarkColor = 16777215;
            if(this.mFrog.GetBullet() != null)
            {
               t = this.mFrog.GetBullet().GetColorType();
               aColor = this.mApp.gBrightBallColors[t];
               aDarkColor = this.mApp.gDarkBallColors[t];
            }
            this.mGuideSprite.graphics.clear();
            this.mGuideSprite.alpha = anAlpha / 255;
            this.mGuideSprite.graphics.lineStyle(5,aDarkColor,1);
            this.mGuideSprite.graphics.beginFill(aColor,1);
            this.mGuideSprite.graphics.moveTo(this.mGuide[6],this.mGuide[7]);
            this.mGuideSprite.graphics.drawPath(this.mGuideLines,this.mGuide,"nonZero");
            this.mGuideSprite.graphics.endFill();
         }
      }
      
      public function DrawTreasure() : void
      {
         var x:int = 0;
         var y:int = 0;
         var xoff:int = 0;
         var yoff:int = 0;
         var pct:Number = NaN;
         var c:ColorTransform = null;
         if(this.IsPaused())
         {
            return;
         }
         if(this.mCurTreasure != null)
         {
            x = this.mCurTreasure.x * Zuma2App.SHRINK_PERCENT;
            y = this.mCurTreasure.y * Zuma2App.SHRINK_PERCENT;
            xoff = 15;
            yoff = 15;
            pct = this.mFruitBounceEffect.GetPct();
            c = !!this.mTreasureWasHit?new ColorTransform(1,1,1,1,255,0,0):new ColorTransform(1,1,1,1,255,255,255);
            c.alphaOffset = this.mTreasureStarAlpha;
            if(c.alphaOffset != 255)
            {
               this.mFruitGlow.transform.colorTransform = c;
            }
            this.mFruitGlowSprite.x = x + xoff;
            this.mFruitGlowSprite.y = y + yoff + this.mTreasureYBob;
            this.mFruitGlowSprite.rotation = this.mTreasureStarAngle * Zuma2App.RAD_TO_DEG;
            this.mFruitImage.mFrame = this.mTreasureCel;
            this.mFruitBitmap.bitmapData = this.mFruitImage.pixels;
            this.mFruitGlowBitmap.bitmapData = this.mFruitImage.pixels;
            this.mFruitSprite.x = x + xoff;
            this.mFruitSprite.y = y + this.mTreasureYBob + yoff;
            if(!this.mTreasureWasHit)
            {
               if(this.mTreasureGlowAlpha != 0 && this.mFruitGlow != null)
               {
                  this.mFruitGlowBitmap.alpha = this.mTreasureGlowAlpha / 255;
               }
            }
            this.mFruitGlow.visible = true;
            this.mFruitSprite.visible = true;
            this.mFruitGlowSprite.visible = true;
         }
      }
      
      public function ClearAll() : void
      {
         for(var i:int = 0; i < this.mApp.mLayers.length; i++)
         {
            this.mApp.mLayers[i].Clear();
         }
      }
      
      public function Stop(args:Array = null) : void
      {
         var ball:Ball = this.mLevel.GetBallAtXY(this.mLastMouseX / Zuma2App.SHRINK_PERCENT,this.mLastMouseY / Zuma2App.SHRINK_PERCENT);
         if(ball == null)
         {
            return;
         }
         ball.SetPowerType(PowerType.PowerType_SlowDown,true);
      }
      
      public function GetGun() : Gun
      {
         return this.mFrog;
      }
      
      public function AddFiredBullet(aBullet:Bullet) : void
      {
         this.mBulletList.append(aBullet);
      }
      
      public function FillZumaBar(args:Array = null) : void
      {
         this.mScore = this.mScore + this.mScoreTarget;
         this.mRollerScore.ForceScore(this.mRollerScore.GetTargetScore());
         this.mZumaBar.mZumaCurrent = this.mScoreTarget;
      }
      
      public function AddProxBombExplosion(x:Number, y:Number) : void
      {
         this.mBombExplosionImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_EXPLOSION_BOMB);
         this.mBombExplosionImage.mFrame = 0;
         this.mBombExplosionBitmap = new Bitmap(this.mBombExplosionImage.pixels,PixelSnapping.NEVER,true);
         this.mBombExplosionBitmap.x = -this.mBombExplosionBitmap.width / 2;
         this.mBombExplosionBitmap.y = -this.mBombExplosionBitmap.height / 2;
         this.mBombExplosionSprite.x = x * Zuma2App.SHRINK_PERCENT;
         this.mBombExplosionSprite.y = y * Zuma2App.SHRINK_PERCENT;
         this.mBombExplosionSprite.addChild(this.mBombExplosionBitmap);
         this.mApp.mLayers[2].mForeground.addChild(this.mBombExplosionSprite);
      }
      
      public function DeleteBall(args:Array = null) : void
      {
         var ball:Ball = this.mLevel.GetBallAtXY(this.mLastMouseX / Zuma2App.SHRINK_PERCENT,this.mLastMouseY / Zuma2App.SHRINK_PERCENT);
         if(ball == null)
         {
            return;
         }
         ball.Explode(false,false);
      }
      
      public function GetCurComboScore() : int
      {
         return this.mCurComboScore;
      }
      
      public function IncNumCleared(val:int) : void
      {
         this.mNumCleared = this.mNumCleared + val;
      }
      
      public function StartLevel(level_num:int) : void
      {
         var i:int = 0;
         this.mApp.mAdAPI.ResumeBroadcast();
         this.mClearCurvePoints = 0;
         this.mWasPerfectLevel = true;
         this.mLevelText.text = "Level " + String(this.mLevelNum + 1);
         this.ToggleLives(true);
         this.ToggleLevel(true);
         this.mApp.mLayers[4].mForeground.addChild(this.mLivesFrame);
         this.mApp.mLayers[4].mForeground.addChild(this.mLivesText);
         this.mApp.mLayers[4].mForeground.addChild(this.mLevelText);
         this.mApp.mLayers[4].mForeground.addChild(this.mLivesFrog);
         this.mApp.mLayers[4].mBackground.addChild(this.mLevelsFrame);
         this.mApp.mLayers[1].mForeground.addChild(this.mFruitGlowSprite);
         this.mApp.mLayers[1].mForeground.addChild(this.mFruitSprite);
         this.mApp.mLayers[1].mForeground.addChild(this.mGuideSprite);
         this.mDisplayingStats = false;
         this.mBambooClosing = false;
         this.mBambooOpening = false;
         this.mBambooWait = 0;
         if(this.mLevel != null)
         {
            this.mLevel.ReInit();
         }
         this.mQRand.Clear();
         if(this.mPowerEffects.length > 0)
         {
            for(i = 0; i < this.mPowerEffects.length; i++)
            {
               this.mPowerEffects[i] = null;
            }
         }
         this.mLevelNum = level_num;
         if(this.mLevel != null)
         {
            this.mLevel.EndLevel();
         }
         this.mLevel = this.mApp.mLevelMgr.GetLevelByIndex(level_num);
         this.mLevel.mBoard = this;
         this.mLevel.mApp = this.mApp;
         this.SetupTunnels(this.mLevel);
         this.mLazerHitTreasure = false;
         if(this.mBackgroundBitmap != null)
         {
            if(this.mBackgroundBitmap.parent != null)
            {
               this.mBackgroundBitmap.parent.removeChild(this.mBackgroundBitmap);
            }
         }
         this.mBackgroundBitmap = new Bitmap(this.mApp.imageManager.getBitmapData("IMAGE_BACKGROUND_" + this.mLevel.mBackgroundImage.toUpperCase()));
         this.mApp.mLayers[0].mBackground.addChild(this.mBackgroundBitmap);
         for(i = 0; i < this.mTunnels.length; i++)
         {
            this.mChuteBitmap[i] = new Bitmap(this.mApp.imageManager.getBitmapData("IMAGE_BACKGROUND_" + this.mTunnels[i].mTunnelImage.toUpperCase()));
            this.mChuteBitmap[i].x = this.mTunnels[i].mX;
            this.mChuteBitmap[i].y = this.mTunnels[i].mY;
            this.mApp.mLayers[1].mBackground.addChild(this.mChuteBitmap[i]);
         }
         if(this.mMenuBarBitmap != null)
         {
            if(this.mMenuBarBitmap.parent != null)
            {
               this.mMenuBarBitmap.parent.removeChild(this.mMenuBarBitmap);
            }
         }
         this.mMenuBarBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_BAR));
         this.mApp.mLayers[3].mForeground.addChild(this.mMenuBarBitmap);
         var upImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_INGAME_MENUBUTTON_UP));
         var downImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_INGAME_MENUBUTTON_DOWN));
         var overImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_INGAME_MENUBUTTON_OVER));
         this.mMenuButton = new SimpleButton(upImage,overImage,downImage,downImage);
         this.mMenuButton.x = 450;
         this.mMenuButton.y = 0;
         this.mMenuButton.addEventListener(MouseEvent.CLICK,this.handleMenuButtonClick);
         this.mMenuButton.addEventListener(MouseEvent.ROLL_OVER,this.handleMenuButtonOver);
         this.mMenuButton.addEventListener(MouseEvent.ROLL_OUT,this.handleMenuButtonOut);
         this.mApp.mLayers[4].mBalls.addChild(this.mMenuButton);
         this.mFrog.mX = this.mLevel.mFrogX[0];
         this.mFrog.mY = this.mLevel.mFrogY[0];
         this.mFrog.mCenterX = this.mLevel.mFrogX[0];
         this.mFrog.mCenterY = this.mLevel.mFrogY[0];
         this.mFrog.LevelReset();
         this.mLevel.StartLevel();
         this.mLevelBeginning = true;
         var aMaxTargetScore:int = 0;
         for(i = 0; i < this.mLevel.mNumCurves; i++)
         {
            if(this.mLevel.mCurveMgr[i].mCurveDesc.mVals.mScoreTarget > aMaxTargetScore)
            {
               aMaxTargetScore = this.mLevel.mCurveMgr[i].mCurveDesc.mVals.mScoreTarget;
            }
            if(this.mApp.gSuckMode)
            {
               this.mLevel.mCurveMgr[i].mCurveDesc.mVals.mPowerUpFreq[PowerType.PowerType_Accuracy] = 0;
            }
         }
         if(this.GauntletMode())
         {
            this.mScoreTarget = int.MAX_VALUE;
         }
         else if(aMaxTargetScore > 0)
         {
            this.mScoreTarget = this.mScore + aMaxTargetScore;
         }
         else
         {
            this.mScoreTarget = 0;
         }
         this.mZumaBar.mZumaGoal = aMaxTargetScore;
         this.mZumaBar.mZumaCurrent = 0;
         this.mZumaBar.Draw();
         this.UpdateGunPos(true);
      }
      
      public function GetNumLives() : int
      {
         return this.mLives;
      }
      
      public function DoClearCurveBonus(curve_num:int) : void
      {
         var pts:int = 2000 * (this.mLevelNum / 4 + 1);
         this.IncScore(pts,false,false);
         this.AddText("CURVE CLEARED \r+" + pts + "\rEXTRA LIFE!",this.mFrog.GetCenterX(),this.mFrog.GetCenterY(),Zuma2App.White_Ball);
         this.mLives++;
         if(this.mLives > 10)
         {
            this.mLives = 10;
         }
         this.mLivesText.text = "X " + String(this.mLives - 1);
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_EXTRALIFE);
      }
      
      public function HasFiredBullets() : Boolean
      {
         return this.mBulletList.size > 0;
      }
      
      public function ToggleLevel(on:Boolean) : void
      {
         this.mLevelsFrame.visible = on;
         this.mLevelText.visible = on;
         if(this.mTimeUpTextField != null)
         {
            this.mTimeUpTextField.visible = on;
         }
      }
      
      public function HasAchievedZuma() : Boolean
      {
         return this.mScore >= this.mScoreTarget;
      }
      
      public function GetAceTimeBonus() : int
      {
         if(this.mLevelStats.mTimePlayed > this.mLevel.mParTime + 99)
         {
            return 0;
         }
         var bonus:int = (1 - this.mLevelStats.mTimePlayed / this.mLevel.mParTime) * 25000;
         bonus = int(bonus / 100) * 100;
         bonus = bonus + 100;
         if(bonus < 100)
         {
            bonus = 100;
         }
         return bonus;
      }
      
      public function ShowStatsScreen(args:Array = null) : void
      {
         this.mStatScreen = new StatsScreen(this.mApp,this,88,88,88,88,18000,15200,50000,11300,1000,50000,999999,20);
      }
      
      public function AdvanceFreeBullet(aBulletItr:DListIterator) : void
      {
         var i:int = 0;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var r:Number = NaN;
         var aRand:int = 0;
         var aNewBall:Ball = null;
         var aBullet:Bullet = aBulletItr.data;
         for(var j:int = 0; j < 2; )
         {
            if(aBullet.GetJustFired())
            {
               aBullet.SetJustFired(false);
            }
            else
            {
               if(j != 0)
               {
                  aBullet.Update(1);
               }
               addr340:
               j++;
               continue;
            }
            if(this.mCurTreasure != null && !this.mTreasureWasHit)
            {
               dx = aBullet.GetX() - this.mCurTreasure.x - 15;
               dy = aBullet.GetY() - this.mCurTreasure.y - 15;
               r = aBullet.GetRadius() + this.mFruitImage.height / 2 / Zuma2App.SHRINK_PERCENT;
               if(dx * dx + dy * dy < r * r)
               {
                  this.DoHitTreasure();
                  this.mLevel.BulletHit(aBullet);
                  if(!aBullet.GetIsCannon())
                  {
                     aBullet.Delete();
                     this.mBulletList.remove(aBulletItr);
                     return;
                  }
               }
            }
            for(i = 0; i < this.mLevel.mNumCurves; i++)
            {
               if(this.mLevel.mCurveMgr[i].CheckCollision(aBullet))
               {
                  this.mLevel.BulletHit(aBullet);
                  if(!aBullet.GetIsCannon())
                  {
                     this.mBulletList.remove(aBulletItr);
                     return;
                  }
                  break;
               }
            }
            for(i = 0; i < this.mLevel.mNumCurves; i++)
            {
               this.mLevel.mCurveMgr[i].CheckGapShot(aBullet);
            }
            if(aBullet.GetX() < -80 || aBullet.GetX() > 880 || aBullet.GetY() < -80 || aBullet.GetY() > 680)
            {
               if(!aBullet.GetIsCannon())
               {
                  this.ResetInARowBonus();
               }
               if(this.mApp.gSuckMode && !aBullet.GetIsCannon())
               {
                  if(this.mLevel.mHaveReachedTarget && this.mLevel.mNumCurves > 0)
                  {
                     aRand = int(Math.random() * this.mLevel.mNumCurves);
                     aNewBall = new Ball(this.mApp);
                     aNewBall.SetColorType(aBullet.GetColorType());
                     aNewBall.SetPowerType(aBullet.GetPowerType());
                     aNewBall.SetSpeedy(true);
                     this.mLevel.mCurveMgr[aRand].AddPendingBall(aNewBall);
                  }
               }
               this.mLevelStats.mNumMisses++;
               aBullet.Delete();
               this.mBulletList.remove(aBulletItr);
               return;
            }
            this.mBallColorMap[aBullet.GetColorType()]++;
            §§goto(addr340);
         }
         aBulletItr.forth();
      }
      
      public function GetPerfectBonus(zone_override:int = -1, level_override:int = -1) : int
      {
         if(level_override == -1)
         {
            level_override = this.mLevelNum;
         }
         if(level_override <= 20 && this.mWasPerfectLevel)
         {
            return 1000 * (this.mLevelNum / 4 + 1);
         }
         return 0;
      }
      
      public function CheckReload() : void
      {
         var aColor:int = 0;
         var aBullet:Bullet = null;
         var aPower:int = 0;
         if(this.mApp.gSuckMode)
         {
            aBullet = this.mFrog.GetBullet();
            if(aBullet != null)
            {
               this.mBallColorMap[aBullet.GetColorType()]++;
            }
            aBullet = this.mFrog.GetNextBullet();
            if(aBullet != null)
            {
               this.mBallColorMap[aBullet.GetColorType()]++;
            }
            return;
         }
         if(this.mFrog.GetBullet() != null && this.mBallColorMap[this.mFrog.GetBullet().GetColorType()] <= 0 && this.mLevel.mNumCurves > 0)
         {
            aColor = this.GetGoodBallColor();
            if(aColor == -1)
            {
               return;
            }
            this.mFrog.SetBulletType(aColor);
         }
         if(this.mFrog.GetNextBullet() != null && this.mBallColorMap[this.mFrog.GetNextBullet().GetColorType()] <= 0 && this.mLevel.mNumCurves > 0)
         {
            aColor = this.GetGoodBallColor();
            if(aColor == -1)
            {
               return;
            }
            this.mFrog.SetNextBulletType(aColor);
         }
         var delay:Boolean = true;
         while(this.mFrog.NeedsReload())
         {
            aColor = this.GetGoodBallColor();
            if(aColor == -1)
            {
               return;
            }
            aPower = PowerType.PowerType_None;
            this.mFrog.Reload(aColor,delay,aPower);
         }
      }
      
      public function GetNumClearsInARow() : int
      {
         return this.mNumClearsInARow;
      }
      
      public function DrawText() : void
      {
         for(var i:int = 0; i < this.mScoreBlips.length; i++)
         {
            this.mScoreBlips[i].Draw();
         }
      }
      
      public function YellowBall(args:Array = null) : void
      {
         this.ChangeBallColor(Zuma2App.Yellow_Ball);
      }
      
      public function ChangeBallColor(color:int) : void
      {
         var ball:Ball = this.mLevel.GetBallAtXY(this.mLastMouseX / Zuma2App.SHRINK_PERCENT,this.mLastMouseY / Zuma2App.SHRINK_PERCENT);
         if(ball == null)
         {
            return;
         }
         ball.SetColorType(color);
      }
      
      public function UpdateTreasure() : void
      {
         if(this.mCurTreasure != null)
         {
            if(this.mStateCount >= this.mTreasureEndFrame)
            {
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_FRUIT_DISAPPEARS);
               this.mCurTreasure = null;
               this.mCurTreasureNum = 0;
               this.mFruitGlowSprite.visible = false;
               this.mFruitSprite.visible = false;
               return;
            }
         }
         var freq:int = this.mLevel.mTreasureFreq;
         if(this.mApp.gForceFruit || this.mCurTreasure == null && this.mStateCount - this.mTreasureEndFrame > freq)
         {
            if(this.mLevel.CheckFruitActivation(-1))
            {
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_FRUIT_APPEARS);
               this.mTreasureEndFrame = this.mStateCount + TREASURE_LIFE;
               this.mTreasureStarAlpha = 255;
               this.mTreasureGlowAlpha = 0;
               this.mTreasureGlowAlphaRate = 12;
               this.mTreasureWasHit = false;
               this.mTreasureVY = this.mTreasureDefaultVY = 0.25;
               this.mMinTreasureY = this.mMaxTreasureY = Number.MAX_VALUE;
               this.mTreasureYBob = 0;
               this.mTreasureAccel = -0.01;
               this.mFruitBounceEffect.Reset();
            }
            this.mApp.gForceFruit = false;
         }
      }
      
      override public function onKeyUp(keyCode:int) : void
      {
         if(keyCode == 32 && this.mFrog != null)
         {
            this.mSpaceBarDown = false;
         }
      }
      
      public function UpdateTimeUp() : void
      {
         this.UpdateText();
         this.mTimeUpTextField.x = this.mTimeUpTextField.x + 10;
         this.mRollerScore.Update();
         if(this.mTimeUpTextField.x >= 190)
         {
            this.mTimeUpTextField.x = 190;
         }
         if(this.mStateCount == 250)
         {
            this.DisplayStats();
         }
         this.UpdateGunPos();
         this.mFrog.update();
      }
      
      public function UpdateBullets() : void
      {
         var aBulletItr:DListIterator = this.mBulletList.getListIterator();
         aBulletItr.start();
         while(aBulletItr.valid())
         {
            this.AdvanceFreeBullet(aBulletItr);
         }
      }
      
      public function Bomb(args:Array = null) : void
      {
         var ball:Ball = this.mLevel.GetBallAtXY(this.mLastMouseX / Zuma2App.SHRINK_PERCENT,this.mLastMouseY / Zuma2App.SHRINK_PERCENT);
         if(ball == null)
         {
            return;
         }
         ball.SetPowerType(PowerType.PowerType_ProximityBomb,true);
      }
      
      public function Reverse(args:Array = null) : void
      {
         var ball:Ball = this.mLevel.GetBallAtXY(this.mLastMouseX / Zuma2App.SHRINK_PERCENT,this.mLastMouseY / Zuma2App.SHRINK_PERCENT);
         if(ball == null)
         {
            return;
         }
         ball.SetPowerType(PowerType.PowerType_MoveBackwards,true);
      }
      
      public function DoAccuracy(accuracy:Boolean) : void
      {
         this.mDoGuide = this.mShowGuide = this.mRecalcLazerGuide = this.mRecalcGuide = accuracy;
         if(accuracy)
         {
            if(this.mAccuracyBackupCount > 0)
            {
               this.mAccuracyBackupCount = this.mAccuracyCount;
            }
            this.mGuideSprite.visible = true;
            this.mAccuracyCount = 2000;
            this.mFrog.SetFireSpeed(19);
         }
         else
         {
            if(this.mGuideBall != null)
            {
               this.mGuideBall.mHilightPulse = false;
            }
            this.mGuideSprite.visible = false;
            this.mGuideBall = null;
            this.mAccuracyCount = 0;
            if(this.mLevel != null)
            {
               this.mFrog.SetFireSpeed(this.mLevel.mFireSpeed);
            }
         }
      }
      
      public function SetRollingInDangerZone() : void
      {
         this.mRollingInDangerZone = true;
      }
      
      override public function update() : void
      {
         var i:int = 0;
         if(!this.mIsInited)
         {
            this.init();
         }
         if(this.mPaused)
         {
            return;
         }
         this.mUpdateCnt++;
         this.mStateCount++;
         if(this.mLevel.DoingInitialPathHilite())
         {
            this.mIgnoreCount++;
         }
         switch(this.mGameState)
         {
            case GameState_Playing:
               this.UpdatePlaying();
               break;
            case GameState_Losing:
               this.UpdateLosing();
               break;
            case GameState_TimeUp:
               this.UpdateTimeUp();
               break;
            case GameState_BeatLevelBonus:
               this.UpdateBeatLevelBonus();
         }
         for(i = 0; i < this.mPowerEffects.length; i++)
         {
            this.mPowerEffects[i].Update();
            if(this.mPowerEffects[i].IsDone())
            {
               this.mPowerEffects[i].Delete();
               this.mPowerEffects.splice(i,1);
               i--;
            }
         }
         if(this.mDoGuide || this.mAccuracyCount > 0 || this.mApp.gSuckMode)
         {
            if(this.mDoGuide || this.mApp.gSuckMode || this.mAccuracyCount > 0)
            {
               this.UpdateGuide(false);
            }
         }
         else
         {
            this.mGuideBall = null;
         }
      }
      
      override public function onKeyDown(keyCode:int) : void
      {
         if(keyCode == 32 && this.mFrog != null && !this.mSpaceBarDown && !this.mPaused)
         {
            this.mSpaceBarDown = true;
            this.mFrog.SwapBullets();
         }
      }
      
      public function ToggleFPS(args:Array = null) : void
      {
         this.mApp.fpsMon.visible = !this.mApp.fpsMon.visible;
      }
      
      public function handleLostFocus(e:FocusEvent) : void
      {
         this.mApp.stage.focus = this.mApp.stage;
      }
      
      public function UpdateLosing() : void
      {
         this.mLevel.mHoleMgr.Update();
         this.UpdateText();
         this.mRollerScore.Update();
         var can_restart:Boolean = true;
         for(var i:int = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].UpdateLosing();
            if(!this.mLevel.mCurveMgr[i].CanRestart())
            {
               can_restart = false;
            }
         }
         if(this.mDeathSkull != null && can_restart)
         {
            this.mDeathSkull.Update();
            if(this.mDeathSkull.mDone)
            {
               this.mFrog.SetPos(this.mLevel.mFrogX[this.mLevel.mCurFrogPoint],this.mLevel.mFrogY[this.mLevel.mCurFrogPoint]);
               this.mDeathSkull.Delete();
               this.mDeathSkull = null;
            }
         }
         this.UpdateGunPos();
         if(can_restart && !this.mDisplayingStats && this.mDeathSkull == null && this.mStateCount > 150)
         {
            this.RestartLevel();
            this.mLives--;
            this.mLivesText.text = "X " + String(this.mLives - 1);
            if(this.mLives <= 0)
            {
               if(this.mApp.mAdAPI._isEnabled)
               {
                  this.mApp.mAdAPI.SetScore(this.mScore);
                  this.mApp.mAdAPI.ScoreSubmit();
                  this.mApp.mAdAPI.GameEnd();
               }
               this.CheckNewHighScore();
               this.KillMenuButton();
               this.mApp.soundManager.stopAll();
               if(!this.mApp.mMoreGames)
               {
                  this.mApp.widgets.game.ShowHighScore();
               }
               else
               {
                  this.mApp.widgets.game.ShowMainMenu();
               }
            }
         }
      }
      
      public function GetStateCount() : int
      {
         return this.mStateCount;
      }
      
      public function IncCurComboScore(val:int) : void
      {
         this.mCurComboScore = this.mCurComboScore + val;
      }
      
      public function UpdateTreasureAnim() : void
      {
         if(this.mStateCount == this.mTreasureEndFrame - 200)
         {
            this.mTreasureGlowAlphaRate = this.mTreasureGlowAlphaRate * 4;
         }
         this.mTreasureStarAngle = this.mTreasureStarAngle + 0.01;
         if(this.mUpdateCnt % 3 == 0)
         {
            this.mTreasureCel = (this.mTreasureCel + 1) % (6 * 10);
         }
         if(this.mTreasureWasHit)
         {
            if(this.mTreasureStarAlpha > 0)
            {
               this.mTreasureStarAlpha = this.mTreasureStarAlpha - 8;
               if(this.mTreasureStarAlpha < 0)
               {
                  this.mTreasureStarAlpha = 0;
               }
            }
            this.mTreasureGlowAlpha = this.mTreasureGlowAlpha + this.mTreasureGlowAlphaRate;
            if(this.mTreasureGlowAlphaRate > 0 && this.mTreasureGlowAlpha >= 255)
            {
               this.mTreasureGlowAlpha = 255;
               this.mTreasureGlowAlphaRate = this.mTreasureGlowAlphaRate * -1;
            }
            else if(this.mTreasureGlowAlphaRate < 0 && this.mTreasureGlowAlpha <= 0)
            {
               this.mTreasureGlowAlphaRate = this.mTreasureGlowAlpha = 0;
            }
            this.mCurTreasure = null;
            this.mCurTreasureNum = 0;
            this.mFruitGlowSprite.visible = false;
            this.mFruitSprite.visible = false;
         }
         else
         {
            this.mTreasureVY = this.mTreasureVY + this.mTreasureAccel;
            if(this.mTreasureAccel < 0 && this.mTreasureVY <= -this.mTreasureDefaultVY)
            {
               this.mTreasureAccel = this.mTreasureAccel * -1;
               if(Math.abs(this.mMinTreasureY - Number.MAX_VALUE) <= 1)
               {
                  this.mMinTreasureY = this.mTreasureYBob;
               }
               else
               {
                  this.mTreasureYBob = this.mMinTreasureY;
               }
            }
            else if(this.mTreasureAccel > 0 && this.mTreasureVY > this.mTreasureDefaultVY)
            {
               this.mTreasureAccel = this.mTreasureAccel * -1;
               if(Math.abs(this.mMaxTreasureY - Number.MAX_VALUE) <= 1)
               {
                  this.mMaxTreasureY = this.mTreasureYBob;
               }
               else
               {
                  this.mTreasureYBob = this.mMaxTreasureY;
               }
            }
            this.mTreasureYBob = this.mTreasureYBob + this.mTreasureVY;
            this.mTreasureGlowAlpha = this.mTreasureGlowAlpha + this.mTreasureGlowAlphaRate;
            if(this.mTreasureGlowAlphaRate > 0 && this.mTreasureGlowAlpha >= 255)
            {
               this.mTreasureGlowAlpha = 255;
               this.mTreasureGlowAlphaRate = this.mTreasureGlowAlphaRate * -1;
            }
            else if(this.mTreasureGlowAlphaRate < 0 && this.mTreasureGlowAlpha <= 0)
            {
               this.mTreasureGlowAlphaRate = this.mTreasureGlowAlphaRate * -1;
               this.mTreasureGlowAlpha = 0;
            }
         }
      }
      
      public function SetPause(pause:Boolean) : void
      {
         this.mPaused = pause;
         if(this.mPaused)
         {
            this.mApp.soundManager.pauseAll();
            this.mPauseOverlay = new Sprite();
            this.mPauseOverlay.graphics.clear();
            this.mPauseOverlay.graphics.beginFill(0,0.5);
            this.mPauseOverlay.graphics.drawRect(0,0,540,405);
            this.mPauseOverlay.graphics.endFill();
            this.mApp.mLayers[4].mBackground.addChild(this.mPauseOverlay);
            this.HideBalls(true);
            this.mApp.mAdAPI.PauseBroadcast();
         }
         else
         {
            this.mApp.soundManager.resumeAll();
            if(this.mPauseOverlay.parent != null)
            {
               this.mPauseOverlay.parent.removeChild(this.mPauseOverlay);
               this.mPauseOverlay.graphics.clear();
               this.mPauseOverlay = null;
            }
            this.HideBalls(false);
            this.mApp.mAdAPI.ResumeBroadcast();
         }
      }
      
      public function handleMenuButtonOut(e:MouseEvent) : void
      {
         this.mOverMenuButton = false;
      }
      
      public function OpenMenu() : void
      {
         this.mMenuButton.enabled = false;
         this.SetPause(true);
         this.mOptionsMenu = new OptionsMenu(this.mApp,this);
      }
      
      public function UpdateTrackBPM(death_dist:int, danger_range:int) : void
      {
      }
      
      override public function onMouseMove(x:Number, y:Number) : void
      {
         var aGunPoint:int = 0;
         this.mLastMouseX = x;
         this.mLastMouseY = y;
         if(this.mPaused)
         {
            return;
         }
         if(this.mFrog == null)
         {
            return;
         }
         var aPrevDestAngle:Number = this.mFrog.GetDestAngle();
         var aPrevAngle:Number = this.mFrog.GetAngle();
         this.UpdateGunPos();
         if(aPrevDestAngle >= Zuma2App.MY_PI)
         {
            aPrevDestAngle = aPrevDestAngle - Zuma2App.MY_PI * 2;
         }
         if(this.mFrog.mDestAngle >= Zuma2App.MY_PI)
         {
            this.mFrog.mDestAngle = this.mFrog.mDestAngle - Zuma2App.MY_PI * 2;
         }
         if(aPrevDestAngle < -Zuma2App.MY_PI && this.mFrog.GetDestAngle() > Zuma2App.MY_PI)
         {
            this.mFrog.mDestAngle = this.mFrog.mDestAngle - 3.14159 * 2;
         }
         else if(aPrevDestAngle > Zuma2App.MY_PI && this.mFrog.GetDestAngle() < -Zuma2App.MY_PI)
         {
            this.mFrog.mDestAngle = this.mFrog.mDestAngle + 3.14159 * 2;
         }
         this.mFrog.mAngle = aPrevAngle;
         this.mMouseOverGunPos = -1;
         if(this.mLevel.mNumFrogPoints > 1 && this.mGameState == GameState_Playing)
         {
            aGunPoint = this.mLevel.GetGunPointFromPos(x / Zuma2App.SHRINK_PERCENT,y / Zuma2App.SHRINK_PERCENT);
            if(aGunPoint >= 0 && aGunPoint != this.mLevel.mCurFrogPoint)
            {
               this.mMouseOverGunPos = aGunPoint;
            }
         }
      }
      
      public function UpdateBeatLevelBonus() : void
      {
         var i:int = 0;
         var e:EndLevelExplosion = null;
         var pts:int = 0;
         this.UpdateText();
         this.mTimeUpTextField.x = this.mTimeUpTextField.x + 10;
         this.mRollerScore.Update();
         this.UpdateBombExplosion();
         if(this.mTimeUpTextField.x >= 85)
         {
            this.mTimeUpTextField.x = 85;
         }
         this.UpdateGunPos();
         this.mFrog.update();
         if(this.mEndLevelExplosions.length > 0)
         {
            for(i = 0; i < this.mEndLevelExplosions.length; i++)
            {
               e = this.mEndLevelExplosions[i];
               if(e.mDelay > 0)
               {
                  e.mDelay--;
                  if(e.mDelay == 0)
                  {
                     pts = 100;
                     this.IncScore(pts,false);
                     this.mRollerScore.ForceScore(this.mRollerScore.GetTargetScore());
                     this.AddText("+" + pts,e.mX,e.mY,Zuma2App.White_Ball);
                     if(e.mPlaySound)
                     {
                        this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_END_LEVEL_EXPLOSION);
                     }
                  }
               }
               else
               {
                  e.Update();
                  if(!e.IsActive())
                  {
                     e.Delete();
                     this.mEndLevelExplosions.splice(i,1);
                     i--;
                  }
               }
            }
         }
         if(this.mEndLevelExplosions.length == 0 && !this.mBambooOpening && !this.mBambooClosing)
         {
            this.CueLevelTransition();
         }
         if(this.mBambooClosing)
         {
            this.mBambooBottomSprite.y = this.mBambooBottomSprite.y - 4;
            if(this.mBambooBottomSprite.y <= 186)
            {
               this.mBambooBottomSprite.y = 186;
            }
            this.mBambooTopSprite.y = this.mBambooTopSprite.y + 7;
            if(this.mBambooTopSprite.y >= 0)
            {
               this.mBambooTopSprite.y = 0;
            }
            this.mFullScreenBlack.alpha = this.mFullScreenBlack.alpha + 0.05;
            if(this.mFullScreenBlack.alpha >= 1)
            {
               this.mFullScreenBlack.alpha = 1;
            }
            if(this.mBambooBottomSprite.y <= 186 && this.mBambooTopSprite.y >= 0)
            {
               this.mBambooClosing = false;
               this.mBambooOpening = true;
               this.mBambooWait = 200;
            }
         }
         if(this.mBambooWait > 0)
         {
            this.mBambooWait--;
            return;
         }
         if(this.mBambooOpening)
         {
            if(!this.mDisplayingStats)
            {
               this.DisplayStats();
            }
            this.mBambooBottomSprite.y = this.mBambooBottomSprite.y + 4;
            if(this.mBambooBottomSprite.y >= 406)
            {
               this.mBambooBottomSprite.y = 406;
               if(this.mBambooBottomSprite.parent != null)
               {
                  this.mBambooBottomSprite.parent.removeChild(this.mBambooBottomSprite);
               }
            }
            this.mBambooTopSprite.y = this.mBambooTopSprite.y - 7;
            if(this.mBambooTopSprite.y <= -379)
            {
               this.mBambooTopSprite.y = -379;
               if(this.mBambooTopSprite.parent != null)
               {
                  this.mBambooTopSprite.parent.removeChild(this.mBambooTopSprite);
               }
            }
            if(this.mFullScreenBlack != null)
            {
               this.mFullScreenBlack.alpha = this.mFullScreenBlack.alpha - 0.01;
               if(this.mFullScreenBlack.alpha <= 0 && this.mFullScreenBlack.parent != null)
               {
                  this.mFullScreenBlack.parent.removeChild(this.mFullScreenBlack);
                  this.mFullScreenBlack = null;
               }
            }
         }
      }
      
      public function ForceTimeUp(args:Array = null) : void
      {
         if(this.mGauntletMode)
         {
            this.SetTimeUp();
         }
      }
      
      public function IncNumClearsInARow(val:int) : void
      {
         this.mNumClearsInARow = this.mNumClearsInARow + val;
         if(this.mNumClearsInARow > 1)
         {
         }
      }
      
      public function UpdatePlaying() : void
      {
         var stillStarting:Boolean = false;
         var i:int = 0;
         this.ResetBallColorMap();
         var aBullet:Bullet = null;
         while((aBullet = this.mFrog.GetFiredBullet()) != null)
         {
            this.AddFiredBullet(aBullet);
         }
         this.mFrog.update();
         this.UpdateBullets();
         if(this.mLevelBeginning)
         {
            stillStarting = false;
            for(i = 0; i < this.mLevel.mNumCurves; i++)
            {
               if(!this.mLevel.mCurveMgr[i].HasReachedCruisingSpeed())
               {
                  stillStarting = true;
               }
            }
            if(!stillStarting || this.mStateCount > 500)
            {
               this.mLevelBeginning = false;
            }
         }
         if(this.mApp.gUpdateBalls)
         {
            this.mLevel.UpdatePlaying();
         }
         this.mLevel.Update(1);
         this.CheckEndConditions();
         this.CheckReload();
         if(this.mBombExplosionSprite.parent != null)
         {
            this.UpdateBombExplosion();
         }
         this.UpdateText();
         if(!this.mLevel.DoingInitialPathHilite() && this.mGameState == GameState_Playing)
         {
            if(this.mGauntletMode)
            {
               this.mTimerBar.Update();
               if(this.mTimerBar.mTimerNumber == 0 && this.mLevel.CurvesAtRest())
               {
                  this.SetTimeUp();
               }
            }
            else
            {
               this.mZumaBar.Update();
            }
         }
         this.mRollerScore.Update();
         if(this.mAccuracyCount > 0)
         {
            if(this.mGameState == GameState_Losing)
            {
               this.mAccuracyCount = this.mAccuracyCount - 3;
            }
            else if(this.mAccuracyBackupCount == 0)
            {
               this.mAccuracyCount--;
            }
            else
            {
               this.mAccuracyCount = this.mAccuracyCount - 2;
            }
            if(this.mAccuracyCount <= 0)
            {
               this.DoAccuracy(false);
            }
         }
         if(!this.mHasDoneIntroSounds)
         {
            if(!this.mLevel.DoingInitialPathHilite() && this.mGameState != GameState_Losing)
            {
               this.mHasDoneIntroSounds = true;
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BALLS_ROLLING);
            }
         }
         this.UpdateTreasureAnim();
         this.UpdateTreasure();
         this.mFruitBounceEffect.Update();
         this.mLevel.UpdateZumaProgress();
      }
      
      public function GetTickCount() : int
      {
         return this.GetStateCount() * 10;
      }
      
      public function GetGoodBallColor() : int
      {
         var i:int = 0;
         var needs_reset:Boolean = false;
         var v:Vector.<Number> = null;
         var b:Bullet = null;
         var aColorMap:Array = new Array();
         var aNumColors:int = 0;
         var only_one:Boolean = true;
         var has_any:Boolean = false;
         for(i = 0; i < 6; i++)
         {
            if(this.mBallColorMap[i] > 0)
            {
               aColorMap[_loc9_] = i;
               if(has_any && this.mBallColorMap[i] >= 1)
               {
                  only_one = false;
               }
               if(this.mBallColorMap[i] >= 1)
               {
                  has_any = true;
               }
            }
         }
         if(aNumColors > 0)
         {
            needs_reset = false;
            v = new Vector.<Number>();
            for(i = 0; i < 6; i++)
            {
               if(this.mBallColorMap[i] > 0)
               {
                  v.push(this.mLevel.GetRandomFrogBulletColor(aNumColors,i));
               }
               else
               {
                  v.push(0);
               }
               if(this.mBallColorMap[i] > 0 && !this.mQRand.HasWeight(i) || this.mBallColorMap[i] == 0 && this.mQRand.HasWeight(i))
               {
                  needs_reset = true;
               }
            }
            if(needs_reset)
            {
               this.mQRand.Clear();
               this.mQRand.SetWeights(v);
            }
         }
         if(this.mLevel.mNumCurves == 0 || only_one && !this.mLevel.DoingInitialPathHilite() && this.mScore == this.mLevelBeginScore)
         {
            b = this.mFrog.GetBullet();
            if(b == null)
            {
               b = this.mFrog.GetNextBullet();
            }
            if(b != null)
            {
               return b.GetColorType();
            }
            return Math.random() * 4;
         }
         if(aNumColors <= 0)
         {
            return -1;
         }
         if(this.gNewStyleBallChooser)
         {
            return this.mQRand.Next();
         }
         return aColorMap[Math.random() * aNumColors];
      }
      
      public function SetCurComboScore(val:int) : void
      {
         this.mCurComboScore = val;
      }
      
      private function init() : void
      {
         var i:int = 0;
         this.mWasPerfectLevel = true;
         this.mNumDeathsCurLevel = 0;
         this.mIgnoreCount = 0;
         this.mScore = 0;
         this.mLevelNum = 0;
         this.mUpsellLevelCount = 0;
         this.mLevelBeginScore = 0;
         this.mClearCurvePoints = 0;
         this.mLives = 3;
         this.mPointsLeftForExtraLife = this.mApp.mLevelMgr.mPointsForLife;
         this.mGameStats = new GameStats();
         this.mLevelStats = new GameStats();
         this.mLevelStats.Reset();
         this.mApp.mAdAPI.SetScore(this.mScore);
         this.mApp.mAdAPI.ResumeBroadcast();
         this.mDeathSkull = null;
         this.mPaused = false;
         if(this.mGauntletMode)
         {
            this.mTimerBar = new TimerBar(this.mApp);
            this.mTimerBar.Init();
         }
         else
         {
            this.mZumaBar = new ZumaBar(this.mApp);
            this.mZumaBar.Init();
         }
         this.mRollerScore = new RollerScore(this.mApp,false);
         this.mQRand = new QRand();
         for(i = 0; i < 6; i++)
         {
            this.mBallColorMap[i] = 0;
         }
         for(i = 0; i < 4; i++)
         {
         }
         this.mHasDoneIntroSounds = false;
         this.mLastBallClickTick = 0;
         this.mLastExplosionTick = 0;
         this.mLastSmallExplosionTick = 0;
         this.mTreasureStarAngle = 0;
         this.mFruitBounceEffect = new Bouncy();
         this.mFruitBounceEffect.SetTargetPercents(0.5,1.2,1);
         this.mFruitBounceEffect.SetRate(0.15);
         this.mFruitBounceEffect.SetNumBounces(6);
         this.mFruitBounceEffect.SetPct(0,true);
         this.mFruitBounceEffect.SetRateDivFactor(1.25);
         this.mFruitGlowSprite = new Sprite();
         this.mFruitGlow = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_FRUIT_GLOW),PixelSnapping.NEVER,true);
         this.mFruitGlow.blendMode = BlendMode.ADD;
         this.mFruitGlow.x = -this.mFruitGlow.width / 2;
         this.mFruitGlow.y = -this.mFruitGlow.height / 2;
         this.mFruitGlow.visible = false;
         this.mFruitGlowSprite.addChild(this.mFruitGlow);
         this.mFruitGlowImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_FRUIT_ACORN_GLOW);
         this.mFruitGlowImage.mFrame = 0;
         this.mFruitGlowBitmap = new Bitmap(this.mFruitGlowImage.pixels,PixelSnapping.NEVER,true);
         this.mFruitGlowBitmap.x = -this.mFruitGlowBitmap.width / 2;
         this.mFruitGlowBitmap.y = -this.mFruitGlowBitmap.height / 2;
         this.mFruitImage = this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_FRUIT_ACORN);
         this.mFruitImage.mFrame = 0;
         this.mFruitBitmap = new Bitmap(this.mFruitImage.pixels,PixelSnapping.NEVER,true);
         this.mFruitBitmap.x = -this.mFruitBitmap.width / 2;
         this.mFruitBitmap.y = -this.mFruitBitmap.height / 2;
         this.mFruitSprite = new Sprite();
         this.mFruitSprite.addChild(this.mFruitBitmap);
         this.mFruitSprite.addChild(this.mFruitGlowBitmap);
         this.mFruitSprite.visible = false;
         this.mApp.mLayers[1].mForeground.addChild(this.mFruitGlowSprite);
         this.mApp.mLayers[1].mForeground.addChild(this.mFruitSprite);
         this.mLivesText = new TextField();
         var aTimeUpTextFormat:TextFormat = new TextFormat();
         aTimeUpTextFormat.font = "TimerText";
         aTimeUpTextFormat.align = TextFormatAlign.CENTER;
         aTimeUpTextFormat.color = 16777215;
         aTimeUpTextFormat.size = 16;
         var aGlow:DropShadowFilter = new DropShadowFilter(2);
         aGlow.strength = 2;
         this.mLivesText = new TextField();
         this.mLivesText.embedFonts = true;
         this.mLivesText.defaultTextFormat = aTimeUpTextFormat;
         this.mLivesText.filters = [aGlow];
         this.mLivesText.textColor = 16777215;
         this.mLivesText.width = 50;
         this.mLivesText.height = 50;
         this.mLivesText.x = 6;
         this.mLivesText.y = 384;
         this.mLivesText.alpha = 1;
         this.mLivesText.selectable = false;
         this.mLivesText.multiline = true;
         this.mLivesText.wordWrap = true;
         this.mLivesText.text = "X" + String(this.mLives - 1);
         this.mLivesText.antiAliasType = AntiAliasType.ADVANCED;
         this.mApp.mLayers[4].mForeground.addChild(this.mLivesText);
         this.mLevelText = new TextField();
         this.mLevelText = new TextField();
         this.mLevelText.embedFonts = true;
         this.mLevelText.defaultTextFormat = aTimeUpTextFormat;
         this.mLevelText.filters = [aGlow];
         this.mLevelText.textColor = 16777215;
         this.mLevelText.width = 70;
         this.mLevelText.height = 50;
         this.mLevelText.x = 471;
         this.mLevelText.y = 384;
         this.mLevelText.alpha = 1;
         this.mLevelText.selectable = false;
         this.mLevelText.multiline = true;
         this.mLevelText.wordWrap = true;
         this.mLevelText.text = "Level " + String(this.mLevelNum + 1);
         this.mLevelText.antiAliasType = AntiAliasType.ADVANCED;
         this.mApp.mLayers[4].mForeground.addChild(this.mLevelText);
         this.mLivesFrame = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_LIVES_FRAME));
         this.mLivesFrame.x = 0;
         this.mLivesFrame.y = 405 - this.mLivesFrame.height;
         this.mApp.mLayers[4].mBackground.addChild(this.mLivesFrame);
         this.mLivesFrog = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_LIVES_FROG));
         this.mLivesFrog.x = -3;
         this.mLivesFrog.y = 381;
         this.mApp.mLayers[4].mForeground.addChild(this.mLivesFrog);
         this.mLevelsFrame = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_LEVELS_FRAME));
         this.mLevelsFrame.x = 540 - this.mLevelsFrame.width;
         this.mLevelsFrame.y = 405 - this.mLevelsFrame.height;
         this.mApp.mLayers[4].mBackground.addChild(this.mLevelsFrame);
         this.mGuideSprite = new Sprite();
         this.mGuideLines.push(2,2,2,2);
         this.mApp.mLayers[1].mForeground.addChild(this.mGuideSprite);
         this.mBombExplosionSprite = new Sprite();
         this.mIsInited = true;
         this.mAccuracyCount = 0;
         this.mFrog = new Gun(this.mApp,this);
         addChild(this.mFrog);
         this.mBulletList = new DLinkedList();
         this.mGameState = GameState_Playing;
         this.mApp.gUpdateBalls = true;
         this.StartLevel(this.mLevelNum);
      }
      
      public function ResetTunnels() : void
      {
         for(var i:int = 0; i < this.mChuteBitmap.length; i++)
         {
            if(this.mChuteBitmap[i].parent != null)
            {
               this.mChuteBitmap[i].parent.removeChild(this.mChuteBitmap[i]);
            }
         }
         this.mTunnels = new Array();
      }
      
      public function CheckIfGotExtraLife(theInc:int) : void
      {
         var p:int = 0;
         while(theInc > 0)
         {
            if(this.mPointsLeftForExtraLife - theInc <= 0)
            {
               p = this.mPointsLeftForExtraLife;
               this.mPointsLeftForExtraLife = this.mApp.mLevelMgr.mPointsForLife;
               theInc = theInc - p;
               this.mLives++;
               if(this.mLives > 10)
               {
                  this.mLives = 10;
               }
               this.mLivesText.text = "X " + String(this.mLives - 1);
               this.AddText("EXTRA LIFE!",this.mFrog.GetCenterX(),this.mFrog.GetCenterY(),Zuma2App.White_Ball);
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_EXTRALIFE);
            }
            else
            {
               this.mPointsLeftForExtraLife = this.mPointsLeftForExtraLife - theInc;
               theInc = 0;
            }
         }
      }
      
      public function IsPaused() : Boolean
      {
         return false;
      }
      
      public function GetNumCleared() : int
      {
         return this.mNumCleared;
      }
      
      public function SetTimeUp() : void
      {
         this.ResetInARowBonus();
         if(this.mScore > this.mApp.mHighScore)
         {
            this.mApp.mHighScore = this.mScore;
            this.mApp.mSharedObject.data.highscore = this.mScore;
            this.mApp.mSharedObject.flush();
         }
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_CHALLENGE_TIME_UP);
         this.mGameState = GameState_TimeUp;
         this.mStateCount = 0;
         this.mTimeUpTextField = new TextField();
         this.mTimeUpTextFormat = new TextFormat();
         this.mTimeUpTextFormat.font = "TimeUpText";
         this.mTimeUpTextFormat.align = TextFormatAlign.CENTER;
         this.mTimeUpTextFormat.color = 16777215;
         this.mTimeUpTextFormat.size = 55;
         var aGlow:DropShadowFilter = new DropShadowFilter();
         aGlow.strength = 50;
         this.mTimeUpTextField = new TextField();
         this.mTimeUpTextField.embedFonts = true;
         this.mTimeUpTextField.defaultTextFormat = this.mTimeUpTextFormat;
         this.mTimeUpTextField.filters = [aGlow];
         this.mTimeUpTextField.textColor = 16777215;
         this.mTimeUpTextField.width = 200;
         this.mTimeUpTextField.height = 100;
         this.mTimeUpTextField.x = -50;
         this.mTimeUpTextField.y = 100;
         this.mTimeUpTextField.alpha = 1;
         this.mTimeUpTextField.selectable = false;
         this.mTimeUpTextField.multiline = true;
         this.mTimeUpTextField.wordWrap = true;
         this.mTimeUpTextField.text = "TIME!";
         var aTextFormat:TextFormat = new TextFormat();
         aTextFormat.font = "TimeUpText";
         aTextFormat.align = TextFormatAlign.CENTER;
         aTextFormat.color = 16777215;
         aTextFormat.size = 24;
         this.mApp.mLayers[3].mForeground.addChild(this.mTimeUpTextField);
      }
      
      public function GetGameState() : int
      {
         return this.mGameState;
      }
      
      public function SetNumCleared(val:int) : void
      {
         this.mNumCleared = val;
      }
      
      public function ResetBallColorMap() : void
      {
         var i:int = 0;
         for(i = 0; i < 6; i++)
         {
            this.mBallColorMap[i] = 0;
         }
      }
      
      public function Reset() : void
      {
         var i:int = 0;
         this.ClearAll();
         if(this.mGauntletMode)
         {
            this.mTimerBar = new TimerBar(this.mApp);
            this.mTimerBar.Init();
         }
         else
         {
            this.mZumaBar = new ZumaBar(this.mApp);
            this.mZumaBar.Init();
         }
         this.mLevelStats.Reset();
         if(this.mTimeUpTextField != null)
         {
            if(this.mTimeUpTextField.parent != null)
            {
               this.mTimeUpTextField.parent.removeChild(this.mTimeUpTextField);
            }
         }
         this.mHasDoneIntroSounds = false;
         this.mTreasureCel = 0;
         this.mNumClearsInARow = this.mCurInARowBonus = this.mCurComboScore = this.mNumCleared = this.mCurComboCount = 0;
         this.mStateCount = 0;
         this.mIgnoreCount = 0;
         this.mScoreTarget = 0;
         this.mLastBallClickTick = 0;
         this.mLastExplosionTick = 0;
         this.mLastSmallExplosionTick = 0;
         this.mAccuracyCount = 0;
         this.mAccuracyBackupCount = 0;
         for(i = 0; i < 6; i++)
         {
            this.mBallColorMap[i] = 0;
         }
         for(i = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].mWayPointMgr.Delete();
         }
         this.ResetTunnels();
         this.DeleteBullets();
         this.DoAccuracy(false);
         this.mFrog.EmptyBullets();
         this.mRollerScore.Reload();
         this.mGameState = GameState_Playing;
         this.mStateCount = 0;
         this.mQRand = new QRand();
         this.mLevelBeginScore = this.mScore;
         this.mApp.gDieAtEnd = true;
         this.mApp.gSuckMode = false;
         this.mApp.gAddBalls = true;
         this.UpdateGunPos(true);
         this.mFruitGlow.visible = false;
         this.mFruitSprite.visible = false;
         this.mCurTreasure = null;
         this.mTreasureEndFrame = 0;
         this.mLastExplosionTick = 0;
      }
      
      public function Cannon(args:Array = null) : void
      {
         var ball:Ball = this.mLevel.GetBallAtXY(this.mLastMouseX / Zuma2App.SHRINK_PERCENT,this.mLastMouseY / Zuma2App.SHRINK_PERCENT);
         if(ball == null)
         {
            return;
         }
         ball.SetPowerType(PowerType.PowerType_Cannon,true);
      }
      
      override public function draw(canvas:Canvas) : void
      {
         var i:int = 0;
         if(!this.mIsInited)
         {
            return;
         }
         if(this.mPaused)
         {
            return;
         }
         if(this.mDeathSkull != null)
         {
            this.mDeathSkull.DrawAboveFrog();
         }
         if(this.mFrog != null)
         {
            this.mFrog.draw(canvas);
         }
         if(this.mDeathSkull != null)
         {
            this.mDeathSkull.DrawBelowFrog();
         }
         for(i = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mHoleMgr.Draw(canvas);
            this.mLevel.mCurveMgr[i].DrawSkullPath();
            this.mLevel.mCurveMgr[i].DrawMisc();
         }
         this.mBulletListIterator = this.mBulletList.getListIterator();
         this.mBulletListIterator.start();
         var aBullet:Bullet = this.mBulletListIterator.data;
         while(aBullet != null)
         {
            aBullet.Draw(canvas);
            aBullet = this.mBulletListIterator.next();
         }
         for(i = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].DrawBalls(canvas);
         }
         this.DrawTreasure();
         for(i = 0; i < this.mPowerEffects.length; i++)
         {
            this.mPowerEffects[i].Draw();
         }
         this.DrawText();
         if(!this.mLevel.DoingInitialPathHilite() && this.mGameState == GameState_Playing)
         {
            if(this.mGauntletMode)
            {
               this.mTimerBar.Draw();
            }
            else
            {
               this.mZumaBar.Draw();
            }
         }
         this.mRollerScore.Draw();
         this.DrawGuide();
         this.mLevel.DrawGunPoints();
      }
      
      public function handleMenuButtonClick(e:MouseEvent) : void
      {
         if(!this.mPaused)
         {
            this.OpenMenu();
         }
      }
      
      public function UpdateGunPos(level_begin:Boolean = false, _x:int = -1, _y:int = -1) : void
      {
         var aCurPoint:int = 0;
         if(level_begin)
         {
            aCurPoint = this.mLevel.mCurFrogPoint;
            this.mFrog.SetPos(this.mLevel.mFrogX[aCurPoint],this.mLevel.mFrogY[aCurPoint]);
         }
         var x:int = _x == -1?int(this.mLastMouseX / Zuma2App.SHRINK_PERCENT):int(_x);
         var y:int = _y == -1?int(this.mLastMouseY / Zuma2App.SHRINK_PERCENT):int(_y);
         var cx:int = this.mFrog.GetCenterX();
         var cy:int = this.mFrog.GetCenterY();
         var dx:int = x - cx;
         var dy:int = cy - y;
         var rad:Number = -Math.atan2(dy,dx);
         this.mFrog.SetDestAngle(rad);
      }
      
      public function BackwardLevel(args:Array = null) : void
      {
         if(this.mLevel.DoingInitialPathHilite())
         {
            this.mLevel.SkipInitialPathHilite();
         }
         this.mLevelNum--;
         if(this.mLevelNum < 0)
         {
            this.mLevelNum = 0;
         }
         this.ResetTunnels();
         for(var i:int = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].DeleteBalls();
         }
         this.mLevelText.text = "Level " + String(this.mLevelNum + 1);
         this.mLevelText.visible = true;
         this.RestartLevel();
      }
      
      public function AddText(text:String, x:Number, y:Number, color:uint, bulge_pct:Number = 1.0) : void
      {
         var count:int = 0;
         var diff:Number = NaN;
         var amt:Number = NaN;
         var t:Number = NaN;
         var rate:Number = NaN;
         var ballColor:uint = this.mApp.gBallColors[color];
         var aBlip:ScoreBlip = new ScoreBlip(this.mApp,text,x,y,ballColor);
         if(bulge_pct >= 1)
         {
            count = 2;
            if(bulge_pct > 1.51)
            {
               count++;
            }
            diff = 1;
            amt = diff / count;
            t = (6 * diff - amt * 6) / 0.1;
            diff = bulge_pct - 1;
            amt = diff / count;
            rate = (6 * diff - amt * 6) / t;
         }
         aBlip.Bulge(bulge_pct,rate,count);
         this.mScoreBlips.push(aBlip);
      }
      
      public function CheckNewHighScore(complete:Boolean = false) : void
      {
         var level:int = 0;
         for(var i:int = 0; i < this.mApp.mHighScores.length; i++)
         {
            if(this.mScore > this.mApp.mHighScores[i])
            {
               this.mApp.mHighScores.splice(i,0,this.mScore);
               level = this.mLevelNum + 1;
               if(level > 20)
               {
                  level = 20;
               }
               if(complete)
               {
                  level = 21;
               }
               this.mApp.mHighScoreLevels.splice(i,0,level);
               this.mApp.mHighScores.pop();
               this.mApp.mHighScoreLevels.pop();
               this.mApp.mNewHighScore = i;
               break;
            }
         }
         this.mApp.mSharedObject.data.highscores = this.mApp.mHighScores;
         this.mApp.mSharedObject.data.highscorelevels = this.mApp.mHighScoreLevels;
         this.mApp.mSharedObject.flush();
      }
      
      public function IncCurInARowBonus(val:int) : void
      {
         this.mCurInARowBonus = this.mCurInARowBonus + val;
      }
      
      public function PowerupToStr(t:int, all_caps:Boolean = true) : String
      {
         var str:String = null;
         switch(t)
         {
            case PowerType.PowerType_ProximityBomb:
               str = !!all_caps?"PROXIMITY BOMB":"Bomb";
               break;
            case PowerType.PowerType_SlowDown:
               str = !!all_caps?"SLOW":"Slow";
               break;
            case PowerType.PowerType_Accuracy:
               str = !!all_caps?"ACCURACY":"Accuracy";
               break;
            case PowerType.PowerType_MoveBackwards:
               str = !!all_caps?"REVERSE":"Reverse";
               break;
            case PowerType.PowerType_Cannon:
               str = !!all_caps?"TRI-SHOT":"Tri-Shot";
               break;
            case PowerType.PowerType_ColorNuke:
               str = !!all_caps?"LIGHTNING":"Lightning";
               break;
            case PowerType.PowerType_Laser:
               str = !!all_caps?"LASER":"Laser";
               break;
            case PowerType.PowerType_GauntletMultBall:
               str = !!all_caps?"BONUS BALL":"Bonus Ball";
         }
         return str;
      }
      
      public function RestartLevel() : void
      {
         if(this.mLevelNum >= 20)
         {
            this.CheckNewHighScore(true);
            this.KillMenuButton();
            this.ClearAll();
            this.mApp.soundManager.stopAll();
            if(!this.mApp.mMoreGames)
            {
               this.mApp.widgets.game.ShowHighScore();
            }
            else
            {
               this.mApp.widgets.game.ShowMainMenu();
            }
            return;
         }
         this.mApp.soundManager.stopAll();
         this.Reset();
         this.StartLevel(this.mLevelNum);
      }
      
      public function CueLevelTransition() : void
      {
         this.mBambooClosing = true;
         this.mBambooBottomBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_TRANSITION_BAMBOO_BOTTOM));
         this.mBambooBottomSprite = new Sprite();
         this.mBambooBottomSprite.x = 0;
         this.mBambooBottomSprite.y = 405;
         this.mBambooBottomSprite.addChild(this.mBambooBottomBitmap);
         this.mApp.mLayers[5].mForeground.addChild(this.mBambooBottomSprite);
         this.mBambooTopBitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_TRANSITION_BAMBOO_TOP));
         this.mBambooTopSprite = new Sprite();
         this.mBambooTopSprite.x = 0;
         this.mBambooTopSprite.y = -378;
         this.mBambooTopSprite.addChild(this.mBambooTopBitmap);
         this.mApp.mLayers[5].mForeground.addChild(this.mBambooTopSprite);
         this.mFullScreenBlack = new Sprite();
         this.mFullScreenBlack.graphics.beginFill(0,1);
         this.mFullScreenBlack.graphics.drawRect(0,0,540,405);
         this.mFullScreenBlack.graphics.endFill();
         this.mFullScreenBlack.alpha = 0;
         this.mApp.mLayers[5].mBackground.addChild(this.mFullScreenBlack);
      }
      
      public function CloseMenu() : void
      {
         this.mMenuButton.enabled = true;
         this.SetPause(false);
      }
      
      public function DisplayStats() : void
      {
         var besttime:int = 0;
         this.ToggleLevel(false);
         this.mDisplayingStats = true;
         this.mGameStats.Add(this.mLevelStats);
         if(this.mApp.mBestTimes[this.mLevelNum] == 0)
         {
            this.mApp.mBestTimes[this.mLevelNum] = this.mLevelStats.mTimePlayed;
            this.mApp.mSharedObject.data.besttimes[this.mLevelNum] = this.mLevelStats.mTimePlayed;
            this.mApp.mSharedObject.flush();
            besttime = this.mLevelStats.mTimePlayed;
         }
         else if(this.mLevelStats.mTimePlayed < this.mApp.mBestTimes[this.mLevelNum])
         {
            this.mApp.mBestTimes[this.mLevelNum] = this.mLevelStats.mTimePlayed;
            this.mApp.mSharedObject.data.besttimes[this.mLevelNum] = this.mLevelStats.mTimePlayed;
            this.mApp.mSharedObject.flush();
            besttime = this.mApp.mBestTimes[this.mLevelNum];
         }
         else
         {
            besttime = this.mApp.mBestTimes[this.mLevelNum];
         }
         this.mWasPerfectLevel = this.mNumDeathsCurLevel == 0;
         this.mScore = this.mScore + (this.GetAceTimeBonus() + this.GetPerfectBonus() + this.mClearCurvePoints);
         this.CheckIfGotExtraLife(this.GetAceTimeBonus() + this.GetPerfectBonus() + this.mClearCurvePoints);
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.SetScore(this.mScore);
         }
         this.mRollerScore.SetTargetScore(this.mRollerScore.GetTargetScore() + (this.GetAceTimeBonus() + this.GetPerfectBonus()));
         this.mStatScreen = new StatsScreen(this.mApp,this,this.mLevelStats.mMaxCombo + 1,this.mLevelStats.mMaxInARow,this.mLevelStats.mNumGaps,this.mLevelStats.mNumGemsCleared,this.mLevel.mParTime,this.mLevelStats.mTimePlayed,this.GetAceTimeBonus(),besttime,this.GetPerfectBonus(),this.mScore - this.mLevelBeginScore,this.mScore,this.mLevelNum);
         this.mNumDeathsCurLevel = 0;
      }
      
      public function GivePoints(args:Array = null) : void
      {
         this.mScore = this.mScore + 1000;
         this.mRollerScore.ForceScore(this.mScore);
      }
      
      public function SetCurComboCount(val:int) : void
      {
         this.mCurComboCount = val;
      }
      
      public function ActivatePowerBall(theBall:Ball) : void
      {
         var i:int = 0;
         var aPowerType:int = theBall.GetPowerOrDestType();
         this.ActivatePower(aPowerType,theBall.GetColorType(),theBall.GetX(),theBall.GetY());
         for(i = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].ActivatePower(theBall);
         }
      }
      
      public function SetLosing(from_curve:int = -1) : void
      {
         this.mUpsellLevelCount++;
         this.mNumDeathsCurLevel++;
         if(this.mScore > this.mApp.mHighScore)
         {
            this.mApp.mHighScore = this.mScore;
            this.mApp.mSharedObject.data.highscore = this.mScore;
            this.mApp.mSharedObject.flush();
         }
         var i:int = 0;
         this.mPreventBallAdvancement = false;
         this.DoAccuracy(false);
         this.mFrog.PlayerDied();
         this.mDeathSkull = null;
         this.mDeathSkull = new DeathSkull(this.mApp,this);
         var h:Hole = this.mLevel.mHoleMgr.mHoles[from_curve];
         this.mDeathSkull.Init(h.mRotation + Zuma2App.MY_PI,h.mX,h.mY,this.mFrog.GetCenterX(),this.mFrog.GetCenterY());
         this.mCurTreasure = null;
         this.mFruitGlowSprite.visible = false;
         this.mFruitSprite.visible = false;
         this.mCurTreasureNum = 0;
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_GAMEOVER1);
         this.ResetInARowBonus();
         this.mLevelStats.mTimePlayed = this.mStateCount - this.mIgnoreCount;
         this.mGameStats.Add(this.mLevelStats);
         this.mLevelStats.Reset();
         this.mAccuracyBackupCount = 0;
         if(this.mAccuracyCount > 300)
         {
            this.mAccuracyCount = 300;
         }
         for(i = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].SetLosing();
         }
         this.mGameState = GameState_Losing;
         this.mStateCount = 0;
      }
      
      public function GetCurComboCount() : int
      {
         return this.mCurComboCount;
      }
      
      public function GreenBall(args:Array = null) : void
      {
         this.ChangeBallColor(Zuma2App.Green_Ball);
      }
      
      public function IncScore(theInc:int, from_balls:Boolean, counts_towards_zuma:Boolean = true) : void
      {
         if(theInc <= 0 || from_balls && !this.mLevel.AllowPointsFromBalls())
         {
            return;
         }
         var score_before_inc:int = this.mScore;
         var prev_score:int = this.mScore;
         if(counts_towards_zuma)
         {
            this.mScore = this.mScore + theInc;
            this.mZumaBar.mZumaCurrent = this.mZumaBar.mZumaCurrent + theInc;
            if(this.mApp.mAdAPI._isEnabled)
            {
               this.mApp.mAdAPI.SetScore(this.mScore);
            }
         }
         else
         {
            this.mClearCurvePoints = this.mClearCurvePoints + theInc;
         }
         this.mRollerScore.SetTargetScore(this.mRollerScore.GetTargetScore() + theInc);
         this.CheckIfGotExtraLife(theInc);
      }
      
      public function GauntletMode() : Boolean
      {
         return this.mGauntletMode;
      }
      
      public function BlueBall(args:Array = null) : void
      {
         this.ChangeBallColor(Zuma2App.Blue_Ball);
      }
      
      public function KillMenuButton() : void
      {
         if(this.mMenuButton != null)
         {
            if(this.mMenuButton.parent != null)
            {
               this.mMenuButton.parent.removeChild(this.mMenuButton);
            }
         }
      }
      
      public function DeleteBullets() : void
      {
         var aBulletItr:DListIterator = this.mBulletList.getListIterator();
         aBulletItr.start();
         while(aBulletItr.valid())
         {
            aBulletItr.data.Delete();
            aBulletItr.forth();
         }
         this.mBulletList.clear();
      }
      
      public function ResetInARowBonus() : void
      {
         if(this.mNumClearsInARow > this.mLevelStats.mMaxInARow)
         {
            this.mLevelStats.mMaxInARow = this.mNumClearsInARow;
            this.mLevelStats.mMaxInARowScore = this.mCurInARowBonus;
         }
         this.mNumClearsInARow = 0;
         this.mCurInARowBonus = 0;
      }
      
      public function BestTimes(args:Array = null) : void
      {
         var aFormat:TextFormat = null;
         var aString:String = null;
         var i:int = 0;
         var number:Number = NaN;
         var minute:String = null;
         var seconds:String = null;
         var time:String = null;
         if(!this.mBestTimesOn)
         {
            this.mBestTimesOn = true;
            aFormat = new TextFormat();
            aFormat.font = "TimeUpText";
            aFormat.align = TextFormatAlign.LEFT;
            aFormat.color = 0;
            aFormat.size = 12;
            this.mBestTimesDebug = new TextField();
            this.mBestTimesDebug.background = true;
            this.mBestTimesDebug.embedFonts = true;
            this.mBestTimesDebug.defaultTextFormat = aFormat;
            this.mBestTimesDebug.width = 100;
            this.mBestTimesDebug.height = 380;
            this.mBestTimesDebug.x = 20;
            this.mBestTimesDebug.y = 20;
            this.mBestTimesDebug.alpha = 1;
            this.mBestTimesDebug.selectable = true;
            this.mBestTimesDebug.multiline = true;
            this.mBestTimesDebug.wordWrap = true;
            aString = "";
            for(i = 1; i < this.mApp.mBestTimes.length; i++)
            {
               number = this.mApp.mBestTimes[i];
               minute = String(int(number / 6000));
               seconds = String(int(number % 6000 / 100));
               if(seconds.length == 1)
               {
                  seconds = "0" + seconds;
               }
               time = minute + ":" + seconds;
               trace(time);
               aString = aString + String("Level " + i + "    " + time + "\r");
            }
            this.mBestTimesDebug.text = aString;
            this.mApp.mLayers[5].mForeground.addChild(this.mBestTimesDebug);
         }
         else
         {
            if(this.mBestTimesDebug.parent != null)
            {
               this.mBestTimesDebug.parent.removeChild(this.mBestTimesDebug);
            }
            this.mBestTimesOn = false;
         }
      }
      
      public function KillUpsell() : void
      {
         this.mMenuButton.enabled = false;
         this.SetPause(false);
         this.mUpsell = null;
         this.RestartLevel();
      }
      
      public function PlayExplosionSound() : void
      {
         var aTick:int = this.GetTickCount();
         if(aTick - this.mLastExplosionTick > 250)
         {
            this.mLastExplosionTick = aTick;
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BOMB_EXPLOSION);
         }
      }
      
      public function WhiteBall(args:Array = null) : void
      {
         this.ChangeBallColor(Zuma2App.White_Ball);
      }
      
      public function ActivatePower(p:int, color_type:int = -1, x:int = -1, y:int = -1) : void
      {
         if(x == -1)
         {
            x = Zuma2App.SCREEN_WIDTH / 2;
         }
         if(y == -1)
         {
            y = Zuma2App.SCREEN_WIDTH / 2;
         }
         var str:String = this.PowerupToStr(p);
         if(p == PowerType.PowerType_ProximityBomb)
         {
            this.PlayExplosionSound();
            if(this.mCurTreasure != null)
            {
               if(this.CirclesIntersect(this.mCurTreasure.x,this.mCurTreasure.y,x,y,PROXIMITY_BOMB_RADIUS + 52))
               {
                  this.DoHitTreasure();
               }
            }
         }
         else if(p == PowerType.PowerType_MoveBackwards)
         {
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_POWERUP_REVERSE1);
            this.AddText(str,x - 20,y - 40,color_type);
         }
         else if(p == PowerType.PowerType_SlowDown)
         {
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_POWERUP_SLOWDOWN);
            this.AddText(str,x - 20,y - 40,color_type);
         }
         else if(p == PowerType.PowerType_Accuracy)
         {
            this.AddText(str,x - 20,y - 40,color_type);
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_POWERUP_ACCURACY);
            this.mAccuracyCount = 2000;
            this.DoAccuracy(true);
         }
         else if(p == PowerType.PowerType_Cannon)
         {
            this.AddText(str,x - 20,y - 40,color_type);
            this.mFrog.SetCannonCount(this.mApp.mLevelMgr.mCannonShots,this.mApp.mLevelMgr.mCannonStacks,color_type);
         }
         else if(p != PowerType.PowerType_Laser)
         {
            if(p != PowerType.PowerType_ColorNuke)
            {
               if(p == PowerType.PowerType_GauntletMultBall)
               {
               }
            }
         }
      }
      
      public function UpdateText() : void
      {
         for(var i:int = 0; i < this.mScoreBlips.length; i++)
         {
            this.mScoreBlips[i].Update();
            if(this.mScoreBlips[i].mDone)
            {
               this.mScoreBlips[i].Delete();
               this.mScoreBlips.splice(i,1);
            }
         }
      }
      
      public function DoHitTreasure() : void
      {
         this.mTreasureWasHit = true;
         this.mTreasureGlowAlphaRate = 12;
         this.mLevelStats.mNumGemsCleared++;
         var aBonus:int = 500;
         this.AddText("BONUS! \r+" + aBonus,this.mCurTreasure.x,this.mCurTreasure.y,0,1.5);
         this.IncScore(aBonus,false);
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_FRUIT_HIT);
      }
      
      public function UpdateGuide(lazer:Boolean = false) : void
      {
         var p1:SexyVector3 = null;
         var p2:SexyVector3 = null;
         var i:int = 0;
         var anIntersectBall:Ball = null;
         this.mGuideT = -1;
         var anAngle:Number = -this.mFrog.GetAngle();
         -Zuma2App.MY_PI / 2;
         var dx:Number = Math.sin(anAngle);
         var dy:Number = Math.cos(anAngle);
         var dx2:Number = dx;
         var dy2:Number = dy;
         var dx3:Number = dx * 28;
         var dy3:Number = dy * 28;
         var dist:int = 33;
         this.aCenter.x = this.mFrog.GetCenterX() - -1 * dx + dist * dy;
         this.aCenter.y = this.mFrog.GetCenterY() - -1 * dy - dist * dx;
         this.aCenter.z = 0;
         this.g1.x = this.aCenter.x - dx3;
         this.g1.y = this.aCenter.y - dy3;
         this.g1.z = 0;
         this.g2.x = this.aCenter.x + dx3;
         this.g2.y = this.aCenter.y + dy3;
         this.g2.z = 0;
         this.v1.x = Math.cos(anAngle);
         this.v1.y = -Math.sin(anAngle);
         this.v1.z = 0;
         var amt:int = 5;
         this.l1.x = this.aCenter.x + amt * dx;
         this.l1.y = this.aCenter.y;
         this.l1.z = 0;
         this.l2.x = this.aCenter.x - amt * dx;
         this.l2.y = this.aCenter.y;
         this.l2.z = 0;
         this.p3.x = this.aCenter.x;
         this.p3.y = this.aCenter.y;
         this.p3.z = 0;
         if(lazer)
         {
            p1 = this.l1;
            p2 = this.l2;
         }
         else
         {
            p1 = this.g1;
            p2 = this.g2;
         }
         this.gPt1 = new Point(p1.x,p1.y);
         this.gPt2 = new Point(p2.x,p2.y);
         this.gCenter = new Point(this.p3.x,this.p3.y);
         this.mLazerHitTreasure = false;
         var t:Number = 10000000;
         var aBall:Ball = null;
         var theT:Point = new Point();
         theT.x = 10000000;
         if(this.mApp.gSuckMode && this.mFrog.GetBullet() == null)
         {
            for(i = 0; i < this.mLevel.mNumCurves; i++)
            {
               anIntersectBall = this.mLevel.mCurveMgr[i].CheckBallIntersection(this.p3,this.v1,theT,false);
               t = theT.x;
               if(anIntersectBall != null && !anIntersectBall.GetIsExploding())
               {
                  aBall = anIntersectBall;
               }
            }
         }
         else
         {
            for(i = 0; i < this.mLevel.mNumCurves; i++)
            {
               anIntersectBall = this.mLevel.mCurveMgr[i].CheckBallIntersection(this.p3,this.v1,theT,true);
               t = theT.x;
               if(anIntersectBall != null && !anIntersectBall.GetIsExploding())
               {
                  aBall = anIntersectBall;
               }
            }
         }
         if(!this.mLazerHitTreasure)
         {
            if(aBall == null)
            {
               t = 1000 / this.v1.Magnitude();
            }
            if(this.mGuideBall != null)
            {
               this.mGuideBall.mHilightPulse = false;
            }
            this.mGuideBall = aBall;
            if(this.mGuideBall != null)
            {
               this.mGuideBall.mHilightPulse = true;
            }
         }
         else if(this.mGuideBall != null)
         {
            this.mGuideBall.mHilightPulse = false;
            this.mGuideBall = null;
         }
         this.aGuide = this.aCenter.Add(this.v1.Mult(t + 20));
         this.guide_center = !!lazer?this.mLazerGuideCenter:this.mGuideCenter;
         var recalc_guide:Boolean = !!lazer?Boolean(this.mRecalcLazerGuide):Boolean(this.mRecalcGuide);
         if(!recalc_guide && this.mShowGuide && this.guide_center.Sub(this.aGuide).Magnitude() < 20)
         {
            return;
         }
         this.guide_center = this.aGuide;
         this.mShowGuide = true;
         recalc_guide = false;
         this.mGuide[0] = (p1.x + dx3 / 2) * Zuma2App.SHRINK_PERCENT;
         this.mGuide[1] = (p1.y + dy3 / 2) * Zuma2App.SHRINK_PERCENT;
         this.mGuide[2] = (p2.x - dx3 / 2) * Zuma2App.SHRINK_PERCENT;
         this.mGuide[3] = (p2.y - dy3 / 2) * Zuma2App.SHRINK_PERCENT;
         this.mGuide[4] = (this.aGuide.x + dx2) * Zuma2App.SHRINK_PERCENT;
         this.mGuide[5] = (this.aGuide.y + dy2) * Zuma2App.SHRINK_PERCENT;
         this.mGuide[6] = (this.aGuide.x - dx2) * Zuma2App.SHRINK_PERCENT;
         this.mGuide[7] = (this.aGuide.y - dy2) * Zuma2App.SHRINK_PERCENT;
      }
      
      public function AddPowerEffect(p:PowerEffect) : void
      {
         this.mPowerEffects.push(p);
      }
      
      override public function onMouseDown(x:Number, y:Number) : void
      {
         var i:int = 0;
         var aGunPoint:int = 0;
         if(!this.mApp.gAddBalls)
         {
            this.mLevel.SkipInitialPathHilite();
         }
         if(!this.mPaused && this.mGameState == GameState_Playing && !this.mOverMenuButton)
         {
            if(this.mLevel.mNumFrogPoints > 1)
            {
               aGunPoint = this.mLevel.GetGunPointFromPos(x / Zuma2App.SHRINK_PERCENT,y / Zuma2App.SHRINK_PERCENT);
               if(aGunPoint >= 0 && aGunPoint != this.mLevel.mCurFrogPoint)
               {
                  this.mLevel.mCurFrogPoint = aGunPoint;
                  this.mFrog.SetDestPos(this.mLevel.mFrogX[aGunPoint],this.mLevel.mFrogY[aGunPoint],this.mLevel.mMoveSpeed,true);
                  this.mMouseOverGunPos = -1;
                  return;
               }
            }
            for(i = 0; i < this.mLevel.mNumCurves; i++)
            {
               if(!this.mLevel.mCurveMgr[i].CanFire())
               {
                  return;
               }
            }
            if(this.mLevel.CanFireBall() && this.mFrog.StartFire())
            {
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BALL_FIRE);
            }
         }
      }
      
      public function CirclesIntersect(x1:Number, y1:Number, x2:Number, y2:Number, total_radius:Number, seperation:Number = 0) : Boolean
      {
         var dx:Number = x1 - x2;
         var dy:Number = y1 - y2;
         var sep:Number = dx * dx + dy * dy;
         if(seperation != 0)
         {
            seperation = sep;
         }
         return sep < total_radius * total_radius;
      }
      
      public function PlayBallClick(theSound:String) : void
      {
         var aTick:int = this.GetTickCount();
         if(aTick - this.mLastBallClickTick < 250)
         {
            return;
         }
         this.mApp.soundManager.playSound(theSound);
         this.mLastBallClickTick = aTick;
      }
      
      public function ForwardLevel(args:Array = null) : void
      {
         if(this.mLevel.DoingInitialPathHilite())
         {
            this.mLevel.SkipInitialPathHilite();
         }
         this.mLevelNum++;
         if(this.mLevelNum >= 19)
         {
            this.mLevelNum = 19;
         }
         this.ResetTunnels();
         for(var i:int = 0; i < this.mLevel.mNumCurves; i++)
         {
            this.mLevel.mCurveMgr[i].DeleteBalls();
         }
         this.mLevelText.text = "Level " + String(this.mLevelNum + 1);
         this.mLevelText.visible = true;
         this.RestartLevel();
      }
      
      public function CheckEndConditions() : void
      {
         var aGlow:DropShadowFilter = null;
         var cm:CurveMgr = null;
         var pt:int = 0;
         var end_pt:int = 0;
         var adjust:int = 0;
         var expCount:int = 0;
         var x:int = 0;
         var y:int = 0;
         var pri:int = 0;
         var s:PathSparkle = null;
         var e:EndLevelExplosion = null;
         var d:int = 0;
         var i:int = 0;
         if(this.mFrog.IsFiring() || !this.mBulletList.isEmpty())
         {
            return;
         }
         var count:int = 0;
         for(i = 0; i < this.mLevel.mNumCurves; i++,count++)
         {
            if(!this.mLevel.mCurveMgr[i].IsWinning())
            {
               break;
            }
         }
         var delay:int = 1;
         if(count == this.mLevel.mNumCurves)
         {
            if(this.mLevel.mNumCurves > 0 || this.mLevel.mHaveReachedTarget)
            {
               this.mLevelStats.mTimePlayed = this.mStateCount - this.mIgnoreCount;
               this.mFrog.EmptyBullets();
               this.mLevelNum++;
               this.mStateCount = 0;
               this.mGameState = GameState_BeatLevelBonus;
               this.mUpsellLevelCount++;
               this.mTimeUpTextField = new TextField();
               this.mTimeUpTextFormat = new TextFormat();
               this.mTimeUpTextFormat.font = "TimeUpText";
               this.mTimeUpTextFormat.align = TextFormatAlign.CENTER;
               this.mTimeUpTextFormat.color = 16777215;
               this.mTimeUpTextFormat.size = 55;
               aGlow = new DropShadowFilter();
               aGlow.strength = 50;
               this.mTimeUpTextField = new TextField();
               this.mTimeUpTextField.embedFonts = true;
               this.mTimeUpTextField.defaultTextFormat = this.mTimeUpTextFormat;
               this.mTimeUpTextField.filters = [aGlow];
               this.mTimeUpTextField.textColor = 16777215;
               this.mTimeUpTextField.width = 400;
               this.mTimeUpTextField.height = 100;
               this.mTimeUpTextField.x = -50;
               this.mTimeUpTextField.y = 100;
               this.mTimeUpTextField.alpha = 1;
               this.mTimeUpTextField.selectable = false;
               this.mTimeUpTextField.multiline = true;
               this.mTimeUpTextField.wordWrap = true;
               this.mTimeUpTextField.text = "LEVEL COMPLETE!";
               this.mApp.mLayers[4].mForeground.addChild(this.mTimeUpTextField);
               for(i = 0; i < this.mLevel.mNumCurves; i++)
               {
                  cm = this.mLevel.mCurveMgr[i];
                  pt = cm.mLastClearedBallPoint;
                  end_pt = cm.GetCurveLength();
                  adjust = (end_pt - pt) % 60;
                  if(adjust != 0)
                  {
                     pt = pt + adjust;
                  }
                  expCount = 0;
                  while(pt <= end_pt)
                  {
                     s = new PathSparkle(this.mApp);
                     cm.GetPoint(pt,s);
                     this.mEndLevelExplosions.push(new EndLevelExplosion(this.mApp));
                     e = this.mEndLevelExplosions[this.mEndLevelExplosions.length - 1];
                     e.SetPos(s.mX,s.mY);
                     e.mDelay = delay;
                     e.mX = s.mX;
                     e.mY = s.mY;
                     if(expCount % 4 == 0)
                     {
                        e.mPlaySound = true;
                     }
                     delay = delay + 10;
                     pt = pt + 60;
                     expCount++;
                  }
               }
               return;
            }
         }
         count = 0;
         var losing_num:int = -1;
         for(i = 0; i < this.mLevel.mNumCurves; i++,count++)
         {
            if(this.mLevel.mCurveMgr[i].IsLosing())
            {
               losing_num = i;
               break;
            }
         }
         if(count != this.mLevel.mNumCurves)
         {
            this.SetLosing(losing_num);
            return;
         }
         if(this.mGauntletMode && this.mLevel.mTimer == 0)
         {
            this.SetTimeUp();
            return;
         }
         var danger_val:int = -1;
         var danger_range:int = -1;
         for(i = 0; i < this.mLevel.mNumCurves; i++)
         {
            if(this.mLevel.mCurveMgr[i].IsInDanger())
            {
               d = this.mLevel.mCurveMgr[i].GetDistanceToDeath();
               if(danger_val == -1 || d < danger_val)
               {
                  danger_range = this.mLevel.mCurveMgr[i].GetDangerDistance();
                  danger_val = d;
               }
            }
         }
         this.UpdateTrackBPM(danger_val,danger_range);
      }
      
      public function SetupTunnels(theLevel:Level) : void
      {
         for(var i:int = 0; i < theLevel.mTunnelData.length; i++)
         {
            this.mTunnels[i] = theLevel.mTunnelData[i];
         }
      }
      
      public function SetNumClearsInARow(val:int) : void
      {
         this.mNumClearsInARow = val;
         if(this.mNumClearsInARow > 1)
         {
         }
      }
      
      public function ShowUpsell() : void
      {
         this.mMenuButton.enabled = false;
         this.SetPause(true);
         if(this.mLevelNum >= 20)
         {
            this.mUpsell = new Upsell(this.mApp,null,this,Upsell.UPSELL_ADVENTURE);
         }
         else
         {
            this.mUpsell = new Upsell(this.mApp,null,this,Upsell.UPSELL_FULL);
         }
      }
      
      public function ToggleLives(on:Boolean) : void
      {
         this.mLivesText.visible = on;
         this.mLivesFrame.visible = on;
         this.mLivesFrog.visible = on;
         if(this.mTimeUpTextField != null)
         {
            this.mTimeUpTextField.visible = on;
         }
      }
      
      public function PlaySmallExplosionSound() : void
      {
         var aTick:int = this.GetTickCount();
         if(aTick - this.mLastSmallExplosionTick > 100)
         {
            this.mLastSmallExplosionTick = aTick;
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BALLS_DESTROYED3);
         }
      }
   }
}
