package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.AppUtils;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class LevelMgr
   {
       
      
      public var mLevelXML:String;
      
      public var mHasFailed:Boolean;
      
      public var mCannonShots:int = 1;
      
      public var mPointsForLife:int = 50000;
      
      public var mError:String;
      
      public var mUniquePowerupColor:Boolean = true;
      
      public var mPowerCooldown:int = 1000;
      
      public var mCannonAngle:Number;
      
      public var mXMLParser:XML;
      
      public var mReady:Boolean;
      
      public var mMinMultBallDistance:int = 3;
      
      public var mLevels:Array;
      
      public var mClearCurveRolloutPct:Number;
      
      public var mPostZumaTime:int;
      
      public var mPowerDelay:int = 1500;
      
      public var mCannonStacks:Boolean = false;
      
      public var mPowerupSpawnDelay:int = 700;
      
      public var mIsHardConfig:Boolean;
      
      public var mCapAffectsPowerupsSpawned:Boolean = true;
      
      public var mClearCurveSpeedMult:Number = 4.0;
      
      public var mMapPoints:Vector.<Point>;
      
      public var mApp:Zuma2App;
      
      public var mCurDir:String;
      
      public function LevelMgr(app:Zuma2App)
      {
         this.mCannonAngle = 15 * Zuma2App.MY_PI / 180;
         super();
         this.mApp = app;
         this.mClearCurveRolloutPct = 0.1;
      }
      
      public function DoParsePowerupRegion(list:XML, level:Level) : void
      {
         var pr:PowerupRegion = null;
         var len:int = list.PowerupRegion.length();
         for(var i:int = 0; i < len; i++)
         {
            pr = new PowerupRegion();
            pr.mCurvePctStart = list.PowerupRegion[i].attribute("start");
            pr.mCurvePctEnd = list.PowerupRegion[i].attribute("end");
            pr.mChance = list.PowerupRegion[i].attribute("chance");
            pr.mCurveNum = list.PowerupRegion[i].attribute("curve");
            level.mPowerupRegions.push(pr);
         }
      }
      
      public function SetupCurveInfoFromXML(curve:String, level:Level, num:int) : void
      {
         level.mNumCurves++;
         level.mCurveMgr[num - 1] = new CurveMgr(this.mApp,num - 1);
         level.mCurveMgr[num - 1].mLevel = level;
         level.mCurveMgr[num - 1].mPath = curve;
      }
      
      public function DoParseTreasure(list:XML, level:Level) : void
      {
         var len:int = list.TreasurePoint.length();
         for(var i:int = 0; i < len; i++)
         {
            level.mTreasurePoints[i] = new TreasurePoint();
            level.mTreasurePoints[i].x = list.TreasurePoint[i].attribute("x");
            level.mTreasurePoints[i].y = list.TreasurePoint[i].attribute("y");
            level.mTreasurePoints[i].mCurveDist[0] = list.TreasurePoint[i].attribute("dist1");
            if(list.TreasurePoint.dist2)
            {
               level.mTreasurePoints[i].mCurveDist[1] = list.TreasurePoint[i].attribute("dist2");
            }
         }
      }
      
      public function LoadLevels(e:Event) : void
      {
         this.mLevels = new Array();
         this.mXMLParser = new XML(e.target.data);
         this.DoParseLevels();
      }
      
      public function LoadXML(theFilename:String) : void
      {
         var xmlLoader:URLLoader = new URLLoader();
         xmlLoader.addEventListener(Event.COMPLETE,this.LoadLevels);
         xmlLoader.load(new URLRequest(theFilename));
      }
      
      public function DoParseLevels() : void
      {
         var level:Level = null;
         var curve:String = null;
         var len:int = this.mXMLParser.Level.length();
         for(var i:int = 0; i < len; i++)
         {
            level = new Level(this.mApp);
            level.mId = this.mXMLParser.Level[i].attribute("id");
            level.mDisplayName = this.mXMLParser.Level[i].attribute("dispname");
            level.mDrawCurves = AppUtils.asBoolean(this.mXMLParser.Level[i].attribute("drawcurve"));
            level.mParTime = this.mXMLParser.Level[i].attribute("partime");
            level.mTreasureFreq = this.mXMLParser.Level[i].attribute("tfreq");
            level.mBackgroundImage = this.mXMLParser.Level[i].attribute("background");
            level.mSkullOverride[0] = this.mXMLParser.Level[i].attribute("curve1skullangle");
            level.mSkullOverride[1] = this.mXMLParser.Level[i].attribute("curve2skullangle");
            this.SetupCurveInfoFromXML(this.mXMLParser.Level[i].attribute("curve1"),level,1);
            curve = this.mXMLParser.Level[i].attribute("curve2");
            if(curve)
            {
               this.SetupCurveInfoFromXML(curve,level,2);
            }
            this.DoParseTreasure(this.mXMLParser.Level[i],level);
            this.DoParseTunnel(this.mXMLParser.Level[i],level);
            this.DoParseGun(this.mXMLParser.Level[i],level);
            this.DoParsePowerupRegion(this.mXMLParser.Level[i],level);
            this.mLevels[i] = level;
         }
         this.mReady = true;
      }
      
      public function DoParseGun(list:XML, level:Level) : void
      {
         var len:int = list.Gun.length();
         level.mNumFrogPoints = 0;
         for(var i:int = 0; i < len; i++)
         {
            level.mMoveType = list.Gun[i].attribute("type");
            level.mFrogX[0] = list.Gun[i].attribute("gx1");
            level.mFrogY[0] = list.Gun[i].attribute("gy1");
            level.mNumFrogPoints++;
            if(list.Gun.attribute("gx2") != undefined)
            {
               level.mFrogX[1] = list.Gun.attribute("gx2");
               level.mFrogY[1] = list.Gun.attribute("gy2");
               level.mNumFrogPoints++;
            }
         }
      }
      
      public function DoParseTunnel(list:XML, level:Level) : void
      {
         var len:int = list.Tunnel.length();
         for(var i:int = 0; i < len; i++)
         {
            level.mTunnelData[i] = new TunnelData();
            level.mTunnelData[i].mPriority = list.Tunnel[i].attribute("pri");
            level.mTunnelData[i].mX = list.Tunnel[i].attribute("x");
            level.mTunnelData[i].mY = list.Tunnel[i].attribute("y");
            level.mTunnelData[i].mTunnelImage = list.Tunnel[i].attribute("chute");
         }
      }
      
      public function GetLevelByIndex(index:int) : Level
      {
         if(index < 0 || index > this.mLevels.length)
         {
            return null;
         }
         return this.mLevels[index];
      }
   }
}
