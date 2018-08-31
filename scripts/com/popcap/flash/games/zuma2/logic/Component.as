package com.popcap.flash.games.zuma2.logic
{
   public class Component
   {
       
      
      public var mValue:Number;
      
      public var mTargetValue:Number;
      
      public var mValueDelta:Number;
      
      public var mStartFrame:int;
      
      public var mOriginalValue:Number;
      
      public var mEndFrame:int;
      
      public function Component(val:Number, target:Number, start:int = 0, end:int = 0)
      {
         super();
         this.mValue = val;
         this.mOriginalValue = val;
         this.mTargetValue = target;
         this.mStartFrame = start;
         this.mEndFrame = end;
         this.mValueDelta = end - start == 0?Number(0):Number((target - val) / Number(end - start));
      }
      
      public function Update() : void
      {
         this.mValue = this.mValue + this.mValueDelta;
         if(this.mValueDelta > 0 && this.mValue > this.mTargetValue || this.mValueDelta < 0 && this.mValue < this.mTargetValue)
         {
            this.mValue = this.mTargetValue;
         }
      }
      
      public function Active(count:int) : Boolean
      {
         return count >= this.mStartFrame && count <= this.mEndFrame;
      }
   }
}
