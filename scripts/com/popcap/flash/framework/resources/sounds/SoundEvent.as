package com.popcap.flash.framework.resources.sounds
{
   import flash.events.Event;
   
   public class SoundEvent extends Event
   {
      
      public static const SOUND_UNMUTED:String = "SoundUnmuted";
      
      public static const SOUND_MUTED:String = "SoundMuted";
       
      
      public function SoundEvent(type:String)
      {
         super(type);
      }
      
      public static function Unmuted() : SoundEvent
      {
         return new SoundEvent(SOUND_UNMUTED);
      }
      
      public static function Muted() : SoundEvent
      {
         return new SoundEvent(SOUND_MUTED);
      }
   }
}
