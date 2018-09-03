module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module images {
						export class ImageDescriptor extends egret.HashObject {
							public mRows:number = 1;
							public mAlphaClass:any = null;
							public mCols:number = 1;
							public mRGBClass:any = null;
							private mResource:com.popcap.flash.framework.resources.images.ImageResource = null;

							public constructor(rgbClass:any,alphaClass:any,rows:number,cols:number)
							{
								super();
								rows = flash.checkInt(rows);
								cols = flash.checkInt(cols);
								super();
								this.mRGBClass = rgbClass;
								this.mAlphaClass = alphaClass;
								this.mRows = flash.checkInt(rows);
								this.mCols = flash.checkInt(cols);
							}

							private mergeData():flash.BitmapData
							{
								var imgData:flash.BitmapData = <any>null;
								var rgbData:flash.BitmapData = <any>null;
								var alphaData:flash.BitmapData = <any>null;
								if(this.mRGBClass != null)
								{
									rgbData = (flash.As3As(new this.mRGBClass(),flash.Bitmap)).bitmapData;
								}
								if(this.mAlphaClass != null)
								{
									alphaData = (flash.As3As(new this.mAlphaClass(),flash.Bitmap)).bitmapData;
								}
								if(rgbData != null)
								{
									imgData = new flash.BitmapData(rgbData.width,rgbData.height,true,0);
								}
								else if(alphaData != null)
								{
									imgData = new flash.BitmapData(alphaData.width,alphaData.height,true,0);
								}
								if(imgData == null)
								{
									throw new flash.Error("Image is empty.").message;
								}
								var srcRect:egret.Rectangle = new egret.Rectangle();
								srcRect.width = imgData.width;
								srcRect.height = imgData.height;
								var destPt:egret.Point = new egret.Point();
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
									imgData["copyChannel"](alphaData,srcRect,destPt,BitmapDataChannel.RED,BitmapDataChannel.ALPHA);
								}
								return imgData;
							}

							public getResource():com.popcap.flash.framework.resources.images.ImageResource
							{
								if(this.mResource != null)
								{
									return this.mResource;
								}
								this.mResource = new com.popcap.flash.framework.resources.images.ImageResource();
								this.mResource.mRows = flash.checkInt(this.mRows);
								this.mResource.mCols = flash.checkInt(this.mCols);
								this.mResource.mNumFrames = flash.checkInt(this.mRows * this.mCols);
								this.mResource.mFrames = this.sliceFrames(this.mergeData());
								this.mResource.mSrcRect.width = this.mResource.mFrames[0]["width"];
								this.mResource.mSrcRect.height = this.mResource.mFrames[0]["height"];
								return this.mResource;
							}

							private sliceFrames(bd:flash.BitmapData):Array<flash.BitmapData>
							{
								var row:number = <any>NaN;
								var col:number = <any>NaN;
								var subPixels:flash.BitmapData = <any>null;
								var srcRect:egret.Rectangle = <any>null;
								var frameWidth:number = bd.width / this.mCols;
								var frameHeight:number = bd.height / this.mRows;
								var frameRect:egret.Rectangle = new egret.Rectangle(0,0,frameWidth,frameHeight);
								var destPt:egret.Point = new egret.Point(0,0);
								var frames:Array<flash.BitmapData> = new Array<flash.BitmapData>();
								var numFrames:number = flash.checkInt(this.mRows * this.mCols);
								for(var i:number = flash.checkInt(0);i < numFrames; i++)
								{
									row = flash.tranint(i / this.mCols);
									col = i % this.mCols;
									subPixels = new flash.BitmapData(frameWidth,frameHeight);
									srcRect = new egret.Rectangle(col * frameWidth,row * frameHeight,frameWidth,frameHeight);
									subPixels.copyPixels(bd,srcRect,destPt);
									frames[i] = subPixels;
								}
								bd.dispose();
								return frames;
							}

						}
					}
				}
			}
		}
	}
}

