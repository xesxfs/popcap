module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class WarningLight extends egret.HashObject {
							public mSkullPathLitBitmap:flash.Bitmap;
							public mSkullPathBitmap:flash.Bitmap;
							public mSkullPathLitSprite:egret.Sprite;
							public mX:number = NaN;
							public mWaypoint:number = NaN;
							public mPulseAlpha:number = NaN;
							public mY:number = NaN;
							public mUpdateCount:number = 0;
							public mSkullPathSprite:egret.Sprite;
							public mAngle:number = NaN;
							public mState:number = 0;
							public mPulseRate:number = NaN;
							public mPriority:number = 0;
							public mApp:Zuma2App;
							public mAlpha:number = NaN;

							public constructor(app:Zuma2App,x:number,y:number)
							{
								super();
								super();
								this.mApp = app;
								this.mX = x;
								this.mY = y;
								this.mAlpha = 0;
								this.mUpdateCount = flash.checkInt(0);
								this.mAngle = 0;
								this.mState = flash.checkInt(0);
								this.mWaypoint = -1;
								this.mPulseAlpha = 0;
								this.mPulseRate = 0;
								this.mPriority = flash.checkInt(0);
								this.mSkullPathBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_SKULLPATH));
								this.mSkullPathBitmap.x = -this.mSkullPathBitmap.width / 2;
								this.mSkullPathBitmap.y = -this.mSkullPathBitmap.height / 2;
								this.mSkullPathLitBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_SKULLPATH_LIT));
								this.mSkullPathLitBitmap.x = -this.mSkullPathLitBitmap.width / 2;
								this.mSkullPathLitBitmap.y = -this.mSkullPathLitBitmap.height / 2;
								this.mSkullPathSprite = new egret.Sprite();
								this.mSkullPathSprite.addChild(this.mSkullPathBitmap);
								this.mSkullPathSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mSkullPathSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mSkullPathLitSprite = new egret.Sprite();
								this.mSkullPathLitSprite.addChild(this.mSkullPathLitBitmap);
								this.mSkullPathLitSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mSkullPathLitSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mApp["mLayers"][0].mBackground.addChild(this.mSkullPathLitSprite);
								this.mApp["mLayers"][0].mBackground.addChild(this.mSkullPathSprite);
							}

							public SetAngle(angle:number)
							{
								this.mAngle = angle;
								this.mSkullPathLitSprite.rotation = -this.mAngle * Zuma2App.RAD_TO_DEG + 90;
								this.mSkullPathSprite.rotation = -this.mAngle * Zuma2App.RAD_TO_DEG + 90;
							}

							public Update():boolean
							{
								this.mUpdateCount++;
								var alpha_amt:number = <any>5;
								if(this.mState == 1)
								{
									this.mAlpha = Math.min(255,this.mAlpha + alpha_amt);
									if(this.mAlpha >= 255)
									{
										this.mState = flash.checkInt(0);
									}
								}
								else if(this.mState == -1)
								{
									this.mAlpha = Math.max(0,this.mAlpha - alpha_amt);
									if(this.mAlpha <= 0)
									{
										this.mState = flash.checkInt(0);
									}
								}
								else if(this.mPulseRate != 0)
								{
									this.mPulseAlpha = this.mPulseAlpha + (this.mPulseRate > 0?this.mPulseRate * 2:this.mPulseRate);
									if(this.mPulseRate < 0 && this.mPulseAlpha <= 0)
									{
										this.mPulseRate = 0;
										this.mPulseAlpha = 0;
									}
									else if(this.mPulseAlpha >= 255 && this.mPulseRate > 0)
									{
										this.mPulseRate = this.mPulseRate * -1;
										this.mPulseAlpha = 255;
										return true;
									}
								}
								return false;
							}

							public Draw()
							{
								this.mSkullPathSprite.alpha = this.mAlpha / 255;
								this.mSkullPathLitSprite.alpha = this.mPulseAlpha / 255;
							}

						}
					}
				}
			}
		}
	}
}

