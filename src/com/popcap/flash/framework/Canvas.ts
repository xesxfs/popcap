module com {
	export module popcap {
		export module flash {
			export module framework {
				export class Canvas extends egret.HashObject {
					private mScratch:flash.BitmapData;
					private mSize:number = 0;
					private mMatrix:egret.Matrix;
					private mDepth:number = 0;
					private mState:Array<egret.Matrix>;
					private mCanvas:flash.BitmapData;
					private mDest:egret.Point;
					private mSrc:egret.Rectangle;

					public constructor(width:number,height:number)
					{
						super();
						width = flash.checkInt(width);
						height = flash.checkInt(height);
						super();
						this.mDest = new egret.Point();
						this.mSrc = new egret.Rectangle();
						this.mCanvas = new flash.BitmapData(width,height,true,16777215);
						this.mScratch = new flash.BitmapData(width,height,true,16777215);
						this.mState = new Array<egret.Matrix>();
						this.mMatrix = new egret.Matrix();
						this.mDepth = flash.checkInt(0);
					}

					public draw(img:com.popcap.flash.framework.resources.images.ImageInst)
					{
						var pixels:flash.BitmapData = <any>img.mSource.mFrames[img.mFrame];
						var color:flash.ColorTransform = <any>null;
						if(img.mIsColored)
						{
							color = img.mColor;
						}
						var blend:string = egret.BlendMode.NORMAL;
						if(img.mIsAdditive)
						{
							blend = egret.BlendMode.ADD;
						}
						var matrix:egret.Matrix = img.mMatrix;
						matrix.translate(this.mMatrix.tx,this.mMatrix.ty);
						this.mCanvas.draw2(pixels,matrix,color,blend,null,img.mIsSmoothed);
						matrix.translate(-this.mMatrix.tx,-this.mMatrix.ty);
					}

					public fillRect(x:number,y:number,w:number,h:number,color:number)
					{
						color = flash.checkInt(color);
						this.mSrc.x = x;
						this.mSrc.y = y;
						this.mSrc.width = w;
						this.mSrc.height = h;
						this.mScratch["fillRect"](this.mSrc,color);
						this.mDest.x = x + this.mMatrix.tx;
						this.mDest.y = y + this.mMatrix.ty;
						this.mCanvas.copyPixels(this.mScratch,this.mSrc,this.mDest,null,null,true);
					}

					public getData():flash.BitmapData
					{
						return this.mCanvas;
					}

					public popMatrix()
					{
						if(this.mDepth == 0)
						{
							return ;
						}
						this.mDepth--;
						this.mMatrix = this.mState[this.mDepth];
					}

					public addRect(x:number,y:number,w:number,h:number,color:number)
					{
						color = flash.checkInt(color);
						this.mSrc.x = x;
						this.mSrc.y = y;
						this.mSrc.width = w;
						this.mSrc.height = h;
						this.mScratch["fillRect"](this.mSrc,color);
						this.mDest.x = x + this.mMatrix.tx;
						this.mDest.y = y + this.mMatrix.ty;
						this.mCanvas.draw2(this.mScratch,this.mMatrix,null,egret.BlendMode.ADD,null,false);
					}

					public blit(img:com.popcap.flash.framework.resources.images.ImageInst)
					{
						if(img.mIsTransformed || img.mIsAdditive)
						{
							this.draw(img);
							return ;
						}
						var pixels:flash.BitmapData = <any>img.mSource.mFrames[img.mFrame];
						var srcRect:egret.Rectangle = img.mSource.mSrcRect;
						if(img.mIsColored)
						{
							this.mDest.x = 0;
							this.mDest.y = 0;
							this.mScratch.copyPixels(pixels,srcRect,this.mDest);
							this.mScratch["colorTransform"](srcRect,img.mColor);
							pixels = this.mScratch;
						}
						this.mDest.x = img.mPos.x + this.mMatrix.tx;
						this.mDest.y = img.mPos.y + this.mMatrix.ty;
						this.mCanvas.copyPixels(pixels,srcRect,this.mDest,null,null,true);
					}

					public getMatrix():egret.Matrix
					{
						return this.mMatrix;
					}

					public pushMatrix()
					{
						this.mState[this.mDepth] = this.mMatrix;
						var oldMatrix:egret.Matrix = this.mMatrix;
						this.mDepth++;
						if(this.mDepth > this.mSize)
						{
							this.mMatrix = new egret.Matrix();
							this.mSize = flash.checkInt(this.mDepth);
							this.mState[this.mDepth] = this.mMatrix;
						}
						this.mMatrix = this.mState[this.mDepth];
						this.mMatrix.identity();
						this.mMatrix.concat(oldMatrix);
					}

					public copy(canvas:com.popcap.flash.framework.Canvas)
					{
						var pixels:flash.BitmapData = canvas.getData();
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
		}
	}
}

