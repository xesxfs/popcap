module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module fonts {
						export class FontLayer extends egret.HashObject {
							protected mExcludedTags:Array<string>;
							public offset:egret.Point;
							protected mSpacing:number = 0;
							public color:flash.ColorTransform;
							protected mRequiredTags:Array<string>;
							protected mAscent:number = 0;
							protected mAscentPadding:number = 0;
							protected mCharData:flash.Dictionary;
							protected mImage:flash.BitmapData;
							protected mHeight:number = 0;
							protected mLineSpacingOffset:number = 0;
							public layerName:string;
							public baseOrder:number = 0;

							public constructor()
							{
								super();
								super();
								this.color = new flash.ColorTransform();
								this.offset = new egret.Point();
								this.mCharData = new flash.Dictionary();
								this.mRequiredTags = new Array<string>();
								this.mExcludedTags = new Array<string>();
							}

							protected create(rgb:any,alpha:any,charList:Array<any>,charOffsets:Array<any>,widthList:Array<any>,charRects:Array<any>,kernPairs:Array<any>,kernValues:Array<any>)
							{
								var char:string = <any>null;
								var data:com.popcap.flash.framework.resources.fonts.FontCharData = <any>null;
								var img:flash.BitmapData = <any>null;
								var pair:string = <any>null;
								var prev:string = <any>null;
								var next:string = <any>null;
								var cd:com.popcap.flash.framework.resources.fonts.FontCharData = <any>null;
								var layerImg:flash.BitmapData = this.merge(rgb,alpha);
								var srcRect:egret.Rectangle = new egret.Rectangle();
								var destPt:egret.Point = new egret.Point();
								var numChars:number = flash.checkInt(charList.length);
								for(var i:number = flash.checkInt(0);i < numChars; i++)
								{
									char = charList[i];
									data = new com.popcap.flash.framework.resources.fonts.FontCharData();
									data.width = flash.checkInt(widthList[i]);
									data.offset = new egret.Point(charOffsets[i][0],charOffsets[i][1]);
									srcRect.x = charRects[i][0];
									srcRect.y = charRects[i][1];
									srcRect.width = charRects[i][2];
									srcRect.height = charRects[i][3];
									if(srcRect.width > 0 && srcRect.height > 0)
									{
										img = new flash.BitmapData(srcRect.width,srcRect.height,true,0);
										if(layerImg != null)
										{
											img.copyPixels(layerImg,srcRect,destPt);
										}
										data.image = img;
									}
									this.mCharData.setItem(char,data);
								}
								var numPairs:number = flash.checkInt(kernPairs.length);
								for(var j:number = flash.checkInt(0);j < numPairs; j++)
								{
									pair = kernPairs[j];
									prev = pair.charAt(0);
									next = pair.charAt(1);
									cd = this.mCharData.getItem(prev);
									cd.kerningOffsets.setItem(next,kernValues[j]);
								}
								layerImg.dispose();
							}

							public GetCharData(char:string):com.popcap.flash.framework.resources.fonts.FontCharData
							{
								return this.mCharData.getItem(char);
							}

							public MatchesTags(tags:flash.Dictionary):boolean
							{
								var tag:string = <any>null;
								var numTags:number = flash.checkInt(this.mExcludedTags.length);
								for(var i:number = flash.checkInt(0);i < numTags; i++)
								{
									tag = this.mExcludedTags[i];
									if(tags.getItem(tag) != undefined)
									{
										return false;
									}
								}
								numTags = flash.checkInt(this.mRequiredTags.length);
								for(i = flash.checkInt(0); i < numTags; i++)
								{
									tag = this.mRequiredTags[i];
									if(tags.getItem(tag) == undefined)
									{
										return false;
									}
								}
								return true;
							}

							public get spacing():number
							{
								return this.mSpacing;
							}

							public get ascentPadding():number
							{
								return this.mAscentPadding;
							}

							public get ascent():number
							{
								return this.mAscent;
							}

							public get lineSpacingOffset():number
							{
								return this.mLineSpacingOffset;
							}

							public IsTagExcluded(tag:string):boolean
							{
								return this.mExcludedTags.indexOf(tag) >= 0;
							}

							public IsTagRequired(tag:string):boolean
							{
								return this.mRequiredTags.indexOf(tag) >= 0;
							}

							public get height():number
							{
								return this.mHeight;
							}

							private merge(rgb:any,alpha:any):flash.BitmapData
							{
								var imgData:flash.BitmapData = <any>null;
								var rgbData:flash.BitmapData = <any>null;
								var alphaData:flash.BitmapData = <any>null;
								if(rgb != null)
								{
									rgbData = (flash.As3As(new rgb(),flash.Bitmap)).bitmapData;
								}
								if(alpha != null)
								{
									alphaData = (flash.As3As(new alpha(),flash.Bitmap)).bitmapData;
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
									return null;
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

						}
					}
				}
			}
		}
	}
}

