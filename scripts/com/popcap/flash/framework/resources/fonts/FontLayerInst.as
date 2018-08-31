package com.popcap.flash.framework.resources.fonts
{
   import flash.geom.ColorTransform;
   
   public class FontLayerInst
   {
       
      
      public var color:ColorTransform;
      
      private var mSourceLayer:FontLayer;
      
      public function FontLayerInst(source:FontLayer)
      {
         super();
         this.color = new ColorTransform();
         this.mSourceLayer = source;
      }
      
      public function get sourceLayer() : FontLayer
      {
         return this.mSourceLayer;
      }
   }
}
