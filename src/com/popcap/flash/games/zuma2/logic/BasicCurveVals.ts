module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class BasicCurveVals extends egret.HashObject {
							public mSlowFactor:number = NaN;
							public mBallRepeat:number = 0;
							public mDrawTunnels:boolean = false;
							public mStartDistance:number = 0;
							public mMaxSpeed:number = NaN;
							public mDrawPit:boolean = false;
							public mAccelerationRate:number = NaN;
							public mSkullRotation:number = 0;
							public mScoreTarget:number = 0;
							public mOrgAccelerationRate:number = NaN;
							public mMaxSingle:number = 0;
							public mOrgMaxSpeed:number = NaN;
							public mMaxNumPowerUps:Array<any>;
							public mSlowDistance:number = 0;
							public mDieAtEnd:boolean = false;
							public mPowerUpChance:number = 0;
							public mDestroyAll:boolean = false;
							public mNumColors:number = 0;
							public mZumaBack:number = 0;
							public mPowerUpFreq:Array<any>;
							public mMaxClumpSize:number = 0;
							public mNumBalls:number = 0;
							public mSpeed:number = NaN;
							public mZumaSlow:number = 0;

							public constructor()
							{
								super();
								super();
								this.mPowerUpFreq = new Array();
								this.mMaxNumPowerUps = new Array();
							}

						}
					}
				}
			}
		}
	}
}

