package com.popcap.flash.games.zuma2.logic
{
   import flash.net.URLLoader;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class CurveData
   {
      
      public static const SUBPIXEL_MULT:Number = 100;
      
      public static const INV_SUBPIXEL_MULT:Number = 1 / SUBPIXEL_MULT;
       
      
      public var aReader:ByteArray;
      
      public var mErrorString:String;
      
      public var mLoaded:Boolean;
      
      public var loader:URLLoader;
      
      public var mDrawCurve:Boolean;
      
      public var mPointList:Vector.<PathPoint>;
      
      public var mVersion:int;
      
      public var mEditType:int;
      
      public var mLinear:Boolean;
      
      public var mApp:Zuma2App;
      
      public var mVals:BasicCurveVals;
      
      public function CurveData(app:Zuma2App)
      {
         this.loader = new URLLoader();
         super();
         this.mApp = app;
         this.mLoaded = false;
      }
      
      public function Load(theFileName:String) : Boolean
      {
         var aBuf:String = null;
         var aBufferSize:int = 0;
         var aByteArray:ByteArray = null;
         var aPoint:PathPoint = null;
         var aFlags:int = 0;
         var isEndPoint:* = false;
         var dx:int = 0;
         var dy:int = 0;
         this.Clear();
         this.mVals = new BasicCurveVals();
         this.mPointList = new Vector.<PathPoint>();
         var i:int = 0;
         this.aReader = this.mApp.mLevelData.mLevels[theFileName + ".dat"];
         this.aReader.position = 0;
         this.aReader.endian = Endian.LITTLE_ENDIAN;
         aBuf = this.aReader.readUTFBytes(4);
         this.mVersion = this.aReader.readInt();
         this.mLinear = this.aReader.readBoolean();
         this.mVals.mStartDistance = this.aReader.readInt();
         this.mVals.mNumBalls = this.aReader.readInt();
         this.mVals.mBallRepeat = this.aReader.readInt();
         this.mVals.mMaxSingle = this.aReader.readInt();
         this.mVals.mNumColors = this.aReader.readInt();
         this.mVals.mSpeed = this.aReader.readFloat();
         this.mVals.mSlowDistance = this.aReader.readInt();
         this.mVals.mAccelerationRate = this.aReader.readFloat();
         this.mVals.mOrgAccelerationRate = this.mVals.mAccelerationRate;
         this.mVals.mMaxSpeed = this.aReader.readFloat();
         this.mVals.mOrgMaxSpeed = this.mVals.mMaxSpeed;
         this.mVals.mScoreTarget = this.aReader.readInt();
         this.mVals.mSkullRotation = this.aReader.readInt();
         this.mVals.mZumaBack = this.aReader.readInt();
         this.mVals.mZumaSlow = this.aReader.readInt();
         this.mVals.mSlowFactor = this.aReader.readFloat();
         this.mVals.mMaxClumpSize = this.aReader.readInt();
         var num_powerups:int = this.aReader.readInt();
         for(i = 0; i < PowerType.PowerType_Max; i++)
         {
            this.mVals.mPowerUpFreq[i] = 0;
            this.mVals.mMaxNumPowerUps[i] = 100000000;
         }
         i = 0;
         while(i < num_powerups && i < PowerType.PowerType_Max)
         {
            if(this.IsDeprecatedPowerUp(i))
            {
               this.aReader.readInt();
               if(this.mVersion >= 12)
               {
                  this.aReader.readInt();
               }
            }
            else
            {
               this.mVals.mPowerUpFreq[i] = this.aReader.readInt();
               if(this.mVersion >= 12)
               {
                  this.mVals.mMaxNumPowerUps[i] = this.aReader.readInt();
               }
            }
            i++;
         }
         this.mVals.mPowerUpChance = this.aReader.readInt();
         this.mDrawCurve = this.aReader.readBoolean();
         this.mVals.mDrawTunnels = this.aReader.readBoolean();
         this.mVals.mDestroyAll = this.aReader.readBoolean();
         this.mVals.mDrawPit = this.aReader.readBoolean();
         this.mVals.mDieAtEnd = this.aReader.readBoolean();
         var smallVersion:Boolean = this.aReader.readBoolean();
         var hasTunnels:Boolean = this.aReader.readBoolean();
         if(!smallVersion)
         {
            this.mEditType = this.aReader.readInt();
            aBufferSize = this.aReader.readInt();
            aByteArray = new ByteArray();
            this.aReader.readBytes(aByteArray,0,aBufferSize);
         }
         else
         {
            this.mEditType = 0;
         }
         var aSize:int = this.aReader.readInt();
         var ox:Number = 0;
         var oy:Number = 0;
         for(i = 0; i < aSize; i++)
         {
            aPoint = new PathPoint();
            aFlags = this.aReader.readByte();
            aPoint.mInTunnel = (aFlags & 1) == 1;
            isEndPoint = (aFlags & 2) == 2;
            if(hasTunnels || this.mVersion >= 15)
            {
               aPoint.mPriority = this.aReader.readByte();
            }
            if(isEndPoint)
            {
               aPoint.x = this.aReader.readFloat();
               aPoint.y = this.aReader.readFloat();
            }
            else
            {
               dx = this.aReader.readByte();
               dy = this.aReader.readByte();
               aPoint.x = ox + dx * INV_SUBPIXEL_MULT;
               aPoint.y = oy + dy * INV_SUBPIXEL_MULT;
            }
            ox = aPoint.x;
            oy = aPoint.y;
            this.mPointList.push(aPoint);
         }
         this.mLoaded = true;
         return true;
      }
      
      public function IsDeprecatedPowerUp(ptype:int) : Boolean
      {
         return ptype == PowerType.PowerType_Fireball || ptype == PowerType.PowerType_ShieldFrog || ptype == PowerType.PowerType_FreezeBoss || ptype == PowerType.PowerType_BallEater || ptype == PowerType.PowerType_BombBullet || ptype == PowerType.PowerType_Lob;
      }
      
      public function Clear() : void
      {
      }
   }
}
