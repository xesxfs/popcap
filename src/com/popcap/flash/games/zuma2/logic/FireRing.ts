module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class FireRing extends egret.HashObject {
							public mFireSprite:egret.Sprite;
							public mAlpha:number = NaN;
							public mFireBitmap:flash.Bitmap;
							public mApp:Zuma2App;
							public mFireImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mCel:number = 0;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mAlpha = 0;
								this.mCel = flash.checkInt(0);
								this.mApp = app;
								this.mFireImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_FIRERING);
								this.mFireImage["mFrame"] = 0;
								this.mFireBitmap = new flash.Bitmap(this.mFireImage["pixels"],flash.PixelSnapping.NEVER,true);
								this.mFireBitmap.x = -this.mFireBitmap.width / 2;
								this.mFireBitmap.y = -this.mFireBitmap.height / 2;
								this.mFireBitmap.blendMode = egret.BlendMode.ADD;
								this.mFireSprite = new egret.Sprite();
								this.mFireSprite.alpha = 0;
								this.mFireSprite.addChild(this.mFireBitmap);
							}

						}
					}
				}
			}
		}
	}
}

