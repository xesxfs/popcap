package com.popcap.flash.games.zuma2.logic
{
   public class Bouncy
   {
       
      
      public var mStartingRate:Number;
      
      public var mDone:Boolean;
      
      public var mRateDivFactor:Number;
      
      public var mFinalPct:Number;
      
      public var mStartingPct:Number;
      
      public var mCount:int;
      
      public var mMaxPct:Number;
      
      public var mRate:Number;
      
      public var mStartInc:Boolean;
      
      public var mInc:Boolean;
      
      public var mPct:Number;
      
      public var mMaxBounces:int;
      
      public var mMinPct:Number;
      
      public function Bouncy()
      {
         super();
         this.mCount = 0;
         this.mMaxBounces = 0;
         this.mPct = 0;
         this.mRate = 0;
         this.mStartingPct = 0;
         this.mStartInc = true;
         this.mInc = true;
         this.mDone = false;
         this.mRateDivFactor = 2;
         this.mStartingRate = 0;
      }
      
      public function Update() : void
      {
         var targetp:Number = NaN;
         if(this.mDone)
         {
            return;
         }
         this.mPct = this.mPct + (!!this.mInc?this.mRate:-this.mRate);
         if(this.mCount == this.mMaxBounces)
         {
            targetp = this.mFinalPct;
         }
         else
         {
            targetp = !!this.mInc?Number(this.mMaxPct):Number(this.mMinPct);
         }
         if(this.mInc && this.mPct >= targetp)
         {
            this.mPct = targetp;
            this.mInc = false;
            this.mCount++;
            this.mRate = this.mRate / this.mRateDivFactor;
         }
         else if(!this.mInc && this.mPct <= targetp)
         {
            this.mPct = targetp;
            this.mInc = true;
            this.mCount++;
            this.mRate = this.mRate / this.mRateDivFactor;
         }
         if(this.mCount > this.mMaxBounces)
         {
            this.mDone = true;
         }
      }
      
      public function SetRate(r:Number) : void
      {
         this.mRate = this.mStartingRate = r;
      }
      
      public function SetTargetPercents(minp:Number, maxp:Number, finalp:Number) : void
      {
         this.mMinPct = minp;
         this.mMaxPct = maxp;
         this.mFinalPct = finalp;
      }
      
      public function GetPct() : Number
      {
         return this.mPct;
      }
      
      public function SetRateDivFactor(d:Number) : void
      {
         this.mRateDivFactor = d;
      }
      
      public function SetNumBounces(b:int) : void
      {
         this.mMaxBounces = b;
      }
      
      public function IsDone() : Boolean
      {
         return this.mDone;
      }
      
      public function Reset() : void
      {
         this.mCount = 0;
         this.mPct = this.mStartingPct;
         this.mInc = this.mStartInc;
         this.mDone = false;
         this.mRate = this.mStartingRate;
      }
      
      public function GetCount() : int
      {
         return this.mCount;
      }
      
      public function SetPct(p:Number, inc:Boolean = true) : void
      {
         this.mPct = this.mStartingPct = p;
         this.mInc = this.mStartInc = inc;
      }
   }
}
