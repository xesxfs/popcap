module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module images {
						export class ImageInst extends egret.HashObject {
							public mFrame:number = 0;
							public mIsColored:boolean = false;
							public mIsTransformed:boolean = false;
							public mMatrix:egret.Matrix;
							public mOffset:egret.Point;
							public mIsAdditive:boolean = false;
							public mIsSmoothed:boolean = false;
							public mPos:egret.Point;
							public mSource:com.popcap.flash.framework.resources.images.ImageResource = null;
							public mColor:flash.ColorTransform;

							public constructor()
							{
								super();
								super();
								this.mPos = new egret.Point();
								this.mOffset = new egret.Point();
								this.mMatrix = new egret.Matrix();
								this.mColor = new flash.ColorTransform();
							}

							public get width():number
							{
								return this.mSource.mSrcRect.width;
							}

							public get pixels():flash.BitmapData
							{
								return this.mSource.mFrames[this.mFrame];
							}

							public get height():number
							{
								return this.mSource.mSrcRect.height;
							}

							public set x(value:number)
							{
								this.mPos.x = value;
								this.mMatrix.tx = value;
							}

							public set y(value:number)
							{
								this.mPos.y = value;
								this.mMatrix.ty = value;
							}

							public get x():number
							{
								return this.mPos.x;
							}

							public get y():number
							{
								return this.mPos.y;
							}

						}
					}
				}
			}
		}
	}
}

