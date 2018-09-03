module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module fonts {
						export class FontResource extends egret.HashObject {
							protected mLineSpacing:number = 0;
							protected mAscent:number = 0;
							protected mLayerList:Array<com.popcap.flash.framework.resources.fonts.FontLayer>;
							protected mPointSize:number = 0;
							protected mHeight:number = 0;
							protected mLayerMap:flash.Dictionary;

							public constructor()
							{
								super();
								super();
								this.mLayerList = new Array<com.popcap.flash.framework.resources.fonts.FontLayer>();
								this.mLayerMap = new flash.Dictionary();
							}

							public get ascent():number
							{
								return this.mAscent;
							}

							public GetStringWidth(str:string):number
							{
								var aChar:string = <any>null;
								var aWidth:number = <any>0;
								var aPrevChar:string = <any>null;
								var aLen:number = flash.checkInt(str.length);
								for(var i:number = flash.checkInt(0);i < aLen; i++)
								{
									aChar = str.charAt(i);
									aWidth = aWidth + this.GetCharWidthKern(aChar,aPrevChar);
									aPrevChar = aChar;
								}
								return aWidth;
							}

							public get pointSize():number
							{
								return this.mPointSize;
							}

							public GetCharWidth(char:string):number
							{
								return this.GetCharWidthKern(char,null);
							}

							public get height():number
							{
								return this.mHeight;
							}

							public get numLayers():number
							{
								return this.mLayerList.length;
							}

							public GetStringImageWidth(str:string):number
							{
								var char:string = <any>null;
								var nextChar:string = <any>null;
								var maxXPos:number = <any>NaN;
								var i:number = flash.checkInt(0);
								var baseLayer:com.popcap.flash.framework.resources.fonts.FontLayer = <any>null;
								var data:com.popcap.flash.framework.resources.fonts.FontCharData = <any>null;
								var layerXPos:number = <any>NaN;
								var spacing:number = <any>NaN;
								var charWidth:number = <any>NaN;
								var imageX:number = <any>NaN;
								var offset:number = <any>NaN;
								var curXPos:number = <any>0;
								var numChars:number = flash.checkInt(str.length);
								var numLayers:number = flash.checkInt(this.mLayerList.length);
								for(var j:number = flash.checkInt(0);j < numChars; j++)
								{
									char = str.charAt(j);
									nextChar = str.charAt(j + 1);
									maxXPos = curXPos;
									for(i = flash.checkInt(0); i < numLayers; i++)
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
											offset = data.kerningOffsets.getItem(nextChar);
											if(<any>!isNaN(offset))
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

							public GetLayer(index:number):com.popcap.flash.framework.resources.fonts.FontLayer
							{
								index = flash.checkInt(index);
								return this.mLayerList[index];
							}

							protected init(pointSize:number,layers:Array<com.popcap.flash.framework.resources.fonts.FontLayer>)
							{
								pointSize = flash.checkInt(pointSize);
								var layer:com.popcap.flash.framework.resources.fonts.FontLayer = <any>null;
								var t:number = flash.checkInt(0);
								var b:number = flash.checkInt(0);
								this.mPointSize = flash.checkInt(pointSize);
								this.mLayerList = layers;
								var top:number = flash.checkInt(flash.int.MAX_VALUE);
								var bottom:number = flash.checkInt(flash.int.MIN_VALUE);
								var numLayers:number = flash.checkInt(this.mLayerList.length);
								for(var i:number = flash.checkInt(0);i < numLayers; i++)
								{
									layer = this.mLayerList[i];
									t = flash.checkInt(layer.offset.y);
									b = flash.checkInt(t + layer.height - 1);
									top = flash.checkInt(t < top?flash.tranint(t):flash.tranint(top));
									bottom = flash.checkInt(b > bottom?flash.tranint(b):flash.tranint(bottom));
									this.mLayerMap.setItem(layer.layerName,layer);
								}
								this.mHeight = flash.checkInt(bottom - top);
							}

							public get lineSpacing():number
							{
								return this.mLineSpacing;
							}

							public GetCharWidthKern(char:string,prev:string):number
							{
								var layer:com.popcap.flash.framework.resources.fonts.FontLayer = <any>null;
								var cData:com.popcap.flash.framework.resources.fonts.FontCharData = <any>null;
								var pData:com.popcap.flash.framework.resources.fonts.FontCharData = <any>null;
								var w:number = flash.checkInt(0);
								var width:number = flash.checkInt(0);
								var numLayers:number = flash.checkInt(this.mLayerList.length);
								for(var i:number = flash.checkInt(0);i < numLayers; i++)
								{
									layer = this.mLayerList[i];
									cData = layer.GetCharData(char);
									pData = layer.GetCharData(prev);
									w = flash.checkInt(cData.width);
									if(pData != null)
									{
										w = flash.checkInt(w + pData.kerningOffsets.getItem(char));
									}
									width = flash.checkInt(w > width?flash.tranint(w):flash.tranint(width));
								}
								return width;
							}

						}
					}
				}
			}
		}
	}
}

