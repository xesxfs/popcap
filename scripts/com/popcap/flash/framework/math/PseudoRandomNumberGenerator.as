package com.popcap.flash.framework.math
{
   public interface PseudoRandomNumberGenerator
   {
       
      
      function Next() : Number;
      
      function SetSeed(param1:Number) : void;
      
      function Reset() : void;
   }
}
