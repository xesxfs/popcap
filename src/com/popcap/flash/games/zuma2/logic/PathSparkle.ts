module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class PathSparkle extends egret.HashObject {
							public mSparkleImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mX:number = NaN;
							public mY:number = NaN;
							public mSparkleSprite:egret.Sprite;
							public mApp:Zuma2App;
							public mUpdateCount:number = 0;
							public mPri:number = 0;
							public mCel:number = 0;
							public mSparkleBitmap:flash.Bitmap;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mApp = app;
								this.mCel = flash.checkInt(0);
								this.mUpdateCount = flash.checkInt(0);
								this.mPri = flash.checkInt(0);
								this.mSparkleSprite = new egret.Sprite();
								this.mSparkleImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_PATH_SPARKLES);
								this.mSparkleImage["mFrame"] = this.mCel;
								this.mSparkleBitmap = new flash.Bitmap(this.mSparkleImage["pixels"],flash.PixelSnapping.NEVER,true);
								this.mSparkleBitmap.x = -this.mSparkleBitmap.width / 2;
								this.mSparkleBitmap.y = -this.mSparkleBitmap.height / 2;
								this.mSparkleBitmap.blendMode = egret.BlendMode.ADD;
								var aColor:flash.ColorTransform = this.mSparkleBitmap["transform"].colorTransform;
								aColor.redMultiplier = 1;
								aColor.blueMultiplier = 0;
								aColor.greenMultiplier = 1;
								this.mSparkleBitmap["transform"].colorTransform = aColor;
								this.mSparkleSprite.addChild(this.mSparkleBitmap);
								this.mApp["mLayers"][0].mBalls.addChild(this.mSparkleSprite);
							}

							public Delete()
							{
								if(this.mSparkleSprite.parent != null)
								{
									this.mSparkleSprite.parent.removeChild(this.mSparkleSprite);
								}
							}

							public Update()
							{
								this.mApp["mLayers"][this.mPri].mBalls.addChild(this.mSparkleSprite);
								this.mSparkleImage["mFrame"] = this.mCel;
								this.mSparkleBitmap.bitmapData = this.mSparkleImage["pixels"];
								this.mSparkleSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mSparkleSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
							}

						}
					}
				}
			}
		}
	}
}

