module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Gun extends com.popcap.flash.framework.widgets.WidgetContainer implements com.popcap.flash.framework.widgets.Widget {
							public static GunState_Firing:number;
							public static FrogType_Normal:number;
							public static FROG_WIDTH:number;
							public static NUM_CHEVRONS:number;
							public static TONGUE_Y1:number;
							public static TONGUE_Y2:number;
							public static FrogType_Cannon:number;
							public static FROG_HEIGHT:number;
							public static TONGUE_YNOBALL:number;
							public static DEG_TO_RAD:number;
							public static RAD_TO_DEG:number;
							public static GunState_Reloading:number;
							public static GunState_Normal:number;
							public mBallXOff:number = 0;
							private mIsInited:boolean = false;
							public mFirePoint:number = 0;
							public mCurrentBody:com.popcap.flash.games.zuma2.logic.FrogBody;
							private mEyesSprite:egret.Sprite;
							public mUpdateCount:number = 0;
							private mFrogBottomSprite:egret.Sprite;
							private mNextBullet:com.popcap.flash.games.zuma2.logic.Bullet;
							public mDestTime:number = 0;
							private mState:number = 0;
							public mCurX:number = 0;
							public mCurY:number = 0;
							private mEyesImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mChevronSize:Array<number>;
							public mCannonAngle:number = NaN;
							private mFrogTopBitmap:flash.Bitmap;
							private mCannonBlastBitmap:flash.Bitmap;
							public mRecoilAmt:number = 0;
							public mChevrons:Array<any>;
							public mType:number = 0;
							private mFireVel:number = 0;
							private mTongueBitmap:flash.Bitmap;
							public mBallYOff:number = 0;
							public mDestAngle:number = 0;
							public mCannonCount:number = 0;
							private mFrogCenter:egret.Point;
							public mBlinkCount:number = 0;
							public mAngle:number = 0;
							private mApp:Zuma2App;
							public mCenterX:number = 0;
							public mCenterY:number = 0;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mBulletSprite:egret.Sprite;
							public mFarthestDistance:number = NaN;
							private mStatePercent:number = 0;
							public mBX:number = 0;
							public mBY:number = 0;
							private mEyesBitmap:flash.Bitmap;
							public mCannonBullets:Array<com.popcap.flash.games.zuma2.logic.Bullet>;
							private mDotSprite:egret.Sprite;
							public mX:number = 0;
							public mY:number = 0;
							public mDoingCannonBlast:boolean = false;
							public mChevronPos:Array<number>;
							private mCenterPoint:egret.Point;
							public mBlinkTimer:number = 0;
							private mFrogBottomBitmap:flash.Bitmap;
							public mCannonRuneColor:number = 0;
							public mDestCount:number = 0;
							public mCannonRuneAlpha:number = 0;
							private mCannonBlastImage:com.popcap.flash.framework.resources.images.ImageInst;
							private mCannonBlastSprite:egret.Sprite;
							public mShowNextBall:boolean = false;
							public mCannonLightness:number = 0;
							private mFrogTopSprite:egret.Sprite;
							public mReloadPoint:number = 0;
							private mBullet:com.popcap.flash.games.zuma2.logic.Bullet;
							public mDestX2:number = 0;
							public mDoingHop:boolean = false;
							public mDestX1:number = 0;
							public mBallPoint:number = 0;
							public mCannonState:number = 0;
							private mDotBitmap:flash.Bitmap;
							private mTongueSprite:egret.Sprite;
							public mDestY2:number = 0;
							public mFrogBody:com.popcap.flash.games.zuma2.logic.FrogBody;
							public mDestY1:number = 0;

							public constructor(app:Zuma2App,board:com.popcap.flash.games.zuma2.widgets.GameBoardWidget)
							{
								super();
								this.mFrogCenter = new egret.Point();
								this.mCenterPoint = new egret.Point();
								this.mCannonBullets = new Array<com.popcap.flash.games.zuma2.logic.Bullet>();
								this.mChevrons = new Array();
								this.mChevronPos = new Array<number>();
								this.mChevronSize = new Array<number>();
								this.mApp = app;
								this.mBoard = board;
								this.init();
							}

							public SetDotColor()
							{
								var imageString:string = <any>null;
								if(this.mNextBullet != null)
								{
									switch(this.mNextBullet.mColorType)
									{
									case 0 :
										imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_BLUE;
										break;
									case 1 :
										imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_YELLOW;
										break;
									case 2 :
										imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_RED;
										break;
									case 3 :
										imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_GREEN;
										break;
									case 4 :
										imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_PURPLE;
										break;
									case 5 :
										imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_WHITE;
										break;
									default :
										imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_BLACK;
									}
								}
								else
								{
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_BLACK;
								}
								this.mDotBitmap.bitmapData = this.mApp["imageManager"].getBitmapData(imageString);
								this.mDotBitmap["smoothing"] = true;
								this.mDotBitmap.x = -(this.mDotBitmap.width / 2);
								this.mDotBitmap.y = -25;
							}

							public init()
							{
								var j:number = flash.checkInt(0);
								this.mIsInited = true;
								this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal);
								this.mStatePercent = 0;
								this.mFireVel = flash.checkInt(8);
								this.mBlinkCount = flash.checkInt(-1);
								this.mBlinkTimer = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < com.popcap.flash.games.zuma2.logic.Gun.NUM_CHEVRONS; i++)
								{
									this.mChevronSize[i] = i * 0.08 + 0.3;
									this.mChevronPos[i] = i * 80 + 10;
									this.mChevrons[i] = new Array();
									for(j = flash.checkInt(0); j < 3; j++)
									{
										this.mChevrons[i][j] = null;
									}
								}
								this.mCurrentBody = new com.popcap.flash.games.zuma2.logic.FrogBody();
								this.SetFrogType(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal,true);
								this.mBulletSprite = new egret.Sprite();
								this.mDotSprite = new egret.Sprite();
								this.mDotBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DOT_BLACK),flash.PixelSnapping.NEVER,true);
								this.mDotBitmap.x = -this.mDotBitmap.width / 2;
								this.mDotBitmap.y = -25;
								this.mDotSprite.addChild(this.mDotBitmap);
								this.MakeNormalFrog();
								this.mApp["mLayers"][1].mBalls.addChild(this.mFrogBottomSprite);
								this.mApp["mLayers"][1].mBalls.addChild(this.mTongueSprite);
								this.mApp["mLayers"][1].mForeground.addChild(this.mDotSprite);
								this.mApp["mLayers"][1].mForeground.addChild(this.mFrogTopSprite);
								this.mApp["mLayers"][1].mForeground.addChild(this.mEyesSprite);
							}

							public KillChevrons()
							{
								var j:number = flash.checkInt(0);
								if(this.mChevrons == null)
								{
									return ;
								}
								for(var i:number = flash.checkInt(0);i < com.popcap.flash.games.zuma2.logic.Gun.NUM_CHEVRONS; i++)
								{
									if(this.mChevrons[i] != null)
									{
										for(j = flash.checkInt(0); j < 3; j++)
										{
											if(this.mChevrons[i][j] != null)
											{
												if(this.mChevrons[i][j].parent != null)
												{
													this.mChevrons[i][j].parent.removeChild(this.mChevrons[i][j]);
													this.mChevrons[i][j] = null;
												}
											}
										}
									}
								}
							}

							public SetBulletType(theType:number)
							{
								theType = flash.checkInt(theType);
								if(this.mBullet != null && theType != -1)
								{
									this.mBullet.SetColorType(theType);
								}
							}

							public draw(canvas:com.popcap.flash.framework.Canvas)
							{
								var rad:number = <any>NaN;
								var rad_min:number = <any>NaN;
								var rad_max:number = <any>NaN;
								var vxmin:number = <any>NaN;
								var vymin:number = <any>NaN;
								var vxmax:number = <any>NaN;
								var vymax:number = <any>NaN;
								var startx:number = flash.checkInt(0);
								var starty:number = flash.checkInt(0);
								var vels:Array<egret.Point> = <any>null;
								var i:number = flash.checkInt(0);
								var v:number = flash.checkInt(0);
								this.mFrogBottomSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mFrogBottomSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mFrogTopSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mFrogTopSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mFrogBottomSprite.rotation = this.mAngle * com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG - 90;
								this.mFrogTopSprite.rotation = this.mAngle * com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG - 90;
								if(this.mCannonState > 0)
								{
									this.mFrogBottomBitmap.y = 5 - this.mRecoilAmt;
								}
								else
								{
									this.mFrogBottomBitmap.y = 13 - this.mRecoilAmt;
								}
								this.mFrogTopBitmap.y = -(this.mFrogTopBitmap.height / 2) - this.mRecoilAmt;
								this.mDotSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mDotSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mDotSprite.rotation = this.mAngle * com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG - 90;
								this.mDotBitmap.y = -25 - this.mRecoilAmt;
								this.DrawTongue();
								this.mEyesSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mEyesSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mEyesSprite.rotation = this.mAngle * com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG - 90;
								this.mEyesBitmap.y = -9 - this.mRecoilAmt;
								if(this.mState != com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal || this.mBlinkCount >= 0)
								{
									this.DrawEyes();
								}
								else
								{
									this.mEyesSprite.visible = false;
								}
								if(this.mBullet != null)
								{
									this.mBullet.Draw(canvas);
								}
								if(this.mType == com.popcap.flash.games.zuma2.logic.Gun.FrogType_Cannon && <any>!this.mBoard["IsPaused"]())
								{
									rad = -this.mDestAngle;
									rad_min = rad - this.mCannonAngle;
									rad_max = rad + this.mCannonAngle;
									vxmin = Math.cos(rad_min);
									vymin = -Math.sin(rad_min);
									vxmax = Math.cos(rad_max);
									vymax = -Math.sin(rad_max);
									startx = flash.checkInt((this.mBullet.GetX() + this.mBallXOff) * Zuma2App.SHRINK_PERCENT);
									starty = flash.checkInt((this.mBullet.GetY() + this.mBallYOff) * Zuma2App.SHRINK_PERCENT);
									vels = new Array<egret.Point>();
									vels[0] = new egret.Point(vxmin,vymin);
									vels[1] = new egret.Point(Math.cos(rad),-Math.sin(rad));
									vels[2] = new egret.Point(vxmax,vymax);
									for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.Gun.NUM_CHEVRONS; i++)
									{
										for(v = flash.checkInt(0); v < 3; v++)
										{
											this.mChevrons[i][v].x = startx + vels[v].x * this.mChevronPos[i] * Zuma2App.SHRINK_PERCENT;
											this.mChevrons[i][v].y = starty + vels[v].y * this.mChevronPos[i] * Zuma2App.SHRINK_PERCENT;
											this.mChevrons[i][v].rotation = this.mDestAngle * Zuma2App.RAD_TO_DEG + 90;
											this.mChevrons[i][v].scaleX = this.mChevronSize[i];
											this.mChevrons[i][v].scaleY = this.mChevronSize[i];
										}
									}
								}
							}

							public GetAngle():number
							{
								return this.mAngle;
							}

							public IsFiring():boolean
							{
								return this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Firing;
							}

							public LevelReset()
							{
								this.SetFrogType(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal,true);
								this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal);
								this.SetDotColor();
								this.init();
							}

							public SetDestAngle(theAngle:number)
							{
								while(this.mAngle < 0)
								{
									this.mAngle = this.mAngle + 2 * Zuma2App.MY_PI;
								}
								while(this.mAngle > 2 * Zuma2App.MY_PI)
								{
									this.mAngle = this.mAngle - 2 * Zuma2App.MY_PI;
								}
								var dist:number = Math.abs(theAngle - this.mAngle);
								if(dist > Zuma2App.MY_PI)
								{
									if(theAngle < this.mAngle)
									{
										theAngle = theAngle + 2 * Zuma2App.MY_PI;
									}
									else
									{
										theAngle = theAngle - 2 * Zuma2App.MY_PI;
									}
								}
								this.mDestAngle = theAngle;
							}

							public SetFrogType(t:number,current:boolean)
							{
								t = flash.checkInt(t);
								var i:number = flash.checkInt(0);
								var j:number = flash.checkInt(0);
								var aChevron:flash.Bitmap = <any>null;
								var fb:com.popcap.flash.games.zuma2.logic.FrogBody = this.mCurrentBody;
								if(current)
								{
									fb = this.mCurrentBody;
									fb.mAlpha = flash.checkInt(255);
								}
								fb.mTongueX = 52;
								fb.mCX = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.FROG_WIDTH / 2);
								fb.mCY = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.FROG_HEIGHT / 2);
								this.mReloadPoint = flash.checkInt(-20);
								this.mFirePoint = flash.checkInt(8);
								this.mBallPoint = flash.checkInt(40);
								this.mBallXOff = flash.checkInt(this.mBallYOff = flash.checkInt(0));
								fb.mNextBallX = flash.checkInt(62);
								fb.mNextBallY = flash.checkInt(25);
								fb.mType = flash.checkInt(t);
								if(this.mBullet != null && <any>!this.mBullet.GetJustFired())
								{
									this.mBullet.SetIsCannon(false);
								}
								if(this.mNextBullet != null && <any>!this.mNextBullet.GetJustFired())
								{
									this.mNextBullet.SetIsCannon(false);
								}
								if(t == com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal)
								{
									this.mType = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal);
									this.KillChevrons();
									this.MakeNormalFrog();
									this.mTongueSprite.visible = true;
									if(this.mBullet != null)
									{
										this.mBullet.Hide(false);
									}
									fb.mMouthOffset = new egret.Point(26,t == com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal?flash.trannumber(79):flash.trannumber(82));
									if(t == com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal)
									{
										fb.mLegsOffset = new egret.Point(2,38);
										this.mBallYOff = flash.checkInt(0);
									}
									else
									{
										fb.mLegsOffset = new egret.Point(1,41);
									}
									fb.mBodyOffset = new egret.Point(16,4);
									fb.mEyesOffset = new egret.Point(32,47);
									this.mCannonState = flash.checkInt(-1);
								}
								else if(t == com.popcap.flash.games.zuma2.logic.Gun.FrogType_Cannon)
								{
									this.mType = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Cannon);
									this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_CANNON_POWERUP);
									this.MakeCannonFrog();
									this.mTongueSprite.visible = false;
									for(i = flash.checkInt(0); i < 5; i++)
									{
										for(j = flash.checkInt(0); j < 3; j++)
										{
											aChevron = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_CANNON_CHEVRONS));
											aChevron.x = -aChevron.width / 2;
											aChevron.y = -aChevron.height / 2;
											aChevron["smoothing"] = true;
											this.mChevrons[i][j] = new egret.Sprite();
											this.mChevrons[i][j].addChild(aChevron);
											this.mChevrons[i][j].alpha = 160 / 255;
											this.mApp["mLayers"][2].addChild(this.mChevrons[i][j]);
										}
									}
								}
								else
								{
									console.log("Invalid frog type");
								}
							}

							public SetCannonCount(c:number,stack:boolean,color_type:number,cannon_angle:number = -100)
							{
								if(cannon_angle < 0)
								{
									this.mCannonAngle = this.mApp["mLevelMgr"].mCannonAngle;
								}
								else
								{
									this.mCannonAngle = cannon_angle;
								}
								if(c != 0)
								{
									if(this.mCannonCount == 0)
									{
										this.mCannonRuneColor = flash.checkInt(color_type);
										this.mCannonState = flash.checkInt(1);
										this.mCannonRuneAlpha = flash.checkInt(this.mCannonLightness = flash.checkInt(0));
									}
									if(stack)
									{
										this.mCannonCount = flash.checkInt(this.mCannonCount + (c - 1));
									}
									else
									{
										this.mCannonCount = flash.checkInt(c - 1);
									}
								}
								else
								{
									this.mCannonCount = flash.checkInt(0);
								}
								if(c == 0)
								{
									if(this.mBullet != null)
									{
										this.mBullet.SetIsCannon(false);
									}
									if(this.mNextBullet != null)
									{
										this.mNextBullet.SetIsCannon(false);
									}
								}
								else if(this.mBullet != null)
								{
									if(<any>!this.mBullet.GetIsCannon())
									{
										this.SetFrogType(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Cannon,false);
										this.mBoard["DoAccuracy"](false);
										if(<any>!this.mBullet.GetJustFired())
										{
											this.mBullet.SetIsCannon(true);
										}
										else if(<any>!this.mNextBullet.GetJustFired())
										{
											this.mNextBullet.SetIsCannon(true);
										}
										else
										{
											this.mCannonCount++;
										}
									}
									else if(this.mNextBullet != null && <any>!this.mNextBullet.GetIsCannon() && this.mState != com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal)
									{
										this.SetFrogType(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Cannon,false);
										this.mNextBullet.SetIsCannon(true);
									}
									else if(this.mState != com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal)
									{
										this.mCannonCount++;
									}
								}
							}

							public GetFiredBullet():com.popcap.flash.games.zuma2.logic.Bullet
							{
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = <any>null;
								if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Firing && this.mStatePercent >= 0.9)
								{
									if(this.mBullet.mSkip)
									{
										this.mBullet.mSkip = false;
										return null;
									}
									aBullet = this.mBullet;
									if(this.mCannonBullets.length > 0)
									{
										this.mBullet = this.mCannonBullets[0];
										this.mCannonBullets.splice(0,1);
									}
									else
									{
										this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal);
										if(aBullet.GetIsCannon())
										{
											aBullet = new com.popcap.flash.games.zuma2.logic.Bullet(this.mApp);
											aBullet.mFrog = this;
											aBullet.mX = this.mBullet.mX;
											aBullet.mY = this.mBullet.mY;
											aBullet.mVelX = this.mBullet.mVelX;
											aBullet.mVelY = this.mBullet.mVelY;
											aBullet.mJustFired = this.mBullet.mJustFired;
											aBullet.mSkip = this.mBullet.mSkip;
											aBullet.SetIsCannon(true);
											this.mBullet.mSkip = true;
											this.mBullet.SetJustFired(false);
											this.mBullet.SetIsCannon(false);
										}
										else
										{
											this.mBullet = null;
										}
									}
									return aBullet;
								}
								return null;
							}

							public CalcAngle()
							{
								if(this.mBullet == null)
								{
									return ;
								}
								var aPoint:egret.Point = new egret.Point();
								var start:number = this.mCurY + this.mReloadPoint;
								var start2:number = this.mCurY + this.mFirePoint;
								var end:number = this.mCurY + this.mBallPoint;
								aPoint.x = this.mCurX - 2;
								if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal)
								{
									aPoint.y = end;
								}
								else if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading)
								{
									aPoint.y = start + (end - start) * this.mStatePercent;
								}
								else if(this.mStatePercent <= 0.6)
								{
									aPoint.y = end + (start2 - end) * this.mStatePercent / 0.6;
								}
								else
								{
									return ;
								}
								this.RotateXY(aPoint,this.mCurX,this.mCurY,-this.mAngle);
								if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading && this.mApp["gSuckMode"])
								{
									if(this.mBX != 0 || this.mBY != 0)
									{
										aPoint.x = x * this.mStatePercent + this.mBX * (1 - this.mStatePercent);
										aPoint.y = y * this.mStatePercent + this.mBY * (1 - this.mStatePercent);
									}
								}
								this.mBullet.SetPos(aPoint.x,aPoint.y);
								this.mBullet.SetRotation(this.mAngle);
							}

							public CannonMode():boolean
							{
								return this.mCannonCount > 0;
							}

							public SwapBullets(playSound:boolean = true)
							{
								var tmp:com.popcap.flash.games.zuma2.logic.Bullet = <any>null;
								if(this.mState != com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal)
								{
									return ;
								}
								if(this.mApp["gSuckMode"])
								{
									if(playSound)
									{
										this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BALL_SWAP);
									}
									tmp = this.mBullet;
									this.mBullet = this.mNextBullet;
									this.mNextBullet = tmp;
									this.mBullet.Hide(false);
									this.mNextBullet.Hide(true);
									this.mBullet.SetIsCannon(this.mNextBullet.GetIsCannon());
									this.mNextBullet.SetIsCannon(false);
									this.SetDotColor();
									this.CalcAngle();
									return ;
								}
								if(this.mBullet == null || this.mNextBullet == null)
								{
									return ;
								}
								if(this.mBullet.GetColorType() == this.mNextBullet.GetColorType())
								{
									return ;
								}
								if(playSound)
								{
									this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BALL_SWAP);
								}
								tmp = this.mBullet;
								this.mBullet = this.mNextBullet;
								this.mNextBullet = tmp;
								this.mBullet.Hide(false);
								this.mNextBullet.Hide(true);
								this.mBullet.SetIsCannon(this.mNextBullet.GetIsCannon());
								this.mNextBullet.SetIsCannon(false);
								this.SetDotColor();
								this.CalcAngle();
							}

							public DrawTongue()
							{
								var tongueY:number = flash.checkInt(0);
								this.mTongueSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mTongueSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mTongueSprite.rotation = this.mAngle * com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG - 90;
								switch(this.mState)
								{
								case com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal :
									tongueY = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.TONGUE_Y2);
									break;
								case com.popcap.flash.games.zuma2.logic.Gun.GunState_Firing :
									tongueY = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.TONGUE_Y1 * this.mStatePercent + com.popcap.flash.games.zuma2.logic.Gun.TONGUE_Y2 * (1 - this.mStatePercent));
									break;
								case com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading :
									tongueY = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.TONGUE_Y2 * this.mStatePercent + com.popcap.flash.games.zuma2.logic.Gun.TONGUE_Y1 * (1 - this.mStatePercent));
								}
								if(this.mBullet == null)
								{
									tongueY = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.TONGUE_YNOBALL);
								}
								this.mTongueBitmap.y = -5 + tongueY - this.mRecoilAmt;
							}

							public SetNextBulletType(theType:number)
							{
								theType = flash.checkInt(theType);
								if(this.mNextBullet != null && theType != -1)
								{
									this.mNextBullet.SetColorType(theType);
									this.SetDotColor();
								}
							}

							public GetCenterX():number
							{
								return this.mCenterX;
							}

							public PlayerDied()
							{
								this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal);
								this.mRecoilAmt = flash.checkInt(0);
								this.mStatePercent = 1;
								this.mBullet.Hide(true);
							}

							public NeedsReload():boolean
							{
								return this.mNextBullet == null || this.mBullet == null;
							}

							public SetAngleToDestAngle()
							{
								while(this.mDestAngle < 0)
								{
									this.mDestAngle = this.mDestAngle + 2 * Zuma2App.MY_PI;
								}
								while(this.mDestAngle > 2 * Zuma2App.MY_PI)
								{
									this.mDestAngle = this.mDestAngle - 2 * Zuma2App.MY_PI;
								}
								this.mAngle = this.mDestAngle;
							}

							public GetCenterY():number
							{
								return this.mCenterY;
							}

							public SetFireSpeed(theSpeed:number)
							{
								this.mFireVel = flash.checkInt(theSpeed);
							}

							public Reload2(theType:number,delay:boolean,thePower:number,bx:number,by:number)
							{
								theType = flash.checkInt(theType);
								thePower = flash.checkInt(thePower);
								bx = flash.checkInt(bx);
								by = flash.checkInt(by);
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = new com.popcap.flash.games.zuma2.logic.Bullet(this.mApp);
								aBullet.mFrog = this;
								aBullet.SetColorType(theType);
								aBullet.SetPowerType(thePower,false);
								this.mBX = bx;
								this.mBY = by;
								this.mStatePercent = 0;
								this.mBullet.Delete();
								this.mBullet = aBullet;
								this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading);
								if(<any>!delay)
								{
									this.mStatePercent = 1;
									this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal);
								}
								this.SetDotColor();
								this.CalcAngle();
							}

							public Reload3()
							{
								if(this.mBullet == null && this.mNextBullet != null)
								{
									this.mBX = 0;
									this.mBY = 0;
									this.mBullet = this.mNextBullet;
									this.mNextBullet = null;
									this.mStatePercent = 0;
									this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading);
									this.SetDotColor();
									this.CalcAngle();
								}
							}

							public GetNextBullet():com.popcap.flash.games.zuma2.logic.Bullet
							{
								return this.mNextBullet;
							}

							public SetDestPos(x:number,y:number,theSpeed:number,doingHop:boolean = false)
							{
								this.mDoingHop = doingHop;
								this.mDestX1 = this.mCenterX;
								this.mDestY1 = this.mCenterY;
								this.mDestX2 = x;
								this.mDestY2 = y;
								var x2:number = (this.mDestX2 - this.mDestX1) * (this.mDestX2 - this.mDestX1);
								var y2:number = (this.mDestY2 - this.mDestY1) * (this.mDestY2 - this.mDestY1);
								var aMag:number = Math.sqrt(x2 + y2);
								this.mDestCount = flash.checkInt(aMag / theSpeed);
								if(this.mDestCount < 1)
								{
									this.mDestCount = flash.checkInt(1);
								}
								this.mDestTime = flash.checkInt(this.mDestCount);
							}

							public SetAngle(theAngle:number)
							{
								this.mAngle = this.mDestAngle = theAngle;
								this.CalcAngle();
							}

							public SetPos(theX:number,theY:number)
							{
								theX = flash.checkInt(theX);
								theY = flash.checkInt(theY);
								this.mCenterY = theX;
								this.mCenterY = theY;
								this.mDestCount = flash.checkInt(0);
								this.mCurX = theX;
								this.mCurY = theY;
								this.CalcAngle();
								var edgex:number = flash.checkInt(this.GetCenterX() > 800 - this.GetCenterX()?0:800);
								var edgey:number = flash.checkInt(this.GetCenterY() > 600 - this.GetCenterY()?0:600);
								var point1:egret.Point = new egret.Point(this.GetCenterX(),this.GetCenterY());
								var point2:egret.Point = new egret.Point(edgex,edgey);
								this.mFarthestDistance = egret.Point.distance(point1,point2);
							}

							public Reload(theType:number,delay:boolean,thePower:number)
							{
								theType = flash.checkInt(theType);
								thePower = flash.checkInt(thePower);
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = new com.popcap.flash.games.zuma2.logic.Bullet(this.mApp);
								aBullet.mFrog = this;
								aBullet.SetColorType(theType);
								aBullet.SetPowerType(thePower,false);
								this.mStatePercent = 0;
								if(this.mBullet != null)
								{
									this.mBullet.Delete();
								}
								this.mBullet = this.mNextBullet;
								if(this.mBullet != null)
								{
									this.mBullet.Hide(false);
								}
								if(this.mCannonCount > 0 && this.mBullet && <any>!this.mBullet.GetIsCannon())
								{
									this.mBullet.SetIsCannon(true);
									this.mCannonCount--;
								}
								this.mNextBullet = aBullet;
								this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading);
								if(<any>!delay)
								{
									this.mStatePercent = 1;
									this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal);
								}
								this.SetDotColor();
								this.CalcAngle();
							}

							public StartFire():boolean
							{
								var i:number = flash.checkInt(0);
								var radmod:number = <any>NaN;
								var cannon_bullet:com.popcap.flash.games.zuma2.logic.Bullet = <any>null;
								if(this.mState != com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal)
								{
									return false;
								}
								if(this.mBullet == null)
								{
									return false;
								}
								this.mStatePercent = 0;
								this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Firing);
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = this.mBullet;
								aBullet.SetJustFired(true);
								if(this.mCannonCount > 0 && <any>!aBullet.GetIsCannon())
								{
									aBullet.SetIsCannon(true);
									this.mCannonCount--;
								}
								if(aBullet.GetIsCannon())
								{
									this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_CANNON_BLAST);
									this.mDoingCannonBlast = true;
									this.mCannonBlastImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_CANNON_BLAST);
									this.mCannonBlastBitmap = new flash.Bitmap(this.mCannonBlastImage["pixels"]);
									this.mCannonBlastBitmap.x = -this.mCannonBlastBitmap.width / 2;
									this.mCannonBlastBitmap.y = -this.mCannonBlastBitmap.height / 2 + 60;
									this.mCannonBlastSprite = new egret.Sprite();
									this.mCannonBlastSprite.addChild(this.mCannonBlastBitmap);
									this.mCannonBlastSprite.x = this.mCenterX * Zuma2App.SHRINK_PERCENT;
									this.mCannonBlastSprite.y = this.mCenterY * Zuma2App.SHRINK_PERCENT;
									this.mCannonBlastSprite.rotation = this.mAngle * Zuma2App.RAD_TO_DEG - 90;
									this.mApp["mLayers"][0].mForeground.addChild(this.mCannonBlastSprite);
								}
								var rad:number = this.mAngle;
								var vx:number = Math.cos(rad);
								var vy:number = Math.sin(rad);
								var vel:number = <any>this.mFireVel;
								this.mBullet.SetVelocity(vx * vel,vy * vel);
								if(aBullet.GetIsCannon() && this.mCannonAngle != 0)
								{
									for(i = flash.checkInt(0); i < 2; i++)
									{
										radmod = (i == 0?-1:1) * this.mCannonAngle;
										vx = Math.cos(rad + radmod);
										vy = Math.sin(rad + radmod);
										cannon_bullet = new com.popcap.flash.games.zuma2.logic.Bullet(this.mApp);
										cannon_bullet.mFrog = this;
										cannon_bullet.mX = this.mBullet.mX;
										cannon_bullet.mY = this.mBullet.mY;
										cannon_bullet.mJustFired = this.mBullet.mJustFired;
										cannon_bullet.mAngleFired = rad + radmod;
										cannon_bullet.SetVelocity(vel * vx,vel * vy);
										cannon_bullet.SetIsCannon(true);
										this.mCannonBullets.push(cannon_bullet);
									}
								}
								if(aBullet.GetIsCannon() && <any>!this.CannonMode())
								{
									this.SetFrogType(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal,false);
								}
								this.CalcAngle();
								return true;
							}

							public GetDestAngle():number
							{
								return this.mDestAngle;
							}

							public DeleteBullet()
							{
								if(this.mBullet != null)
								{
									this.mBullet.Delete();
									this.mBullet = this.mNextBullet;
									this.mNextBullet = null;
								}
							}

							public RotateXY(aPoint:egret.Point,cx:number,cy:number,rad:number)
							{
								var ox:number = aPoint.x - cx;
								var oy:number = aPoint.y - cy;
								rad = rad + Zuma2App.MY_PI / 2;
								aPoint.x = cx + ox * Math.cos(rad) + oy * Math.sin(rad);
								aPoint.y = cy + oy * Math.cos(rad) - ox * Math.sin(rad);
							}

							public update()
							{
								var v:number = <any>NaN;
								var amount:number = <any>NaN;
								var old_angle:number = <any>NaN;
								var t:number = <any>NaN;
								var i:number = flash.checkInt(0);
								if(<any>!this.mIsInited)
								{
									this.init();
								}
								this.mUpdateCount++;
								this.mCurX = this.mCenterX;
								this.mCurY = this.mCenterY;
								this.mX = this.mCenterX;
								this.mY = this.mCenterY;
								if(this.mBullet != null)
								{
									this.mBullet.Update();
								}
								if(this.mNextBullet != null)
								{
									this.mNextBullet.Update();
								}
								if(this.mBlinkCount >= 0 && --this.mBlinkTimer == 0)
								{
									this.mBlinkCount--;
									this.mBlinkTimer = flash.checkInt(15);
								}
								if(this.mAngle != this.mDestAngle)
								{
									v = 100;
									amount = v;
									old_angle = this.mAngle;
									if(this.mAngle < this.mDestAngle)
									{
										this.mAngle = this.mAngle + amount;
										if(this.mAngle > this.mDestAngle)
										{
											this.SetAngleToDestAngle();
										}
									}
									else
									{
										this.mAngle = this.mAngle - amount;
										if(this.mAngle < this.mDestAngle)
										{
											this.SetAngleToDestAngle();
										}
									}
								}
								if(this.mDestCount > 0)
								{
									this.mDestCount--;
									t = flash.trannumber(this.mDestCount) / this.mDestTime;
									this.mCenterX = t * this.mDestX1 + (1 - t) * this.mDestX2;
									this.mCenterY = t * this.mDestY1 + (1 - t) * this.mDestY2;
									if(this.mDestCount == 0)
									{
										this.mDoingHop = false;
									}
								}
								var slow_mod:number = <any>1;
								if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Firing)
								{
									this.mStatePercent = this.mStatePercent + 0.15;
									if(this.mStatePercent > 0.6)
									{
										this.mBullet.Update();
										this.mRecoilAmt = flash.checkInt(this.mRecoilAmt + 2.33);
									}
								}
								else
								{
									this.mStatePercent = this.mStatePercent + 0.07 / slow_mod;
									if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading)
									{
										if((this.mRecoilAmt = flash.checkInt(this.mRecoilAmt - 0.7 / slow_mod)) < 0)
										{
											this.mRecoilAmt = flash.checkInt(0);
										}
									}
								}
								if(this.mStatePercent > 1)
								{
									this.mStatePercent = 1;
									if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading)
									{
										this.mState = flash.checkInt(com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal);
										this.mRecoilAmt = flash.checkInt(0);
									}
								}
								if(this.mState == com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal && this.mRecoilAmt > 0)
								{
									if((this.mRecoilAmt = flash.checkInt(this.mRecoilAmt - 0.7)) / slow_mod < 0)
									{
										this.mRecoilAmt = flash.checkInt(0);
									}
								}
								if(this.mDoingCannonBlast)
								{
									if(this.mUpdateCount % 2 == 0)
									{
										this.mCannonBlastImage["mFrame"]++;
										this.mCannonBlastBitmap.bitmapData = this.mCannonBlastImage["pixels"];
										if(this.mCannonBlastImage["mFrame"] >= 14)
										{
											this.mDoingCannonBlast = false;
											if(this.mCannonBlastSprite.parent != null)
											{
												this.mCannonBlastSprite.parent.removeChild(this.mCannonBlastSprite);
												this.mCannonBlastSprite = null;
												this.mCannonBlastImage = null;
												this.mCannonBlastBitmap = null;
											}
										}
									}
								}
								if(this.mBullet != null)
								{
									if(this.mBullet.GetIsCannon())
									{
										for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.Gun.NUM_CHEVRONS; i++)
										{
											this.mChevronSize[i] = this.mChevronSize[i] + 0.001;
											this.mChevronPos[i] = this.mChevronPos[i] + 1;
											if(i == 0)
												{}
											if(this.mChevronPos[i] > 420)
											{
												this.mChevronSize[i] = 0.3;
												this.mChevronPos[i] = 10;
											}
										}
									}
								}
								this.CalcAngle();
							}

							public MakeNormalFrog()
							{
								if(this.mEyesSprite == null)
								{
									this.mEyesSprite = new egret.Sprite();
									this.mEyesImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_EYES);
									this.mEyesImage["mFrame"] = 0;
									this.mEyesBitmap = new flash.Bitmap(this.mEyesImage["pixels"],flash.PixelSnapping.NEVER,true);
									this.mEyesSprite.addChild(this.mEyesBitmap);
								}
								if(this.mFrogTopSprite == null)
								{
									this.mFrogTopSprite = new egret.Sprite();
									this.mFrogTopBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_TOP));
									this.mFrogTopSprite.addChild(this.mFrogTopBitmap);
								}
								if(this.mFrogBottomSprite == null)
								{
									this.mFrogBottomSprite = new egret.Sprite();
									this.mFrogBottomBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_BOTTOM));
									this.mFrogBottomSprite.addChild(this.mFrogBottomBitmap);
								}
								if(this.mTongueSprite == null)
								{
									this.mTongueSprite = new egret.Sprite();
									this.mTongueBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_TONGUE));
									this.mTongueSprite.addChild(this.mTongueBitmap);
								}
								this.mEyesImage["mFrame"] = 0;
								this.mEyesImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_EYES);
								this.mEyesBitmap.bitmapData = this.mEyesImage["pixels"];
								this.mEyesBitmap["smoothing"] = true;
								this.mEyesBitmap.x = -this.mEyesBitmap.width / 2;
								this.mEyesBitmap.y = -9;
								this.mEyesSprite.visible = false;
								this.mFrogTopBitmap.bitmapData = this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_TOP);
								this.mFrogTopBitmap["smoothing"] = true;
								this.mFrogTopBitmap.x = -(this.mFrogTopBitmap.width / 2);
								this.mFrogTopBitmap.y = -(this.mFrogTopBitmap.height / 2);
								this.mFrogTopSprite.x = this.mX;
								this.mFrogTopSprite.y = this.mY;
								this.mTongueBitmap.bitmapData = this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_TONGUE);
								this.mTongueBitmap["smoothing"] = true;
								this.mTongueBitmap.x = -(this.mTongueBitmap.width / 2);
								this.mTongueBitmap.y = -5;
								this.mTongueSprite.x = this.mX;
								this.mTongueSprite.y = this.mY;
								this.mFrogBottomBitmap.bitmapData = this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_BOTTOM);
								this.mFrogBottomBitmap["smoothing"] = true;
								this.mFrogBottomBitmap.x = -(this.mFrogBottomBitmap.width / 2);
								this.mFrogBottomBitmap.y = 13;
								this.mFrogBottomSprite.x = this.mX;
								this.mFrogBottomSprite.y = this.mY;
							}

							public EmptyBullets(reset_frog_type:boolean = true)
							{
								if(reset_frog_type)
								{
									this.SetFrogType(com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal,true);
								}
								if(this.mNextBullet != null)
								{
									this.mNextBullet.Delete();
									this.mNextBullet = null;
								}
								if(this.mBullet != null)
								{
									this.mBullet.Delete();
									this.mBullet = null;
								}
								for(var i:number = flash.checkInt(0);i < this.mCannonBullets.length; i++)
								{
									this.mCannonBullets[i].Delete();
								}
								this.mCannonBullets = new Array<com.popcap.flash.games.zuma2.logic.Bullet>();
							}

							public GetX():number
							{
								return this.mX;
							}

							public GetY():number
							{
								return this.mY;
							}

							public DrawEyes()
							{
								var cel:number = flash.checkInt(0);
								if(this.mBlinkCount >= 0)
								{
									cel = flash.checkInt(this.mBlinkCount % 2 == 0?-1:1);
								}
								else if(this.mState != com.popcap.flash.games.zuma2.logic.Gun.GunState_Firing)
								{
									cel = flash.checkInt(1);
								}
								if(cel >= 0)
								{
									this.mEyesImage["mFrame"] = cel;
									this.mEyesBitmap.bitmapData = this.mEyesImage["pixels"];
									this.mEyesSprite.visible = true;
								}
							}

							public GetBullet():com.popcap.flash.games.zuma2.logic.Bullet
							{
								return this.mBullet;
							}

							public Move(x:number,y:number)
							{
								var dx:number = x - this.mFrogTopSprite.x;
								var dy:number = y - this.mFrogTopSprite.y;
								var angle:number = Math.atan2(dy,dx);
								this.mFrogTopSprite.rotation = angle * com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG - 90;
								this.mFrogBottomSprite.rotation = angle * com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG - 90;
								this.mDotSprite.x = this.mX - 50 * Math.cos(angle);
								this.mDotSprite.y = this.mY - 50 * Math.sin(angle);
								this.mAngle = angle;
							}

							public ForceX(x:number)
							{
								x = flash.checkInt(x);
								this.mCenterX = this.mCurX = x;
							}

							public ForceY(y:number)
							{
								y = flash.checkInt(y);
								this.mCenterY = this.mCurY = y;
							}

							public MakeCannonFrog()
							{
								if(this.mEyesSprite == null)
								{
									this.mEyesSprite = new egret.Sprite();
								}
								if(this.mFrogTopSprite == null)
								{
									this.mFrogTopSprite = new egret.Sprite();
								}
								if(this.mFrogBottomSprite == null)
								{
									this.mFrogBottomSprite = new egret.Sprite();
								}
								if(this.mTongueSprite == null)
								{
									this.mTongueSprite = new egret.Sprite();
								}
								this.mEyesImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_CANNON_EYES);
								this.mEyesImage["mFrame"] = 0;
								this.mEyesBitmap.bitmapData = this.mEyesImage["pixels"];
								this.mEyesBitmap.x = -this.mEyesBitmap.width / 2;
								this.mEyesBitmap.y = -9;
								this.mEyesSprite.visible = false;
								this.mFrogTopBitmap.bitmapData = this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_CANNON_TOP);
								this.mFrogTopBitmap["smoothing"] = true;
								this.mFrogTopBitmap.x = -(this.mFrogTopBitmap.width / 2);
								this.mFrogTopBitmap.y = -(this.mFrogTopBitmap.height / 2);
								this.mFrogTopSprite.x = this.mX;
								this.mFrogTopSprite.y = this.mY;
								this.mFrogBottomBitmap.bitmapData = this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_FROG_CANNON_BOTTOM);
								this.mFrogBottomBitmap["smoothing"] = true;
								this.mFrogBottomBitmap.x = -(this.mFrogBottomBitmap.width / 2);
								this.mFrogBottomBitmap.y = 10;
								this.mFrogBottomSprite.x = this.mX;
								this.mFrogBottomSprite.y = this.mY;
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.Gun.GunState_Firing = 1;
com.popcap.flash.games.zuma2.logic.Gun.FrogType_Normal = 0;
com.popcap.flash.games.zuma2.logic.Gun.FROG_WIDTH = 147;
com.popcap.flash.games.zuma2.logic.Gun.NUM_CHEVRONS = 5;
com.popcap.flash.games.zuma2.logic.Gun.TONGUE_Y1 = 5;
com.popcap.flash.games.zuma2.logic.Gun.TONGUE_Y2 = 3;
com.popcap.flash.games.zuma2.logic.Gun.FrogType_Cannon = 1;
com.popcap.flash.games.zuma2.logic.Gun.FROG_HEIGHT = 134;
com.popcap.flash.games.zuma2.logic.Gun.TONGUE_YNOBALL = 7;
com.popcap.flash.games.zuma2.logic.Gun.DEG_TO_RAD = Zuma2App.MY_PI / 180;
com.popcap.flash.games.zuma2.logic.Gun.RAD_TO_DEG = 180 / Zuma2App.MY_PI;
com.popcap.flash.games.zuma2.logic.Gun.GunState_Reloading = 2;
com.popcap.flash.games.zuma2.logic.Gun.GunState_Normal = 0;
flash.extendsClass("com.popcap.flash.games.zuma2.logic.Gun","com.popcap.flash.framework.widgets.WidgetContainer")
flash.implementsClass("com.popcap.flash.games.zuma2.logic.Gun",["com.popcap.flash.framework.widgets.Widget"]);