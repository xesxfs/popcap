module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class CurveMgr extends egret.HashObject {
							public static MAX_GAP_SIZE:number;
							public static PROXIMITY_BOMB_RADIUS:number;
							public mNumPowerUpsThisLevel:Array<any>;
							public mPendingBalls:de.polygonal.ds.DLinkedList;
							public mBulletList:de.polygonal.ds.DLinkedList;
							public mLevel:com.popcap.flash.games.zuma2.logic.Level;
							public mNumPowerupsActivated:Array<any>;
							public mInitialPathHilite:boolean = false;
							public mPath:string;
							public mCurveDesc:com.popcap.flash.games.zuma2.logic.CurveDesc;
							public mInDanger:boolean = false;
							public mSkullHilite:number = 0;
							public mBallObj:any;
							public mLastClearedBallPoint:number = 0;
							public mPlayedSparkleSound:boolean = false;
							public mIsLoaded:boolean = false;
							public mHaveSets:boolean = false;
							public mProxBombCounter:number = 0;
							public mWarningLights:Array<com.popcap.flash.games.zuma2.logic.WarningLight>;
							public mOverrideSpeed:number = NaN;
							public mHasReachedCruisingSpeed:boolean = false;
							public mNumBallsCreated:number = 0;
							public mPathLightEndFrame:number = 0;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mApp:Zuma2App;
							public mStopTime:number = 0;
							public mBallColorHasPowerup:Array<any>;
							public mBackwardCount:number = 0;
							public mDangerPoint:number = 0;
							public mChainFromSuck:boolean = false;
							public mSpeedScale:number = NaN;
							public mCanCheckForSpeedup:boolean = false;
							public mSlowCount:number = 0;
							public mStopAddingBalls:boolean = false;
							public mCurveNum:number = 0;
							public mSparkles:Array<com.popcap.flash.games.zuma2.logic.PathSparkle>;
							public mHasReachedRolloutPoint:boolean = false;
							public mPostZumaFlashTimer:number = 0;
							public mLastPowerupTime:number = 0;
							public mFirstChainEnd:number = 0;
							public mLastPathShowTick:number = 0;
							public mTotalBalls:number = 0;
							public mDoingClearCurveRollout:boolean = false;
							public mLastSpawnedPowerUpFrame:Array<any>;
							public mLastPathHilitePitch:number = 0;
							public mBallList:de.polygonal.ds.DLinkedList;
							public mSkullHiliteDir:number = 0;
							public mLastPathHiliteWP:number = 0;
							public mWayPointMgr:com.popcap.flash.games.zuma2.logic.WayPointMgr;
							public mNeedsSpeedup:boolean = false;
							public mLastCompletedPowerUpFrame:Array<any>;
							public mHadPowerUp:boolean = false;
							public mAdvanceSpeed:number = NaN;
							public mFirstBallMovedBackwards:boolean = false;

							public constructor(app:Zuma2App,curve_num:number)
							{
								super();
								curve_num = flash.checkInt(curve_num);
								super();
								this.mBallList = new DLinkedList();
								this.mBulletList = new DLinkedList();
								this.mPendingBalls = new DLinkedList();
								this.mSparkles = new Array<com.popcap.flash.games.zuma2.logic.PathSparkle>();
								this.mBallObj = new Object();
								this.mWarningLights = new Array<com.popcap.flash.games.zuma2.logic.WarningLight>();
								this.mBallColorHasPowerup = new Array();
								this.mLastSpawnedPowerUpFrame = new Array();
								this.mLastCompletedPowerUpFrame = new Array();
								this.mNumPowerUpsThisLevel = new Array();
								this.mNumPowerupsActivated = new Array();
								this.mApp = app;
								this.mCurveNum = flash.checkInt(curve_num);
								this.mWayPointMgr = new com.popcap.flash.games.zuma2.logic.WayPointMgr(app);
								this.mCurveDesc = new com.popcap.flash.games.zuma2.logic.CurveDesc(app);
								this.Reset();
							}

							public GetBoardTickCount():number
							{
								return this.GetBoardStateCount() * 10;
							}

							public CanFire():boolean
							{
								if(this.mBallList["isEmpty"]())
								{
									return true;
								}
								return this.mBallList["tail"].data.GetWayPoint() < this.mWayPointMgr.GetEndPoint();
							}

							public AdvanceBullets()
							{
								var aBulletItr:de.polygonal.ds.DListIterator = <any>this.mBulletList["getListIterator"]();
								while(aBulletItr["valid"]())
								{
									this.AdvanceMergingBullet(aBulletItr);
								}
							}

							public GetPoint(thePoint:number,s:com.popcap.flash.games.zuma2.logic.PathSparkle)
							{
								thePoint = flash.checkInt(thePoint);
								var aList:Array<com.popcap.flash.games.zuma2.logic.WayPoint> = this.mWayPointMgr.mWayPoints;
								if(thePoint < 0)
								{
									thePoint = flash.checkInt(0);
								}
								if(thePoint >= aList.length)
								{
									thePoint = flash.checkInt(aList.length - 1);
								}
								var aPoint:com.popcap.flash.games.zuma2.logic.WayPoint = aList[thePoint];
								s.mX = aPoint.x;
								s.mY = aPoint.y;
								s.mPri = flash.checkInt(aPoint.mPriority);
							}

							public UpdatePlaying():boolean
							{
								var i:number = flash.checkInt(0);
								var s:com.popcap.flash.games.zuma2.logic.PathSparkle = <any>null;
								var soundString:string = <any>null;
								var do_clear:boolean = <any>false;
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var rit:de.polygonal.ds.DListIterator = <any>null;
								var edge_wp:number = flash.checkInt(0);
								var x:number = <any>NaN;
								var y:number = <any>NaN;
								var aPoint:egret.Point = <any>null;
								var Rect:egret.Rectangle = <any>null;
								var tunnel_wp:number = flash.checkInt(0);
								var wp_list:Array<com.popcap.flash.games.zuma2.logic.WayPoint> = <any>null;
								if(this.mStopAddingBalls && this.mPostZumaFlashTimer > 0)
								{
									this.mPostZumaFlashTimer--;
								}
								var ret:boolean = <any>false;
								var wp:number = flash.checkInt(<any>!<any>!this.mBallList["isEmpty"]()?0:flash.tranint(this.mBallList["tail"].data.GetWayPoint()));
								var ballsAtBeginning:boolean = this.mBallList["isEmpty"]() || wp < this.mCurveDesc.mCutoffPoint;
								if(this.mStopTime > 0)
								{
									this.mStopTime--;
									if(ballsAtBeginning)
									{
										this.mStopTime = flash.checkInt(0);
									}
									if(this.mStopTime == 0)
									{
										if(<any>!this.mDoingClearCurveRollout)
										{
											this.mAdvanceSpeed = 0;
										}
									}
								}
								if(this.mInitialPathHilite && <any>!this.mBoard["mPreventBallAdvancement"] && this.mLastPathHiliteWP < this.mWayPointMgr.GetNumPoints() && this.mSkullHiliteDir == 0)
								{
									this.mSparkles.push(new com.popcap.flash.games.zuma2.logic.PathSparkle(this.mApp));
									s = this.mSparkles[this.mSparkles.length - 1];
									this.GetPoint(this.mLastPathHiliteWP,s);
									this.mLastPathHiliteWP = flash.checkInt(this.mLastPathHiliteWP + 10);
									if(this.mLastPathHiliteWP >= this.mWayPointMgr.GetNumPoints())
									{
										ret = true;
										this.mSkullHiliteDir = 12;
									}
									if(this.mBoard["mUpdateCnt"] % 25 == 0)
									{
										if(this.mCurveNum != 1 && this.mLastPathHilitePitch > -20)
										{
											this.mLastPathHilitePitch--;
										}
										else if(this.mCurveNum == 1 && this.mLastPathHilitePitch < 0)
										{
											this.mLastPathHilitePitch++;
										}
									}
									if(<any>!this.mPlayedSparkleSound && this.mCurveNum == 0)
									{
										this.mPlayedSparkleSound = true;
										soundString = "SOUND_SPARKLE_START" + String(this.mBoard["mLevelNum"] % 5 + 1);
										this.mApp["soundManager"].playSound(soundString);
									}
								}
								for(i = flash.checkInt(0); i < this.mSparkles.length; i++)
								{
									s = this.mSparkles[i];
									s.mUpdateCount++;
									if(s.mUpdateCount % 3 == 0)
									{
										if(++s.mCel >= 14)
										{
											this.mSparkles.splice(i,1);
											i--;
											s.Delete();
										}
									}
								}
								this.mSkullHilite = this.mSkullHilite + this.mSkullHiliteDir;
								if(this.mSkullHiliteDir > 0 && this.mSkullHilite >= 255)
								{
									this.mSkullHilite = 255;
									this.mSkullHiliteDir = this.mSkullHiliteDir * -1;
								}
								else if(this.mSkullHiliteDir < 0 && this.mSkullHilite <= 0)
								{
									this.mSkullHilite = this.mSkullHiliteDir = 0;
								}
								var pulse_next:boolean = <any>false;
								for(i = flash.checkInt(0); i < this.mWarningLights.length; i++)
								{
									if(pulse_next)
									{
										this.mWarningLights[i].mPulseRate = -this.mWarningLights[i - 1].mPulseRate;
									}
									pulse_next = this.mWarningLights[i].Update();
									if(this.mInitialPathHilite)
									{
										this.mWarningLights[i].mPulseAlpha = this.mWarningLights[i].mPulseAlpha - 5;
										if(this.mWarningLights[i].mPulseAlpha < 0)
										{
											this.mWarningLights[i].mPulseAlpha = 0;
										}
									}
								}
								if(this.mInitialPathHilite)
								{
									return ret;
								}
								if(this.mSlowCount > 0)
								{
									this.mSlowCount--;
									if(ballsAtBeginning && <any>!this.mStopAddingBalls)
									{
										this.mSlowCount = flash.checkInt(0);
									}
								}
								if(this.mBackwardCount > 0)
								{
									this.mBackwardCount--;
									if(ballsAtBeginning && <any>!this.mStopAddingBalls)
									{
										this.mBackwardCount = flash.checkInt(0);
									}
								}
								if(this.mApp["gAddBalls"])
								{
									this.AddBall();
								}
								this.UpdateBalls();
								this.AdvanceBullets();
								this.UpdateSuckingBalls();
								if(<any>!this.mDoingClearCurveRollout && <any>!this.mBoard["HasAchievedZuma"]() && <any>!this.mLevel.mIsEndless && this.mHasReachedCruisingSpeed && <any>!this.mInitialPathHilite && <any>!this.mBoard["mPreventBallAdvancement"])
								{
									do_clear = this.mBallList["isEmpty"]();
									if(do_clear)
									{
										console.log("Ball list is empty, doing clear curve");
									}
									if(<any>!do_clear)
									{
										b = null;
										rit = this.mBallList["getListIterator"]();
										rit["end"]();
										while(rit["valid"]())
										{
											if(<any>!rit["data"].GetIsExploding())
											{
												b = rit["data"];
												break;
											}
											rit["back"]();
										}
										if(b != null)
										{
											edge_wp = flash.checkInt(b.GetWayPoint() + b.GetRadius());
											aPoint = new egret.Point();
											if(this.GetXYFromWaypoint(edge_wp,aPoint))
											{
												Rect = new egret.Rectangle(0,0,800,600);
												if(<any>!Rect.containsPoint(aPoint))
												{
													do_clear = true;
													console.log("Rectangle contains point");
												}
												else if(<any>!this.mLevel.mOffscreenClearBonus)
												{
													tunnel_wp = flash.checkInt(-1);
													wp_list = this.mWayPointMgr.mWayPoints;
													for(i = flash.checkInt(0); i < wp_list.length; )
													{
														if(wp_list[i].mInTunnel)
														{
															tunnel_wp = flash.checkInt(i);
															i++;
															continue;
														}
														break;
													}
													if(tunnel_wp != -1 && edge_wp <= tunnel_wp)
													{
														do_clear = true;
													}
												}
											}
										}
										else
										{
											do_clear = true;
										}
									}
									if(do_clear)
									{
										this.mDoingClearCurveRollout = true;
										this.mBoard["DoClearCurveBonus"](this.mCurveNum);
										this.mSlowCount = flash.checkInt(0);
										this.mBackwardCount = flash.checkInt(0);
										this.mAdvanceSpeed = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale * this.mApp["mLevelMgr"].mClearCurveSpeedMult;
									}
								}
								this.AdvanceBalls();
								this.AdvanceBackwardBalls();
								this.RemoveBallsAtFront();
								this.RemoveBallsAtEnd();
								this.UpdateSets();
								this.UpdatePowerUps();
								if(<any>!this.mBallList["isEmpty"]())
								{
									this.SetFarthestBall(this.mBallList["tail"].data.GetWayPoint());
								}
								else
								{
									this.SetFarthestBall(0);
								}
								if(<any>!this.mHasReachedCruisingSpeed)
								{
									if(this.mAdvanceSpeed - this.mCurveDesc.mVals.mSpeed * this.mSpeedScale < 0.1)
									{
										this.mHasReachedCruisingSpeed = true;
									}
								}
								return ret;
							}

							public GetNumInARow(theBall:com.popcap.flash.games.zuma2.logic.Ball,theColor:number,ballObj:any):number
							{
								theColor = flash.checkInt(theColor);
								var aPrevEnd:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(theBall.GetColorType() != theColor)
								{
									return 0;
								}
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = theBall;
								var aNextEnd:com.popcap.flash.games.zuma2.logic.Ball = aBall;
								var aColor:number = flash.checkInt(theColor);
								var aCount:number = flash.checkInt(1);
								while(true)
								{
									aNextBall = aNextEnd.GetNextBall(true);
									if(aNextBall == null)
									{
										break;
									}
									if(aNextBall.GetColorType() != aColor)
									{
										break;
									}
									aNextEnd = aNextBall;
									aCount++;
								}
								aPrevEnd = aBall;
								while(true)
								{
									aPrevBall = aPrevEnd.GetPrevBall(true);
									if(aPrevBall == null)
									{
										break;
									}
									if(aPrevBall.GetColorType() != aColor)
									{
										break;
									}
									aPrevEnd = aPrevBall;
									aCount++;
								}
								ballObj["aNextEnd"] = aNextEnd;
								ballObj["aPrevEnd"] = aPrevEnd;
								return aCount;
							}

							public HideBalls(hide:boolean)
							{
								var ball:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									ball = aBallItr["data"];
									ball.Hide(hide);
									aBallItr["forth"]();
								}
							}

							public AdvanceMergingBullet(theBulletItr:de.polygonal.ds.DListIterator)
							{
								var aHitBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var anItr:de.polygonal.ds.DListIterator = <any>null;
								var hitInFront:boolean = <any>false;
								var aNewBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aGapDist:number = flash.checkInt(0);
								var aNumGaps:number = flash.checkInt(0);
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aMaxGapBonus:number = flash.checkInt(0);
								var aBonus:number = flash.checkInt(0);
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = <any>theBulletItr["data"];
								this.DoMerge(aBullet);
								if(aBullet.GetHitPercent() >= 1)
								{
									aHitBall = aBullet.GetHitBall();
									anItr = new DListIterator(this.mBallList,aHitBall.mListItr["node"]);
									hitInFront = aBullet.GetHitInFront();
									if(hitInFront)
									{
										anItr["forth"]();
									}
									aNewBall = new com.popcap.flash.games.zuma2.logic.Ball(this.mApp);
									aNewBall.SetRotation(aBullet.GetRotation());
									aNewBall.SetColorType(aBullet.GetColorType());
									aNewBall.SetPowerType(aBullet.GetPowerType());
									this.mWayPointMgr.SetWayPoint(aNewBall,aBullet.GetWayPoint(),this.mLevel.mLoopAtEnd);
									aNewBall.InsertInList(this.mBallList,anItr,this);
									aGapDist = flash.checkInt(aBullet.GetMinGapDist());
									aNumGaps = flash.checkInt(aBullet.GetNumGaps());
									aBullet.Delete();
									this.mBulletList["remove"](theBulletItr);
									this.mTotalBalls++;
									aPrevBall = aNewBall.GetPrevBall();
									aNextBall = aNewBall.GetNextBall();
									aNewBall.UpdateCollisionInfo(5);
									aNewBall.SetNeedCheckCollision(true);
									if(aPrevBall != null && aNewBall.GetCollidesWithPrev())
									{
										aPrevBall.SetNeedCheckCollision(true);
									}
									if(aGapDist > 0)
									{
										aGapDist = flash.checkInt(aGapDist - 64);
										if(aGapDist < 0)
										{
											aGapDist = flash.checkInt(0);
										}
										aMaxGapBonus = flash.checkInt(500);
										aBonus = flash.checkInt(aMaxGapBonus * (com.popcap.flash.games.zuma2.logic.CurveMgr.MAX_GAP_SIZE - aGapDist) / com.popcap.flash.games.zuma2.logic.CurveMgr.MAX_GAP_SIZE);
										aBonus = flash.checkInt(flash.tranint(aBonus / 10) * 10);
										if(aBonus < 10)
										{
											aBonus = flash.checkInt(10);
										}
										if(aBonus > 0)
										{
											if(aNumGaps > 1)
											{
												aBonus = flash.checkInt(aBonus * aNumGaps);
											}
											aNewBall.SetGapBonus(aBonus,aNumGaps);
										}
									}
									if(<any>!this.CheckSet(aNewBall))
									{
										if(aPrevBall != null && <any>!aPrevBall.GetCollidesWithNext() && aPrevBall.GetColorType() == aNewBall.GetColorType() && aPrevBall.GetBullet() == null && <any>!aPrevBall.GetIsExploding())
										{
											aNewBall.SetSuckPending(true);
											aNewBall.SetSuckCount(1);
										}
										else if(aNextBall != null && <any>!aNewBall.GetCollidesWithNext() && aNextBall.GetColorType() == aNewBall.GetColorType() && aNextBall.GetBullet() == null && <any>!aNextBall.GetIsExploding())
										{
											aNewBall.SetSuckPending(true);
											if(aNextBall.GetSuckCount() <= 0)
											{
												aNextBall.SetSuckCount(1);
											}
										}
										else
										{
											this.mBoard["ResetInARowBonus"]();
											aNewBall.SetGapBonus(0,0);
										}
									}
									else
									{
										this.mBoard["IncNumClearsInARow"](1);
									}
								}
								else
								{
									this.mBoard["mBallColorMap"][aBullet.GetColorType()]++;
									theBulletItr["forth"]();
								}
							}

							public IsInDanger():boolean
							{
								return this.mInDanger;
							}

							public GetDangerDistance():number
							{
								return this.mWayPointMgr.GetNumPoints() - this.mDangerPoint;
							}

							public DrawSkullPath()
							{
								var w:com.popcap.flash.games.zuma2.logic.WarningLight = <any>null;
								for(var i:number = flash.checkInt(0);i < this.mWarningLights.length; i++)
								{
									w = this.mWarningLights[i];
									w.Draw();
								}
							}

							public AdvanceBalls()
							{
								var aSpeed:number = <any>NaN;
								var sd:number = flash.checkInt(0);
								var aMix:number = <any>NaN;
								var rit:de.polygonal.ds.DListIterator = <any>null;
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aNext:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aDist:number = <any>NaN;
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aNextWayPoint:number = <any>NaN;
								var collides:boolean = <any>false;
								var aPrev:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aTick:number = flash.checkInt(0);
								var pct:number = <any>NaN;
								var aMaxTime:number = flash.checkInt(0);
								var aFrame:number = flash.checkInt(0);
								var farthest_curve:number = flash.checkInt(0);
								var idx:number = flash.checkInt(0);
								var i:number = flash.checkInt(0);
								var w:com.popcap.flash.games.zuma2.logic.WarningLight = <any>null;
								var minalpha:number = <any>NaN;
								if(this.mBallList["isEmpty"]())
								{
									return ;
								}
								var can_advance:boolean = this.mLevel.CanAdvanceBalls();
								var aWarningPoint:number = flash.checkInt(this.mDangerPoint);
								var aMaxSpeed:number = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale;
								if(this.mCurveDesc.mVals.mAccelerationRate != 0)
								{
									this.mCurveDesc.mCurAcceleration = this.mCurveDesc.mCurAcceleration + this.mCurveDesc.mVals.mAccelerationRate;
									aMaxSpeed = aMaxSpeed + this.mCurveDesc.mCurAcceleration;
									if(aMaxSpeed > this.mCurveDesc.mVals.mMaxSpeed)
									{
										aMaxSpeed = this.mCurveDesc.mVals.mMaxSpeed;
									}
								}
								if(this.mSlowCount > 0)
								{
									aMaxSpeed = aMaxSpeed / 4;
								}
								var slowfactor:number = this.mCurveDesc.mVals.mSlowFactor;
								var pzt_speed:number = this.mLevel.mPostZumaTimeSpeedInc * aMaxSpeed + aMaxSpeed;
								var pzt_slow:number = slowfactor - this.mLevel.mPostZumaTimeSlowInc * this.mCurveDesc.mVals.mSlowFactor;
								if(pzt_slow < 1)
								{
									pzt_slow = 1;
								}
								if(this.mApp["mLevelMgr"].mPostZumaTime == 0 || <any>!this.mBoard["HasAchievedZuma"]())
								{
									pzt_speed = aMaxSpeed;
									pzt_slow = slowfactor;
								}
								if(this.mApp["gDieAtEnd"])
								{
									if(this.mFirstChainEnd < this.mDangerPoint - this.mCurveDesc.mVals.mSlowDistance || <any>!this.mHasReachedCruisingSpeed)
									{
										aMaxSpeed = pzt_speed;
									}
									else if(this.mFirstChainEnd < this.mDangerPoint)
									{
										aMix = flash.trannumber(this.mFirstChainEnd - (this.mDangerPoint - this.mCurveDesc.mVals.mSlowDistance)) / this.mCurveDesc.mVals.mSlowDistance;
										aMaxSpeed = (1 - aMix) * pzt_speed + aMix * pzt_speed / pzt_slow;
									}
									else
									{
										aMaxSpeed = aMaxSpeed / pzt_slow;
										this.mBoard["SetRollingInDangerZone"]();
									}
								}
								var end_clear_curve:boolean = <any>false;
								if(this.mDoingClearCurveRollout)
								{
									rit = this.mBallList["getListIterator"]();
									rit["end"]();
									while(rit["valid"]())
									{
										b = rit["data"];
										if(<any>!b.GetIsExploding())
										{
											if(b.GetWayPoint() / flash.trannumber(this.mWayPointMgr.GetEndPoint()) >= this.mApp["mLevelMgr"].mClearCurveRolloutPct)
											{
												end_clear_curve = true;
											}
											break;
										}
										rit["back"]();
									}
								}
								if(this.mAdvanceSpeed > aMaxSpeed && <any>!this.mBoard["mPreventBallAdvancement"] && (<any>!this.mDoingClearCurveRollout || end_clear_curve))
								{
									this.mDoingClearCurveRollout = false;
									this.mAdvanceSpeed = this.mAdvanceSpeed - 0.1;
								}
								else if(this.mAdvanceSpeed <= aMaxSpeed && end_clear_curve)
								{
									this.mDoingClearCurveRollout = false;
								}
								if(this.mAdvanceSpeed < aMaxSpeed)
								{
									this.mAdvanceSpeed = this.mAdvanceSpeed + 0.005;
									if(this.mAdvanceSpeed >= aMaxSpeed)
									{
										this.mAdvanceSpeed = aMaxSpeed;
									}
								}
								aSpeed = <any>!<any>!can_advance?flash.trannumber(this.mAdvanceSpeed):flash.trannumber(0);
								if(this.mOverrideSpeed >= 0)
								{
									aSpeed = aSpeed + this.mOverrideSpeed;
								}
								if(this.mBoard["mPreventBallAdvancement"])
								{
									aSpeed = 0;
								}
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>this.mBallList["head"].data;
								var aWayPoint:number = aBall.GetWayPoint();
								var aDiff:number = <any>0;
								if(<any>!this.mFirstBallMovedBackwards && <any>!this.mStopTime)
								{
									aDiff = aSpeed;
									this.mWayPointMgr.SetWayPoint(aBall,aWayPoint + aSpeed,this.mLevel.mLoopAtEnd);
								}
								if(this.mApp["gSuckMode"] && this.mStopAddingBalls && <any>!this.mBallList["isEmpty"]())
								{
									aBall = this.mBallList["head"].data;
									this.mAdvanceSpeed = aMaxSpeed;
									if(aBall.GetSpeedy())
									{
										aNext = aBall.GetNextBall();
										if(aNext != null)
										{
											if(aNext.GetSpeedy())
											{
												this.mAdvanceSpeed = 20;
											}
											else
											{
												aDist = aNext.GetWayPoint() - aBall.GetWayPoint();
												this.mAdvanceSpeed = aDist / 10;
											}
											if(this.mAdvanceSpeed > 20)
											{
												this.mAdvanceSpeed = 20;
											}
											else if(this.mAdvanceSpeed < aMaxSpeed)
											{
												this.mAdvanceSpeed = aMaxSpeed;
											}
										}
									}
								}
								var speedup_possible:boolean = <any>false;
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								var aFirstChainEnd:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								while(aBallItr["valid"]())
								{
									aBall = aBallItr["data"];
									aNextBall = null;
									aBallItr["forth"]();
									if(<any>!aBallItr["hasNext"]())
									{
										break;
									}
									aNextBall = aBallItr["data"];
									aNextWayPoint = aNextBall.GetWayPoint();
									aWayPoint = aBall.GetWayPoint();
									collides = false;
									if(aWayPoint > aNextWayPoint - aBall.GetRadius() - aNextBall.GetRadius())
									{
										this.mWayPointMgr.SetWayPoint(aNextBall,aWayPoint + aBall.GetRadius() + aNextBall.GetRadius(),this.mLevel.mLoopAtEnd);
										collides = true;
									}
									if(collides)
									{
										if(<any>!aBall.GetCollidesWithNext())
										{
											if(aBall.GetSpeedy() && <any>!aNextBall.GetSpeedy())
											{
												aPrev = aBall;
												while(aPrev != null)
												{
													aPrev.SetSpeedy(false);
													aPrev = aPrev.GetPrevBall(true);
												}
											}
											aBall.SetCollidesWithNext(true);
											this.mBoard["PlayBallClick"](Zuma2Sounds.SOUND_BALL_CLICK1);
										}
										aDiff = aNextBall.GetWayPoint() - aNextWayPoint;
										aBall.SetNeedCheckCollision(false);
									}
									else
									{
										aDiff = 0;
									}
									if(aFirstChainEnd == null && <any>!aBall.GetCollidesWithNext())
									{
										aFirstChainEnd = aBall;
										sd = flash.checkInt(this.mCurveDesc.mVals.mStartDistance);
										if(aFirstChainEnd.GetWayPoint() < sd / 100 * this.GetCurveLength())
										{
											speedup_possible = true;
										}
									}
								}
								if(<any>!speedup_possible && this.mLevel.mTempSpeedupTimer <= 0)
								{
									this.mCanCheckForSpeedup = true;
									this.mOverrideSpeed = -1;
								}
								sd = flash.checkInt(this.mCurveDesc.mVals.mStartDistance);
								if(<any>!this.mHasReachedRolloutPoint && this.mBackwardCount <= 0 && this.mBallList["tail"].data.GetWayPoint() >= sd / 100 * this.GetCurveLength())
								{
									this.mHasReachedRolloutPoint = true;
								}
								if(aFirstChainEnd == null)
								{
									aFirstChainEnd = this.mBallList["tail"].data;
									this.mCanCheckForSpeedup = true;
									if(this.HasReachedCruisingSpeed())
									{
										speedup_possible = true;
									}
								}
								this.mFirstChainEnd = flash.checkInt(aFirstChainEnd.GetWayPoint());
								if(speedup_possible && this.mCanCheckForSpeedup && this.mLevel.mHurryToRolloutAmt > 0)
								{
									sd = flash.checkInt(this.mCurveDesc.mVals.mStartDistance);
									if(this.mFirstChainEnd < sd / 100 * this.GetCurveLength())
									{
										this.mCanCheckForSpeedup = false;
										this.mOverrideSpeed = this.mLevel.mHurryToRolloutAmt;
									}
									else
									{
										this.mCanCheckForSpeedup = true;
										this.mOverrideSpeed = -1;
									}
								}
								var newWarning:any = <any>this.mFirstChainEnd >= aWarningPoint;
								if(newWarning && this.mApp["gDieAtEnd"])
								{
									aTick = flash.checkInt(this.GetBoardTickCount());
									pct = flash.trannumber(this.GetCurveLength() - this.mFirstChainEnd) / flash.trannumber(this.GetCurveLength() - this.mDangerPoint);
									aMaxTime = flash.checkInt(100 + 4000 * pct);
									aFrame = flash.checkInt(this.mBoard["GetStateCount"]());
									if(aFrame >= this.mPathLightEndFrame && aTick - this.mLastPathShowTick >= aMaxTime)
									{
										farthest_curve = flash.checkInt(this.mLevel.GetFarthestBallPercent(farthest_curve,false));
										if(farthest_curve == this.mCurveNum)
										{
											this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_WARNING1);
										}
										this.mLastPathShowTick = flash.checkInt(aTick);
										this.mPathLightEndFrame = flash.checkInt(aFrame);
										if(this.mWarningLights.length > 0)
										{
											idx = flash.checkInt(this.mWarningLights.length);
											for(i = flash.checkInt(0); i < this.mWarningLights.length; i++)
											{
												w = this.mWarningLights[i];
												if(w.mWaypoint + 18 > this.mFirstChainEnd)
												{
													idx = flash.checkInt(i);
													break;
												}
											}
											if(idx < this.mWarningLights.length)
											{
												this.mWarningLights[idx].mPulseRate = 30 * (1 - pct);
												minalpha = 10;
												if(this.mWarningLights[idx].mPulseRate < minalpha)
												{
													this.mWarningLights[idx].mPulseRate = minalpha;
												}
											}
										}
									}
								}
								var was_in_danger:boolean = this.mInDanger;
								this.mInDanger = this.mBallList["tail"].data.GetWayPoint() >= this.mDangerPoint && this.mApp["gDieAtEnd"];
								if(was_in_danger != this.mInDanger && this.mWarningLights.length > 0)
								{
									for(i = flash.checkInt(0); i < this.mWarningLights.length; i++)
									{
										this.mWarningLights[i].mState = flash.checkInt(<any>!<any>!this.mInDanger?1:-1);
									}
								}
							}

							public GetXYFromWaypoint(waypoint:number,aPoint:egret.Point):boolean
							{
								waypoint = flash.checkInt(waypoint);
								var wpl:Array<com.popcap.flash.games.zuma2.logic.WayPoint> = this.mWayPointMgr.mWayPoints;
								if(waypoint >= wpl.length)
								{
									return false;
								}
								var p:com.popcap.flash.games.zuma2.logic.WayPoint = wpl[waypoint];
								aPoint.x = p.x;
								aPoint.y = p.y;
								return true;
							}

							public GetNumPendingSingles(theNumGroups:number):number
							{
								theNumGroups = flash.checkInt(theNumGroups);
								var aColor:number = flash.checkInt(0);
								var aNumGroups:number = flash.checkInt(0);
								var aPrevColor:number = flash.checkInt(-1);
								var aNumSingles:number = flash.checkInt(0);
								var aGroupCount:number = flash.checkInt(0);
								var anRItr:de.polygonal.ds.DListIterator = <any>this.mPendingBalls["getListIterator"]();
								anRItr["end"]();
								while(anRItr["valid"]() && aNumGroups <= theNumGroups)
								{
									aColor = flash.checkInt(anRItr["data"].GetColorType());
									if(aColor != aPrevColor)
									{
										if(aGroupCount == 1)
										{
											aNumSingles++;
										}
										aGroupCount = flash.checkInt(1);
										aNumGroups++;
										aPrevColor = flash.checkInt(aColor);
									}
									else
									{
										aGroupCount++;
									}
									anRItr["back"]();
								}
								var anItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								anItr["start"]();
								while(anItr["valid"]() && aNumGroups <= theNumGroups)
								{
									aColor = flash.checkInt(anItr["data"].GetColorType());
									if(aColor != aPrevColor)
									{
										if(aGroupCount == 1)
										{
											aNumSingles++;
										}
										aGroupCount = flash.checkInt(1);
										aNumGroups++;
										aPrevColor = flash.checkInt(aColor);
									}
									else
									{
										aGroupCount++;
									}
									anItr["forth"]();
								}
								return aNumSingles;
							}

							public AddBall()
							{
								var aWayPoint:number = <any>NaN;
								if(<any>!this.mApp["gAddBalls"] || this.mLevel.mNum == flash.int.MAX_VALUE && this.mBoard["mPreventBallAdvancement"])
								{
									return ;
								}
								if(this.mPendingBalls["isEmpty"]())
								{
									if(<any>!this.mStopAddingBalls)
									{
										this.AddPendingBall();
									}
									else
									{
										return ;
									}
								}
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>this.mPendingBalls["head"].data;
								this.mWayPointMgr.SetWayPoint(aBall,1,this.mLevel.mLoopAtEnd);
								var aFrontBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(<any>!this.mBallList["isEmpty"]())
								{
									aFrontBall = this.mBallList["head"].data;
									if(this.mAdvanceSpeed > aFrontBall.GetRadius() && aFrontBall.GetWayPoint() >= 0)
									{
										if(aFrontBall.GetWayPoint() - this.mAdvanceSpeed < 5)
										{
											aWayPoint = aFrontBall.GetWayPoint() - aFrontBall.GetRadius() - aBall.GetRadius() - 0.001;
											aBall.SetWayPoint(aWayPoint,this.mWayPointMgr.InTunnel(aWayPoint));
										}
									}
									else if(aBall.GetWayPoint() > aFrontBall.GetWayPoint() || aBall.CollidesWith(aFrontBall))
									{
										return ;
									}
								}
								var anItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								anItr["start"]();
								aBall.InsertInList(this.mBallList,anItr,this);
								aBall.UpdateCollisionInfo(5 + this.mAdvanceSpeed);
								aBall.SetNeedCheckCollision(true);
								aBall.SetRotation(this.mWayPointMgr.GetRotationForPoint(aBall.GetWayPoint()));
								aBall.SetBackwardsCount(0);
								aBall.SetSuckCount(0);
								aBall.SetGapBonus(0,0);
								aBall.SetComboCount(0,0);
								this.mPendingBalls["removeHead"]();
								if(aBall.GetWayPoint() > 1)
								{
									this.AddBall();
								}
							}

							public CheckCollision(theBullet:com.popcap.flash.games.zuma2.logic.Bullet,should_add:boolean = true):boolean
							{
								var aBullet2:com.popcap.flash.games.zuma2.logic.Bullet = <any>null;
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aBallCenter:com.popcap.flash.games.zuma2.logic.SexyVector3 = <any>null;
								var aBulletCenter:com.popcap.flash.games.zuma2.logic.SexyVector3 = <any>null;
								var aPerp:com.popcap.flash.games.zuma2.logic.SexyVector3 = <any>null;
								var aCross:com.popcap.flash.games.zuma2.logic.SexyVector3 = <any>null;
								var aWayPoint:number = <any>NaN;
								var rad:number = flash.checkInt(0);
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = theBullet;
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var hitInFront:any = false;
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								var aBulletItr:de.polygonal.ds.DListIterator = <any>this.mBulletList["getListIterator"]();
								aBulletItr["start"]();
								while(aBulletItr["valid"]())
								{
									aBullet2 = aBulletItr["data"];
									if(theBullet.CollidesWithPhysically(aBullet2))
									{
										aBullet2.Update();
										this.AdvanceMergingBullet(aBulletItr);
										break;
									}
									aBulletItr["forth"]();
								}
								var remove_at_next:boolean = <any>false;
								aBallItr["start"]();
								while(true)
								{
									if(aBallItr["valid"]())
									{
										aBall = aBallItr["data"];
										if(aBall.mId == 1)
											{}
										if(aBall.CollidesWithPhysically(aBullet,0) && aBall.GetBullet() == null && <any>!aBall.GetIsExploding())
										{
											aPrevBall = aBall.GetPrevBall(true);
											if(aPrevBall == null || aPrevBall.GetBullet() == null)
											{
												aNextBall = aBall.GetNextBall(true);
												if(aNextBall == null || aNextBall.GetBullet() == null)
												{
													aBallCenter = new com.popcap.flash.games.zuma2.logic.SexyVector3(aBall.GetX(),aBall.GetY(),0);
													aBulletCenter = new com.popcap.flash.games.zuma2.logic.SexyVector3(aBullet.GetX(),aBullet.GetY(),0);
													aPerp = this.mWayPointMgr.CalcPerpendicular(aBall.GetWayPoint());
													aCross = aBulletCenter.Sub(aBallCenter).Cross(aPerp);
													hitInFront = aCross.z < 0;
													if(<any>!this.mWayPointMgr.InTunnel2(aBall,hitInFront))
													{
														if(theBullet.GetIsCannon())
														{
															this.mBoard["IncScore"](10,true);
															this.StartExploding(aBall);
															this.mBoard["PlaySmallExplosionSound"]();
														}
													}
												}
											}
										}
										if(remove_at_next)
										{
											break;
										}
										aBallItr["forth"]();
										continue;
									}
									if(aBallItr["node"] != null)
									{
										if(theBullet.GetIsCannon())
										{
											return true;
										}
										aBullet.SetHitBall(aBall,hitInFront);
										aBullet.SetMergeSpeed(this.mCurveDesc.mMergeSpeed);
										aNextBall = aBall.GetNextBall();
										if(<any>!hitInFront)
										{
											aBullet.RemoveGapInfoForBall(aBall.GetId());
										}
										else if(aNextBall != null)
										{
											aBullet.RemoveGapInfoForBall(aNextBall.GetId());
										}
										if(this.mApp["gStopSuckbackImmediately"])
										{
											if(hitInFront && aNextBall != null && aNextBall.GetSuckBack() && aNextBall.GetSuckCount() > 0 && aNextBall.GetColorType() != aBullet.GetColorType())
											{
												aNextBall.SetSuckCount(0);
											}
											else if(<any>!hitInFront && aBall != null && aBall.GetSuckBack() && aBall.GetSuckCount() > 0 && aBall.GetColorType() != aBullet.GetColorType())
											{
												aBall.SetSuckCount(0);
											}
										}
										this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BALL_CLICK2);
										aWayPoint = aBall.GetWayPoint();
										rad = flash.checkInt(80);
										if(this.mWayPointMgr.CheckDiscontinuity(aWayPoint - rad,2 * rad))
										{
											aBullet.mDoNewMerge = true;
										}
										this.mBulletList["append"](aBullet);
										return true;
									}
									return false;
								}
								return true;
							}

							public GetNumPendingMatches():number
							{
								var t:number = flash.checkInt(0);
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(this.mPendingBalls["size"] == 0 && this.mBallList["size"] == 0)
								{
									return 0;
								}
								t = flash.checkInt(this.mPendingBalls["size"] > 0?flash.tranint(this.mPendingBalls["tail"].data.GetColorType()):flash.tranint(this.mBallList["head"].data.GetColorType()));
								var num:number = flash.checkInt(0);
								var rit:de.polygonal.ds.DListIterator = <any>this.mPendingBalls["getListIterator"]();
								rit["end"]();
								while(rit["valid"]())
								{
									b = rit["data"];
									if(b.GetColorType() == t)
									{
										num++;
										rit["back"]();
										continue;
									}
									break;
								}
								if(this.mPendingBalls["size"] > 0)
								{
									return num;
								}
								var it:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								it["start"]();
								while(it["valid"]())
								{
									b = it["data"];
									if(b.GetColorType() == t)
									{
										num++;
										it["forth"]();
										continue;
									}
									break;
								}
								return num;
							}

							public Reset()
							{
								var i:number = flash.checkInt(0);
								this.mChainFromSuck = false;
								this.mPlayedSparkleSound = false;
								this.mHasReachedCruisingSpeed = false;
								this.mNumBallsCreated = flash.checkInt(0);
								this.mNeedsSpeedup = false;
								this.mOverrideSpeed = -1;
								this.mProxBombCounter = flash.checkInt(-1);
								this.mHasReachedRolloutPoint = false;
								this.mCanCheckForSpeedup = false;
								this.mLastPowerupTime = flash.checkInt(0);
								this.mLastPathHiliteWP = flash.checkInt(0);
								this.mLastPathHilitePitch = flash.checkInt(this.mCurveNum == 1?-20:0);
								this.mInitialPathHilite = false;
								this.mSkullHilite = 0;
								this.mDoingClearCurveRollout = false;
								this.mSkullHiliteDir = 0;
								for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Max; i++)
								{
									this.mNumPowerUpsThisLevel[i] = 0;
									this.mNumPowerupsActivated[i] = 0;
								}
								for(i = flash.checkInt(0); i < 6; i++)
								{
									this.mBallColorHasPowerup[i] = 0;
								}
								for(var j:number = flash.checkInt(0);j < this.mWarningLights.length; j++)
								{
									this.mWarningLights[j].mState = flash.checkInt(-1);
									if(this.mWarningLights[j].mPulseRate > 0)
									{
										this.mWarningLights[j].mPulseRate = this.mWarningLights[j].mPulseRate * -1;
									}
								}
							}

							public CheckBallIntersection(p1:com.popcap.flash.games.zuma2.logic.SexyVector3,v1:com.popcap.flash.games.zuma2.logic.SexyVector3,theT:egret.Point,skip_exploding:boolean = false):com.popcap.flash.games.zuma2.logic.Ball
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var t2:number = <any>NaN;
								var theT2:egret.Point = <any>null;
								var anIntersectBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var idx:number = flash.checkInt(0);
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									aBall = aBallItr["data"];
									if(<any>!this.mWayPointMgr.InTunnel(aBall.GetWayPoint()))
									{
										theT2 = new egret.Point();
										if((<any>!aBall.GetIsExploding() || <any>!skip_exploding) && aBall.Intersects(p1,v1,theT2))
										{
											t2 = theT2.x;
											if(t2 < theT.x && t2 > 0)
											{
												anIntersectBall = aBall;
												theT.x = t2;
											}
										}
									}
									aBallItr["forth"]();
									idx++;
								}
								return anIntersectBall;
							}

							public StartExploding(theBall:com.popcap.flash.games.zuma2.logic.Ball,from_lightning_frog:boolean = false,record_levelstats:boolean = true)
							{
								if(theBall.GetIsExploding())
								{
									return ;
								}
								if(record_levelstats)
								{
									this.mBoard["mLevelStats"].mNumBallsCleared++;
									this.mBoard["IncNumCleared"](1);
								}
								this.mLastClearedBallPoint = flash.checkInt(theBall.GetWayPoint());
								if(theBall.GetSuckPending())
								{
									theBall.SetSuckPending(false);
								}
								theBall.Explode(this.mWayPointMgr.InTunnel(theBall.GetWayPoint()),from_lightning_frog);
								if(theBall.GetPowerOrDestType() != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None)
								{
									this.mNumPowerupsActivated[theBall.GetPowerOrDestType()]++;
									this.mBoard["ActivatePowerBall"](theBall);
									this.mLastCompletedPowerUpFrame[theBall.GetPowerOrDestType()] = this.mBoard["GetStateCount"]();
									this.mHadPowerUp = true;
								}
							}

							public CanRestart():boolean
							{
								return this.mBallList["isEmpty"]();
							}

							public DeleteBalls()
							{
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								var aBulletItr:de.polygonal.ds.DListIterator = <any>this.mBulletList["getListIterator"]();
								var aPendingItr:de.polygonal.ds.DListIterator = <any>this.mPendingBalls["getListIterator"]();
								aBulletItr["start"]();
								while(aBulletItr["valid"]())
								{
									aBulletItr["data"].Delete();
									aBulletItr["forth"]();
								}
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									aBallItr["data"].Delete();
									aBallItr["forth"]();
								}
								aPendingItr["start"]();
								while(aPendingItr["valid"]())
								{
									aPendingItr["data"].Delete();
									aPendingItr["forth"]();
								}
								this.mBallList["clear"]();
								this.mPendingBalls["clear"]();
								this.mBulletList["clear"]();
							}

							public DoMerge(theBullet:com.popcap.flash.games.zuma2.logic.Bullet)
							{
								var aPercent:number = <any>NaN;
								var aPad:number = flash.checkInt(0);
								var w1:number = <any>NaN;
								var aMaxGapSpace:number = <any>NaN;
								var w2:number = <any>NaN;
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var hitInFront:boolean = <any>false;
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = theBullet;
								aBullet.CheckSetHitBallToPrevBall();
								var aHitBall:com.popcap.flash.games.zuma2.logic.Ball = aBullet.GetHitBall();
								var aRotation:number = aBullet.GetRotation();
								this.mWayPointMgr.SetWayPoint(aBullet,aHitBall.GetWayPoint(),this.mLevel.mLoopAtEnd);
								this.mWayPointMgr.FindFreeWayPoint(aHitBall,aBullet,aBullet.GetHitInFront(),this.mLevel.mLoopAtEnd);
								aBullet.SetDestPos(aBullet.GetX(),aBullet.GetY());
								aBullet.SetRotation(aRotation,true);
								aBullet.SetRotation(this.mWayPointMgr.GetRotationForPoint(aBullet.GetWayPoint()),false);
								aBullet.Update();
								var aPushBall:com.popcap.flash.games.zuma2.logic.Ball = aBullet.GetPushBall();
								if(aPushBall != null)
								{
									aPercent = 1 - aBullet.GetHitPercent();
									aPad = flash.checkInt(flash.tranint(-aBullet.GetRadius() * aPercent / 2));
									w1 = aPushBall.GetWayPoint();
									aMaxGapSpace = aBullet.GetHitPercent() * aBullet.GetHitPercent() * (aPushBall.GetRadius() + aBullet.GetRadius());
									this.mWayPointMgr.FindFreeWayPoint(aBullet,aBullet.GetPushBall(),true,this.mLevel.mLoopAtEnd,aPad);
									if(aPushBall.GetWayPoint() - aBullet.GetWayPoint() > aMaxGapSpace)
									{
										w2 = aBullet.GetWayPoint() + aMaxGapSpace;
										if(w2 > w1)
										{
											this.mWayPointMgr.SetWayPoint(aPushBall,w2,this.mLevel.mLoopAtEnd);
										}
										else
										{
											this.mWayPointMgr.SetWayPoint(aPushBall,w1,this.mLevel.mLoopAtEnd);
										}
									}
									aPushBall.SetNeedCheckCollision(true);
									if(<any>!this.mApp["gStopSuckbackImmediately"])
									{
										aNextBall = aHitBall.GetNextBall();
										hitInFront = aBullet.GetHitInFront();
										if(hitInFront && aNextBall != null && aNextBall.GetSuckBack() && aNextBall.GetSuckCount() > 0 && aNextBall.GetColorType() != aBullet.GetColorType())
										{
											aNextBall.SetSuckCount(0);
										}
										else if(<any>!hitInFront && aHitBall != null && aHitBall.GetSuckBack() && aHitBall.GetSuckCount() > 0 && aHitBall.GetColorType() != aBullet.GetColorType())
										{
											aHitBall.SetSuckCount(0);
										}
									}
								}
							}

							public DrawBalls(canvas:com.popcap.flash.framework.Canvas)
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = <any>null;
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									aBall = aBallItr["data"];
									aBall.Draw(canvas);
									aBallItr["forth"]();
								}
								var aBulletItr:de.polygonal.ds.DListIterator = <any>this.mBulletList["getListIterator"]();
								aBulletItr["start"]();
								while(aBulletItr["valid"]())
								{
									aBullet = aBulletItr["data"];
									aBullet.Draw(canvas);
									aBulletItr["forth"]();
								}
							}

							public CanSpawnPowerUp(ptype:number):boolean
							{
								ptype = flash.checkInt(ptype);
								var maxnum:number = flash.checkInt(this.mCurveDesc.mVals.mMaxNumPowerUps[ptype]);
								if(ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Cannon && this.mBoard["HasAchievedZuma"]())
								{
									return false;
								}
								if(this.mLevel.HasPowerup(ptype))
								{
									return false;
								}
								if(ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_ColorNuke || ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Laser)
								{
									return false;
								}
								return <any>!<any>!this.mApp["mLevelMgr"].mCapAffectsPowerupsSpawned?this.mNumPowerUpsThisLevel[ptype] < maxnum:this.mNumPowerupsActivated[ptype] < maxnum;
							}

							public CheckSet(theBall:com.popcap.flash.games.zuma2.logic.Ball):boolean
							{
								var i:number = flash.checkInt(0);
								var aGapBonus:number = flash.checkInt(0);
								var aNumGaps:number = flash.checkInt(0);
								var anEndBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aBallItr:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var anItr:de.polygonal.ds.DListIterator = <any>null;
								var destroySound:com.popcap.flash.framework.resources.sounds.SoundResource = <any>null;
								var soundString:string = <any>null;
								var aSound:com.popcap.flash.framework.resources.sounds.SoundResource = <any>null;
								var aVolume:number = <any>NaN;
								this.mHadPowerUp = false;
								this.mBallObj["aNextEnd"] = null;
								this.mBallObj["aPrevEnd"] = null;
								var aComboCount:number = flash.checkInt(theBall.GetComboCount());
								var aCount:number = flash.checkInt(this.GetNumInARow(theBall,theBall.GetColorType(),this.mBallObj));
								if(aCount >= 3)
								{
									this.mBoard["SetNumCleared"](0);
									this.mBoard["SetCurComboCount"](aComboCount);
									this.mBoard["SetCurComboScore"](theBall.GetComboScore());
									this.mBoard["mNeedComboCount"].clear();
									for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Max; i++)
									{
										this.mApp["gGotPowerUp"][i] = false;
									}
									aGapBonus = flash.checkInt(0);
									aNumGaps = flash.checkInt(0);
									anEndBall = this.mBallObj["aNextEnd"].GetNextBall();
									aBallItr = this.mBallObj["aPrevEnd"];
									while(aBallItr != anEndBall)
									{
										if(aBallItr.GetSuckPending())
										{
											aBallItr.SetSuckPending(false);
											this.mBoard["IncNumClearsInARow"](1);
											this.mChainFromSuck = true;
										}
										this.StartExploding(aBallItr);
										aGapBonus = flash.checkInt(aGapBonus + aBallItr.GetGapBonus());
										if(aBallItr.GetNumGaps() > aNumGaps)
										{
											aNumGaps = flash.checkInt(aBallItr.GetNumGaps());
										}
										aBallItr.SetGapBonus(0,0);
										aBallItr = aBallItr.GetNextBall();
									}
									this.DoScoring(theBall,this.mBoard["GetNumCleared"](),aComboCount,aGapBonus,aNumGaps);
									if(this.mBoard["GetCurComboCount"]() > this.mBoard["mLevelStats"].mMaxCombo || this.mBoard["GetCurComboCount"]() == this.mBoard["mLevelStats"].mMaxCombo && this.mBoard["GetCurComboScore"]() >= this.mBoard["mLevelStats"].mMaxComboScore)
									{
										this.mBoard["mLevelStats"].mMaxCombo = this.mBoard["GetCurComboCount"]();
										this.mBoard["mLevelStats"].mMaxComboScore = this.mBoard["GetCurComboScore"]();
									}
									aBallItr = this.mBallObj["aPrevEnd"];
									while(aBallItr != anEndBall)
									{
										aBallItr.SetComboCount(aComboCount,this.mBoard["GetCurComboScore"]());
										aBallItr = aBallItr.GetNextBall();
									}
									anItr = this.mBoard["mNeedComboCount"].getListIterator();
									anItr["start"]();
									while(anItr["valid"]())
									{
										anItr["data"].SetComboCount(aComboCount,this.mBoard["GetCurComboScore"]());
										anItr["forth"]();
									}
									this.mBoard["mNeedComboCount"].clear();
									if(<any>!this.mHadPowerUp)
									{
										switch(aComboCount)
										{
										case 0 :
											destroySound = this.mApp["soundManager"].getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED1);
											break;
										case 1 :
											destroySound = this.mApp["soundManager"].getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED2);
											break;
										case 2 :
											destroySound = this.mApp["soundManager"].getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED3);
											break;
										case 3 :
											destroySound = this.mApp["soundManager"].getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED4);
											break;
										default :
											destroySound = this.mApp["soundManager"].getSoundResource(Zuma2Sounds.SOUND_BALLS_DESTROYED5);
										}
										destroySound["setVolume"](0.5);
										destroySound["play"](1);
										soundString = "SOUND_BALL_COMBO" + (aComboCount + 1);
										aSound = this.mApp["soundManager"].getSoundResource(soundString);
										if(aSound != null)
										{
											aVolume = 0.4 + 0.2 * aComboCount;
											if(aVolume > 1)
											{
												aVolume = 1;
											}
											aSound["play"](1);
										}
									}
									this.mBoard["SetCurComboCount"](0);
									this.mBoard["SetCurComboScore"](0);
									return true;
								}
								return false;
							}

							public RollBallsIn()
							{
								this.mHasReachedCruisingSpeed = false;
								var s1:number = this.mCurveDesc.mVals.mSpeed;
								var aStartDistance:number = flash.checkInt(this.mCurveDesc.mVals.mStartDistance);
								var k:number = this.GetCurveLength() * aStartDistance / 100;
								if(this.mFirstChainEnd > 0)
								{
									k = k - flash.trannumber(this.mFirstChainEnd / this.GetCurveLength());
									if(k <= 0)
									{
										this.mAdvanceSpeed = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale;
										return ;
									}
								}
								var b:number = 20 * s1 + 1;
								var c:number = -20 * k;
								var numFrames:number = flash.checkInt((-b + Math.sqrt(b * b - 4 * c)) / 2);
								this.mAdvanceSpeed = s1 + numFrames * 0.1;
								if(<any>!this.mApp["gAddBalls"])
								{
									this.mHasReachedCruisingSpeed = true;
									this.mAdvanceSpeed = this.mCurveDesc.mVals.mSpeed * this.mSpeedScale;
								}
							}

							public UpdateSuckingBalls()
							{
								var aFirstBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aSuckCount:number = flash.checkInt(0);
								var aMoveAmount:number = <any>NaN;
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var anEndBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var b:boolean = <any>false;
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = <any>null;
								var aPushBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var collide:boolean = <any>false;
								var aMaxWayPoint:number = <any>NaN;
								var aBackwardsCount:number = flash.checkInt(0);
								var doBackwards:boolean = <any>false;
								var aBackwardsSpeed:number = <any>NaN;
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									aFirstBall = aBallItr["data"];
									if(<any>!aFirstBall.GetSuckBack() && aFirstBall.GetSuckCount() > 0)
									{
										this.UpdateForwardSuckingBalls();
										return ;
									}
									aSuckCount = flash.checkInt(aFirstBall.GetSuckCount());
									aMoveAmount = (aSuckCount >> 3) * this.mSpeedScale;
									if(aFirstBall.GetSuckCount() > 0)
									{
										aBall = null;
										while(aBallItr["valid"]())
										{
											aBall = aBallItr["data"];
											aBallItr["forth"]();
											aBall.SetSuckCount(0);
											this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() - aMoveAmount,this.mLevel.mLoopAtEnd);
											aBullet = aBall.GetBullet();
											if(aBullet != null && <any>!aBullet.mDoNewMerge)
											{
												aPushBall = aBullet.GetPushBall();
												if(aPushBall != null)
												{
													this.mWayPointMgr.FindFreeWayPoint(aPushBall,aBullet,false,this.mLevel.mLoopAtEnd);
												}
												aBullet.UpdateHitPos();
											}
											if(<any>!aBall.GetCollidesWithNext())
											{
												break;
											}
										}
										anEndBall = aBall;
										aFirstBall.SetSuckCount(aSuckCount + 1);
										aPrevBall = aFirstBall.GetPrevBall();
										if(aPrevBall != null && aPrevBall.GetColorType() == aFirstBall.GetColorType() && aPrevBall.GetIsExploding())
										{
											while(aPrevBall != null)
											{
												aPrevBall = aPrevBall.GetPrevBall();
												if(aPrevBall != null && <any>!aPrevBall.GetIsExploding())
												{
													break;
												}
											}
										}
										b = aPrevBall != null && aPrevBall.GetColorType() == aFirstBall.GetColorType();
										if(b)
										{
											collide = false;
											aMaxWayPoint = aFirstBall.GetWayPoint() - aFirstBall.GetRadius() - aPrevBall.GetRadius();
											if(aPrevBall.GetWayPoint() > aMaxWayPoint)
											{
												this.mWayPointMgr.SetWayPoint(aPrevBall,aMaxWayPoint,this.mLevel.mLoopAtEnd);
												collide = true;
											}
											if(collide)
											{
												this.mBoard["PlayBallClick"](Zuma2Sounds.SOUND_BALL_CLICK1);
												aPrevBall.SetCollidesWithNext(true);
												aFirstBall.SetSuckCount(0);
												aBackwardsCount = flash.checkInt(5 + 5 * aFirstBall.GetComboCount());
												doBackwards = true;
												if(<any>!this.CheckSet(aFirstBall) || aFirstBall.GetSuckFromCompacting())
												{
													aFirstBall.SetComboCount(0,0);
												}
												if(aBackwardsCount > 40)
												{
													aBackwardsCount = flash.checkInt(40);
												}
												aBackwardsCount = flash.checkInt(aBackwardsCount * 3);
												if(doBackwards)
												{
													if(anEndBall.GetBackwardsCount() == 0)
													{
														anEndBall.SetBackwardsCount(30);
														aBackwardsSpeed = aFirstBall.GetComboCount() * 1.5;
														if(aBackwardsSpeed <= 1)
														{
															aBackwardsSpeed = 1;
														}
														anEndBall.SetBackwardsSpeed(aBackwardsSpeed);
													}
												}
												this.ClearPendingSucks(anEndBall);
											}
										}
										else
										{
											aFirstBall.SetSuckCount(0);
										}
									}
									else
									{
										aBallItr["forth"]();
									}
								}
							}

							public DeleteBall(theBall:com.popcap.flash.games.zuma2.logic.Ball)
							{
								var anItr:de.polygonal.ds.DListIterator = <any>null;
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = theBall.GetBullet();
								if(aBullet != null)
								{
									aBullet.MergeFully();
									anItr = this.mBulletList["nodeOf"](aBullet);
									if(anItr["valid"]())
									{
										this.AdvanceMergingBullet(anItr["data"]);
									}
								}
								this.DeleteBullet(theBall.GetBullet());
								theBall.SetCollidesWithPrev(false);
								theBall.Delete();
							}

							public DrawMisc()
							{
								for(var i:number = flash.checkInt(0);i < this.mSparkles.length; i++)
								{
									this.mSparkles[i].Update();
								}
							}

							public RemoveBallsAtEnd()
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(this.mApp["gDieAtEnd"] || this.mLevel.mLoopAtEnd)
								{
									return ;
								}
								if(this.mBallList["isEmpty"]())
								{
									return ;
								}
								var anEndPoint:number = flash.checkInt(this.mWayPointMgr.GetEndPoint());
								var anItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								anItr["end"]();
								var done:boolean = <any>false;
								while(<any>!done)
								{
									aBall = anItr["data"];
									if(aBall.GetWayPoint() >= anEndPoint)
									{
										if(<any>!this.mLevel.mLoopAtEnd || aBall.GetIsExploding())
										{
											if(anItr["node"] != this.mBallList["head"])
											{
												anItr["back"]();
											}
											else
											{
												done = true;
											}
											this.DeleteBullet(aBall.GetBullet());
											aBall.RemoveFromList();
											aBall.mDead = true;
											this.DeleteBall(aBall);
										}
										continue;
									}
									break;
								}
							}

							public GetFarthestBallPercent(ignore_gaps:boolean = true):number
							{
								var it:de.polygonal.ds.DListIterator = <any>null;
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(this.mBallList["isEmpty"]())
								{
									return 0;
								}
								var aWayPoint:number = flash.checkInt(this.mBallList["tail"].data.GetWayPoint());
								if(<any>!ignore_gaps)
								{
									it = this.mBallList["getListIterator"]();
									it["start"]();
									while(it["valid"]())
									{
										b = it["data"];
										if(<any>!b.GetCollidesWithNext())
										{
											aWayPoint = flash.checkInt(b.GetWayPoint());
											break;
										}
										it["forth"]();
									}
								}
								return flash.tranint(aWayPoint * 100 / this.mWayPointMgr.GetNumPoints());
							}

							public SetLosing()
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aBulletItr:de.polygonal.ds.DListIterator = <any>this.mBulletList["getListIterator"]();
								aBulletItr["start"]();
								while(aBulletItr["valid"]())
								{
									aBulletItr["data"].Delete();
									aBulletItr["forth"]();
								}
								this.mBulletList = new DLinkedList();
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									aBall = aBallItr["data"];
									aBall.SetSuckCount(this.mAdvanceSpeed * 4);
									aBallItr["forth"]();
								}
							}

							public DoBackwards()
							{
								if(<any>!this.mBallList["isEmpty"]())
								{
									this.mBackwardCount = flash.checkInt(300);
								}
							}

							public ActivateProximityBomb(theBall:com.popcap.flash.games.zuma2.logic.Ball)
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var radius:number = flash.checkInt(com.popcap.flash.games.zuma2.logic.CurveMgr.PROXIMITY_BOMB_RADIUS);
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									aBall = aBallItr["data"];
									if(<any>!aBall.GetIsExploding() && aBall.CollidesWithPhysically(theBall,radius))
									{
										aBall.SetComboCount(this.mBoard["GetCurComboCount"](),this.mBoard["GetCurComboScore"]());
										this.mBoard["mNeedComboCount"].append(aBall);
										this.StartExploding(aBall);
									}
									aBallItr["forth"]();
								}
							}

							public SetPath(path:string)
							{
								this.mPath = path;
							}

							public LoadCurve()
							{
								var aHoleX:number = flash.checkInt(0);
								var aHoleY:number = flash.checkInt(0);
								var aPoint:com.popcap.flash.games.zuma2.logic.WayPoint = <any>null;
								var pt:egret.Point = <any>null;
								var midpoint:com.popcap.flash.games.zuma2.logic.SexyVector3 = <any>null;
								var perp:com.popcap.flash.games.zuma2.logic.SexyVector3 = <any>null;
								var p1:com.popcap.flash.games.zuma2.logic.SexyVector3 = <any>null;
								this.mWarningLights = new Array<com.popcap.flash.games.zuma2.logic.WarningLight>();
								this.mSpeedScale = 1;
								this.mWayPointMgr.LoadCurve(this.mPath,this.mCurveDesc);
								var aRotation:number = <any>this.mCurveDesc.mVals.mSkullRotation;
								if(aRotation >= 0)
								{
									aRotation = Zuma2App.DEG_TO_RAD * aRotation;
								}
								var len:number = flash.checkInt(this.mWayPointMgr.mWayPoints.length);
								if(len > 0)
								{
									this.mWayPointMgr.CalcPerpendicularForPoint(flash.tranint(len - 1));
									aPoint = this.mWayPointMgr.mWayPoints[len - 1];
									aHoleX = flash.checkInt(aPoint.x);
									aHoleY = flash.checkInt(aPoint.y);
									if(aRotation < 0)
									{
										aRotation = aPoint.mRotation;
									}
								}
								this.mLevel.mHoleMgr.PlaceHole(this.mCurveNum,aHoleX,aHoleY,aRotation,true);
								this.mDangerPoint = flash.checkInt(this.mWayPointMgr.mWayPoints.length - this.mCurveDesc.mDangerDistance);
								if(this.mDangerPoint >= this.mWayPointMgr.mWayPoints.length)
								{
									this.mDangerPoint = flash.checkInt(this.mWayPointMgr.mWayPoints.length - 1);
								}
								var point_spacing:number = flash.checkInt(0);
								for(var wp:number = flash.checkInt(this.mDangerPoint * this.mLevel.mPotPct);wp <= this.mWayPointMgr.GetEndPoint() - 50; wp = flash.checkInt(wp + 50))
								{
									pt = this.mWayPointMgr.GetPointPos(wp);
									midpoint = new com.popcap.flash.games.zuma2.logic.SexyVector3(pt.x,pt.y,0);
									perp = this.mWayPointMgr.CalcPerpendicular(wp).Mult(point_spacing);
									p1 = midpoint.Add(perp);
									this.mWarningLights.push(new com.popcap.flash.games.zuma2.logic.WarningLight(this.mApp,p1.x,p1.y));
									this.mWarningLights[this.mWarningLights.length - 1].SetAngle(this.mWayPointMgr.GetRotationForPoint(wp));
									this.mWarningLights[this.mWarningLights.length - 1].mWaypoint = wp;
									this.mWarningLights[this.mWarningLights.length - 1].mPriority = flash.checkInt(this.mWayPointMgr.GetPriority(wp));
								}
								this.mIsLoaded = true;
							}

							public HasReachedCruisingSpeed():boolean
							{
								return this.mHasReachedCruisingSpeed;
							}

							public RemoveBallsAtFront()
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(<any>!this.mHasReachedCruisingSpeed)
								{
									return ;
								}
								var anItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								anItr["start"]();
								while(anItr["valid"]())
								{
									aBall = anItr["data"];
									if(aBall.GetWayPoint() < this.mCurveDesc.mCutoffPoint && this.mStopAddingBalls || aBall.GetWayPoint() < 1)
									{
										anItr["forth"]();
										this.DeleteBullet(aBall.GetBullet());
										aBall.RemoveFromList();
										if(<any>!aBall.GetIsExploding() && <any>!this.mStopAddingBalls)
										{
											this.mPendingBalls["append"](aBall);
										}
										else
										{
											if(<any>!this.mStopAddingBalls)
												{}
											aBall.mDead = true;
											this.DeleteBall(aBall);
											if(this.mBallList["size"] == 0 && this.mStopAddingBalls)
											{
												this.mLastClearedBallPoint = flash.checkInt(0);
											}
										}
										continue;
									}
									break;
								}
							}

							public StartLevel()
							{
								var i:number = flash.checkInt(0);
								this.mPathLightEndFrame = flash.checkInt(0);
								this.mLastPathShowTick = flash.checkInt(Math.min(0,this.GetBoardTickCount() - 1000000));
								this.mLastClearedBallPoint = flash.checkInt(0);
								for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Max; i++)
								{
									this.mLastSpawnedPowerUpFrame[i] = this.mBoard["GetStateCount"]() - 1000;
									this.mLastCompletedPowerUpFrame[i] = this.mBoard["GetStateCount"]() - 1000;
								}
								this.DeleteBalls();
								var aNumBalls:number = flash.checkInt(this.mCurveDesc.mVals.mNumBalls > 0 && this.mCurveDesc.mVals.mNumBalls < 10?flash.tranint(this.mCurveDesc.mVals.mNumBalls):10);
								for(i = flash.checkInt(0); i < aNumBalls; i++)
								{
									this.AddPendingBall();
								}
								this.mStopTime = flash.checkInt(0);
								this.mSlowCount = flash.checkInt(0);
								this.mBackwardCount = flash.checkInt(0);
								this.mTotalBalls = flash.checkInt(aNumBalls);
								this.mNumBallsCreated = flash.checkInt(this.mPendingBalls["size"]);
								this.mStopAddingBalls = false;
								this.mInDanger = false;
								this.mFirstChainEnd = flash.checkInt(0);
								this.mFirstBallMovedBackwards = false;
								this.mApp["gDieAtEnd"] = <any>!<any>!this.mLevel.mLoopAtEnd?false:flash.Boolean(this.mCurveDesc.mVals.mDieAtEnd);
								this.RollBallsIn();
							}

							public CheckGapShot(theBullet:com.popcap.flash.games.zuma2.logic.Bullet):boolean
							{
								var dx:number = <any>NaN;
								var dy:number = <any>NaN;
								var aPoint:com.popcap.flash.games.zuma2.logic.WayPoint = <any>null;
								var aGapSize:number = flash.checkInt(0);
								var aGapBallId:number = flash.checkInt(0);
								var anItr:de.polygonal.ds.DListIterator = <any>null;
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var it2:de.polygonal.ds.DListIterator = <any>null;
								var valid:boolean = <any>false;
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aDiameter:number = flash.checkInt(theBullet.GetRadius() * 2);
								var r:number = theBullet.GetRadius();
								var checkDist:number = r * r;
								var x:number = theBullet.GetX();
								var y:number = theBullet.GetY();
								var aList:Array<com.popcap.flash.games.zuma2.logic.WayPoint> = this.mWayPointMgr.mWayPoints;
								var aSize:number = flash.checkInt(aList.length);
								var aCurCurvePoint:number = flash.checkInt(theBullet.GetCurCurvePoint(this.mCurveNum));
								if(aCurCurvePoint > 0 && aCurCurvePoint < aSize)
								{
									aPoint = aList[aCurCurvePoint];
									dx = aPoint.x - x;
									dy = aPoint.y - y;
									if(dx * dx + dy * dy < checkDist)
									{
										return false;
									}
									theBullet.SetCurCurvePoint(this.mCurveNum,0);
								}
								for(var i:number = flash.checkInt(1);i < aSize; i = flash.checkInt(i + aDiameter))
								{
									aPoint = aList[i];
									if(<any>!aPoint.mInTunnel)
									{
										dx = aPoint.x - x;
										dy = aPoint.y - y;
										if(dx * dx + dy * dy < checkDist)
										{
											theBullet.SetCurCurvePoint(this.mCurveNum,i);
											aGapSize = flash.checkInt(0);
											aGapBallId = flash.checkInt(0);
											anItr = this.mBallList["getListIterator"]();
											anItr["start"]();
											while(anItr["valid"]())
											{
												aBall = anItr["data"];
												if(aBall.GetWayPoint() > i)
												{
													aPrevBall = aBall.GetPrevBall();
													if(aPrevBall != null)
													{
														if(aBall.GetIsExploding())
														{
															it2 = new DListIterator(this.mBallList,anItr["node"]);
															it2["forth"]();
															valid = false;
															while(it2["valid"]())
															{
																b = it2["data"];
																if(<any>!b.GetIsExploding())
																{
																	valid = true;
																	break;
																}
																it2["forth"]();
															}
															if(<any>!valid)
															{
																break;
															}
														}
														aGapSize = flash.checkInt(aBall.GetWayPoint() - aPrevBall.GetWayPoint());
														aGapBallId = flash.checkInt(aBall.GetId());
													}
													break;
												}
												anItr["forth"]();
											}
											if(aGapSize > 0)
											{
												return theBullet.AddGapInfo(this.mCurveNum,aGapSize,aGapBallId);
											}
											return false;
										}
									}
								}
								return false;
							}

							public HasPowerup(p:number):boolean
							{
								p = flash.checkInt(p);
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var it:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								it["start"]();
								while(it["valid"]())
								{
									b = it["data"];
									if(b.GetPowerOrDestType() == p)
									{
										return true;
									}
									it["forth"]();
								}
								return false;
							}

							public UpdateForwardSuckingBalls()
							{
								var aFirstBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aSuckCount:number = flash.checkInt(0);
								var aMoveAmount:number = <any>NaN;
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var anEndBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aBullet:com.popcap.flash.games.zuma2.logic.Bullet = <any>null;
								var aPushBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var collide:boolean = <any>false;
								var aMaxWayPoint:number = <any>NaN;
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["end"]();
								while(true)
								{
									aFirstBall = aBallItr["data"];
									aSuckCount = flash.checkInt(aFirstBall.GetSuckCount());
									aMoveAmount = (aSuckCount >> 3) * this.mSpeedScale;
									if(aFirstBall.GetSuckCount() > 0)
									{
										while(true)
										{
											aBall = aBallItr["data"];
											aBall.SetSuckCount(0,false);
											this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() + aMoveAmount,this.mLevel.mLoopAtEnd);
											aBullet = aBall.GetBullet();
											if(aBullet != null && <any>!aBullet.mDoNewMerge)
											{
												aPushBall = aBullet.GetPushBall();
												if(aPushBall != null)
												{
													this.mWayPointMgr.FindFreeWayPoint(aPushBall,aBullet,false,this.mLevel.mLoopAtEnd);
												}
												aBullet.UpdateHitPos();
											}
											if(<any>!aBall.GetCollidesWithPrev())
											{
												break;
											}
											if(aBallItr["node"] == this.mBallList["head"])
											{
												break;
											}
											aBallItr["back"]();
										}
										anEndBall = aBall;
										aFirstBall.SetSuckCount(aSuckCount + 1,false);
										aNextBall = aFirstBall.GetNextBall();
										if(aNextBall != null)
										{
											collide = false;
											aMaxWayPoint = aFirstBall.GetWayPoint() + aFirstBall.GetRadius() + aNextBall.GetRadius();
											if(aNextBall.GetWayPoint() < aMaxWayPoint)
											{
												this.mWayPointMgr.SetWayPoint(aNextBall,aMaxWayPoint,this.mLevel.mLoopAtEnd);
												collide = true;
											}
											if(collide)
											{
												this.mBoard["PlayBallClick"](Zuma2Sounds.SOUND_BALL_CLICK1);
												aNextBall.SetCollidesWithPrev(true);
												aFirstBall.SetSuckCount(0,true);
												if(<any>!this.CheckSet(aFirstBall))
												{
													aFirstBall.SetComboCount(0,0);
												}
												this.ClearPendingSucks(anEndBall);
											}
										}
										else
										{
											aFirstBall.SetSuckCount(0,true);
										}
										continue;
									}
									if(aBallItr["node"] != this.mBallList["head"])
									{
										aBallItr["back"]();
										continue;
									}
									break;
								}
							}

							public ZumaAchieved(stop:boolean)
							{
								var anItr:de.polygonal.ds.DListIterator = <any>null;
								if(this.mStopAddingBalls == stop)
								{
									return ;
								}
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_LEVEL_ZUMA);
								this.mBackwardCount = flash.checkInt(this.mCurveDesc.mVals.mZumaBack);
								if(<any>!this.mBoard["GauntletMode"]())
								{
									this.mSlowCount = flash.checkInt(this.mCurveDesc.mVals.mZumaSlow);
								}
								if(<any>!this.mBoard["GauntletMode"]())
								{
									this.mStopAddingBalls = stop;
									this.mPostZumaFlashTimer = flash.checkInt(50);
									if(stop)
									{
										anItr = this.mPendingBalls["getListIterator"]();
										anItr["start"]();
										while(anItr["valid"]())
										{
											anItr["data"].Delete();
											anItr["forth"]();
										}
										this.mPendingBalls["clear"]();
									}
								}
								else
								{
									this.mHasReachedCruisingSpeed = false;
									this.mHasReachedRolloutPoint = false;
									this.mCanCheckForSpeedup = false;
								}
							}

							public GetCurveLength():number
							{
								return this.mWayPointMgr.mWayPoints.length;
							}

							public GetBoardStateCount():number
							{
								return <any>!<any>!this.mBoard?flash.tranint(this.mBoard["GetStateCount"]()):0;
							}

							public IsLosing():boolean
							{
								if(this.mHaveSets || this.mBallList["isEmpty"]() || this.mLevel.mLoopAtEnd || this.mBallList["tail"].data.GetWayPoint() < this.mWayPointMgr.GetEndPoint() || <any>!this.mBulletList["isEmpty"]() || this.mBackwardCount > 0)
								{
									return false;
								}
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>this.mBallList["tail"].data;
								while(aBall != null)
								{
									if(aBall.GetSuckCount() > 0)
									{
										return false;
									}
									aBall = aBall.GetPrevBall(true);
								}
								return true;
							}

							public DeleteBullet(theBullet:com.popcap.flash.games.zuma2.logic.Bullet)
							{
								if(theBullet == null)
								{
									return ;
								}
								var aBulletItr:de.polygonal.ds.DListIterator = <any>this.mBulletList["nodeOf"](theBullet);
								if(aBulletItr["valid"]())
								{
									this.mBulletList["remove"](aBulletItr);
								}
								theBullet.Delete();
							}

							public ActivatePower(theBall:com.popcap.flash.games.zuma2.logic.Ball)
							{
								var aPower:number = flash.checkInt(theBall.GetPowerOrDestType());
								this.mApp["gGotPowerUp"][aPower] = true;
								if(aPower == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_ProximityBomb)
								{
									this.ActivateProximityBomb(theBall);
								}
								else if(aPower == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_MoveBackwards)
								{
									this.DoBackwards();
								}
								else if(aPower == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_SlowDown)
								{
									this.DoSlowdown();
								}
							}

							public AtRest():boolean
							{
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(this.mBallList["size"] == 0)
								{
									return true;
								}
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									b = aBallItr["data"];
									if(b.GetIsExploding() || b.GetSuckCount() > 0 || b.GetBullet() != null)
									{
										return false;
									}
									aBallItr["forth"]();
								}
								return true;
							}

							public AddPowerUp(thePower:number):com.popcap.flash.games.zuma2.logic.Ball
							{
								thePower = flash.checkInt(thePower);
								var i:number = flash.checkInt(0);
								var available_balls:Array<com.popcap.flash.games.zuma2.logic.Ball> = <any>null;
								var valid_indices:Array<number> = <any>null;
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var idx:number = flash.checkInt(0);
								var color_type:number = flash.checkInt(0);
								var it:de.polygonal.ds.DListIterator = <any>null;
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var pr:com.popcap.flash.games.zuma2.logic.PowerupRegion = <any>null;
								var min_wp:number = <any>NaN;
								var max_wp:number = <any>NaN;
								var region_b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								if(<any>!this.mApp["mLevelMgr"].mUniquePowerupColor && thePower != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall)
								{
									return null;
								}
								available_balls = new Array<com.popcap.flash.games.zuma2.logic.Ball>();
								valid_indices = new Array<number>();
								for(i = flash.checkInt(0); i < this.mCurveDesc.mVals.mNumColors; i++)
								{
									if(this.mBallColorHasPowerup[i] == 0 || thePower == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall)
									{
										valid_indices.push(i);
									}
								}
								b = null;
								while(valid_indices.length > 0 && b == null)
								{
									idx = flash.checkInt(Math.random() * valid_indices.length);
									color_type = flash.checkInt(valid_indices[idx]);
									it = this.mBallList["getListIterator"]();
									it["start"]();
									while(it["valid"]())
									{
										aBall = it["data"];
										if(aBall.GetPowerType() == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None && aBall.GetDestPowerType() == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_None && aBall.GetColorType() == color_type && <any>!aBall.GetIsExploding())
										{
											if(thePower != com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall || thePower == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall && <any>!this.mWayPointMgr.InTunnel2(aBall,true) && <any>!this.mWayPointMgr.InTunnel2(aBall,false) && aBall.GetWayPoint() / this.mWayPointMgr.GetEndPoint() >= this.mApp["mLevelMgr"].mMinMultBallDistance)
											{
												available_balls.push(aBall);
											}
											else if(thePower == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_GauntletMultBall)
												{}
										}
										it["forth"]();
									}
									if(this.mLevel.mPowerupRegions.length > 0)
									{
										for(i = flash.checkInt(0); i < this.mLevel.mPowerupRegions.length; i++)
										{
											pr = this.mLevel.mPowerupRegions[i];
											if(pr.mCurveNum == this.mCurveNum && flash.tranint(Math.random() * pr.mChance) == 0)
											{
												min_wp = pr.mCurvePctStart * this.mWayPointMgr.GetNumPoints();
												max_wp = pr.mCurvePctEnd * this.mWayPointMgr.GetNumPoints();
												for(idx = flash.checkInt(0); idx < available_balls.length; idx++)
												{
													region_b = available_balls[idx];
													if(region_b.GetWayPoint() >= min_wp && region_b.GetWayPoint() <= max_wp)
													{
														b = region_b;
														break;
													}
												}
												break;
											}
										}
									}
									if(available_balls.length == 0)
									{
										valid_indices.splice(idx,1);
									}
									else if(b == null)
									{
										b = available_balls[flash.tranint(Math.random() * available_balls.length)];
									}
								}
								if(b != null)
								{
									b.SetPowerType(thePower);
								}
								return b;
							}

							public UpdateLosing()
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aSuckCount:number = flash.checkInt(0);
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								var anEndPoint:number = flash.checkInt(this.mWayPointMgr.GetEndPoint());
								while(aBallItr["valid"]())
								{
									aBall = aBallItr["data"];
									if(aBall.GetWayPoint() >= anEndPoint)
									{
										aSuckCount = flash.checkInt(aBall.GetSuckCount());
										if(aSuckCount < 0)
										{
											aBall.SetSuckCount(aSuckCount + 1);
										}
										else
										{
											aBall.Delete();
											this.mBallList["remove"](aBallItr);
											aBallItr["forth"]();
											continue;
										}
									}
									else
									{
										this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() + (aBall.GetSuckCount() >> 2),this.mLevel.mLoopAtEnd);
										aBall.SetSuckCount(aBall.GetSuckCount() + 1);
										if(aBall.GetWayPoint() >= anEndPoint)
										{
											aBall.SetSuckCount(0);
										}
									}
									aBallItr["forth"]();
								}
								if(<any>!this.mBallList["isEmpty"]())
								{
									this.SetFarthestBall(this.mBallList["tail"].data.GetWayPoint());
								}
							}

							public DoScoring(theBall:com.popcap.flash.games.zuma2.logic.Ball,theNumBalls:number,theComboCount:number,theGapBonus:number,theNumGaps:number)
							{
								theNumBalls = flash.checkInt(theNumBalls);
								theComboCount = flash.checkInt(theComboCount);
								theGapBonus = flash.checkInt(theGapBonus);
								theNumGaps = flash.checkInt(theNumGaps);
								var p:number = flash.checkInt(0);
								var soundString:string = <any>null;
								if(theNumBalls == 0)
								{
									return ;
								}
								var max_bulge:number = <any>1.5;
								var bulge:number = <any>1;
								var aNumPoints:number = flash.checkInt(theNumBalls * 10 + theGapBonus + theComboCount * 100);
								var inARow:boolean = <any>false;
								var aChainBonusStart:number = flash.checkInt(<any>!<any>!this.mApp["gSuckMode"]?10:4);
								var aRowBonus:number = flash.checkInt(0);
								if(this.mBoard["GetNumClearsInARow"]() > aChainBonusStart && theComboCount == 0)
								{
									inARow = true;
									aRowBonus = flash.checkInt((<any>!<any>!this.mApp["gSuckMode"]?10:100) + 10 * (this.mBoard["GetNumClearsInARow"]() - (aChainBonusStart + 1)));
									aNumPoints = flash.checkInt(aNumPoints + aRowBonus);
									if(this.mLevel.AllowPointsFromBalls())
									{
										this.mBoard["IncCurInARowBonus"](aRowBonus);
									}
								}
								if(this.mLevel.AllowPointsFromBalls())
								{
									this.mBoard["IncCurComboScore"](aNumPoints);
									this.mBoard["IncScore"](aNumPoints,true);
									if(theComboCount > 0)
									{
										this.mBoard["mLevelStats"].mNumCombos++;
									}
									if(theGapBonus > 0)
									{
										this.mBoard["mLevelStats"].mNumGaps++;
									}
								}
								var scoreString:any = <any>"";
								if(this.mLevel.AllowPointsFromBalls())
								{
									scoreString = "+" + aNumPoints;
								}
								if(theComboCount > 0)
								{
									if(this.mLevel.AllowPointsFromBalls())
									{
										max_bulge = 1.5;
										bulge = 1 + (max_bulge - 1) / 10 * (theComboCount + 1);
										if(bulge < 1)
										{
											bulge = 1;
										}
										scoreString = scoreString + ("\rCOMBO x" + (theComboCount + 1));
									}
								}
								if(theGapBonus > 0)
								{
									if(this.mLevel.AllowPointsFromBalls())
									{
										if(theNumGaps > 1)
										{
											if(theNumGaps > 3)
											{
												scoreString = scoreString + "\rQUAD GAP BONUS!!!!";
											}
											else if(theNumGaps > 2)
											{
												scoreString = scoreString + "\rTRIPLE GAP BONUS!!!";
											}
											else
											{
												scoreString = scoreString + "\rDOUBLE GAP BONUS!!";
											}
										}
										else
										{
											scoreString = scoreString + "\rGAP BONUS!";
										}
									}
									this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_GAPBONUS1);
								}
								if(inARow && this.mLevel.AllowPointsFromBalls())
								{
									max_bulge = 1.5;
									bulge = 1 + (max_bulge - 1) / 10 * (this.mBoard["GetNumClearsInARow"]() + 1 - aChainBonusStart);
									if(bulge < 1)
									{
										bulge = 1;
									}
									if(bulge > 1.5)
									{
										bulge = 1.5;
									}
									if(this.mChainFromSuck)
									{
										scoreString = scoreString + ("\rCHAIN BONUS x" + this.mBoard["GetNumClearsInARow"]());
										this.mChainFromSuck = false;
									}
									else
									{
										scoreString = scoreString + ("\rCHAIN BONUS x" + (this.mBoard["GetNumClearsInARow"]() + 1));
									}
									p = flash.checkInt(this.mBoard["GetNumClearsInARow"]() - 5);
									if(p > 10)
									{
										p = flash.checkInt(10);
									}
									soundString = "SOUND_CHAIN" + p;
									this.mApp["soundManager"].playSound(soundString);
								}
								this.mBoard["AddText"](scoreString,theBall.GetX(),theBall.GetY(),theBall.GetColorType(),bulge);
							}

							public ClearPendingSucks(theEndBall:com.popcap.flash.games.zuma2.logic.Ball)
							{
								var aBallItr:com.popcap.flash.games.zuma2.logic.Ball = theEndBall;
								var firstChain:boolean = <any>true;
								while(aBallItr != null)
								{
									if(aBallItr.GetSuckPending())
									{
										aBallItr.SetSuckPending(false);
										this.mBoard["ResetInARowBonus"]();
										aBallItr.SetGapBonus(0,0);
									}
									aBallItr = aBallItr.GetPrevBall();
									if(aBallItr == null)
									{
										break;
									}
									if(<any>!aBallItr.GetCollidesWithNext())
									{
										firstChain = false;
									}
									if(<any>!firstChain && aBallItr.GetSuckCount())
									{
										break;
									}
								}
							}

							public UpdateSets()
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var exploding:boolean = <any>false;
								var aNextBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								this.mHaveSets = false;
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["start"]();
								while(aBallItr["valid"]())
								{
									aBall = aBallItr["data"];
									exploding = aBall.GetIsExploding();
									if(exploding)
									{
										this.mHaveSets = true;
									}
									if(aBall.GetShouldRemove())
									{
										aNextBall = aBall.GetNextBall();
										aPrevBall = aBall.GetPrevBall();
										if(aNextBall != null && <any>!aNextBall.GetIsExploding())
										{
											if(aPrevBall != null && <any>!aPrevBall.GetShouldRemove() && aNextBall.GetColorType() == aPrevBall.GetColorType())
											{
												aNextBall.SetSuckCount(10);
												aNextBall.SetComboCount(aBall.GetComboCount() + 1,aBall.GetComboScore());
											}
										}
										if(aBallItr["node"] == this.mBallList["head"])
										{
											if(<any>!this.mDoingClearCurveRollout)
											{
												this.mAdvanceSpeed = 0;
											}
											if(this.mStopTime < 40)
											{
												this.mStopTime = flash.checkInt(40);
											}
										}
										this.DeleteBall(aBall);
										this.mBallList["remove"](aBallItr);
									}
									else
									{
										if(exploding)
										{
											aBall.UpdateExplosion();
										}
										else
										{
											this.mBoard["mBallColorMap"][aBall.GetColorType()]++;
										}
										aBallItr["forth"]();
									}
								}
							}

							public SetFarthestBall(thePoint:number)
							{
								thePoint = flash.checkInt(thePoint);
								if(this.mBoard["GetGameState"]() == GameBoardWidget.GameState_Losing)
								{
									return ;
								}
								var aLastPoint:number = flash.checkInt(this.mDangerPoint);
								if(aLastPoint < 0)
								{
									aLastPoint = flash.checkInt(0);
								}
								var aPercentOpen:number = <any>0;
								if(thePoint >= aLastPoint)
								{
									aPercentOpen = flash.trannumber(thePoint - aLastPoint) / (this.mWayPointMgr.GetNumPoints() - aLastPoint);
								}
								this.mLevel.mHoleMgr.SetPctOpen(this.mCurveNum,aPercentOpen);
							}

							public IsWinning():boolean
							{
								var is_empty:boolean = this.mBallList["isEmpty"]() && this.mPendingBalls["isEmpty"]();
								if(is_empty)
								{
									return true;
								}
								return false;
							}

							public UpdateBalls()
							{
								var b:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var itr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								var i:number = flash.checkInt(0);
								itr["start"]();
								while(itr["valid"]())
								{
									i++;
									b = itr["data"];
									b.Update();
									itr["forth"]();
								}
								itr = this.mBulletList["getListIterator"]();
								itr["start"]();
								while(itr["valid"]())
								{
									itr["data"].Update();
									itr["forth"]();
								}
							}

							public DoSlowdown()
							{
								if(this.mSlowCount < 1000)
								{
									this.mSlowCount = flash.checkInt(800);
								}
							}

							public AddPendingBall()
							{
								var aNewColor:number = flash.checkInt(0);
								var aPrevColor:number = flash.checkInt(0);
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = new com.popcap.flash.games.zuma2.logic.Ball(this.mApp);
								var aNumColors:number = flash.checkInt(this.mCurveDesc.mVals.mNumColors);
								if(<any>!this.mPendingBalls["isEmpty"]())
								{
									aPrevColor = flash.checkInt(this.mPendingBalls["tail"].data.GetColorType());
								}
								else if(<any>!this.mBallList["isEmpty"]())
								{
									aPrevColor = flash.checkInt(this.mBallList["head"].data.GetColorType());
								}
								else
								{
									aPrevColor = flash.checkInt(this.mLevel.GetRandomPendingBallColor(aNumColors));
								}
								if(aPrevColor >= aNumColors)
								{
									aPrevColor = flash.checkInt(this.mLevel.GetRandomPendingBallColor(aNumColors));
								}
								var num_matches:number = flash.checkInt(this.GetNumPendingMatches());
								var start:number = flash.checkInt(33);
								var start_w:number = flash.checkInt(4);
								var aMaxSingle:number = flash.checkInt(this.mCurveDesc.mVals.mMaxSingle);
								if(this.mApp["mRand"].Next() * 100 <= this.mCurveDesc.mVals.mBallRepeat && num_matches < this.mCurveDesc.mVals.mMaxClumpSize)
								{
									aNewColor = flash.checkInt(aPrevColor);
								}
								else if(aMaxSingle < 10 && this.GetNumPendingSingles(1) == 1 && (aMaxSingle == 0 || this.GetNumPendingSingles(10) > aMaxSingle))
								{
									aNewColor = flash.checkInt(aPrevColor);
								}
								else
								{
									do
									{
										aNewColor = flash.checkInt(this.mLevel.GetRandomPendingBallColor(aNumColors));
									}
									while(aNewColor == aPrevColor)
								}
								aBall.SetColorType(aNewColor);
								aNewColor = flash.checkInt(aBall.GetColorType());
								this.mPendingBalls["append"](aBall);
								this.mNumBallsCreated++;
								if(this.mCurveDesc.mVals.mNumBalls > 0 && this.mNumBallsCreated >= this.mCurveDesc.mVals.mNumBalls)
								{
									this.mStopAddingBalls = true;
								}
							}

							public AdvanceBackwardBalls()
							{
								var aBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aBackwardsCount:number = flash.checkInt(0);
								var aPrevBall:com.popcap.flash.games.zuma2.logic.Ball = <any>null;
								var aMaxWayPoint:number = <any>NaN;
								this.mFirstBallMovedBackwards = false;
								if(this.mBallList["isEmpty"]())
								{
									return ;
								}
								var aBallItr:de.polygonal.ds.DListIterator = <any>this.mBallList["getListIterator"]();
								aBallItr["end"]();
								var ballMoved:boolean = <any>false;
								var aDiff:number = <any>0;
								if(this.mBackwardCount)
								{
									this.mBallList["tail"].data.SetBackwardsSpeed(1 * this.mSpeedScale);
									this.mBallList["tail"].data.SetBackwardsCount(1);
								}
								while(true)
								{
									aBall = aBallItr["data"];
									aBackwardsCount = flash.checkInt(aBall.GetBackwardsCount());
									if(aBackwardsCount > 0)
									{
										aDiff = aBall.GetBackwardsSpeed();
										this.mWayPointMgr.SetWayPoint(aBall,aBall.GetWayPoint() - aDiff,this.mLevel.mLoopAtEnd);
										aBall.SetBackwardsCount(aBackwardsCount - 1);
										ballMoved = true;
									}
									if(aBallItr["node"] == this.mBallList["head"])
									{
										break;
									}
									aBallItr["back"]();
									aPrevBall = aBallItr["data"];
									if(ballMoved)
									{
										if(aPrevBall.GetCollidesWithNext())
										{
											this.mWayPointMgr.SetWayPoint(aPrevBall,aPrevBall.GetWayPoint() - aDiff,this.mLevel.mLoopAtEnd);
										}
										else
										{
											aMaxWayPoint = aBall.GetWayPoint() - aBall.GetRadius() - aPrevBall.GetRadius();
											if(aPrevBall.GetWayPoint() > aMaxWayPoint)
											{
												ballMoved = true;
												if(<any>!aPrevBall.GetCollidesWithNext())
												{
													aPrevBall.SetCollidesWithNext(true);
													this.mBoard["PlayBallClick"](Zuma2Sounds.SOUND_BALL_CLICK1);
												}
												aDiff = aPrevBall.GetWayPoint() - aMaxWayPoint;
												aPrevBall.SetWayPoint(aMaxWayPoint,this.mWayPointMgr.InTunnel(aMaxWayPoint));
											}
											else
											{
												ballMoved = false;
											}
										}
									}
								}
								if(ballMoved)
								{
									this.mFirstBallMovedBackwards = true;
									if(this.mStopTime < 20)
									{
										this.mStopTime = flash.checkInt(20);
									}
								}
							}

							public HasReachedRolloutPoint():boolean
							{
								return this.mHasReachedRolloutPoint;
							}

							public UpdatePowerUps()
							{
								var i:number = flash.checkInt(0);
								var num_nonzero:number = flash.checkInt(0);
								var total:number = flash.checkInt(0);
								var rand_val:number = flash.checkInt(0);
								var num:number = flash.checkInt(0);
								var freq:number = flash.checkInt(0);
								var old_spawn_frame:number = flash.checkInt(0);
								var allow_dupes:boolean = <any>false;
								var cooldown_amt:number = flash.checkInt(0);
								if(this.mBallList["isEmpty"]() || this.mBoard["mPreventBallAdvancement"])
								{
									return ;
								}
								var aStateCount:number = flash.checkInt(this.mBoard["GetStateCount"]());
								if(aStateCount < this.mApp["mLevelMgr"].mPowerDelay)
								{
									return ;
								}
								var psd:number = flash.checkInt(this.mApp["mLevelMgr"].mPowerupSpawnDelay);
								if(psd > 0 && aStateCount - this.mLastPowerupTime < psd)
								{
									return ;
								}
								var chance:number = flash.checkInt(this.mCurveDesc.mVals.mPowerUpChance);
								if(chance == 0)
								{
									return ;
								}
								chance = flash.checkInt(chance - chance * this.mLevel.GetPowerIncPct());
								if(chance <= 0)
								{
									chance = flash.checkInt(1);
								}
								if(this.mApp["mLevelMgr"].mUniquePowerupColor)
								{
									num_nonzero = flash.checkInt(0);
									for(i = flash.checkInt(0); i < this.mCurveDesc.mVals.mNumColors; i++)
									{
										if(this.mBallColorHasPowerup[i] > 0)
										{
											num_nonzero++;
										}
									}
									if(num_nonzero == this.mCurveDesc.mVals.mNumColors)
									{
										return ;
									}
								}
								if(flash.tranint(Math.random() * chance) == 0)
								{
									total = flash.checkInt(0);
									for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Max; i++)
									{
										if(this.CanSpawnPowerUp(i))
										{
											total = flash.checkInt(total + this.mCurveDesc.mVals.mPowerUpFreq[i]);
										}
									}
									if(total == 0)
									{
										return ;
									}
									rand_val = flash.checkInt(Math.random() * total);
									num = flash.checkInt(0);
									for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Max; i++)
									{
										if(this.CanSpawnPowerUp(i))
										{
											freq = flash.checkInt(this.mCurveDesc.mVals.mPowerUpFreq[i]);
											if(rand_val < num + freq)
											{
												old_spawn_frame = flash.checkInt(this.mLastSpawnedPowerUpFrame[i]);
												allow_dupes = false;
												cooldown_amt = flash.checkInt(this.mApp["mLevelMgr"].mPowerCooldown);
												if(aStateCount - old_spawn_frame < cooldown_amt)
												{
													return ;
												}
												if(aStateCount - this.mLastCompletedPowerUpFrame[i] < cooldown_amt && this.mLastCompletedPowerUpFrame[i] > 0)
												{
													return ;
												}
												this.AddPowerUp(i);
												this.mLastPowerupTime = flash.checkInt(aStateCount);
												this.mLastSpawnedPowerUpFrame[i] = aStateCount;
												this.mNumPowerUpsThisLevel[i]++;
												break;
											}
											num = flash.checkInt(num + freq);
										}
									}
								}
							}

							public GetDistanceToDeath():number
							{
								if(<any>!this.mInDanger || this.mBallList["isEmpty"]())
								{
									return -1;
								}
								var d:number = flash.checkInt(this.mWayPointMgr.GetNumPoints() - this.mBallList["tail"].data.GetWayPoint());
								if(d < 0)
								{
									d = flash.checkInt(0);
								}
								return d;
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.CurveMgr.MAX_GAP_SIZE = 300;
com.popcap.flash.games.zuma2.logic.CurveMgr.PROXIMITY_BOMB_RADIUS = 56;
