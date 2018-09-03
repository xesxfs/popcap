module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Ball extends egret.HashObject {
							public static mIdGen:number;
							public mComboScore:number = 0;
							public mExplodeAlpha:number = 1.0;
							public mExplodeFrame:number = 0;
							public mPowerupIconSprite:egret.Sprite;
							public mExplodingFromLightning:boolean = false;
							public mIsCannon:boolean = false;
							public mIconAppearScale:number = NaN;
							public mBallBitmap:flash.Bitmap;
							public mHilightSprite:egret.Sprite;
							public mComboCount:number = 0;
							public mPowerupIconImage:com.popcap.flash.framework.resources.images.ImageInst;
							public p:com.popcap.flash.games.zuma2.logic.SexyVector3;
							public mDead:boolean = false;
							public mApp:Zuma2App;
							public mGapBonus:number = 0;
							public mId:number = 0;
							public mStartFrame:number = 0;
							public mCollidesWithNext:boolean = false;
							public mLastPowerType:number = 0;
							public mExplodingInTunnel:boolean = false;
							public mCurve:com.popcap.flash.games.zuma2.logic.CurveMgr;
							public mLastFrame:number = 0;
							public mNeedCheckCollision:boolean = false;
							private mMatrix:egret.Matrix;
							public mPowerupIconBitmap:flash.Bitmap;
							public mCel:number = 0;
							public mPowerupBallImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mList:de.polygonal.ds.DLinkedList;
							public mBallImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mBallExplodeBitmap:flash.Bitmap;
							public mPulseState:number = 0;
							public mRotationInc:number = NaN;
							public mHilightBitmap:flash.Bitmap;
							public mHilightPulse:boolean = false;
							public mSuckCount:number = 0;
							public mRotation:number = NaN;
							public mBackwardsSpeed:number = NaN;
							public mShrinkClear:boolean = false;
							public mUpdateCount:number = 0;
							public mShouldRemove:boolean = false;
							public mBallExplodeImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mPriority:number = 0;
							public mPowerFade:number = 0;
							public mSuckPending:boolean = false;
							public mDestRotation:number = NaN;
							public mColorType:number = 0;
							public mPowerCount:number = 0;
							public mRadius:number = NaN;
							public mSuckFromCompacting:boolean = false;
							public mIconScaleRate:number = NaN;
							public mWayPoint:number = NaN;
							public mExploding:boolean = false;
							public mPulseTimer:number = 0;
							public mInTunnel:boolean = false;
							public mX:number = NaN;
							public mY:number = NaN;
							public mPowerupBallBitmap:flash.Bitmap;
							public mFrog:com.popcap.flash.games.zuma2.logic.Gun;
							public mCannonFrame:number = 0;
							public mBackwardsCount:number = 0;
							public mBullet:com.popcap.flash.games.zuma2.logic.Bullet;
							public mNumGaps:number = 0;
							public mSuckBack:boolean = false;
							public mSpeedy:boolean = false;
							public mPowerGracePeriod:number = 0;
							public mIconCel:number = 0;
							public mDestPowerType:number = 0;
							public mBallSprite:egret.Sprite;
							public mPowerType:number = 0;
							public mListItr:de.polygonal.ds.DListIterator;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mMatrix = new egret.Matrix();
								this.p = new com.popcap.flash.games.zuma2.logic.SexyVector3(0,0,0);
								this.mApp = app;
								this.mDead = false;
								this.mId = flash.checkInt(++com.popcap.flash.games.zuma2.logic.Ball.mIdGen);
								this.mBallSprite = new egret.Sprite();
								this.mHilightSprite = new egret.Sprite();
								this.mHilightBitmap = new flash.Bitmap();
								this.mBallImage = this.mApp["imageManager"].getImageInst(this.PickBallColor());
								this.mBallImage["mFrame"] = Math.random() * 60;
								this.mMatrix.translate(-13,-13);
								this.mBallSprite = new egret.Sprite();
								this.mBallSprite.graphics["beginBitmapFill"](this.mBallImage["pixels"],this.mMatrix,false,true);
								this.mBallSprite.graphics.drawRect(-13,-13,26,26);
								this.mBallSprite.graphics.endFill();
								this.mBallSprite.x = -50;
								this.mBallSprite.y = -50;
								this.mApp["mLayers"][0].mBalls.addChild(this.mBallSprite);
								this.mApp["mLayers"][0].mBalls.addChild(this.mHilightSprite);
								this.mPriority = flash.checkInt(0);
								this.mFrog = null;
								this.mInTunnel = false;
								this.mCurve = null;
								this.mUpdateCount = flash.checkInt(0);
								this.mSuckFromCompacting = false;
								this.mX = 0;
								this.mY = 0;
								this.mSuckBack = true;
								this.mBullet = null;
								this.mCel = flash.checkInt(0);
								this.mShouldRemove = false;
								this.mLastFrame = flash.checkInt(0);
								this.mIsCannon = false;
								this.mSpeedy = false;
								this.mList = null;
								this.mCollidesWithNext = false;
								this.mSuckCount = flash.checkInt(0);
								this.mBackwardsCount = flash.checkInt(0);
								this.mBackwardsSpeed = 0;
								this.mComboCount = flash.checkInt(0);
								this.mComboScore = flash.checkInt(0);
								this.mRotation = 0;
								this.mRotationInc = 0;
								this.mNeedCheckCollision = false;
								this.mSuckPending = false;
								this.mShrinkClear = false;
								this.mIconCel = flash.checkInt(-1);
								this.mIconAppearScale = 1;
								this.mIconScaleRate = 0;
								this.mStartFrame = flash.checkInt(0);
								this.mWayPoint = 0;
								this.mPowerType = flash.checkInt(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
								this.mDestPowerType = flash.checkInt(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
								this.mPowerCount = flash.checkInt(0);
								this.mPowerFade = flash.checkInt(0);
								this.mGapBonus = flash.checkInt(0);
								this.mNumGaps = flash.checkInt(0);
								this.mExplodeFrame = flash.checkInt(0);
								this.mPowerGracePeriod = flash.checkInt(0);
								this.mLastPowerType = flash.checkInt(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
								this.mExplodingFromLightning = false;
								this.mExploding = this.mExplodingInTunnel = false;
								this.mRadius = 18;
							}

							public SetComboCount(theCount:number,theScore:number)
							{
								theCount = flash.checkInt(theCount);
								theScore = flash.checkInt(theScore);
								this.mComboCount = flash.checkInt(theCount);
								this.mComboScore = flash.checkInt(theScore);
							}

							public GetX():number
							{
								return this.mX;
							}

							public SetPriority(p:number)
							{
								p = flash.checkInt(p);
								if(p > this.mPriority)
								{
									this.mApp["mLayers"][1].mBalls.addChild(this.mBallSprite);
									this.mApp["mLayers"][1].mBalls.addChild(this.mHilightSprite);
									if(this.mPowerupIconSprite != null)
									{
										this.mApp["mLayers"][1].mForeground.addChild(this.mPowerupIconSprite);
									}
								}
								if(p < this.mPriority)
								{
									this.mApp["mLayers"][0].mBalls.addChild(this.mBallSprite);
									this.mApp["mLayers"][0].mBalls.addChild(this.mHilightSprite);
									if(this.mPowerupIconSprite != null)
									{
										this.mApp["mLayers"][0].mForeground.addChild(this.mPowerupIconSprite);
									}
								}
								this.mPriority = flash.checkInt(p);
							}

							public GetBackwardsSpeed():number
							{
								return this.mBackwardsSpeed;
							}

							public GetIsCannon():boolean
							{
								return this.mIsCannon;
							}

							public SetBackwardsSpeed(speed:number)
							{
								this.mBackwardsSpeed = speed;
							}

							public GetExplosionColor():string
							{
								var imageString:string = <any>null;
								switch(this.mColorType)
								{
								case 0 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_BLUE_EXPLOSION;
									break;
								case 1 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_YELLOW_EXPLOSION;
									break;
								case 2 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_RED_EXPLOSION;
									break;
								case 3 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_GREEN_EXPLOSION;
									break;
								case 4 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_PURPLE_EXPLOSION;
									break;
								case 5 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_WHITE_EXPLOSION;
									break;
								default :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_BLUE_EXPLOSION;
								}
								return imageString;
							}

							public GetPrevBall(mustCollide:boolean = false):com.popcap.flash.games.zuma2.logic.Ball
							{
								if(this.mList == null)
								{
									return null;
								}
								var anItr:de.polygonal.ds.DListIterator = this.mListItr;
								if(anItr["node"] == this.mList["head"])
								{
									return null;
								}
								if(<any>!mustCollide)
								{
									return anItr["node"].prev.data;
								}
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>anItr["node"].prev.data;
								if(aBall.GetCollidesWithNext())
								{
									return aBall;
								}
								return null;
							}

							public RemoveFromList()
							{
								if(this.mList != null)
								{
									this.mList["remove"](this.mListItr);
									this.mList = null;
									this.mListItr = null;
								}
							}

							public UpdateExplosion()
							{
								if(<any>!this.mExploding)
								{
									return ;
								}
								if(<any>!this.mExplodingFromLightning && this.mUpdateCount % 4 == 0)
								{
									this.mExplodeFrame++;
									this.mExplodeAlpha = this.mExplodeAlpha - 0.15;
								}
								if(this.mExplodeFrame >= 10)
								{
									this.mShouldRemove = true;
								}
							}

							public GetIsExploding():boolean
							{
								return this.mExploding;
							}

							public GetGapBonus():number
							{
								return this.mGapBonus;
							}

							public SetWayPoint(thePoint:number,in_tunnel:boolean)
							{
								this.mWayPoint = thePoint;
								this.mInTunnel = in_tunnel;
								if(thePoint > 100)
									{}
							}

							public Contains(x:number,y:number):boolean
							{
								x = flash.checkInt(x);
								y = flash.checkInt(y);
								x = flash.checkInt(x - this.mX);
								y = flash.checkInt(y - this.mY);
								var r:number = flash.checkInt(this.GetRadius() - 3);
								if(x * x + y * y < r * r)
								{
									return true;
								}
								return false;
							}

							public SetSuckPending(pending:boolean,compact:boolean = false)
							{
								this.mSuckPending = pending;
								this.mSuckFromCompacting = compact;
							}

							public SetCollidesWithNext(collidesWithNext:boolean)
							{
								this.mCollidesWithNext = collidesWithNext;
							}

							public GetSuckCount():number
							{
								return this.mSuckCount;
							}

							public SetBallImage(color:number)
							{
								color = flash.checkInt(color);
								var imageString:string = <any>null;
								switch(color)
								{
								case 0 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_BLUE;
									break;
								case 1 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_YELLOW;
									break;
								case 2 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_RED;
									break;
								case 3 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_GREEN;
									break;
								case 4 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_PURPLE;
									break;
								case 5 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_WHITE;
									break;
								default :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_BLUE;
								}
								this.mBallImage = this.mApp["imageManager"].getImageInst(imageString);
								this.mBallImage["mFrame"] = Math.random() * 60;
								this.mBallSprite.graphics.clear();
								this.mBallSprite.graphics["beginBitmapFill"](this.mBallImage["pixels"],this.mMatrix,false,true);
								this.mBallSprite.graphics.drawRect(-13,-13,26,26);
								this.mBallSprite.graphics.endFill();
							}

							public GetCollidesWithPrev():boolean
							{
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = this.GetPrevBall();
								if(aPrevBall != null)
								{
									return aPrevBall.GetCollidesWithNext();
								}
								return false;
							}

							public GetShouldRemove():boolean
							{
								return this.mShouldRemove;
							}

							public CollidesWith(ball:com.popcap.flash.games.zuma2.logic.Ball,thePad:number = 0):boolean
							{
								return Math.abs(flash.tranint(this.mWayPoint) - flash.tranint(ball.mWayPoint)) < (this.mRadius + thePad) * 2;
							}

							public UpdateCollisionInfo(thePad:number = 0)
							{
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = this.GetPrevBall();
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = this.GetNextBall();
								if(aPrevBall != null)
								{
									aPrevBall.SetCollidesWithNext(aPrevBall.CollidesWith(this,thePad));
								}
								if(aNextBall != null)
								{
									this.SetCollidesWithNext(aNextBall.CollidesWith(this,thePad));
								}
								else
								{
									this.SetCollidesWithNext(false);
								}
							}

							public GetColorType():number
							{
								return this.mColorType;
							}

							public SetPos(x:number,y:number)
							{
								this.mX = x;
								this.mY = y;
							}

							public Explode(in_tunnel:boolean,from_lightning_frog:boolean)
							{
								var p:com.popcap.flash.games.zuma2.logic.PowerEffect = <any>null;
								if(this.mExploding)
								{
									return ;
								}
								this.mExplodeAlpha = 1;
								this.mBallSprite.graphics.clear();
								this.mHilightSprite.graphics.clear();
								if(this.mPowerupIconSprite != null)
								{
									this.mPowerupIconSprite.graphics.clear();
								}
								this.mExploding = true;
								this.mExplodingInTunnel = in_tunnel;
								if(<any>!this.mExplodingInTunnel)
								{
									this.mExplodeFrame = flash.checkInt(0);
									this.mBallExplodeImage = this.mApp["imageManager"].getImageInst(this.GetExplosionColor());
									this.mBallExplodeImage["mFrame"] = this.mExplodeFrame;
									this.mBallExplodeBitmap = new flash.Bitmap(this.mBallExplodeImage["pixels"]);
									this.mBallExplodeBitmap.x = -this.mBallExplodeBitmap.width / 2;
									this.mBallExplodeBitmap.y = -this.mBallExplodeBitmap.height / 2;
									this.mBallSprite.addChild(this.mBallExplodeBitmap);
								}
								var b:com.popcap.flash.games.zuma2.widgets.GameBoardWidget = this.mCurve.mBoard;
								if(this.GetPowerOrDestType() == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_ProximityBomb)
								{
									p = new com.popcap.flash.games.zuma2.logic.PowerEffect(this.mApp,this.mX,this.mY);
									p.AddDefaultEffectType(com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Bomb,this.mColorType,this.mRotation);
									b["AddPowerEffect"](p);
									b["AddProxBombExplosion"](this.GetX(),this.GetY());
								}
								else if(this.GetPowerOrDestType() == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Accuracy)
								{
									p = new com.popcap.flash.games.zuma2.logic.PowerEffect(this.mApp,this.mX,this.mY);
									p.AddDefaultEffectType(com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Accuracy,this.mColorType,this.mRotation);
									b["AddPowerEffect"](p);
								}
								else if(this.GetPowerOrDestType() == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_MoveBackwards)
								{
									p = new com.popcap.flash.games.zuma2.logic.ReversePowerEffect(this.mApp,this,this.mX,this.mY);
									p.AddDefaultEffectType(com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Reverse,this.mColorType,this.mRotation);
									b["AddPowerEffect"](p);
								}
								else if(this.GetPowerOrDestType() == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_SlowDown)
								{
									p = new com.popcap.flash.games.zuma2.logic.PowerEffect(this.mApp,this.mX,this.mY);
									p.AddDefaultEffectType(com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Stop,this.mColorType,this.mRotation);
									b["AddPowerEffect"](p);
								}
								else if(this.GetPowerOrDestType() != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Cannon)
								{
									if(this.GetPowerOrDestType() == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Laser)
										{}
								}
								if(this.GetPowerOrDestType() != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
									{}
							}

							public SetSuckCount(theCount:number,suck_back:boolean = true)
							{
								this.mSuckCount = flash.checkInt(theCount);
								this.mSuckBack = suck_back;
							}

							public GetPowerOrDestType(include_grace_period:boolean = true):number
							{
								if(this.mPowerType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
								{
									return this.mPowerType;
								}
								if(this.mPowerGracePeriod > 0 && this.mLastPowerType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
								{
									return this.mLastPowerType;
								}
								return this.mDestPowerType;
							}

							public GetRotation():number
							{
								return this.mRotation;
							}

							public GetBackwardsCount():number
							{
								return this.mBackwardsCount;
							}

							public GetSuckPending():boolean
							{
								return this.mSuckPending;
							}

							public SetBackwardsCount(theCount:number)
							{
								theCount = flash.checkInt(theCount);
								this.mBackwardsCount = flash.checkInt(theCount);
							}

							public GetNextBall(mustCollide:boolean = false):com.popcap.flash.games.zuma2.logic.Ball
							{
								if(this.mList == null)
								{
									return null;
								}
								var anItr:de.polygonal.ds.DListIterator = this.mListItr;
								if(anItr["node"].next == null)
								{
									return null;
								}
								if(<any>!mustCollide || this.GetCollidesWithNext())
								{
									return anItr["node"].next.data;
								}
								return null;
							}

							public Update(theAmount:number = 1)
							{
								var imageString:string = <any>null;
								this.mUpdateCount++;
								if(this.mPowerFade > 0)
								{
									this.mIconAppearScale = this.mIconAppearScale - this.mIconScaleRate;
									if(this.mIconAppearScale < 1)
									{
										this.mIconAppearScale = 1;
									}
									this.mPowerFade--;
									if(this.mPowerFade == 0)
									{
										this.mPowerType = flash.checkInt(this.mDestPowerType);
										if(this.mPowerType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
										{
											return ;
										}
										this.mDestPowerType = flash.checkInt(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
										if(this.mPowerType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None && this.mPowerCount <= 0)
										{
											this.mPowerCount = flash.checkInt(2000);
										}
										imageString = this.GetPowerupImage();
										this.mPowerupBallImage = this.mApp["imageManager"].getImageInst(imageString);
										this.mPowerupBallImage["mFrame"] = this.mIconCel;
										this.mPowerupIconSprite.graphics["beginBitmapFill"](this.mPowerupBallImage["pixels"],this.mMatrix,false,true);
										this.mPowerupIconSprite.graphics.drawRect(-13,-13,26,26);
										this.mPowerupIconSprite.graphics.endFill();
										this.mIconAppearScale = 1;
										if(this.mPowerType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_MoveBackwards)
										{
											this.mPowerupIconImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_REVERSE_PULSE);
											this.mPowerupIconImage["mFrame"] = 0;
											this.mPowerupIconBitmap.bitmapData = this.mPowerupIconImage["pixels"];
											this.mPowerupIconBitmap.x = -this.mPowerupIconBitmap.width / 2;
											this.mPowerupIconBitmap.y = -this.mPowerupIconBitmap.height / 2;
											this.mPowerupIconBitmap["smoothing"] = true;
											this.mPowerupIconSprite.addChild(this.mPowerupIconBitmap);
										}
										this.mBallSprite.visible = false;
										this.mIconCel = flash.checkInt(-1);
									}
								}
								if(this.mPowerCount > 0 && <any>!this.mExploding)
								{
									if(--this.mPowerCount <= 0)
									{
										this.mPowerGracePeriod = flash.checkInt(150);
										this.mLastPowerType = flash.checkInt(this.GetPowerOrDestType());
										this.SetPowerType(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
									}
								}
								if(this.mPowerGracePeriod > 0 && --this.mPowerGracePeriod == 0)
								{
									this.mLastPowerType = flash.checkInt(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
								}
								if(this.mPowerType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
								{
									if(<any>!this.mExploding)
									{
										this.mPulseTimer++;
										if(this.mPulseState == 0 && this.mPulseTimer >= 30)
										{
											this.mPulseState++;
											this.mPulseTimer = flash.checkInt(0);
										}
										else if(this.mPulseState == 1 && this.mPulseTimer >= 128)
										{
											this.mPulseTimer = flash.checkInt(0);
											this.mPulseState++;
										}
										else if(this.mPulseState == 2 && this.mPulseTimer >= 25)
										{
											this.mPulseState = flash.checkInt(0);
											this.mPulseTimer = flash.checkInt(0);
										}
									}
								}
								if(this.mPowerType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_MoveBackwards && this.mUpdateCount % 4 == 0)
								{
									this.mCel = flash.checkInt(this.mCel == 0?21:flash.tranint(this.mCel - 1));
								}
								this.UpdateRotation();
							}

							public GetNumGaps():number
							{
								return this.mNumGaps;
							}

							public GetId():number
							{
								return this.mId;
							}

							public SetColorType(theType:number)
							{
								theType = flash.checkInt(theType);
								this.mColorType = flash.checkInt(theType);
								this.SetBallImage(this.mColorType);
							}

							public SetNeedCheckCollision(needCheck:boolean)
							{
								this.mNeedCheckCollision = needCheck;
							}

							public GetListItr():de.polygonal.ds.DListIterator
							{
								return this.mListItr;
							}

							public GetWayPoint():number
							{
								return this.mWayPoint;
							}

							public GetPowerupImage():string
							{
								var imageString:string = <any>null;
								switch(this.mColorType)
								{
								case 0 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_BLUE;
									break;
								case 1 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_YELLOW;
									break;
								case 2 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_RED;
									break;
								case 3 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_GREEN;
									break;
								case 4 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_PURPLE;
									break;
								case 5 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_WHITE;
									break;
								default :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_BLUE;
								}
								return imageString;
							}

							public DrawAboveBalls()
							{
								var angle_off:number = <any>NaN;
								var alpha:number = <any>NaN;
								if(this.mPowerupIconSprite != null && this.mPowerupIconSprite.parent != null)
								{
									angle_off = -Zuma2App.MY_PI / 2;
									this.mPowerupIconSprite.rotation = (angle_off + -this.mRotation) * Zuma2App.RAD_TO_DEG;
									this.mPowerupIconSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
									this.mPowerupIconSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
									this.mPowerupIconSprite.scaleX = this.mIconAppearScale;
									this.mPowerupIconSprite.scaleY = this.mIconAppearScale;
									if(this.mPowerType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_MoveBackwards)
										{}
									if(this.mIconAppearScale == 1)
									{
										if(this.mPowerType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_MoveBackwards)
										{
											this.mPowerupIconImage["mFrame"] = this.mCel;
											this.mPowerupIconBitmap.bitmapData = this.mPowerupIconImage["pixels"];
										}
										else if(this.mPulseState < 2)
										{
											alpha = (255 - this.mPulseTimer * (this.mPulseState == 0?4:2)) / 255;
											this.mPowerupIconBitmap.alpha = alpha;
										}
									}
								}
								else if(this.mIconCel == -1 || this.mIconAppearScale <= 1)
									{}
							}

							public GetCollidesWithNext():boolean
							{
								return this.mCollidesWithNext;
							}

							public GetPowerType():number
							{
								return this.mPowerType;
							}

							public SetGapBonus(theBonus:number,theNumGaps:number)
							{
								theBonus = flash.checkInt(theBonus);
								theNumGaps = flash.checkInt(theNumGaps);
								this.mGapBonus = flash.checkInt(theBonus);
								this.mNumGaps = flash.checkInt(theNumGaps);
							}

							public Intersects(p1:com.popcap.flash.games.zuma2.logic.SexyVector3,v1:com.popcap.flash.games.zuma2.logic.SexyVector3,theT2:egret.Point):boolean
							{
								this.p.x = p1.x - this.mX;
								this.p.y = p1.y - this.mY;
								this.p.z = 0;
								var r:number = this.mRadius - 1;
								var a:number = v1.Dot(v1);
								var b:number = 2 * this.p.Dot(v1);
								var c:number = this.p.Dot(this.p) - r * 2 * (r * 2);
								var disc:number = b * b - 4 * a * c;
								if(disc < 0)
								{
									return false;
								}
								disc = Math.sqrt(disc);
								theT2.x = (-b - disc) / (2 * a);
								return true;
							}

							public PickBallColor():string
							{
								var imageString:string = <any>null;
								var color:number = flash.checkInt(Math.random() * 5);
								switch(color)
								{
								case 0 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_BLUE;
									break;
								case 1 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_YELLOW;
									break;
								case 2 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_RED;
									break;
								case 3 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_GREEN;
									break;
								case 4 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_PURPLE;
									break;
								case 5 :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_WHITE;
									break;
								default :
									imageString = com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_BLUE;
								}
								this.mColorType = flash.checkInt(color);
								return imageString;
							}

							public GetRadius():number
							{
								return this.mRadius;
							}

							public Hide(hide:boolean)
							{
								if(this.mBallSprite != null)
								{
									this.mBallSprite.visible = <any>!hide;
								}
								if(this.mPowerupIconSprite != null)
								{
									this.mPowerupIconSprite.visible = <any>!hide;
								}
							}

							public Draw(canvas:com.popcap.flash.framework.Canvas)
							{
								this.mBallSprite.x = (this.mX - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
								this.mBallSprite.y = (this.mY - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
								this.mBallSprite.rotation = -this.mRotation * Zuma2App.RAD_TO_DEG;
								if(<any>!this.mExploding)
								{
									this.mBallImage["mFrame"] = this.GetFrame();
									this.mBallImage["mIsSmoothed"] = true;
									this.mBallSprite.graphics.clear();
									this.mBallSprite.graphics["beginBitmapFill"](this.mBallImage["pixels"],this.mMatrix,false,true);
									this.mBallSprite.graphics.drawRect(-13,-13,26,26);
									this.mBallSprite.graphics.endFill();
									this.mHilightSprite.graphics.clear();
									if(this.mHilightPulse && this.mPowerType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None || this.mCurve.mPostZumaFlashTimer > 0)
									{
										this.mHilightSprite.x = (this.mX - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
										this.mHilightSprite.y = (this.mY - this.mRadius) * Zuma2App.SHRINK_PERCENT + 13;
										this.mHilightSprite.rotation = -this.mRotation * Zuma2App.RAD_TO_DEG;
										this.mHilightSprite.blendMode = egret.BlendMode.ADD;
										this.mHilightSprite.graphics["beginBitmapFill"](this.mBallImage["pixels"],this.mMatrix,false,true);
										this.mHilightSprite.graphics.drawRect(-13,-13,26,26);
										this.mHilightSprite.graphics.endFill();
									}
								}
								else if(this.mExploding && this.mBallExplodeImage != null)
								{
									this.mBallExplodeImage["mFrame"] = this.mExplodeFrame;
									this.mBallExplodeBitmap.bitmapData = this.mBallExplodeImage["pixels"];
									this.mBallSprite.alpha = this.mExplodeAlpha;
								}
								this.DrawAboveBalls();
							}

							public CollidesWithPhysically(theBall:com.popcap.flash.games.zuma2.logic.Ball,thePad:number = 0):boolean
							{
								var dx:number = theBall.GetX() - this.GetX();
								var dy:number = theBall.GetY() - this.GetY();
								var r:number = flash.trannumber(theBall.GetRadius() + thePad * 2 + this.GetRadius());
								if(<any>!flash.Boolean(dx * dx + dy * dy < r * r))
									{}
								return dx * dx + dy * dy < r * r;
							}

							public GetComboScore():number
							{
								return this.mComboScore;
							}

							public UpdateRotation()
							{
								if(this.mRotationInc != 0)
								{
									this.mRotation = this.mRotation + this.mRotationInc;
									if(this.mRotationInc > 0 && this.mRotation > this.mDestRotation || this.mRotationInc < 0 && this.mRotation < this.mDestRotation)
									{
										this.mRotation = this.mDestRotation;
										this.mRotationInc = 0;
									}
								}
							}

							public SetCollidesWithPrev(collidesWithPrev:boolean)
							{
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = this.GetPrevBall();
								if(aPrevBall != null)
								{
									return aPrevBall.SetCollidesWithNext(collidesWithPrev);
								}
							}

							public InsertInList(list:de.polygonal.ds.DLinkedList,itr:de.polygonal.ds.DListIterator,cm:com.popcap.flash.games.zuma2.logic.CurveMgr):de.polygonal.ds.DListIterator
							{
								this.mList = list;
								if(itr["node"] == null)
								{
									this.mList["insertAfter"](itr,this);
								}
								else
								{
									this.mList["insertBefore"](itr,this);
								}
								this.mListItr = this.mList["nodeOf"](this);
								if(this.mListItr["node"] == null)
								{
									console.log("Iterator node is null");
								}
								this.mCurve = cm;
								return this.mListItr;
							}

							public GetSuckBack():boolean
							{
								return this.mSuckBack;
							}

							public SetPowerType(theType:number,delay:boolean = true)
							{
								var aColor:flash.ColorTransform = <any>null;
								var color:number = flash.checkInt(0);
								if(theType == this.mPowerType)
								{
									return ;
								}
								this.mPulseState = flash.checkInt(0);
								this.mPulseTimer = flash.checkInt(0);
								this.mIconCel = flash.checkInt(-1);
								if(theType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
								{
									this.mPowerGracePeriod = flash.checkInt(0);
									this.mLastPowerType = flash.checkInt(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
								}
								if(delay)
								{
									this.mDestPowerType = flash.checkInt(theType);
									if(theType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None && this.mPowerType == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall)
									{
										this.mPowerFade = flash.checkInt(300);
									}
									else
									{
										this.mPowerFade = flash.checkInt(100);
									}
									switch(theType)
									{
									case com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Accuracy :
										this.mIconCel = flash.checkInt(0);
										break;
									case com.popcap.flash.games.zuma2.logic.PowerType.PowerType_ColorNuke :
										this.mIconCel = flash.checkInt(1);
										break;
									case com.popcap.flash.games.zuma2.logic.PowerType.PowerType_SlowDown :
										this.mIconCel = flash.checkInt(2);
										break;
									case com.popcap.flash.games.zuma2.logic.PowerType.PowerType_ProximityBomb :
										this.mIconCel = flash.checkInt(3);
										break;
									case com.popcap.flash.games.zuma2.logic.PowerType.PowerType_MoveBackwards :
										this.mIconCel = flash.checkInt(4);
										break;
									case com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Cannon :
										this.mIconCel = flash.checkInt(5);
										break;
									case com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Laser :
										this.mIconCel = flash.checkInt(6);
									}
									if(theType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
									{
										if(theType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall)
										{
											this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_POWERUP_APPEARS2);
										}
									}
									else if(this.GetPowerOrDestType() != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
									{
										if(this.GetPowerOrDestType() != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall)
										{
											this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_POWERUP_DISAPPEARS);
										}
									}
									if(this.mIconCel != -1)
									{
										this.mPowerupIconImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_POWERPULSES);
										this.mPowerupIconImage["mFrame"] = this.mIconCel;
										this.mPowerupIconBitmap = new flash.Bitmap(this.mPowerupIconImage["pixels"],flash.PixelSnapping.NEVER,true);
										this.mPowerupIconBitmap.x = -this.mPowerupIconBitmap.width / 2;
										this.mPowerupIconBitmap.y = -this.mPowerupIconBitmap.height / 2;
										this.mPowerupIconBitmap.blendMode = egret.BlendMode.ADD;
										aColor = this.mPowerupIconBitmap["transform"].colorTransform;
										color = flash.checkInt(this.mApp["gBallColors"][this.mColorType]);
										aColor.redMultiplier = ((color & 16711680) >> 16) / 255;
										aColor.greenMultiplier = ((color & 65280) >> 8) / 255;
										aColor.blueMultiplier = ((color & 255) >> 0) / 255;
										this.mPowerupIconBitmap["transform"].colorTransform = aColor;
										if(this.mPowerupIconSprite == null)
										{
											this.mPowerupIconSprite = new egret.Sprite();
											this.mPowerupIconSprite.addChild(this.mPowerupIconBitmap);
										}
										else
										{
											this.mPowerupIconSprite.addChild(this.mPowerupIconBitmap);
										}
										this.mApp["mLayers"][this.mPriority].mForeground.addChild(this.mPowerupIconSprite);
										this.mIconAppearScale = 5;
										this.mIconScaleRate = (this.mIconAppearScale - 1) / flash.trannumber(this.mPowerFade);
									}
									else if(this.mIconCel == -1 && this.mPowerupIconSprite.parent != null)
									{
										this.mPowerupIconSprite.parent.removeChild(this.mPowerupIconSprite);
										this.mPowerupIconSprite = null;
										this.mBallSprite.visible = true;
									}
								}
								else
								{
									this.mDestPowerType = flash.checkInt(com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None);
									this.mPowerType = flash.checkInt(theType);
								}
								if(theType != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
									{}
							}

							public GetDestPowerType():number
							{
								return this.mDestPowerType;
							}

							public Delete()
							{
								if(this.mBallSprite.parent != null)
								{
									this.mBallSprite.parent.removeChild(this.mBallSprite);
								}
								if(this.mHilightSprite != null)
								{
									if(this.mHilightSprite.parent != null)
									{
										this.mHilightSprite.parent.removeChild(this.mHilightSprite);
									}
								}
								if(this.mPowerupIconSprite != null)
								{
									if(this.mPowerupIconSprite.parent != null)
									{
										this.mPowerupIconSprite.parent.removeChild(this.mPowerupIconSprite);
									}
								}
							}

							public GetFrame():number
							{
								var aFrame:number = flash.checkInt(0);
								var div:number = flash.checkInt(1);
								var aNumFrames:number = flash.checkInt(60);
								var aPoint:number = flash.checkInt(this.mWayPoint);
								aFrame = flash.checkInt((aPoint / div + this.mStartFrame) % aNumFrames);
								if(aFrame < 0)
								{
									aFrame = flash.checkInt(-aFrame);
								}
								else if(aFrame >= aNumFrames)
								{
									aFrame = flash.checkInt(aNumFrames - 1);
								}
								return aFrame;
							}

							public GetBullet():com.popcap.flash.games.zuma2.logic.Bullet
							{
								if(this.mBullet != null)
									{}
								return this.mBullet;
							}

							public SetRotation(theRot:number,immediate:boolean = true)
							{
								if(immediate)
								{
									this.mRotation = theRot;
								}
								else
								{
									if(Math.abs(theRot - this.mRotation) <= 0.001)
									{
										return ;
									}
									while(Math.abs(theRot - this.mRotation) > Zuma2App.MY_PI)
									{
										if(theRot > this.mRotation)
										{
											theRot = theRot - 2 * Zuma2App.MY_PI;
										}
										else
										{
											theRot = theRot + 2 * Zuma2App.MY_PI;
										}
									}
									this.mDestRotation = theRot;
									this.mRotationInc = Zuma2App.MY_PI / 30;
									if(theRot < this.mRotation)
									{
										this.mRotationInc = -this.mRotationInc;
									}
								}
							}

							public GetY():number
							{
								return this.mY;
							}

							public GetSpeedy():boolean
							{
								return this.mSpeedy;
							}

							public GetSuckFromCompacting():boolean
							{
								return this.mSuckFromCompacting;
							}

							public SetBullet(theBullet:com.popcap.flash.games.zuma2.logic.Bullet)
							{
								this.mBullet = theBullet;
							}

							public SetSpeedy(speedy:boolean)
							{
								this.mSpeedy = speedy;
							}

							public GetComboCount():number
							{
								return this.mComboCount;
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.Ball.mIdGen = 0;
