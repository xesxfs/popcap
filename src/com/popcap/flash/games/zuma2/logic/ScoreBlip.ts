module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class ScoreBlip extends egret.HashObject {
							public mBulgeDir:number = NaN;
							public mLife:number = 0;
							public mAlphaDecRate:number = NaN;
							public mX:number = NaN;
							public mY:number = NaN;
							public mSize:number = NaN;
							public mDone:boolean = false;
							public mTextFormat:flash.TextFormat;
							public mAlphaDelay:number = NaN;
							public mBulgePct:number = NaN;
							public mUpdateCount:number = 0;
							public mSpeed:number = NaN;
							public mTextSprite:egret.Sprite;
							public mTextField:flash.TextField;
							public mAlpha:number = NaN;
							public mColor:number = 0;
							public mBulgeDec:number = NaN;
							public mText:string;
							public mApp:Zuma2App;
							public mAlphaFadeDelay:number = NaN;
							public mBulgeAmt:number = NaN;

							public constructor(app:Zuma2App,text:string,x:number,y:number,color:number)
							{
								super();
								color = flash.checkUint(color);
								super();
								this.mApp = app;
								this.mText = text;
								this.mColor = flash.checkUint(color);
								this.mX = x;
								this.mY = y;
								if(this.mX < 150)
								{
									this.mX = 150;
								}
								if(this.mX > 600)
								{
									this.mX = 600;
								}
								if(this.mY < 125)
								{
									this.mY = 125;
								}
								if(this.mY > 600)
								{
									this.mY = 600;
								}
								this.mSize = 1;
								this.mLife = flash.checkInt(25);
								this.mSpeed = 0.5;
								this.mAlphaFadeDelay = 50;
								this.mAlphaDecRate = 5;
								this.mAlpha = 255;
								this.mDone = false;
								this.mTextSprite = new egret.Sprite();
								this.mTextFormat = new flash.TextFormat();
								this.mTextFormat.font = "BonusText";
								this.mTextFormat.align = flash.TextFormatAlign.CENTER;
								this.mTextFormat.color = color;
								this.mTextFormat.size = 24;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(0,1,2,2,200);
								this.mTextField = new flash.TextField();
								this.mTextField.embedFonts = true;
								this.mTextField.defaultTextFormat = this.mTextFormat;
								this.mTextField.filters = [aGlow];
								this.mTextField.textColor = flash.checkUint(color);
								this.mTextField.width = 200;
								this.mTextField.height = 100;
								this.mTextField.x = -this.mTextField.width / 2;
								this.mTextField.y = -this.mTextField.height / 2;
								this.mTextField.alpha = 1;
								this.mTextField["selectable"] = false;
								this.mTextField.multiline = true;
								this.mTextField["wordWrap"] = true;
								this.mTextField.text = text;
								this.mTextSprite.alpha = 1;
								this.mTextSprite.addChild(this.mTextField);
								this.mTextSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mTextSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mApp["mLayers"][3].mBackground.addChild(this.mTextSprite);
							}

							public Update()
							{
								this.mUpdateCount++;
								if(this.mDone)
								{
									return ;
								}
								if(this.mBulgeDir != 0)
								{
									this.mSize = this.mSize + this.mBulgeDir * this.mBulgeAmt;
									if(this.mBulgeDir > 0 && this.mSize >= this.mBulgePct)
									{
										this.mSize = this.mBulgePct;
										this.mBulgeDir = -1;
										this.mBulgePct = this.mBulgePct - this.mBulgeDec;
									}
									else if(this.mBulgeDir < 0 && this.mSize <= 1)
									{
										this.mSize = 1;
										this.mBulgeDir = 1;
									}
									if(this.mSize <= 1 && this.mBulgePct <= 1)
									{
										this.mSize = 1;
										this.mBulgeDir = 0;
									}
								}
								this.mY = this.mY - this.mSpeed;
								if(this.mY < -this.mTextField.height)
								{
									this.mDone = true;
								}
								if(--this.mLife <= 0)
								{
									this.mLife = flash.checkInt(0);
									if(this.mAlpha <= 0)
									{
										this.mDone = true;
									}
								}
								if(--this.mAlphaFadeDelay <= 0)
								{
									this.mAlpha = this.mAlpha - this.mAlphaDecRate;
									if(this.mAlpha < 0)
									{
										this.mAlpha = 0;
										if(this.mLife <= 0)
										{
											this.mDone = true;
										}
									}
								}
							}

							public Delete()
							{
								if(this.mTextSprite != null)
								{
									if(this.mTextSprite.parent != null)
									{
										this.mTextSprite.parent.removeChild(this.mTextSprite);
									}
								}
							}

							public Draw()
							{
								var aFade:number = <any>NaN;
								if(<any>!this.mDone)
								{
									aFade = this.mLife / 18;
									if(aFade > 1)
									{
										aFade = 1;
									}
									this.mTextSprite.scaleX = this.mSize;
									this.mTextSprite.scaleY = this.mSize;
									this.mTextSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
									this.mTextSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
									this.mTextSprite.alpha = this.mAlpha / 255;
								}
							}

							public Bulge(pct:number,rate:number,count:number)
							{
								count = flash.checkInt(count);
								this.mSize = 1;
								this.mBulgePct = pct;
								this.mBulgeAmt = rate;
								this.mBulgeDir = 1;
								this.mBulgeDec = (pct - 1) / flash.trannumber(count);
							}

						}
					}
				}
			}
		}
	}
}

