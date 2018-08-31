package com.popcap.flash.framework.resources.fonts
{
   import flash.utils.Dictionary;
   
   public class FontResource
   {
       
      
      protected var mLineSpacing:int = 0;
      
      protected var mAscent:int = 0;
      
      protected var mLayerList:Vector.<FontLayer>;
      
      protected var mPointSize:int = 0;
      
      protected var mHeight:int = 0;
      
      protected var mLayerMap:Dictionary;
      
      public function FontResource()
      {
         super();
         this.mLayerList = new Vector.<FontLayer>();
         this.mLayerMap = new Dictionary();
      }
      
      public function get ascent() : int
      {
         return this.mAscent;
      }
      
      public function GetStringWidth(str:String) : Number
      {
         var aChar:String = null;
         var aWidth:Number = 0;
         var aPrevChar:String = null;
         var aLen:int = str.length;
         for(var i:int = 0; i < aLen; i++)
         {
            aChar = str.charAt(i);
            aWidth = aWidth + this.GetCharWidthKern(aChar,aPrevChar);
            aPrevChar = aChar;
         }
         return aWidth;
      }
      
      public function get pointSize() : int
      {
         return this.mPointSize;
      }
      
      public function GetCharWidth(char:String) : int
      {
         return this.GetCharWidthKern(char,null);
      }
      
      public function get height() : int
      {
         return this.mHeight;
      }
      
      public function get numLayers() : int
      {
         return this.mLayerList.length;
      }
      
      public function GetStringImageWidth(str:String) : Number
      {
         var char:String = null;
         var nextChar:String = null;
         var maxXPos:Number = NaN;
         var i:int = 0;
         var baseLayer:FontLayer = null;
         var data:FontCharData = null;
         var layerXPos:Number = NaN;
         var spacing:Number = NaN;
         var charWidth:Number = NaN;
         var imageX:Number = NaN;
         var offset:Number = NaN;
         var curXPos:Number = 0;
         var numChars:int = str.length;
         var numLayers:int = this.mLayerList.length;
         for(var j:int = 0; j < numChars; j++)
         {
            char = str.charAt(j);
            nextChar = str.charAt(j + 1);
            maxXPos = curXPos;
            for(i = 0; i < numLayers; i++)
            {
               baseLayer = this.mLayerList[i];
               data = baseLayer.GetCharData(char);
               layerXPos = curXPos;
               spacing = 0;
               charWidth = data.width;
               imageX = layerXPos + baseLayer.offset.x + data.offset.x;
               if(nextChar != "")
               {
                  spacing = baseLayer.spacing;
                  offset = data.kerningOffsets[nextChar];
                  if(!isNaN(offset))
                  {
                     spacing = spacing + offset;
                  }
               }
               layerXPos = layerXPos + (charWidth + spacing);
               if(layerXPos > maxXPos)
               {
                  maxXPos = layerXPos;
               }
            }
            curXPos = maxXPos;
         }
         return curXPos;
      }
      
      public function GetLayer(index:int) : FontLayer
      {
         return this.mLayerList[index];
      }
      
      protected function init(pointSize:int, layers:Vector.<FontLayer>) : void
      {
         var layer:FontLayer = null;
         var t:int = 0;
         var b:int = 0;
         this.mPointSize = pointSize;
         this.mLayerList = layers;
         var top:int = int.MAX_VALUE;
         var bottom:int = int.MIN_VALUE;
         var numLayers:int = this.mLayerList.length;
         for(var i:int = 0; i < numLayers; i++)
         {
            layer = this.mLayerList[i];
            t = layer.offset.y;
            b = t + layer.height - 1;
            top = t < top?int(t):int(top);
            bottom = b > bottom?int(b):int(bottom);
            this.mLayerMap[layer.layerName] = layer;
         }
         this.mHeight = bottom - top;
      }
      
      public function get lineSpacing() : int
      {
         return this.mLineSpacing;
      }
      
      public function GetCharWidthKern(char:String, prev:String) : int
      {
         var layer:FontLayer = null;
         var cData:FontCharData = null;
         var pData:FontCharData = null;
         var w:int = 0;
         var width:int = 0;
         var numLayers:int = this.mLayerList.length;
         for(var i:int = 0; i < numLayers; i++)
         {
            layer = this.mLayerList[i];
            cData = layer.GetCharData(char);
            pData = layer.GetCharData(prev);
            w = cData.width;
            if(pData != null)
            {
               w = w + pData.kerningOffsets[char];
            }
            width = w > width?int(w):int(width);
         }
         return width;
      }
   }
}
