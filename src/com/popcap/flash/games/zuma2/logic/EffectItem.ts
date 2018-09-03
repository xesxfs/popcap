module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class EffectItem extends egret.HashObject {
							public mXOffset:Array<com.popcap.flash.games.zuma2.logic.Component>;
							public mAngle:Array<com.popcap.flash.games.zuma2.logic.Component>;
							public mBitmap:flash.Bitmap;
							public mImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mSprite:egret.Sprite;
							public mCel:number = 0;
							public mColor:flash.ColorTransform;
							public mApp:Zuma2App;
							public mScale:Array<com.popcap.flash.games.zuma2.logic.Component>;
							public mOpacity:Array<com.popcap.flash.games.zuma2.logic.Component>;
							public mYOffset:Array<com.popcap.flash.games.zuma2.logic.Component>;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mScale = new Array<com.popcap.flash.games.zuma2.logic.Component>();
								this.mOpacity = new Array<com.popcap.flash.games.zuma2.logic.Component>();
								this.mAngle = new Array<com.popcap.flash.games.zuma2.logic.Component>();
								this.mXOffset = new Array<com.popcap.flash.games.zuma2.logic.Component>();
								this.mYOffset = new Array<com.popcap.flash.games.zuma2.logic.Component>();
								this.mApp = app;
							}

							public Init(x:number,y:number)
							{
								this.mSprite = new egret.Sprite();
								this.mImage["mFrame"] = this.mCel;
								this.mBitmap = new flash.Bitmap(this.mImage["pixels"],flash.PixelSnapping.NEVER,true);
								this.mBitmap.x = -this.mBitmap.width / 2;
								this.mBitmap.y = -this.mBitmap.height / 2;
								this.mBitmap["transform"].colorTransform = this.mColor;
								this.mBitmap.blendMode = egret.BlendMode.ADD;
								this.mSprite.addChild(this.mBitmap);
								this.mSprite.x = x * Zuma2App.SHRINK_PERCENT;
								this.mSprite.y = y * Zuma2App.SHRINK_PERCENT;
								this.mApp["mLayers"][2].mForeground.addChild(this.mSprite);
							}

							public Delete()
							{
								if(this.mSprite != null)
								{
									if(this.mSprite.parent != null)
									{
										this.mSprite.parent.removeChild(this.mSprite);
									}
								}
							}

						}
					}
				}
			}
		}
	}
}

