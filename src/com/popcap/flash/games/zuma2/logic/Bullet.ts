module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Bullet extends com.popcap.flash.games.zuma2.logic.Ball {
							public mHitDX:number = 0;
							public mHitBall:com.popcap.flash.games.zuma2.logic.Ball;
							private mDestX:number = 0;
							private mDestY:number = 0;
							public mSkip:boolean = false;
							private mMatrix_com_popcap_flash_games_zuma2_logic_Bullet:egret.Matrix;
							public mHaveSetPrevBall:boolean = false;
							public mAngleFired:number = NaN;
							public mHitX:number = 0;
							public mHitY:number = 0;
							public mMergeSpeed:number = 0;
							private mHitInFront:boolean = false;
							public mCurCurvePoint:Array<any>;
							public mVelX:number = 0;
							public mVelY:number = 0;
							public mJustFired:boolean = false;
							public mDoNewMerge:boolean = false;
							public mHitDY:number = 0;
							public mGapInfo:Array<com.popcap.flash.games.zuma2.logic.GapInfo>;
							public mHitPercent:number = 0;

							public constructor(app:Zuma2App)
							{
								super(app);
								this.mGapInfo = new Array<com.popcap.flash.games.zuma2.logic.GapInfo>();
								this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet = new egret.Matrix();
								this.mCurCurvePoint = new Array();
								this.mApp = app;
								this.mVelX = 0;
								this.mVelY = 0;
								this.mX = 0;
								this.mY = 0;
								this.mAngleFired = 0;
								this.mDead = false;
								this.mJustFired = false;
								this.mSkip = false;
								this.mHitBall = null;
								this.mHitPercent = 0;
								this.mMergeSpeed = 0.025;
								this.mDoNewMerge = false;
								this.mUpdateCount = flash.checkInt(0);
								this.mHitDX = 0;
								this.mHitDY = 0;
								this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet.translate(-13,-13);
								this.mBallSprite = new egret.Sprite();
								this.mApp["mLayers"][1].mBalls.addChild(this.mBallSprite);
								this.mPriority = flash.checkInt(0);
							}

							public GetCurGapBall(theCurveNum:number):number
							{
								theCurveNum = flash.checkInt(theCurveNum);
								var aCurGapBall:number = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < this.mGapInfo.length; i++)
								{
									if(this.mGapInfo[i].mCurve == theCurveNum)
									{
										aCurGapBall = flash.checkInt(this.mGapInfo[i].mBallId);
									}
								}
								return aCurGapBall;
							}

							public GetHitPercent():number
							{
								return this.mHitPercent;
							}

							public GetPushBall():com.popcap.flash.games.zuma2.logic.Ball
							{
								if(this.mHitBall == null)
								{
									return null;
								}
								var aPushBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								aPushBall = <any>!<any>!this.mHitInFront?this.mHitBall.GetNextBall():this.mHitBall;
								if(aPushBall != null)
								{
									if(this.mDoNewMerge || aPushBall.CollidesWithPhysically(this))
									{
										return aPushBall;
									}
								}
								return null;
							}

							public SetHitBall(theBall:com.popcap.flash.games.zuma2.logic.Ball,hitInFront:boolean)
							{
								this.SetBallInfo(null);
								this.mHaveSetPrevBall = false;
								this.mHitBall = theBall;
								this.mHitX = this.mX;
								this.mHitY = this.mY;
								this.mHitDX = this.mX - theBall.GetX();
								this.mHitDY = this.mY - theBall.GetY();
								this.mHitPercent = 0;
								this.mHitInFront = hitInFront;
								this.SetBallInfo(this);
							}

							public MergeFully()
							{
								this.mHitPercent = 1;
								this.Update();
							}

							public CheckSetHitBallToPrevBall()
							{
								if(this.mHaveSetPrevBall || this.mHitBall == null)
								{
									return ;
								}
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = this.mHitBall.GetPrevBall();
								if(aPrevBall == null)
								{
									return ;
								}
								if(aPrevBall.CollidesWithPhysically(this) && <any>!aPrevBall.GetIsExploding())
								{
									this.mHaveSetPrevBall = true;
									this.SetBallInfo(null);
									this.mHitBall = aPrevBall;
									this.mHitInFront = true;
									this.mHitX = this.mX;
									this.mHitY = this.mY;
									this.mHitDX = this.mX - aPrevBall.GetX();
									this.mHitDY = this.mY - aPrevBall.GetY();
									this.mHitPercent = 0;
									this.SetBallInfo(this);
								}
							}

							public UpdateHitPos()
							{
								this.mHitX = this.mX;
								this.mHitY = this.mY;
							}

							public GetHitBall():com.popcap.flash.games.zuma2.logic.Ball
							{
								return this.mHitBall;
							}

							public SetCurCurvePoint(theCurveNum:number,thePoint:number)
							{
								theCurveNum = flash.checkInt(theCurveNum);
								thePoint = flash.checkInt(thePoint);
								this.mCurCurvePoint[theCurveNum] = thePoint;
							}

							public SetIsCannon(isCannon:boolean)
							{
								this.mIsCannon = isCannon;
								this.mCannonFrame = flash.checkInt(0);
								if(this.mIsCannon)
								{
									this.mBallImage = this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_CANNON);
									this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet.tx = -8.5;
									this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet.ty = -15;
									this.mBallSprite.graphics.clear();
									this.mBallSprite.graphics["beginBitmapFill"](this.mBallImage["pixels"],this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet,false,true);
									this.mBallSprite.graphics.drawRect(-8.5,-15,19,19);
									this.mBallSprite.graphics.endFill();
								}
								else if(<any>!this.mIsCannon)
								{
									this.SetBallImage(this.mColorType);
									this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet.tx = -13;
									this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet.ty = -13;
									this.mBallSprite.graphics.clear();
									this.mBallSprite.graphics["beginBitmapFill"](this.mBallImage["pixels"],this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet,false,true);
									this.mBallSprite.graphics.drawRect(-13,-13,26,26);
									this.mBallSprite.graphics.endFill();
								}
							}

							public GetCurCurvePoint(theCurveNum:number):number
							{
								theCurveNum = flash.checkInt(theCurveNum);
								return this.mCurCurvePoint[theCurveNum];
							}

							public SetDestPos(x:number,y:number)
							{
								this.mDestX = x;
								this.mDestY = y;
							}

							public SetBallInfo(theBullet:com.popcap.flash.games.zuma2.logic.Bullet)
							{
								if(this.mHitBall != null)
								{
									this.mHitBall.SetBullet(theBullet);
								}
							}

							public SetVelocity(vx:number,vy:number)
							{
								this.mVelX = vx;
								this.mVelY = vy;
							}

							public GetMinGapDist():number
							{
								var aMinDist:number = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < this.mGapInfo.length; i++)
								{
									if(aMinDist == 0 || this.mGapInfo[i].mDist < aMinDist)
									{
										aMinDist = flash.checkInt(this.mGapInfo[i].mDist);
									}
								}
								return aMinDist;
							}

							public GetHitInFront():boolean
							{
								return this.mHitInFront;
							}

							public Delete()
							{
								this.SetBallInfo(null);
								if(this.mBallSprite.parent != null)
								{
									this.mBallSprite.parent.removeChild(this.mBallSprite);
								}
							}

							public GetJustFired():boolean
							{
								return this.mJustFired;
							}

							public SetJustFired(fired:boolean)
							{
								this.mJustFired = fired;
							}

							public SetMergeSpeed(theSpeed:number)
							{
								this.mMergeSpeed = theSpeed;
							}

							public GetX():number
							{
								return this.mX;
							}

							public GetY():number
							{
								return this.mY;
							}

							public Update(theAmount:number = 1)
							{
								var vx:number = <any>NaN;
								var vy:number = <any>NaN;
								this.mUpdateCount++;
								if(this.mHitBall == null)
								{
									vx = this.mVelX * theAmount;
									vy = this.mVelY * theAmount;
									this.mX = this.mX + vx;
									this.mY = this.mY + vy;
									if(this.mX < 100)
										{}
								}
								else if(<any>!this.mExploding)
								{
									this.mHitPercent = this.mHitPercent + this.mMergeSpeed;
									if(this.mHitPercent > 1)
									{
										this.mHitPercent = 1;
									}
									if(<any>!this.mDoNewMerge)
									{
										this.mX = this.mHitX + this.mHitPercent * (this.mDestX - this.mHitX);
										this.mY = this.mHitY + this.mHitPercent * (this.mDestY - this.mHitY);
									}
								}
								this.UpdateRotation();
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

							public Draw(canvas:com.popcap.flash.framework.Canvas)
							{
								this.mBallSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
								this.mBallSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
								this.mBallSprite.rotation = this.mRotation * Zuma2App.RAD_TO_DEG - 90;
							}

							public GetNumGaps():number
							{
								return this.mGapInfo.length;
							}

							public RemoveGapInfoForBall(theBallId:number)
							{
								theBallId = flash.checkInt(theBallId);
								var i:number = flash.checkInt(0);
								for(i = flash.checkInt(0); i < this.mGapInfo.length; i++)
								{
									if(this.mGapInfo[i].mBallId == theBallId)
									{
										this.mGapInfo.splice(i,1);
									}
								}
							}

							public AddGapInfo(theCurve:number,theDist:number,theBallId:number):boolean
							{
								theCurve = flash.checkInt(theCurve);
								theDist = flash.checkInt(theDist);
								theBallId = flash.checkInt(theBallId);
								for(var i:number = flash.checkInt(0);i < this.mGapInfo.length; i++)
								{
									if(this.mGapInfo[i].mBallId == theBallId)
									{
										return false;
									}
								}
								this.mGapInfo.push(new com.popcap.flash.games.zuma2.logic.GapInfo());
								var anInfo:com.popcap.flash.games.zuma2.logic.GapInfo = this.mGapInfo[this.mGapInfo.length - 1];
								anInfo.mBallId = flash.checkInt(theBallId);
								anInfo.mDist = flash.checkInt(theDist);
								anInfo.mCurve = flash.checkInt(theCurve);
								return true;
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
								this.mBallSprite.graphics.clear();
								this.mBallSprite.graphics["beginBitmapFill"](this.mBallImage["pixels"],this.mMatrix_com_popcap_flash_games_zuma2_logic_Bullet,false,true);
								this.mBallSprite.graphics.drawRect(-13,-13,26,26);
								this.mBallSprite.graphics.endFill();
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.logic.Bullet","com.popcap.flash.games.zuma2.logic.Ball")
