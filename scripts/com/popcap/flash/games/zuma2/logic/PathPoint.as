package com.popcap.flash.games.zuma2.logic
{
   public class PathPoint
   {
       
      
      public var mSplinePoint:Boolean;
      
      public var mEndPoint:Boolean;
      
      public var mSelected:Boolean;
      
      public var mPriority:int;
      
      public var mDist:Number;
      
      public var t:Number;
      
      public var x:Number;
      
      public var y:Number;
      
      public var mInTunnel:Boolean;
      
      public function PathPoint(tx:Number = 0, ty:Number = 0, dist:Number = 0)
      {
         super();
         this.x = tx;
         this.y = ty;
         this.mDist = dist;
         this.mInTunnel = false;
         this.mSelected = false;
         this.mPriority = 0;
         this.mEndPoint = false;
         this.t = 0;
         this.mSplinePoint = false;
      }
   }
}
