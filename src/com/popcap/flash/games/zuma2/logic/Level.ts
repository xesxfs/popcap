module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Level extends egret.HashObject {
							public mMoveSpeed:number = 25;
							public mHoleMgr:com.popcap.flash.games.zuma2.logic.HoleMgr;
							public mTunnelImages:Array<string>;
							public mHaveReachedTarget:boolean = false;
							public mDrawCurves:boolean = false;
							public mUpdateCount:number = 0;
							public mPotPct:number = NaN;
							public mLilyPadSprite:egret.Sprite;
							public mOffscreenClearBonus:boolean = false;
							public mCurveMgr:Array<any>;
							public mMoveType:string;
							public mTreasurePoints:Array<com.popcap.flash.games.zuma2.logic.TreasurePoint>;
							public mPowerupRegions:Array<com.popcap.flash.games.zuma2.logic.PowerupRegion>;
							public mTimeToComplete:number = 0;
							public mNumFrogPoints:number = 0;
							public mId:string;
							public mHasReachedCruisingSpeed:boolean = false;
							public mHurryToRolloutAmt:number = NaN;
							public mApp:Zuma2App;
							public mTargetBarSize:number = 0;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mIsEndless:boolean = false;
							public mTunnelData:Array<any>;
							public mLoopAtEnd:boolean = false;
							public mPostZumaTimeSpeedInc:number = NaN;
							public mLilyPadBitmap:flash.Bitmap;
							public mPostZumaTimeSlowInc:number = NaN;
							public mNumCurves:number = 0;
							public mBackgroundImage:string;
							public mCurBarSize:number = 0;
							public mFurthestBallDistance:number = 0;
							public mFrog:com.popcap.flash.games.zuma2.logic.Gun;
							public mDisplayName:string;
							public mTempSpeedupTimer:number = 0;
							public mFrogX:Array<any>;
							public mFrogY:Array<any>;
							public mAllCurvesAtRolloutPoint:boolean = false;
							public mFireSpeed:number = 0;
							public mTreasureFreq:number = 0;
							public mTimer:number = 0;
							public mNum:number = 0;
							public mSkullOverride:Array<number>;
							public mParTime:number = 0;
							public mLilyPadUpBitmap1:flash.Bitmap;
							public mLilyPadUpBitmap2:flash.Bitmap;
							public mCurFrogPoint:number = 0;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mFrogX = new Array();
								this.mFrogY = new Array();
								this.mTreasurePoints = new Array<com.popcap.flash.games.zuma2.logic.TreasurePoint>();
								this.mTunnelData = new Array();
								this.mTunnelImages = new Array<string>();
								this.mSkullOverride = new Array<number>();
								this.mPowerupRegions = new Array<com.popcap.flash.games.zuma2.logic.PowerupRegion>();
								this.mApp = app;
								this.mCurveMgr = new Array();
								this.mTimer = flash.checkInt(this.mTimeToComplete = flash.checkInt(-1));
								this.mPotPct = 1;
								this.mNumFrogPoints = flash.checkInt(0);
								this.mCurFrogPoint = flash.checkInt(0);
								this.mFireSpeed = flash.checkInt(8);
								for(var i:number = flash.checkInt(0);i < 4; i++)
								{
									this.mSkullOverride[i] = 0;
								}
								this.Reset();
							}

							public ReInit()
							{
								var i:number = flash.checkInt(0);
								for(i = flash.checkInt(0); i < this.mNumCurves; i++)
								{
									this.mCurveMgr[i].SetFarthestBall(0);
								}
								this.mHaveReachedTarget = false;
								this.mAllCurvesAtRolloutPoint = false;
								this.mHasReachedCruisingSpeed = false;
								this.mPotPct = 1;
								this.mFurthestBallDistance = flash.checkInt(0);
								this.Reset();
								for(i = flash.checkInt(0); i < this.mNumCurves; i++)
								{
									this.mCurveMgr[i].Reset();
								}
							}

							public UpdatePlaying()
							{
								var i:number = flash.checkInt(0);
								var pct:number = flash.checkInt(0);
								var tspeed:boolean = this.mHasReachedCruisingSpeed;
								var was_at_rollout:boolean = this.mAllCurvesAtRolloutPoint;
								this.mHasReachedCruisingSpeed = true;
								this.mAllCurvesAtRolloutPoint = true;
								var any_have_sparkles:boolean = <any>false;
								for(i = flash.checkInt(0); i < this.mNumCurves; i++)
								{
									if(this.mCurveMgr[i].UpdatePlaying() && i + 1 < this.mNumCurves)
									{
										this.mCurveMgr[i + 1].mInitialPathHilite = true;
									}
									if(this.mCurveMgr[i].mSparkles.length > 0)
									{
										any_have_sparkles = true;
									}
									if(<any>!this.mCurveMgr[i].HasReachedCruisingSpeed())
									{
										this.mHasReachedCruisingSpeed = false;
									}
									if(<any>!this.mCurveMgr[i].HasReachedRolloutPoint())
									{
										this.mAllCurvesAtRolloutPoint = false;
									}
									if(this.mTempSpeedupTimer == 1)
									{
										this.mCurveMgr[i].mOverrideSpeed = -1;
									}
									pct = flash.checkInt(this.mCurveMgr[i].GetFarthestBallPercent());
									if(pct > this.mFurthestBallDistance)
									{
										this.mFurthestBallDistance = flash.checkInt(pct);
									}
								}
								if(<any>!this.mApp["gAddBalls"] && <any>!any_have_sparkles && <any>!this.mBoard["mPreventBallAdvancement"])
								{
									this.mApp["gAddBalls"] = true;
									for(i = flash.checkInt(0); i < this.mNumCurves; i++)
									{
										this.mCurveMgr[i].mInitialPathHilite = false;
									}
								}
							}

							public SetFrog(frog:com.popcap.flash.games.zuma2.logic.Gun)
							{
								this.mFrog = frog;
							}

							public BulletHit(b:com.popcap.flash.games.zuma2.logic.Bullet)
							{
							}

							public CanFireBall():boolean
							{
								var count:number = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++,count++)
								{
									if(<any>!this.mCurveMgr[i].IsWinning())
									{
										break;
									}
								}
								if(count == this.mNumCurves)
								{
									return false;
								}
								return true;
							}

							public Reset()
							{
								this.mHaveReachedTarget = false;
								this.mAllCurvesAtRolloutPoint = false;
								this.mHasReachedCruisingSpeed = false;
								this.mCurFrogPoint = flash.checkInt(0);
								this.mFurthestBallDistance = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									this.mCurveMgr[i].Reset();
								}
							}

							public DrawGunPoints()
							{
								if(this.mNumFrogPoints > 1)
								{
									if(this.mLilyPadBitmap == null || this.mLilyPadSprite == null || this.mLilyPadUpBitmap1 == null || this.mLilyPadUpBitmap2 == null)
									{
										this.mLilyPadUpBitmap1 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP));
										this.mLilyPadUpBitmap2 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP));
										this.mLilyPadUpBitmap1.x = this.mFrogX[0] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap1.width / 2;
										this.mLilyPadUpBitmap1.y = this.mFrogY[0] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap1.height / 2;
										this.mLilyPadUpBitmap2.x = this.mFrogX[1] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap2.width / 2;
										this.mLilyPadUpBitmap2.y = this.mFrogY[1] * Zuma2App.SHRINK_PERCENT - this.mLilyPadUpBitmap2.height / 2;
										this.mApp["mLayers"][0].mBackground.addChild(this.mLilyPadUpBitmap2);
										this.mApp["mLayers"][0].mBackground.addChild(this.mLilyPadUpBitmap1);
										this.mLilyPadBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER));
										this.mLilyPadBitmap.x = -this.mLilyPadBitmap.width / 2;
										this.mLilyPadBitmap.y = -this.mLilyPadBitmap.height / 2;
										this.mLilyPadSprite = new egret.Sprite();
										this.mLilyPadSprite.addChild(this.mLilyPadBitmap);
										this.mApp["mLayers"][2].mBackground.addChild(this.mLilyPadSprite);
									}
									if(this.mLilyPadUpBitmap1 != null && this.mLilyPadUpBitmap1.stage == null)
									{
										this.mApp["mLayers"][0].mBackground.addChild(this.mLilyPadUpBitmap1);
									}
									if(this.mLilyPadUpBitmap2 != null && this.mLilyPadUpBitmap2.stage == null)
									{
										this.mApp["mLayers"][0].mBackground.addChild(this.mLilyPadUpBitmap2);
									}
									if(this.mBoard["mMouseOverGunPos"] == -1)
									{
										this.mLilyPadSprite.visible = false;
									}
									else
									{
										this.mApp["mLayers"][2].mBackground.addChild(this.mLilyPadSprite);
										this.mLilyPadSprite.x = this.mFrogX[this.mBoard["mMouseOverGunPos"]] * Zuma2App.SHRINK_PERCENT;
										this.mLilyPadSprite.y = this.mFrogY[this.mBoard["mMouseOverGunPos"]] * Zuma2App.SHRINK_PERCENT;
										this.mLilyPadSprite.visible = true;
									}
								}
							}

							public SkipInitialPathHilite()
							{
								var j:number = flash.checkInt(0);
								var had_any:boolean = <any>false;
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									if(this.mCurveMgr[i].mSparkles.length > 0 || this.mCurveMgr[i].mInitialPathHilite)
									{
										had_any = true;
										for(j = flash.checkInt(0); j < this.mCurveMgr[i].mSparkles.length; j++)
										{
											this.mCurveMgr[i].mSparkles[j].Delete();
										}
										this.mCurveMgr[i].mSparkles = new Array<com.popcap.flash.games.zuma2.logic.PathSparkle>();
										this.mCurveMgr[i].mInitialPathHilite = false;
									}
								}
								if(had_any)
								{
									this.mApp["gAddBalls"] = true;
									this.mApp["soundManager"].stopAll();
								}
							}

							public CurvesAtRest():boolean
							{
								if(this.mBoard["HasFiredBullets"]() || this.mBoard["GetGun"]().IsFiring())
								{
									return false;
								}
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									if(<any>!this.mCurveMgr[i].AtRest())
									{
										return false;
									}
								}
								return true;
							}

							public CheckFruitActivation(curve_num:number):boolean
							{
								curve_num = flash.checkInt(curve_num);
								var cstart:number = flash.checkInt(0);
								var cend:number = flash.checkInt(0);
								var ball_pct:number = flash.checkInt(0);
								var i:number = flash.checkInt(0);
								var tp:com.popcap.flash.games.zuma2.logic.TreasurePoint = <any>null;
								if(this.mBoard["mPreventBallAdvancement"] || this.mBoard["HasAchievedZuma"]())
								{
									return false;
								}
								var freq:number = flash.checkInt(this.mTreasureFreq);
								if(<any>!this.mApp["gForceFruit"])
								{
									if(this.mBoard["mCurTreasure"] != null || flash.tranint(Math.random() * freq) != 0)
									{
										return false;
									}
								}
								var treasure_pts:Array<number> = new Array<number>();
								if(curve_num == -1)
								{
									cstart = flash.checkInt(0);
									cend = flash.checkInt(this.mNumCurves);
								}
								else
								{
									cstart = flash.checkInt(cend = flash.checkInt(curve_num));
								}
								for(var cnum:number = flash.checkInt(cstart);cnum < cend; cnum++)
								{
									ball_pct = flash.checkInt(this.mCurveMgr[cnum].GetFarthestBallPercent());
									for(i = flash.checkInt(0); i < this.mTreasurePoints.length; i++)
									{
										tp = this.mTreasurePoints[i];
										if(tp.mCurveDist[cnum] > 0 && ball_pct >= tp.mCurveDist[cnum])
										{
											treasure_pts.push(i);
										}
									}
								}
								if(treasure_pts.length == 0)
								{
									return false;
								}
								var idx:number = flash.checkInt(Math.random() * treasure_pts.length);
								this.mBoard["mCurTreasureNum"] = treasure_pts[idx];
								this.mBoard["mCurTreasure"] = this.mTreasurePoints[treasure_pts[idx]];
								this.mBoard["mCurTreasure"].x = this.mTreasurePoints[treasure_pts[idx]].x;
								this.mBoard["mCurTreasure"].y = this.mTreasurePoints[treasure_pts[idx]].y;
								this.mBoard["mMinTreasureY"] = this.mBoard["mMaxTreasureY"] = Number.MAX_VALUE;
								return true;
							}

							public GetFarthestBallPercent(farthest_curve:number = 0,ignore_gaps:boolean = false):number
							{
								var tmp:number = flash.checkInt(0);
								var p:number = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									tmp = flash.checkInt(this.mCurveMgr[i].GetFarthestBallPercent(ignore_gaps));
									if(tmp > p)
									{
										if(farthest_curve != 0)
										{
											farthest_curve = flash.checkInt(i);
										}
										p = flash.checkInt(tmp);
									}
								}
								return p;
							}

							public Draw(canvas:com.popcap.flash.framework.Canvas)
							{
								this.mHoleMgr.Draw(canvas);
							}

							public StartLevel()
							{
								var j:number = flash.checkInt(0);
								this.mHoleMgr = new com.popcap.flash.games.zuma2.logic.HoleMgr(this.mApp);
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									this.mCurveMgr[i].mBoard = this.mBoard;
									this.mCurveMgr[i].LoadCurve();
									this.mCurveMgr[i].StartLevel();
									if(i == 0)
									{
										this.mCurveMgr[i].mInitialPathHilite = true;
									}
								}
								for(i = flash.checkInt(0); i < this.mHoleMgr.mHoles.length; i++)
								{
									for(j = flash.checkInt(0); j < 4; j++)
									{
										if(this.mHoleMgr.mHoles[i].mCurveNum == j)
										{
											if(this.mSkullOverride[j] != 0)
											{
												this.mHoleMgr.mHoles[i].SetRotation(this.mSkullOverride[j]);
											}
											break;
										}
									}
								}
								this.SetupHiddenHoles();
								this.mApp["gAddBalls"] = false;
							}

							public GetRandomFrogBulletColor(max_curve_colors:number,color_num:number):number
							{
								max_curve_colors = flash.checkInt(max_curve_colors);
								color_num = flash.checkInt(color_num);
								return 1 / flash.trannumber(max_curve_colors);
							}

							public GetPowerIncPct():number
							{
								return 0;
							}

							public GetBallAtXY(x:number,y:number):com.popcap.flash.games.zuma2.logic.Ball
							{
								x = flash.checkInt(x);
								y = flash.checkInt(y);
								var anItr:de.polygonal.ds.DListIterator = <any>null;
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									anItr = this.mCurveMgr[i].mBallList.getListIterator();
									anItr["start"]();
									while(anItr["valid"]())
									{
										if(anItr["data"].Contains(x,y))
										{
											return anItr["data"];
										}
										anItr["forth"]();
									}
								}
								return null;
							}

							public DoingInitialPathHilite():boolean
							{
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									if(this.mCurveMgr[i].mInitialPathHilite)
									{
										return true;
									}
								}
								return false;
							}

							public EndLevel()
							{
								if(this.mHoleMgr != null)
								{
									this.mHoleMgr.Delete();
								}
								for(var i:number = flash.checkInt(0);i < this.mCurveMgr.length; i++)
								{
									this.mCurveMgr[i].mWarningLights = null;
								}
							}

							public SetupHiddenHoles()
							{
								var h:com.popcap.flash.games.zuma2.logic.Hole = <any>null;
								var vis_h:com.popcap.flash.games.zuma2.logic.Hole = <any>null;
								var vis_idx:number = flash.checkInt(0);
								var invis_rect:egret.Rectangle = <any>null;
								var vis_rect:egret.Rectangle = <any>null;
								if(this.mHoleMgr.mNumHoles < 2)
								{
									return ;
								}
								var idx:number = flash.checkInt(0);
								while((h = this.mHoleMgr.mHoles[idx]) != null)
								{
									if(<any>!h.mVisible)
									{
										vis_idx = flash.checkInt(0);
										invis_rect = new egret.Rectangle(h.mX,h.mY,65,65);
										invis_rect.inflate(-4,-4);
										while((vis_h = this.mHoleMgr.mHoles[vis_idx]) != null)
										{
											if(<any>!vis_h.mVisible)
											{
												vis_idx++;
											}
											else
											{
												vis_rect = new egret.Rectangle(vis_h.mX,vis_h.mY,65,65);
												vis_rect.inflate(-4,-4);
												if(vis_rect.intersects(invis_rect))
												{
													h.mShared.push(vis_idx);
												}
												vis_idx++;
											}
										}
									}
									idx++;
								}
							}

							public GetRandomPendingBallColor(max_curve_colors:number):number
							{
								max_curve_colors = flash.checkInt(max_curve_colors);
								return flash.tranint(Math.random() * max_curve_colors);
							}

							public HasPowerup(p:number):boolean
							{
								p = flash.checkInt(p);
								for(var i:number = flash.checkInt(0);i < this.mNumCurves; i++)
								{
									if(this.mCurveMgr[i].HasPowerup(p))
									{
										return true;
									}
								}
								return false;
							}

							public GetBarPercent():number
							{
								return flash.trannumber(this.mCurBarSize) / flash.trannumber(this.mTargetBarSize);
							}

							public AllowPointsFromBalls():boolean
							{
								return true;
							}

							public CanAdvanceBalls():boolean
							{
								return true;
							}

							public GetGunPointFromPos(x:number,y:number):number
							{
								x = flash.checkInt(x);
								y = flash.checkInt(y);
								var dx:number = flash.checkInt(0);
								var dy:number = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < this.mNumFrogPoints; i++)
								{
									dx = flash.checkInt(x - this.mFrogX[i]);
									dy = flash.checkInt(y - this.mFrogY[i]);
									if(dx * dx + dy * dy < 56 * 56)
									{
										return i;
									}
								}
								return -1;
							}

							public UpdateZumaProgress()
							{
								var i:number = flash.checkInt(0);
								if(<any>!this.mHaveReachedTarget && <any>!this.mBoard["GauntletMode"]() && this.mBoard["mScore"] >= this.mBoard["mScoreTarget"])
								{
									this.mHaveReachedTarget = true;
									for(i = flash.checkInt(0); i < this.mNumCurves; i++)
									{
										this.mCurveMgr[i].ZumaAchieved(true);
									}
								}
							}

							public Update(f:number)
							{
								this.mUpdateCount++;
								if(this.mTimer > 0)
								{
									this.mTimer--;
								}
								this.mHoleMgr.Update();
							}

						}
					}
				}
			}
		}
	}
}

