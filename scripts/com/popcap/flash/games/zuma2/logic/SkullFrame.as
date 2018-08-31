package com.popcap.flash.games.zuma2.logic
{
   public class SkullFrame
   {
       
      
      public var mAngle:Number;
      
      public var mX:Number;
      
      public var mSize:Number;
      
      public var mAlpha:Number;
      
      public var mY:Number;
      
      public var mIsFinalFrame:Boolean;
      
      public var mPctOpen:Number;
      
      public function SkullFrame()
      {
         super();
         this.mPctOpen = 1;
         this.mAngle = 0;
         this.mSize = 0;
         this.mAlpha = 128;
         this.mIsFinalFrame = false;
         this.mX = 0;
         this.mY = 0;
      }
   }
}
