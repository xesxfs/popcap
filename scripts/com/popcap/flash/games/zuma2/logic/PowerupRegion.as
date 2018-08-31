package com.popcap.flash.games.zuma2.logic
{
   public class PowerupRegion
   {
       
      
      public var mChance:int;
      
      public var mCurvePctStart:Number;
      
      public var mCurveNum:int;
      
      public var mDebugDraw:Boolean;
      
      public var mCurvePctEnd:Number;
      
      public function PowerupRegion()
      {
         super();
         this.mCurvePctStart = 0;
         this.mCurvePctEnd = 0;
         this.mDebugDraw = false;
         this.mChance = 0;
         this.mCurveNum = 0;
      }
   }
}
