module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class CurveData extends egret.HashObject {
							public static SUBPIXEL_MULT:number;
							public static INV_SUBPIXEL_MULT:number;
							public aReader:flash.ByteArray;
							public mErrorString:string;
							public mLoaded:boolean = false;
							public loader:egret.URLLoader;
							public mDrawCurve:boolean = false;
							public mPointList:Array<com.popcap.flash.games.zuma2.logic.PathPoint>;
							public mVersion:number = 0;
							public mEditType:number = 0;
							public mLinear:boolean = false;
							public mApp:Zuma2App;
							public mVals:com.popcap.flash.games.zuma2.logic.BasicCurveVals;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.loader = new egret.URLLoader();
								this.mApp = app;
								this.mLoaded = false;
							}

							public Load(theFileName:string):boolean
							{
								var aBuf:string = <any>null;
								var aBufferSize:number = flash.checkInt(0);
								var aByteArray:flash.ByteArray = <any>null;
								var aPoint:com.popcap.flash.games.zuma2.logic.PathPoint = <any>null;
								var aFlags:number = flash.checkInt(0);
								var isEndPoint:any = false;
								var dx:number = flash.checkInt(0);
								var dy:number = flash.checkInt(0);
								this.Clear();
								this.mVals = new com.popcap.flash.games.zuma2.logic.BasicCurveVals();
								this.mPointList = new Array<com.popcap.flash.games.zuma2.logic.PathPoint>();
								var i:number = flash.checkInt(0);
								this.aReader = this.mApp["mLevelData"].mLevels[theFileName + ".dat"];
								this.aReader.position = flash.checkUint(0);
								this.aReader.endian = flash.Endian.LITTLE_ENDIAN;
								aBuf = this.aReader.readUTFBytes(4);
								this.mVersion = flash.checkInt(this.aReader.readInt());
								this.mLinear = this.aReader.readBoolean();
								this.mVals.mStartDistance = flash.checkInt(this.aReader.readInt());
								this.mVals.mNumBalls = flash.checkInt(this.aReader.readInt());
								this.mVals.mBallRepeat = flash.checkInt(this.aReader.readInt());
								this.mVals.mMaxSingle = flash.checkInt(this.aReader.readInt());
								this.mVals.mNumColors = flash.checkInt(this.aReader.readInt());
								this.mVals.mSpeed = this.aReader.readFloat();
								this.mVals.mSlowDistance = flash.checkInt(this.aReader.readInt());
								this.mVals.mAccelerationRate = this.aReader.readFloat();
								this.mVals.mOrgAccelerationRate = this.mVals.mAccelerationRate;
								this.mVals.mMaxSpeed = this.aReader.readFloat();
								this.mVals.mOrgMaxSpeed = this.mVals.mMaxSpeed;
								this.mVals.mScoreTarget = flash.checkInt(this.aReader.readInt());
								this.mVals.mSkullRotation = flash.checkInt(this.aReader.readInt());
								this.mVals.mZumaBack = flash.checkInt(this.aReader.readInt());
								this.mVals.mZumaSlow = flash.checkInt(this.aReader.readInt());
								this.mVals.mSlowFactor = this.aReader.readFloat();
								this.mVals.mMaxClumpSize = flash.checkInt(this.aReader.readInt());
								var num_powerups:number = flash.checkInt(this.aReader.readInt());
								for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Max; i++)
								{
									this.mVals.mPowerUpFreq[i] = 0;
									this.mVals.mMaxNumPowerUps[i] = 100000000;
								}
								i = flash.checkInt(0);
								while(i < num_powerups && i < com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Max)
								{
									if(this.IsDeprecatedPowerUp(i))
									{
										this.aReader.readInt();
										if(this.mVersion >= 12)
										{
											this.aReader.readInt();
										}
									}
									else
									{
										this.mVals.mPowerUpFreq[i] = this.aReader.readInt();
										if(this.mVersion >= 12)
										{
											this.mVals.mMaxNumPowerUps[i] = this.aReader.readInt();
										}
									}
									i++;
								}
								this.mVals.mPowerUpChance = flash.checkInt(this.aReader.readInt());
								this.mDrawCurve = this.aReader.readBoolean();
								this.mVals.mDrawTunnels = this.aReader.readBoolean();
								this.mVals.mDestroyAll = this.aReader.readBoolean();
								this.mVals.mDrawPit = this.aReader.readBoolean();
								this.mVals.mDieAtEnd = this.aReader.readBoolean();
								var smallVersion:boolean = this.aReader.readBoolean();
								var hasTunnels:boolean = this.aReader.readBoolean();
								if(<any>!smallVersion)
								{
									this.mEditType = flash.checkInt(this.aReader.readInt());
									aBufferSize = flash.checkInt(this.aReader.readInt());
									aByteArray = new flash.ByteArray();
									this.aReader.readBytes(aByteArray,0,aBufferSize);
								}
								else
								{
									this.mEditType = flash.checkInt(0);
								}
								var aSize:number = flash.checkInt(this.aReader.readInt());
								var ox:number = <any>0;
								var oy:number = <any>0;
								for(i = flash.checkInt(0); i < aSize; i++)
								{
									aPoint = new com.popcap.flash.games.zuma2.logic.PathPoint();
									aFlags = flash.checkInt(this.aReader.readByte());
									aPoint.mInTunnel = (aFlags & 1) == 1;
									isEndPoint = (aFlags & 2) == 2;
									if(hasTunnels || this.mVersion >= 15)
									{
										aPoint.mPriority = flash.checkInt(this.aReader.readByte());
									}
									if(isEndPoint)
									{
										aPoint.x = this.aReader.readFloat();
										aPoint.y = this.aReader.readFloat();
									}
									else
									{
										dx = flash.checkInt(this.aReader.readByte());
										dy = flash.checkInt(this.aReader.readByte());
										aPoint.x = ox + dx * com.popcap.flash.games.zuma2.logic.CurveData.INV_SUBPIXEL_MULT;
										aPoint.y = oy + dy * com.popcap.flash.games.zuma2.logic.CurveData.INV_SUBPIXEL_MULT;
									}
									ox = aPoint.x;
									oy = aPoint.y;
									this.mPointList.push(aPoint);
								}
								this.mLoaded = true;
								return true;
							}

							public IsDeprecatedPowerUp(ptype:number):boolean
							{
								ptype = flash.checkInt(ptype);
								return ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Fireball || ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_ShieldFrog || ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_FreezeBoss || ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_BallEater || ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_BombBullet || ptype == com.popcap.flash.games.zuma2.logic.PowerType.PowerType_Lob;
							}

							public Clear()
							{
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.CurveData.SUBPIXEL_MULT = 100;
com.popcap.flash.games.zuma2.logic.CurveData.INV_SUBPIXEL_MULT = 1 / com.popcap.flash.games.zuma2.logic.CurveData.SUBPIXEL_MULT;
