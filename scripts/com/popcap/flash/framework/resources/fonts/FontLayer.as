package com.popcap.flash.framework.resources.fonts
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class FontLayer
   {
       
      
      protected var mExcludedTags:Vector.<String>;
      
      public var offset:Point;
      
      protected var mSpacing:int = 0;
      
      public var color:ColorTransform;
      
      protected var mRequiredTags:Vector.<String>;
      
      protected var mAscent:int = 0;
      
      protected var mAscentPadding:int = 0;
      
      protected var mCharData:Dictionary;
      
      protected var mImage:BitmapData;
      
      protected var mHeight:int = 0;
      
      protected var mLineSpacingOffset:int = 0;
      
      public var layerName:String;
      
      public var baseOrder:int = 0;
      
      public function FontLayer()
      {
         super();
         this.color = new ColorTransform();
         this.offset = new Point();
         this.mCharData = new Dictionary();
         this.mRequiredTags = new Vector.<String>();
         this.mExcludedTags = new Vector.<String>();
      }
      
      protected function create(rgb:Class, alpha:Class, charList:Array, charOffsets:Array, widthList:Array, charRects:Array, kernPairs:Array, kernValues:Array) : void
      {
         var char:String = null;
         var data:FontCharData = null;
         var img:BitmapData = null;
         var pair:String = null;
         var prev:String = null;
         var next:String = null;
         var cd:FontCharData = null;
         var layerImg:BitmapData = this.merge(rgb,alpha);
         var srcRect:Rectangle = new Rectangle();
         var destPt:Point = new Point();
         var numChars:int = charList.length;
         for(var i:int = 0; i < numChars; i++)
         {
            char = charList[i];
            data = new FontCharData();
            data.width = widthList[i];
            data.offset = new Point(charOffsets[i][0],charOffsets[i][1]);
            srcRect.x = charRects[i][0];
            srcRect.y = charRects[i][1];
            srcRect.width = charRects[i][2];
            srcRect.height = charRects[i][3];
            if(srcRect.width > 0 && srcRect.height > 0)
            {
               img = new BitmapData(srcRect.width,srcRect.height,true,0);
               if(layerImg != null)
               {
                  img.copyPixels(layerImg,srcRect,destPt);
               }
               data.image = img;
            }
            this.mCharData[char] = data;
         }
         var numPairs:int = kernPairs.length;
         for(var j:int = 0; j < numPairs; j++)
         {
            pair = kernPairs[j];
            prev = pair.charAt(0);
            next = pair.charAt(1);
            cd = this.mCharData[prev];
            cd.kerningOffsets[next] = kernValues[j];
         }
         layerImg.dispose();
      }
      
      public function GetCharData(char:String) : FontCharData
      {
         return this.mCharData[char];
      }
      
      public function MatchesTags(tags:Dictionary) : Boolean
      {
         var tag:String = null;
         var numTags:int = this.mExcludedTags.length;
         for(var i:int = 0; i < numTags; i++)
         {
            tag = this.mExcludedTags[i];
            if(tags[tag] != undefined)
            {
               return false;
            }
         }
         numTags = this.mRequiredTags.length;
         for(i = 0; i < numTags; i++)
         {
            tag = this.mRequiredTags[i];
            if(tags[tag] == undefined)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get spacing() : int
      {
         return this.mSpacing;
      }
      
      public function get ascentPadding() : int
      {
         return this.mAscentPadding;
      }
      
      public function get ascent() : int
      {
         return this.mAscent;
      }
      
      public function get lineSpacingOffset() : int
      {
         return this.mLineSpacingOffset;
      }
      
      public function IsTagExcluded(tag:String) : Boolean
      {
         return this.mExcludedTags.indexOf(tag) >= 0;
      }
      
      public function IsTagRequired(tag:String) : Boolean
      {
         return this.mRequiredTags.indexOf(tag) >= 0;
      }
      
      public function get height() : int
      {
         return this.mHeight;
      }
      
      private function merge(rgb:Class, alpha:Class) : BitmapData
      {
         var imgData:BitmapData = null;
         var rgbData:BitmapData = null;
         var alphaData:BitmapData = null;
         if(rgb != null)
         {
            rgbData = (new rgb() as Bitmap).bitmapData;
         }
         if(alpha != null)
         {
            alphaData = (new alpha() as Bitmap).bitmapData;
         }
         if(rgbData != null)
         {
            imgData = new BitmapData(rgbData.width,rgbData.height,true,0);
         }
         else if(alphaData != null)
         {
            imgData = new BitmapData(alphaData.width,alphaData.height,true,0);
         }
         if(imgData == null)
         {
            return null;
         }
         var srcRect:Rectangle = new Rectangle();
         srcRect.width = imgData.width;
         srcRect.height = imgData.height;
         var destPt:Point = new Point();
         if(rgbData != null)
         {
            imgData.copyPixels(rgbData,srcRect,destPt);
         }
         if(alphaData != null)
         {
            if(rgbData == null)
            {
               imgData.copyPixels(alphaData,srcRect,destPt);
            }
            imgData.copyChannel(alphaData,srcRect,destPt,BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
         }
         return imgData;
      }
   }
}
