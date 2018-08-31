package com.popcap.flash.games.zuma2.logic
{
   import flash.geom.Point;
   
   public class ReversePowerEffect extends PowerEffect
   {
       
      
      public var mCurve:CurveMgr;
      
      public var mStartWaypoint:Number;
      
      public var mRotation:Number;
      
      public var mWaypoint:Number;
      
      public var mScale:Number;
      
      public function ReversePowerEffect(app:Zuma2App, b:Ball, x:Number = 0, y:Number = 0)
      {
         super(app,x,y);
         this.mCurve = b.mCurve;
         this.mStartWaypoint = this.mWaypoint = b.GetWayPoint();
         var pos:Point = this.mCurve.mWayPointMgr.GetPointPos(this.mWaypoint);
         mX = pos.x;
         mY = pos.y;
         this.mRotation = this.mCurve.mWayPointMgr.GetRotationForPoint(this.mWaypoint);
      }
      
      override public function Draw() : void
      {
         var item:EffectItem = null;
         if(this.IsDone())
         {
            return;
         }
         var start_idx:int = !!mDrawReverse?int(mItems.length - 1):0;
         var end_idx:int = !!mDrawReverse?0:int(mItems.length);
         var idx:int = start_idx;
         while(!!mDrawReverse?idx >= end_idx:idx < end_idx)
         {
            item = mItems[idx];
            item.mSprite.alpha = GetComponentValue(item.mOpacity,255,mUpdateCount) / 255;
            if(item.mSprite.alpha != 0)
            {
               item.mSprite.scaleX = !!mDone?Number(this.mScale):Number(GetComponentValue(item.mScale,1,mUpdateCount));
               item.mSprite.scaleY = !!mDone?Number(this.mScale):Number(GetComponentValue(item.mScale,1,mUpdateCount));
               item.mSprite.rotation = -this.mRotation * Zuma2App.RAD_TO_DEG;
               item.mSprite.x = mX * Zuma2App.SHRINK_PERCENT;
               item.mSprite.y = mY * Zuma2App.SHRINK_PERCENT;
            }
            idx = idx + (!!mDrawReverse?-1:1);
         }
      }
      
      override public function Update() : void
      {
         var pos:Point = null;
         if(this.IsDone())
         {
            return;
         }
         super.Update();
         var updates_done:Boolean = mDone;
         if(!updates_done)
         {
            return;
         }
         this.mWaypoint = this.mWaypoint - 20;
         pos = this.mCurve.mWayPointMgr.GetPointPos(this.mWaypoint);
         mX = pos.x;
         mY = pos.y;
         this.mRotation = this.mCurve.mWayPointMgr.GetRotationForPoint(this.mWaypoint);
         this.mScale = this.mWaypoint / this.mStartWaypoint;
         if(this.mScale < 0)
         {
            mDone = true;
         }
      }
      
      override public function IsDone() : Boolean
      {
         return mDone && this.mWaypoint < 0;
      }
   }
}
