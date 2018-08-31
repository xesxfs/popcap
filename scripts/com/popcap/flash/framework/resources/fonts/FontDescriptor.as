package com.popcap.flash.framework.resources.fonts
{
   public class FontDescriptor
   {
       
      
      private var mRes:FontResource;
      
      private var mClass:Class;
      
      public function FontDescriptor(fontClass:Class)
      {
         super();
         this.mClass = fontClass;
      }
      
      public function getResource() : FontResource
      {
         if(this.mRes == null)
         {
            this.mRes = new this.mClass();
         }
         return this.mRes;
      }
   }
}
