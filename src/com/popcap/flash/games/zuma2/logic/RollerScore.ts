module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class RollerScore extends egret.HashObject {
							public mRollerBitmap:flash.Bitmap;
							public mCurrNum:number = 0;
							public mTargetNum:number = 0;
							public mRollerSprite:egret.Sprite;
							public mTarget:Array<any>;
							public mGauntletMode:boolean = false;
							public mAtTarget:boolean = false;
							public mDigits:Array<any>;
							public mApp:Zuma2App;
							public mNumbersImage:flash.Bitmap;

							public constructor(app:Zuma2App,gauntlet_mode:boolean = false)
							{
								super();
								super();
								this.mDigits = new Array();
								this.mTarget = new Array();
								this.mApp = app;
								this.Reset(gauntlet_mode);
							}

							public ForceScore(score:number)
							{
								score = flash.checkInt(score);
								var i:number = flash.checkInt(0);
								var denom:number = flash.checkInt(0);
								var p:number = flash.checkInt(0);
								if(score > 999999)
								{
									score = flash.checkInt(999999);
								}
								for(i = flash.checkInt(0); i < 6; i++)
								{
									this.mDigits[i].mNum = -1;
									this.mDigits[i].mVY = 0;
									this.mDigits[i].mY = -7;
									this.mDigits[i].mDelay = this.mDigits[i].mBounceState = 0;
								}
								for(i = flash.checkInt(0); i < 6; i++)
								{
									denom = flash.checkInt(flash.tranint(Math.pow(10,i)));
									p = flash.checkInt(flash.tranint(Math.pow(10,i + 1)));
									this.mDigits[i].mNum = flash.tranint(score % p / denom);
									if(flash.tranint(score / p) == 0)
									{
										break;
									}
								}
								for(i = flash.checkInt(0); i < 6; i++)
								{
									this.mTarget[i].mNum = this.mDigits[i].mNum;
									this.mTarget[i].mX = this.mDigits[i].mX;
									this.mTarget[i].mY = this.mDigits[i].mY;
									this.mTarget[i].mVY = this.mDigits[i].mVY;
									this.mTarget[i].mDelay = this.mDigits[i].mDelay;
									this.mTarget[i].mBounceState = this.mDigits[i].mBounceState;
									this.mTarget[i].mRestingY = this.mDigits[i].mRestingY;
								}
								this.mTargetNum = flash.checkInt(this.mCurrNum = flash.checkInt(score));
								this.mAtTarget = true;
							}

							public SetTargetScore(num:number)
							{
								num = flash.checkInt(num);
								var i:number = flash.checkInt(0);
								var denom:number = flash.checkInt(0);
								var p:number = flash.checkInt(0);
								var d:number = flash.checkInt(0);
								var max_speed:number = <any>NaN;
								if(num > 999999)
								{
									num = flash.checkInt(999999);
								}
								if(num == this.mCurrNum)
								{
									return ;
								}
								var diff:number = flash.checkInt(num - this.mCurrNum);
								var num_digits:number = flash.checkInt(1);
								while(diff > 0)
								{
									diff = flash.checkInt(diff / 10);
									if(diff > 0)
									{
										num_digits++;
									}
								}
								this.mTargetNum = flash.checkInt(num);
								var idx:number = flash.checkInt(0);
								while(true)
								{
									denom = flash.checkInt(flash.tranint(Math.pow(10,idx)));
									p = flash.checkInt(flash.tranint(Math.pow(10,idx + 1)));
									d = flash.checkInt(num % p / denom);
									this.mTarget[idx].mNum = d;
									if(this.mDigits[idx].mNum != d)
									{
										this.mDigits[idx].mDelay = Math.random() * 15;
										if(this.mGauntletMode)
										{
											this.mDigits[idx].mVY = 1 * num_digits + Math.random() * 2;
											max_speed = 3;
											if(this.mDigits[idx].mVY > max_speed)
											{
												this.mDigits[idx].mVY = max_speed;
											}
										}
										else
										{
											this.mDigits[idx].mVY = 1 + Math.random() * 0;
										}
										this.mDigits[idx].mBounceState = 0;
									}
									if(flash.tranint(num / p) == 0)
									{
										break;
									}
									idx++;
								}
								for(i = flash.checkInt(idx + 1); i < 6; i++)
								{
									this.mTarget[i].mNum = -1;
								}
								this.mAtTarget = false;
							}

							public Draw()
							{
								var d:com.popcap.flash.games.zuma2.logic.RollerDigit = <any>null;
								var ch:number = flash.checkInt(this.mNumbersImage.height);
								var clipx:number = flash.checkInt(11 * Zuma2App.SHRINK_PERCENT);
								var clipy:number = flash.checkInt(8 * Zuma2App.SHRINK_PERCENT + 12);
								for(var i:number = flash.checkInt(0);i < 6; i++)
								{
									d = this.mDigits[i];
									d.mNumberImage["mFrame"] = this.GetCel(d.mNum);
									d.mNumberBitmap.bitmapData = d.mNumberImage["pixels"];
									d.mNumberBitmap.y = d.mY + clipy;
									if(d.mY != 0)
									{
										d.mNumberImage["mFrame"] = d.mNum == -1?flash.tranint(this.GetCel(0)):flash.tranint(this.GetCel(d.mNum + 1));
										d.mNextNumberBitmap.bitmapData = d.mNumberImage["pixels"];
										d.mNextNumberBitmap.y = d.mY + clipy - ch;
									}
								}
							}

							public Update()
							{
								var d:com.popcap.flash.games.zuma2.logic.RollerDigit = <any>null;
								var td:com.popcap.flash.games.zuma2.logic.RollerTarget = <any>null;
								if(this.mAtTarget)
								{
									return ;
								}
								var ch:number = flash.checkInt(this.mNumbersImage.height);
								var same:boolean = <any>true;
								for(var i:number = flash.checkInt(5);i >= 0; i--)
								{
									d = this.mDigits[i];
									td = this.mTarget[i];
									if(--d.mDelay > 0)
									{
										same = false;
									}
									else
									{
										d.mDelay = flash.checkInt(0);
										if(d.mVY == 0)
										{
											if(d.mNum != td.mNum)
											{
												same = false;
											}
										}
										else if(d.mVY != 0)
										{
											d.mY = d.mY + d.mVY;
											if(d.mY >= ch && d.mBounceState == 0)
											{
												d.mNum = flash.checkInt(d.mNum == -1?1:flash.tranint((d.mNum + 1) % 10));
												if(d.mNum == td.mNum)
												{
													if(0)
													{
														d.mVY = 1 + Math.random() * 2;
													}
													d.mY = 0;
													d.mBounceState = flash.checkInt(1);
													same = false;
												}
												else
												{
													same = false;
													d.mY = ch - d.mY;
												}
											}
											else if(d.mBounceState == 1 && d.mY >= 4)
											{
												same = false;
												d.mBounceState++;
												d.mVY = d.mVY * -1;
											}
											else if(d.mBounceState == 2 && d.mY <= -8)
											{
												same = false;
												d.mBounceState++;
												d.mVY = d.mVY * -1;
												d.mRestingY = flash.checkInt(-8 + Math.random() * 0);
											}
											else if(d.mBounceState == 3 && d.mY >= d.mRestingY)
											{
												d.mVY = 0;
												d.mBounceState = flash.checkInt(0);
											}
											else
											{
												same = false;
											}
										}
									}
								}
								this.mAtTarget = same;
							}

							public GetTargetScore():number
							{
								return this.mTargetNum;
							}

							public Reset(gauntlet_mode:boolean)
							{
								var digit:com.popcap.flash.games.zuma2.logic.RollerDigit = <any>null;
								this.mGauntletMode = gauntlet_mode;
								this.mNumbersImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UI_SCORENUMBERS));
								this.mRollerBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UI_SCOREBAR),flash.PixelSnapping.NEVER,true);
								this.mRollerSprite = new egret.Sprite();
								this.mRollerSprite.addChild(this.mRollerBitmap);
								this.mApp["mLayers"][3].mForeground.addChild(this.mRollerSprite);
								this.mRollerSprite.x = 8 * Zuma2App.SHRINK_PERCENT;
								this.mRollerSprite.y = 11 * Zuma2App.SHRINK_PERCENT;
								var add:number = <any>8;
								var xsep:number = <any>2;
								var xoff:number = flash.checkInt(10);
								for(var i:number = flash.checkInt(5);i >= 0; i--)
								{
									digit = new com.popcap.flash.games.zuma2.logic.RollerDigit(this.mApp);
									this.mDigits[i] = digit;
									this.mDigits[i].mX = xoff + (this.mNumbersImage.width + add) * (5 - i);
									this.mDigits[i].mNumberSprite.x = this.mDigits[i].mX;
									this.mDigits[i].mVY = 0;
									this.mDigits[i].mNum = -1;
									this.mDigits[i].mY = 0;
									this.mDigits[i].mNumberSprite.y = this.mDigits[i].mY;
									this.mDigits[i].mDelay = 0;
									this.mDigits[i].mBounceState = 0;
									this.mTarget[i] = new com.popcap.flash.games.zuma2.logic.RollerTarget(this.mApp);
								}
								this.mDigits[0].mNum = this.mTarget[0].mNum = -1;
								this.mTargetNum = flash.checkInt(this.mCurrNum = flash.checkInt(0));
								this.mAtTarget = true;
							}

							public GetCurrentScore():number
							{
								var d:com.popcap.flash.games.zuma2.logic.RollerDigit = <any>null;
								if(this.mCurrNum == this.mTargetNum)
								{
									return this.mCurrNum;
								}
								this.mCurrNum = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < 6; i++)
								{
									d = this.mDigits[i];
									if(d.mNum == -1)
									{
										break;
									}
									this.mCurrNum = flash.checkInt(this.mCurrNum + Math.pow(10,i) * this.mDigits[i].mNum);
								}
								return this.mCurrNum;
							}

							public Reload()
							{
								this.mApp["mLayers"][3].mForeground.addChild(this.mRollerSprite);
								for(var i:number = flash.checkInt(0);i < this.mDigits.length; i++)
								{
									this.mDigits[i].Reload();
								}
							}

							public GetCel(num:number):number
							{
								num = flash.checkInt(num);
								if(num < 0)
								{
									return 0;
								}
								if(num % 10 > 0)
								{
									return num;
								}
								return 10;
							}

						}
					}
				}
			}
		}
	}
}

