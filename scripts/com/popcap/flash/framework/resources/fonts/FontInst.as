package com.popcap.flash.framework.resources.fonts
{
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   
   public class FontInst
   {
       
      
      private var mPointSize:int;
      
      private var mLayers:Vector.<FontLayerInst>;
      
      private var mScale:Number = 1.0;
      
      private var mTags:Dictionary;
      
      private var mSource:FontResource;
      
      public function FontInst()
      {
         super();
         this.mTags = new Dictionary();
         this.mLayers = new Vector.<FontLayerInst>();
      }
      
      public function HasTag(tag:String) : Boolean
      {
         return this.mTags[tag] != undefined;
      }
      
      public function get scale() : Number
      {
         return this.mScale;
      }
      
      public function set scale(scale:Number) : void
      {
         this.mScale = scale;
         this.mPointSize = int(this.defaultPointSize * this.mScale);
      }
      
      public function DrawString(str:String, img:BitmapData, x:Number, y:Number) : void
      {
         var char:String = null;
         var nextChar:String = null;
         var maxXPos:Number = NaN;
         var i:int = 0;
         var layerInst:FontLayerInst = null;
         var baseLayer:FontLayer = null;
         var data:FontCharData = null;
         var layerXPos:Number = NaN;
         var spacing:Number = NaN;
         var charWidth:Number = NaN;
         var imageX:Number = NaN;
         var imageY:Number = NaN;
         var offset:Number = NaN;
         var color:ColorTransform = null;
         var image:BitmapData = null;
         var matrix:Matrix = null;
         var command:Array = null;
         var commands:Array = null;
         var list:Array = null;
         var c:int = 0;
         var cmd:Array = null;
         var renderCommands:Array = new Array();
         var curXPos:Number = 0;
         var numChars:int = str.length;
         var numLayers:int = this.numLayers;
         for(var j:int = 0; j < numChars; j++)
         {
            char = str.charAt(j);
            nextChar = str.charAt(j + 1);
            maxXPos = curXPos;
            for(i = 0; i < numLayers; i++)
            {
               layerInst = this.GetLayer(i);
               baseLayer = layerInst.sourceLayer;
               data = baseLayer.GetCharData(char);
               layerXPos = curXPos;
               spacing = 0;
               charWidth = data.width;
               imageX = layerXPos + baseLayer.offset.x + data.offset.x;
               imageY = -(baseLayer.ascent - baseLayer.offset.y - data.offset.y);
               if(nextChar != "")
               {
                  spacing = baseLayer.spacing;
                  offset = data.kerningOffsets[nextChar];
                  if(!isNaN(offset))
                  {
                     spacing = spacing + offset;
                  }
               }
               if(data.image != null)
               {
                  color = new ColorTransform();
                  color.concat(layerInst.color);
                  color.concat(baseLayer.color);
                  image = data.image;
                  matrix = new Matrix();
                  matrix.translate(imageX,imageY);
                  matrix.scale(this.mScale,this.mScale);
                  matrix.translate(x,y);
                  command = [image,matrix,color];
                  commands = renderCommands[baseLayer.baseOrder];
                  if(commands == null)
                  {
                     commands = new Array();
                     renderCommands[baseLayer.baseOrder] = commands;
                  }
                  commands.push(command);
               }
               layerXPos = layerXPos + (charWidth + spacing);
               if(layerXPos > maxXPos)
               {
                  maxXPos = layerXPos;
               }
            }
            curXPos = maxXPos;
         }
         for(var order:int = 0; order < renderCommands.length; order++)
         {
            list = renderCommands[order];
            if(list != null)
            {
               for(c = 0; c < list.length; c++)
               {
                  cmd = list[c];
                  img.draw(cmd[0],cmd[1],cmd[2],null,null,true);
               }
            }
         }
      }
      
      public function RemoveTag(tag:String) : void
      {
         delete this.mTags[tag];
         this.RefreshLayers();
      }
      
      public function AddTag(tag:String) : void
      {
         this.mTags[tag] = tag;
         this.RefreshLayers();
      }
      
      public function get ascent() : Number
      {
         return this.source.ascent * this.mScale;
      }
      
      public function get source() : FontResource
      {
         return this.mSource;
      }
      
      public function GetStringWidth(str:String) : Number
      {
         return this.source.GetStringWidth(str) * this.mScale;
      }
      
      public function set pointSize(size:int) : void
      {
         this.mPointSize = size;
         this.mScale = size / this.defaultPointSize;
      }
      
      private function RefreshLayers() : void
      {
         var layer:FontLayer = null;
         this.mLayers.length = 0;
         var numLayers:int = this.source.numLayers;
         for(var i:int = 0; i < numLayers; i++)
         {
            layer = this.source.GetLayer(i);
            if(layer.MatchesTags(this.mTags))
            {
               this.mLayers.push(new FontLayerInst(layer));
            }
         }
      }
      
      public function get height() : Number
      {
         return this.source.height * this.mScale;
      }
      
      public function get numLayers() : int
      {
         return this.mLayers.length;
      }
      
      public function get defaultPointSize() : int
      {
         return this.source.pointSize;
      }
      
      public function get pointSize() : int
      {
         return this.mPointSize;
      }
      
      public function GetStringImageWidth(str:String) : Number
      {
         return this.source.GetStringImageWidth(str) * this.mScale;
      }
      
      public function set source(value:FontResource) : void
      {
         this.mSource = value;
         this.RefreshLayers();
      }
      
      public function GetLayer(index:int) : FontLayerInst
      {
         return this.mLayers[index];
      }
      
      public function get lineSpacing() : Number
      {
         return this.source.lineSpacing * this.mScale;
      }
   }
}
