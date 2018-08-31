package com.popcap.flash.framework.resources.sounds
{
   import flash.media.Sound;
   import flash.utils.getTimer;
   
   public class SoundResource
   {
       
      
      private var mVolume:Number = 1.0;
      
      public var resourceId:int = -1;
      
      public var sound:Sound;
      
      private var mLastTime:int = 0;
      
      private var mInstances:Vector.<SoundInst>;
      
      public function SoundResource()
      {
         super();
         this.mInstances = new Vector.<SoundInst>();
      }
      
      public function loop() : SoundInst
      {
         var tmp:SoundInst = null;
         var inst:SoundInst = null;
         var numInst:int = this.mInstances.length;
         for(var i:int = 0; i < numInst; i++)
         {
            tmp = this.mInstances[i];
            if(tmp.isDone())
            {
               inst = tmp;
               break;
            }
         }
         if(inst == null)
         {
            inst = new SoundInst();
            this.mInstances.push(inst);
         }
         inst.reset(this);
         inst.numPlays = -1;
         inst.play(this.mVolume);
         return inst;
      }
      
      public function resume() : void
      {
         var tmp:SoundInst = null;
         var numInst:int = this.mInstances.length;
         for(var i:int = 0; i < numInst; i++)
         {
            tmp = this.mInstances[i];
            tmp.resume();
         }
      }
      
      public function play(numPlays:int) : SoundInst
      {
         var tmp:SoundInst = null;
         var thisTime:int = getTimer();
         if(thisTime - 10 <= this.mLastTime)
         {
            return null;
         }
         this.mLastTime = thisTime;
         var inst:SoundInst = null;
         var numInst:int = this.mInstances.length;
         for(var i:int = 0; i < numInst; i++)
         {
            tmp = this.mInstances[i];
            if(tmp.isDone())
            {
               inst = tmp;
               break;
            }
         }
         if(inst == null)
         {
            inst = new SoundInst();
            this.mInstances.push(inst);
         }
         inst.reset(this);
         inst.numPlays = numPlays;
         inst.play(this.mVolume);
         return inst;
      }
      
      public function pause() : void
      {
         var tmp:SoundInst = null;
         var numInst:int = this.mInstances.length;
         for(var i:int = 0; i < numInst; i++)
         {
            tmp = this.mInstances[i];
            tmp.pause();
         }
      }
      
      public function stop() : void
      {
         var tmp:SoundInst = null;
         var numInst:int = this.mInstances.length;
         for(var i:int = 0; i < numInst; i++)
         {
            tmp = this.mInstances[i];
            tmp.stop();
         }
      }
      
      public function setVolume(volume:Number) : void
      {
         var tmp:SoundInst = null;
         this.mVolume = volume;
         var numInst:int = this.mInstances.length;
         for(var i:int = 0; i < numInst; i++)
         {
            tmp = this.mInstances[i];
            tmp.setVolume(volume);
         }
      }
   }
}
