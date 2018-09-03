module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class RollerDigit extends egret.HashObject {
							public mX:number = NaN;
							public mY:number = NaN;
							public mRestingY:number = 0;
							public mNum:number = 0;
							public mDelay:number = 0;
							public mNumberMask:egret.Sprite;
							public mNumberImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mVY:number = NaN;
							public mNextNumberImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mApp:Zuma2App;
							public mNumberSprite:egret.Sprite;
							public mBounceState:number = 0;
							public mNumberBitmap:flash.Bitmap;
							public mNextNumberBitmap:flash.Bitmap;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mApp = app;
								this.mNum = flash.checkInt(-1);
								this.mX = 0;
								this.mY = 0;
								this.mNumberMask = new egret.Sprite();
								this.mNumberMask.graphics.beginFill(16777215);
								this.mNumberMask.graphics.drawRect(0,8,10,22 + 1 / 3);
								this.mNumberMask.graphics.endFill();
								this.mNumberImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UI_SCORENUMBERS);
								this.mNumberImage["mFrame"] = 0;
								this.mNumberBitmap = new flash.Bitmap(this.mNumberImage["pixels"],flash.PixelSnapping.NEVER,true);
								this.mNextNumberBitmap = new flash.Bitmap(this.mNumberImage["pixels"],flash.PixelSnapping.NEVER,true);
								this.mNextNumberBitmap.mask = this.mNumberMask;
								this.mNumberSprite = new egret.Sprite();
								this.mNumberBitmap.mask = this.mNumberMask;
								this.mNumberSprite.mask = this.mNumberMask;
								this.mNumberSprite.addChild(this.mNumberMask);
								this.mNumberSprite.addChild(this.mNumberBitmap);
								this.mNumberSprite.addChild(this.mNextNumberBitmap);
								this.mApp["mLayers"][3].mForeground.addChild(this.mNumberSprite);
							}

							public Reload()
							{
								this.mApp["mLayers"][3].mForeground.addChild(this.mNumberSprite);
							}

						}
					}
				}
			}
		}
	}
}

