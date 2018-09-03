module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module fonts {
						export class FontInst extends egret.HashObject {
							private mPointSize:number = 0;
							private mLayers:Array<com.popcap.flash.framework.resources.fonts.FontLayerInst>;
							private mScale:number = 1.0;
							private mTags:flash.Dictionary;
							private mSource:com.popcap.flash.framework.resources.fonts.FontResource;

							public constructor()
							{
								super();
								super();
								this.mTags = new flash.Dictionary();
								this.mLayers = new Array<com.popcap.flash.framework.resources.fonts.FontLayerInst>();
							}

							public HasTag(tag:string):boolean
							{
								return this.mTags.getItem(tag) != undefined;
							}

							public get scale():number
							{
								return this.mScale;
							}

							public set scale(scale:number)
							{
								this.mScale = scale;
								this.mPointSize = flash.checkInt(flash.tranint(this.defaultPointSize * this.mScale));
							}

							public DrawString(str:string,img:flash.BitmapData,x:number,y:number)
							{
								var char:string = <any>null;
								var nextChar:string = <any>null;
								var maxXPos:number = <any>NaN;
								var i:number = flash.checkInt(0);
								var layerInst:com.popcap.flash.framework.resources.fonts.FontLayerInst = <any>null;
								var baseLayer:com.popcap.flash.framework.resources.fonts.FontLayer = <any>null;
								var data:com.popcap.flash.framework.resources.fonts.FontCharData = <any>null;
								var layerXPos:number = <any>NaN;
								var spacing:number = <any>NaN;
								var charWidth:number = <any>NaN;
								var imageX:number = <any>NaN;
								var imageY:number = <any>NaN;
								var offset:number = <any>NaN;
								var color:flash.ColorTransform = <any>null;
								var image:flash.BitmapData = <any>null;
								var matrix:egret.Matrix = <any>null;
								var command:Array<any> = <any>null;
								var commands:Array<any> = <any>null;
								var list:Array<any> = <any>null;
								var c:number = flash.checkInt(0);
								var cmd:Array<any> = <any>null;
								var renderCommands:Array<any> = new Array();
								var curXPos:number = <any>0;
								var numChars:number = flash.checkInt(str.length);
								var numLayers:number = flash.checkInt(this.numLayers);
								for(var j:number = flash.checkInt(0);j < numChars; j++)
								{
									char = str.charAt(j);
									nextChar = str.charAt(j + 1);
									maxXPos = curXPos;
									for(i = flash.checkInt(0); i < numLayers; i++)
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
											offset = data.kerningOffsets.getItem(nextChar);
											if(<any>!isNaN(offset))
											{
												spacing = spacing + offset;
											}
										}
										if(data.image != null)
										{
											color = new flash.ColorTransform();
											color.concat(layerInst.color);
											color.concat(baseLayer.color);
											image = data.image;
											matrix = new egret.Matrix();
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
								for(var order:number = flash.checkInt(0);order < renderCommands.length; order++)
								{
									list = renderCommands[order];
									if(list != null)
									{
										for(c = flash.checkInt(0); c < list.length; c++)
										{
											cmd = list[c];
											img.draw2(cmd[0],cmd[1],cmd[2],null,null,true);
										}
									}
								}
							}

							public RemoveTag(tag:string)
							{
								this.mTags.delItem(tag);
								this.RefreshLayers();
							}

							public AddTag(tag:string)
							{
								this.mTags.setItem(tag,tag);
								this.RefreshLayers();
							}

							public get ascent():number
							{
								return this.source["ascent"] * this.mScale;
							}

							public get source():com.popcap.flash.framework.resources.fonts.FontResource
							{
								return this.mSource;
							}

							public GetStringWidth(str:string):number
							{
								return this.source["GetStringWidth"](str) * this.mScale;
							}

							public set pointSize(size:number)
							{
								size = flash.checkInt(size);
								this.mPointSize = flash.checkInt(size);
								this.mScale = size / this.defaultPointSize;
							}

							private RefreshLayers()
							{
								var layer:com.popcap.flash.framework.resources.fonts.FontLayer = <any>null;
								this.mLayers.length = 0;
								var numLayers:number = flash.checkInt(this.source["numLayers"]);
								for(var i:number = flash.checkInt(0);i < numLayers; i++)
								{
									layer = this.source["GetLayer"](i);
									if(layer.MatchesTags(this.mTags))
									{
										this.mLayers.push(new com.popcap.flash.framework.resources.fonts.FontLayerInst(layer));
									}
								}
							}

							public get height():number
							{
								return this.source["height"] * this.mScale;
							}

							public get numLayers():number
							{
								return this.mLayers.length;
							}

							public get defaultPointSize():number
							{
								return this.source["pointSize"];
							}

							public get pointSize():number
							{
								return this.mPointSize;
							}

							public GetStringImageWidth(str:string):number
							{
								return this.source["GetStringImageWidth"](str) * this.mScale;
							}

							public set source(value:com.popcap.flash.framework.resources.fonts.FontResource)
							{
								this.mSource = value;
								this.RefreshLayers();
							}

							public GetLayer(index:number):com.popcap.flash.framework.resources.fonts.FontLayerInst
							{
								index = flash.checkInt(index);
								return this.mLayers[index];
							}

							public get lineSpacing():number
							{
								return this.source["lineSpacing"] * this.mScale;
							}

						}
					}
				}
			}
		}
	}
}

