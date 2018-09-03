module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class LevelMgr extends egret.HashObject {
							public mLevelXML:string;
							public mHasFailed:boolean = false;
							public mCannonShots:number = 1;
							public mPointsForLife:number = 50000;
							public mError:string;
							public mUniquePowerupColor:boolean = true;
							public mPowerCooldown:number = 1000;
							public mCannonAngle:number = NaN;
							public mXMLParser:flash.XML;
							public mReady:boolean = false;
							public mMinMultBallDistance:number = 3;
							public mLevels:Array<any>;
							public mClearCurveRolloutPct:number = NaN;
							public mPostZumaTime:number = 0;
							public mPowerDelay:number = 1500;
							public mCannonStacks:boolean = false;
							public mPowerupSpawnDelay:number = 700;
							public mIsHardConfig:boolean = false;
							public mCapAffectsPowerupsSpawned:boolean = true;
							public mClearCurveSpeedMult:number = 4.0;
							public mMapPoints:Array<egret.Point>;
							public mApp:Zuma2App;
							public mCurDir:string;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mCannonAngle = 15 * Zuma2App.MY_PI / 180;
								this.mApp = app;
								this.mClearCurveRolloutPct = 0.1;
							}

							public DoParsePowerupRegion(list:flash.XML,level:com.popcap.flash.games.zuma2.logic.Level)
							{
								var pr:com.popcap.flash.games.zuma2.logic.PowerupRegion = <any>null;
								var len:number = flash.checkInt(list.dot("PowerupRegion").length());
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									pr = new com.popcap.flash.games.zuma2.logic.PowerupRegion();
									pr.mCurvePctStart = list.dot("PowerupRegion").dot(i).attribute("start");
									pr.mCurvePctEnd = list.dot("PowerupRegion").dot(i).attribute("end");
									pr.mChance = flash.checkInt(list.dot("PowerupRegion").dot(i).attribute("chance"));
									pr.mCurveNum = flash.checkInt(list.dot("PowerupRegion").dot(i).attribute("curve"));
									level.mPowerupRegions.push(pr);
								}
							}

							public SetupCurveInfoFromXML(curve:string,level:com.popcap.flash.games.zuma2.logic.Level,num:number)
							{
								num = flash.checkInt(num);
								level.mNumCurves++;
								level.mCurveMgr[num - 1] = new com.popcap.flash.games.zuma2.logic.CurveMgr(this.mApp,num - 1);
								level.mCurveMgr[num - 1].mLevel = level;
								level.mCurveMgr[num - 1].mPath = curve;
							}

							public DoParseTreasure(list:flash.XML,level:com.popcap.flash.games.zuma2.logic.Level)
							{
								var len:number = flash.checkInt(list.dot("TreasurePoint").length());
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									level.mTreasurePoints[i] = new com.popcap.flash.games.zuma2.logic.TreasurePoint();
									level.mTreasurePoints[i].x = flash.checkInt(list.dot("TreasurePoint").dot(i).attribute("x"));
									level.mTreasurePoints[i].y = flash.checkInt(list.dot("TreasurePoint").dot(i).attribute("y"));
									level.mTreasurePoints[i].mCurveDist[0] = list.dot("TreasurePoint").dot(i).attribute("dist1");
									if(list.dot("TreasurePoint").dot("dist2"))
									{
										level.mTreasurePoints[i].mCurveDist[1] = list.dot("TreasurePoint").dot(i).attribute("dist2");
									}
								}
							}

							public LoadLevels(e:egret.Event)
							{
								this.mLevels = new Array();
								this.mXMLParser = new flash.XML(e.target["data"]);
								this.DoParseLevels();
							}

							public LoadXML(theFilename:string)
							{
								var xmlLoader:egret.URLLoader = new egret.URLLoader();
								xmlLoader.addEventListener(egret.Event.COMPLETE,flash.bind(this.LoadLevels,this),null);
								xmlLoader.load(new egret.URLRequest(theFilename));
							}

							public DoParseLevels()
							{
								var level:com.popcap.flash.games.zuma2.logic.Level = <any>null;
								var curve:string = <any>null;
								var len:number = flash.checkInt(this.mXMLParser.dot("Level").length());
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									level = new com.popcap.flash.games.zuma2.logic.Level(this.mApp);
									level.mId = this.mXMLParser.dot("Level").dot(i).attribute("id");
									level.mDisplayName = this.mXMLParser.dot("Level").dot(i).attribute("dispname");
									level.mDrawCurves = AppUtils.asBoolean(this.mXMLParser.dot("Level").dot(i).attribute("drawcurve"));
									level.mParTime = flash.checkInt(this.mXMLParser.dot("Level").dot(i).attribute("partime"));
									level.mTreasureFreq = flash.checkInt(this.mXMLParser.dot("Level").dot(i).attribute("tfreq"));
									level.mBackgroundImage = this.mXMLParser.dot("Level").dot(i).attribute("background");
									level.mSkullOverride[0] = this.mXMLParser.dot("Level").dot(i).attribute("curve1skullangle");
									level.mSkullOverride[1] = this.mXMLParser.dot("Level").dot(i).attribute("curve2skullangle");
									this.SetupCurveInfoFromXML(this.mXMLParser.dot("Level").dot(i).attribute("curve1"),level,1);
									curve = this.mXMLParser.dot("Level").dot(i).attribute("curve2");
									if(curve)
									{
										this.SetupCurveInfoFromXML(curve,level,2);
									}
									this.DoParseTreasure(this.mXMLParser.dot("Level").dot(i),level);
									this.DoParseTunnel(this.mXMLParser.dot("Level").dot(i),level);
									this.DoParseGun(this.mXMLParser.dot("Level").dot(i),level);
									this.DoParsePowerupRegion(this.mXMLParser.dot("Level").dot(i),level);
									this.mLevels[i] = level;
								}
								this.mReady = true;
							}

							public DoParseGun(list:flash.XML,level:com.popcap.flash.games.zuma2.logic.Level)
							{
								var len:number = flash.checkInt(list.dot("Gun").length());
								level.mNumFrogPoints = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									level.mMoveType = list.dot("Gun").dot(i).attribute("type");
									level.mFrogX[0] = list.dot("Gun").dot(i).attribute("gx1");
									level.mFrogY[0] = list.dot("Gun").dot(i).attribute("gy1");
									level.mNumFrogPoints++;
									if(list.dot("Gun").attribute("gx2") != undefined)
									{
										level.mFrogX[1] = list.dot("Gun").attribute("gx2");
										level.mFrogY[1] = list.dot("Gun").attribute("gy2");
										level.mNumFrogPoints++;
									}
								}
							}

							public DoParseTunnel(list:flash.XML,level:com.popcap.flash.games.zuma2.logic.Level)
							{
								var len:number = flash.checkInt(list.dot("Tunnel").length());
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									level.mTunnelData[i] = new com.popcap.flash.games.zuma2.logic.TunnelData();
									level.mTunnelData[i].mPriority = list.dot("Tunnel").dot(i).attribute("pri");
									level.mTunnelData[i].mX = list.dot("Tunnel").dot(i).attribute("x");
									level.mTunnelData[i].mY = list.dot("Tunnel").dot(i).attribute("y");
									level.mTunnelData[i].mTunnelImage = list.dot("Tunnel").dot(i).attribute("chute");
								}
							}

							public GetLevelByIndex(index:number):com.popcap.flash.games.zuma2.logic.Level
							{
								index = flash.checkInt(index);
								if(index < 0 || index > this.mLevels.length)
								{
									return null;
								}
								return this.mLevels[index];
							}

						}
					}
				}
			}
		}
	}
}

