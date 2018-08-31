package com.popcap.flash.games.zuma2.logic
{
   public class WayPoint
   {
       
      
      public var mInTunnel:Boolean;
      
      public var mAvgRotation:Number;
      
      public var mRotation:Number;
      
      public var mPriority:int;
      
      public var mHavePerpendicular:Boolean;
      
      public var x:Number;
      
      public var y:Number;
      
      public var mHaveAvgRotation:Boolean;
      
      public var mPerpendicular:SexyVector3;
      
      public function WayPoint(x:Number, y:Number)
      {
         super();
         this.x = x;
         this.y = y;
         this.mHaveAvgRotation = false;
         this.mHavePerpendicular = false;
         this.mInTunnel = false;
         this.mPriority = 0;
      }
   }
}
