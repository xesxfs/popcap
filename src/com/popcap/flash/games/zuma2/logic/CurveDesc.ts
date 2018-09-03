module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class CurveDesc extends egret.HashObject {
							public mDangerDistance:number = 0;
							public mCurAcceleration:number = NaN;
							public mApp:Zuma2App;
							public mCutoffPoint:number = 0;
							public mMergeSpeed:number = NaN;
							public mVals:com.popcap.flash.games.zuma2.logic.BasicCurveVals;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mApp = app;
								this.mMergeSpeed = 0.025;
								this.mDangerDistance = flash.checkInt(600);
							}

							public GetValuesFrom(data:com.popcap.flash.games.zuma2.logic.CurveData)
							{
								this.mVals = data.mVals;
							}

						}
					}
				}
			}
		}
	}
}

