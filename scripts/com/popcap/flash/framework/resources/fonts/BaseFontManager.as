package com.popcap.flash.framework.resources.fonts
{
   import flash.utils.Dictionary;
   
   public class BaseFontManager implements FontManager
   {
       
      
      protected var mFonts:Dictionary;
      
      public function BaseFontManager()
      {
         super();
         this.mFonts = new Dictionary();
      }
      
      public function getFontResource(id:String) : FontResource
      {
         var desc:FontDescriptor = this.mFonts[id];
         if(desc == null)
         {
            return null;
         }
         var res:FontResource = desc.getResource();
         if(res == null)
         {
            return null;
         }
         return res;
      }
      
      public function getFontInst(id:String) : FontInst
      {
         var res:FontResource = this.getFontResource(id);
         if(res == null)
         {
            return null;
         }
         var inst:FontInst = new FontInst();
         inst.source = res;
         return inst;
      }
   }
}
