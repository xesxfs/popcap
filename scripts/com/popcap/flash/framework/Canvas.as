package com.popcap.flash.framework
{
   import com.popcap.flash.framework.resources.images.ImageInst;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Canvas
   {
       
      
      private var mScratch:BitmapData;
      
      private var mSize:int;
      
      private var mMatrix:Matrix;
      
      private var mDepth:int;
      
      private var mState:Vector.<Matrix>;
      
      private var mCanvas:BitmapData;
      
      private var mDest:Point;
      
      private var mSrc:Rectangle;
      
      public function Canvas(width:int, height:int)
      {
         this.mDest = new Point();
         this.mSrc = new Rectangle();
         super();
         this.mCanvas = new BitmapData(width,height,true,16777215);
         this.mScratch = new BitmapData(width,height,true,16777215);
         this.mState = new Vector.<Matrix>();
         this.mMatrix = new Matrix();
         this.mDepth = 0;
      }
      
      public function draw(img:ImageInst) : void
      {
         var pixels:BitmapData = img.mSource.mFrames[img.mFrame];
         var color:ColorTransform = null;
         if(img.mIsColored)
         {
            color = img.mColor;
         }
         var blend:String = BlendMode.NORMAL;
         if(img.mIsAdditive)
         {
            blend = BlendMode.ADD;
         }
         var matrix:Matrix = img.mMatrix;
         matrix.translate(this.mMatrix.tx,this.mMatrix.ty);
         this.mCanvas.draw(pixels,matrix,color,blend,null,img.mIsSmoothed);
         matrix.translate(-this.mMatrix.tx,-this.mMatrix.ty);
      }
      
      public function fillRect(x:Number, y:Number, w:Number, h:Number, color:int) : void
      {
         this.mSrc.x = x;
         this.mSrc.y = y;
         this.mSrc.width = w;
         this.mSrc.height = h;
         this.mScratch.fillRect(this.mSrc,color);
         this.mDest.x = x + this.mMatrix.tx;
         this.mDest.y = y + this.mMatrix.ty;
         this.mCanvas.copyPixels(this.mScratch,this.mSrc,this.mDest,null,null,true);
      }
      
      public function getData() : BitmapData
      {
         return this.mCanvas;
      }
      
      public function popMatrix() : void
      {
         if(this.mDepth == 0)
         {
            return;
         }
         this.mDepth--;
         this.mMatrix = this.mState[this.mDepth];
      }
      
      public function addRect(x:Number, y:Number, w:Number, h:Number, color:int) : void
      {
         this.mSrc.x = x;
         this.mSrc.y = y;
         this.mSrc.width = w;
         this.mSrc.height = h;
         this.mScratch.fillRect(this.mSrc,color);
         this.mDest.x = x + this.mMatrix.tx;
         this.mDest.y = y + this.mMatrix.ty;
         this.mCanvas.draw(this.mScratch,this.mMatrix,null,BlendMode.ADD,null,false);
      }
      
      public function blit(img:ImageInst) : void
      {
         if(img.mIsTransformed || img.mIsAdditive)
         {
            this.draw(img);
            return;
         }
         var pixels:BitmapData = img.mSource.mFrames[img.mFrame];
         var srcRect:Rectangle = img.mSource.mSrcRect;
         if(img.mIsColored)
         {
            this.mDest.x = 0;
            this.mDest.y = 0;
            this.mScratch.copyPixels(pixels,srcRect,this.mDest);
            this.mScratch.colorTransform(srcRect,img.mColor);
            pixels = this.mScratch;
         }
         this.mDest.x = img.mPos.x + this.mMatrix.tx;
         this.mDest.y = img.mPos.y + this.mMatrix.ty;
         this.mCanvas.copyPixels(pixels,srcRect,this.mDest,null,null,true);
      }
      
      public function getMatrix() : Matrix
      {
         return this.mMatrix;
      }
      
      public function pushMatrix() : void
      {
         this.mState[this.mDepth] = this.mMatrix;
         var oldMatrix:Matrix = this.mMatrix;
         this.mDepth++;
         if(this.mDepth > this.mSize)
         {
            this.mMatrix = new Matrix();
            this.mSize = this.mDepth;
            this.mState[this.mDepth] = this.mMatrix;
         }
         this.mMatrix = this.mState[this.mDepth];
         this.mMatrix.identity();
         this.mMatrix.concat(oldMatrix);
      }
      
      public function copy(canvas:Canvas) : void
      {
         var pixels:BitmapData = canvas.getData();
         this.mSrc.x = 0;
         this.mSrc.y = 0;
         this.mSrc.width = pixels.width;
         this.mSrc.height = pixels.height;
         this.mDest.x = this.mMatrix.tx;
         this.mDest.y = this.mMatrix.ty;
         this.mCanvas.copyPixels(pixels,this.mSrc,this.mDest,null,null,true);
      }
   }
}
