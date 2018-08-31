package com.popcap.flash.games.zuma2.logic
{
   public class QRand
   {
       
      
      public var mPrevLastHitUpdate:Vector.<int>;
      
      public var mWeights:Vector.<Number>;
      
      public var mCurSway:Vector.<Number>;
      
      public var mUpdateCnt:int;
      
      public var mLastIndex:int;
      
      public var mLastHitUpdate:Vector.<int>;
      
      public function QRand()
      {
         this.mWeights = new Vector.<Number>();
         this.mCurSway = new Vector.<Number>();
         this.mLastHitUpdate = new Vector.<int>();
         this.mPrevLastHitUpdate = new Vector.<int>();
         super();
         this.Init();
      }
      
      public function SetWeights(v:Vector.<Number>) : void
      {
         var aTotal:Number = NaN;
         var anArgNum:int = 0;
         var aWeightNum:int = 0;
         this.mWeights = new Vector.<Number>();
         if(v.length == 1)
         {
            this.mWeights.push(1 - v[0]);
            this.mWeights.push(v[0]);
         }
         else
         {
            aTotal = 0;
            for(anArgNum = 0; anArgNum < v.length; anArgNum++)
            {
               this.mWeights.push(v[anArgNum]);
               aTotal = aTotal + this.mWeights[anArgNum];
            }
            for(aWeightNum = 0; aWeightNum < this.mWeights.length; aWeightNum++)
            {
               this.mWeights[aWeightNum] = this.mWeights[aWeightNum] / aTotal;
            }
         }
         for(var i:int = int(this.mLastHitUpdate.length); i < this.mWeights.length; i++)
         {
            this.mLastHitUpdate.push(0);
            this.mPrevLastHitUpdate.push(0);
         }
         this.mCurSway = new Vector.<Number>();
      }
      
      public function HasWeight(idx:int) : Boolean
      {
         if(idx >= this.mWeights.length)
         {
            return false;
         }
         return this.mWeights[idx] > 0;
      }
      
      public function Next() : int
      {
         var aWeight:Number = NaN;
         var anAvgLength:Number = NaN;
         var aPctOff:Number = NaN;
         var aPrevPctOff:Number = NaN;
         var aSway:Number = NaN;
         this.mUpdateCnt++;
         var aTotalWeight:Number = 0;
         for(var i:int = 0; i < this.mWeights.length; i++)
         {
            aWeight = this.mWeights[i];
            if(aWeight != 0)
            {
               anAvgLength = 1 / aWeight;
               aPctOff = 1 + (Number(this.mUpdateCnt - this.mLastHitUpdate[i]) - anAvgLength) / anAvgLength;
               aPrevPctOff = 1 + (Number(this.mUpdateCnt - this.mPrevLastHitUpdate[i]) - anAvgLength * 2) / (anAvgLength * 2);
               aSway = aWeight * Math.max(Math.min(aPctOff * 0.75 + aPrevPctOff * 0.25,3),0.333);
               this.mCurSway[i] = aSway;
               aTotalWeight = aTotalWeight + aSway;
            }
            else
            {
               this.mCurSway[i] = 0;
            }
         }
         var aRand:Number = Math.random() * aTotalWeight;
         var anIdx:int = 0;
         while(anIdx < this.mCurSway.length && aRand > this.mCurSway[anIdx])
         {
            aRand = aRand - this.mCurSway[anIdx];
            anIdx++;
         }
         if(anIdx >= this.mCurSway.length)
         {
            anIdx--;
         }
         this.mPrevLastHitUpdate[anIdx] = this.mLastHitUpdate[anIdx];
         this.mLastHitUpdate[anIdx] = this.mUpdateCnt;
         this.mLastIndex = anIdx;
         return anIdx;
      }
      
      public function Init() : void
      {
         this.mUpdateCnt = 0;
         this.mLastIndex = -1;
      }
      
      public function Clear() : void
      {
         this.mWeights = new Vector.<Number>();
         this.mCurSway = new Vector.<Number>();
         this.mLastHitUpdate = new Vector.<int>();
         this.mPrevLastHitUpdate = new Vector.<int>();
      }
      
      public function NumNonZeroWeights() : int
      {
         var num:int = 0;
         for(var i:int = 0; i < this.mWeights.length; i++)
         {
            if(this.mWeights[i] != 0)
            {
               num++;
            }
         }
         return num;
      }
   }
}
