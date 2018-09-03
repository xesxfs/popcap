module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Hole extends egret.HashObject {
							public mFrame:number = 0;
							public mPercentOpen:number = NaN;
							public mSkullBaseSprite:egret.Sprite;
							public mSkullHeadBitmapData:flash.BitmapData;
							public mX:number = 0;
							public mY:number = 0;
							public mCurve:com.popcap.flash.games.zuma2.logic.CurveMgr;
							public mDeathAlpha:number = NaN;
							public mUpdateCount:number = 0;
							public mRotation:number = NaN;
							public mSkullHoleBitmap:flash.Bitmap;
							public mCurveNum:number = 0;
							public mDoDeathFade:boolean = false;
							public mSkullHoleSprite:egret.Sprite;
							public mShared:Array<number>;
							public mRing:Array<any>;
							public mSkullHeadBitmap:flash.Bitmap;
							public mVisible:boolean = false;
							public mPercentTarget:number = NaN;
							public mSkullHeadMatrix:egret.Matrix;
							public mSkullHeadSprite:egret.Sprite;
							public mSkullSprite:egret.Sprite;
							public mSkullJawBitmap:flash.Bitmap;
							public mSkullBaseBitmap:flash.Bitmap;
							public mApp:Zuma2App;
							public mSkullJawSprite:egret.Sprite;
							public mSkullMask:egret.Sprite;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mSkullHeadMatrix = new egret.Matrix();
								this.mApp = app;
								this.mFrame = flash.checkInt(0);
								this.mVisible = true;
								this.mPercentOpen = 0;
								this.mPercentTarget = -1;
								this.mUpdateCount = flash.checkInt(0);
								this.mCurveNum = flash.checkInt(-1);
								this.mDoDeathFade = false;
								this.mDeathAlpha = 0;
								this.mShared = new Array<number>();
								this.mRing = new Array();
								this.mRing[0] = new com.popcap.flash.games.zuma2.logic.FireRing(this.mApp);
								this.mRing[1] = new com.popcap.flash.games.zuma2.logic.FireRing(this.mApp);
								this.mRing[1].mCel = -1;
								this.mRing[2] = new com.popcap.flash.games.zuma2.logic.FireRing(this.mApp);
								this.mRing[2].mCel = -1;
								this.mSkullSprite = new egret.Sprite();
								this.mSkullHeadSprite = new egret.Sprite();
								this.mSkullBaseSprite = new egret.Sprite();
								this.mSkullHoleSprite = new egret.Sprite();
								this.mSkullJawSprite = new egret.Sprite();
								this.mSkullHoleBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_HOLE));
								this.mSkullJawBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_JAW));
								this.mSkullHeadBitmapData = this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_HEAD);
								this.mSkullHeadBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_HEAD));
								this.mSkullBaseBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_BASE));
								this.mSkullHoleBitmap["smoothing"] = true;
								this.mSkullJawBitmap["smoothing"] = true;
								this.mSkullBaseBitmap["smoothing"] = true;
								this.mSkullJawBitmap.x = -(this.mSkullJawBitmap.width / 2);
								this.mSkullJawBitmap.y = -(this.mSkullJawBitmap.height / 2) + 10;
								this.mSkullHeadMatrix.translate(-this.mSkullHeadBitmapData.width / 2,-this.mSkullHeadBitmapData.height / 2 - 3);
								this.mSkullBaseBitmap.x = -(this.mSkullBaseBitmap.width / 2);
								this.mSkullBaseBitmap.y = -(this.mSkullBaseBitmap.height / 2);
								this.mSkullHoleBitmap.x = -(this.mSkullHoleBitmap.width / 2);
								this.mSkullHoleBitmap.y = -(this.mSkullHoleBitmap.height / 2);
								this.mSkullMask = new egret.Sprite();
								this.mSkullMask.graphics.beginFill(0);
								this.mSkullMask.graphics.drawCircle(0,0,29);
								this.mSkullMask.graphics.endFill();
								this.mSkullHeadBitmap.x = -this.mSkullHeadBitmap.width / 2;
								this.mSkullHeadBitmap.y = -20;
								this.mSkullHeadBitmap["smoothing"] = true;
								this.mSkullHeadBitmap["pixelSnapping"] = flash.PixelSnapping.NEVER;
								this.mSkullHeadBitmap.mask = this.mSkullMask;
								this.mSkullHeadSprite.addChild(this.mSkullHeadBitmap);
								this.mSkullHoleSprite.addChild(this.mSkullHoleBitmap);
								this.mSkullJawSprite.addChild(this.mSkullJawBitmap);
								this.mSkullBaseSprite.addChild(this.mSkullBaseBitmap);
								this.mApp["mLayers"][0].mBackground.addChild(this.mSkullHoleSprite);
								this.mApp["mLayers"][0].mBackground.addChild(this.mSkullJawSprite);
								this.mApp["mLayers"][0].mBackground.addChild(this.mSkullHeadSprite);
								this.mApp["mLayers"][0].mBackground.addChild(this.mSkullBaseSprite);
								this.mApp["mLayers"][0].mBackground.addChild(this.mSkullMask);
								this.mApp["mLayers"][0].mBackground.addChild(this.mRing[0].mFireSprite);
								this.mApp["mLayers"][0].mBackground.addChild(this.mRing[1].mFireSprite);
								this.mApp["mLayers"][0].mBackground.addChild(this.mRing[2].mFireSprite);
							}

							public SetPctOpen(pct:number)
							{
								if(pct < this.mPercentOpen && this.mVisible)
								{
									this.mPercentTarget = pct;
								}
								else
								{
									this.mPercentOpen = pct;
									this.mPercentTarget = -1;
								}
							}

							public GetPctOpen():number
							{
								return this.mPercentOpen;
							}

							public SetPos()
							{
								this.mSkullBaseSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mSkullBaseSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mSkullJawSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mSkullJawSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mSkullHoleSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mSkullHoleSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mSkullHeadSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mSkullHeadSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mSkullMask.x = this.mSkullHeadSprite.x;
								this.mSkullMask.y = this.mSkullHeadSprite.y;
								this.mSkullBaseSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								this.mSkullHeadSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								this.mSkullJawSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								this.mSkullHoleSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								for(var i:number = flash.checkInt(0);i < 3; i++)
								{
									this.mRing[i].mFireSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
									this.mRing[i].mFireSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
									this.mRing[i].mFireSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								}
							}

							public DrawMain(canvas:com.popcap.flash.framework.Canvas,is_gray:boolean = false)
							{
							}

							public DrawRings()
							{
								var fr:com.popcap.flash.games.zuma2.logic.FireRing = <any>null;
								var a:number = flash.checkInt(0);
								var i:number = flash.checkInt(0);
								if(this.mDeathAlpha >= 255 || <any>!this.mDoDeathFade && this.mDeathAlpha != 0)
								{
									for(i = flash.checkInt(0); i < 3; i++)
										{}
									return ;
								}
								for(i = flash.checkInt(0); i < 3; i++)
								{
									this.mRing[1].mFireSprite.visible = true;
								}
								for(i = flash.checkInt(0); i < 3; i++)
								{
									fr = this.mRing[i];
									if(<any>!(fr.mCel == -1 || fr.mAlpha == 0))
									{
										a = flash.checkInt(fr.mAlpha);
										if(this.mDoDeathFade)
										{
											a = flash.checkInt(Math.min(a,255 - this.mDeathAlpha));
										}
										fr.mFireImage["mFrame"] = fr.mCel;
										fr.mFireBitmap.bitmapData = fr.mFireImage["pixels"];
										fr.mFireSprite.alpha = a / 255;
									}
								}
							}

							public Delete()
							{
								this.mRing = null;
							}

							public SetRotation(rot:number)
							{
								this.mRotation = rot;
								this.mSkullBaseSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								this.mSkullHeadSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								this.mSkullJawSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								this.mSkullHoleSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								for(var i:number = flash.checkInt(0);i < 3; i++)
								{
									this.mRing[i].mFireSprite.rotation = -(this.mRotation + Zuma2App.MY_PI) * Zuma2App.RAD_TO_DEG;
								}
							}

							public Update()
							{
								var anim_rate:number = flash.checkInt(0);
								var num_cels:number = flash.checkInt(0);
								var alpha_inc1:number = <any>NaN;
								var alpha_inc2:number = <any>NaN;
								var all_done:boolean = <any>false;
								var i:number = flash.checkInt(0);
								if(this.mDoDeathFade)
								{
									this.mDeathAlpha = this.mDeathAlpha + 2;
									if(this.mDeathAlpha > 255)
									{
										this.mDeathAlpha = 255;
									}
								}
								else if(this.mDeathAlpha > 0)
								{
									this.mDeathAlpha = this.mDeathAlpha - 1;
									if(this.mDeathAlpha < 0)
									{
										this.mDeathAlpha = 0;
									}
								}
								this.mUpdateCount++;
								if(this.mPercentOpen > this.mPercentTarget && this.mPercentTarget >= 0)
								{
									this.mPercentOpen = this.mPercentOpen - 0.01;
									if(this.mPercentOpen < this.mPercentTarget)
									{
										this.mPercentOpen = this.mPercentTarget;
										this.mPercentTarget = -1;
									}
								}
								if(this.mPercentOpen > 0 && this.mVisible)
								{
									num_cels = flash.checkInt(36);
									anim_rate = flash.checkInt(7 - this.mPercentOpen * 4);
									if(anim_rate < 3)
									{
										anim_rate = flash.checkInt(3);
									}
									else if(anim_rate > 7)
									{
										anim_rate = flash.checkInt(7);
									}
									alpha_inc1 = 255 / (6 * flash.trannumber(num_cels));
									if(this.mRing[0].mCel != -1)
									{
										this.mRing[0].mAlpha = this.mRing[0].mAlpha + alpha_inc1;
										if(this.mRing[0].mAlpha >= 255)
										{
											this.mRing[0].mAlpha = 255;
										}
										if(this.mUpdateCount % anim_rate == 0)
										{
											if(++this.mRing[0].mCel >= num_cels)
											{
												this.mRing[0].mCel = -1;
											}
										}
									}
									alpha_inc2 = 128 / (flash.trannumber(anim_rate) * 10);
									if(this.mRing[1].mAlpha == 0 && this.mRing[0].mCel == 21)
									{
										this.mRing[1].mCel = 0;
										this.mRing[1].mAlpha = 128;
									}
									else if(this.mRing[1].mCel != -1)
									{
										this.mRing[1].mAlpha = this.mRing[1].mAlpha + alpha_inc2;
										if(this.mRing[1].mAlpha >= 255)
										{
											this.mRing[1].mAlpha = 255;
										}
										if(this.mUpdateCount % anim_rate == 0)
										{
											if(++this.mRing[1].mCel >= num_cels)
											{
												this.mRing[1].mCel = 0;
												this.mRing[1].mAlpha = 128;
											}
										}
									}
									if(this.mRing[2].mAlpha == 0 && this.mRing[1].mCel == num_cels / 2)
									{
										this.mRing[2].mCel = 0;
										this.mRing[2].mAlpha = 128;
									}
									else if(this.mRing[2].mCel != -1)
									{
										this.mRing[2].mAlpha = this.mRing[2].mAlpha + alpha_inc2;
										if(this.mRing[2].mAlpha >= 255)
										{
											this.mRing[2].mAlpha = 255;
										}
										if(this.mUpdateCount % anim_rate == 0)
										{
											if(++this.mRing[2].mCel >= num_cels)
											{
												this.mRing[2].mCel = 0;
												this.mRing[2].mAlpha = 128;
											}
										}
									}
								}
								else if(this.mVisible)
								{
									all_done = true;
									anim_rate = flash.checkInt(7 - this.mPercentOpen * 4);
									if(anim_rate < 3)
									{
										anim_rate = flash.checkInt(3);
									}
									else if(anim_rate > 7)
									{
										anim_rate = flash.checkInt(7);
									}
									i = flash.checkInt(0);
									for(i = flash.checkInt(0); i < 3; i++)
									{
										if(this.mRing[i].mAlpha > 0)
										{
											if(this.mUpdateCount % anim_rate == 0)
											{
												if(++this.mRing[i].mCel >= 36)
													{}
											}
											this.mRing[i].mCel = 0;
											this.mRing[i].mAlpha = this.mRing[i].mAlpha - 2;
											if(this.mRing[i].mAlpha <= 0)
											{
												this.mRing[i].mAlpha = 0;
											}
											else
											{
												all_done = false;
											}
										}
									}
									if(all_done)
									{
										for(i = flash.checkInt(0); i < 3; i++)
										{
											this.mRing[i].mCel = i == 0?0:-1;
											this.mRing[i].mAlpha = 0;
										}
									}
								}
							}

							public Draw(canvas:com.popcap.flash.framework.Canvas,hilite_override:number = 0)
							{
								this.mSkullHeadBitmap.y = -20 - 20 * this.mPercentOpen;
								this.DrawMain(canvas,false);
								if(this.mDeathAlpha > 0)
								{
									this.DrawMain(canvas,true);
								}
								if(this.mVisible)
								{
									this.DrawRings();
								}
							}

						}
					}
				}
			}
		}
	}
}

