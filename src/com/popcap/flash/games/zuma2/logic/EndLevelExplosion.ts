module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class EndLevelExplosion extends egret.HashObject {
							public mX:number = 0;
							private mExplosionSprite:egret.Sprite;
							private mExplosionImage:com.popcap.flash.framework.resources.images.ImageInst;
							private mApp:Zuma2App;
							public mPlaySound:boolean = false;
							private mExplosionBitmap:flash.Bitmap;
							private mUpdateCount:number = 0;
							public mY:number = 0;
							public mDelay:number = 0;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mApp = app;
								this.mExplosionImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_PATH_EXPLOSION);
								this.mExplosionImage["mFrame"] = 0;
								this.mExplosionBitmap = new flash.Bitmap(this.mExplosionImage["pixels"]);
								this.mExplosionBitmap.x = -this.mExplosionBitmap.width / 2;
								this.mExplosionBitmap.y = -this.mExplosionBitmap.height / 2;
								this.mExplosionSprite = new egret.Sprite();
								this.mExplosionSprite.addChild(this.mExplosionBitmap);
								this.mExplosionSprite.scaleX = 0.5;
								this.mExplosionSprite.scaleY = 0.5;
								this.mApp["mLayers"][3].mForeground.addChild(this.mExplosionSprite);
								this.mPlaySound = false;
								this.mUpdateCount = flash.checkInt(0);
							}

							public SetPos(x:number,y:number)
							{
								x = flash.checkInt(x);
								y = flash.checkInt(y);
								this.mExplosionSprite.x = x * Zuma2App.SHRINK_PERCENT;
								this.mExplosionSprite.y = y * Zuma2App.SHRINK_PERCENT;
							}

							public Delete()
							{
								if(this.mExplosionSprite.parent != null)
								{
									this.mExplosionSprite.parent.removeChild(this.mExplosionSprite);
								}
								this.mExplosionSprite = null;
							}

							public Update()
							{
								this.mUpdateCount++;
								if(this.mUpdateCount % 3 == 0)
								{
									this.mExplosionImage["mFrame"]++;
									this.mExplosionBitmap.bitmapData = this.mExplosionImage["pixels"];
								}
							}

							public IsActive():boolean
							{
								if(this.mExplosionImage["mFrame"] >= 14)
								{
									return false;
								}
								return true;
							}

						}
					}
				}
			}
		}
	}
}

