module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class PowerupRegion extends egret.HashObject {
							public mChance:number = 0;
							public mCurvePctStart:number = NaN;
							public mCurveNum:number = 0;
							public mDebugDraw:boolean = false;
							public mCurvePctEnd:number = NaN;

							public constructor()
							{
								super();
								super();
								this.mCurvePctStart = 0;
								this.mCurvePctEnd = 0;
								this.mDebugDraw = false;
								this.mChance = flash.checkInt(0);
								this.mCurveNum = flash.checkInt(0);
							}

						}
					}
				}
			}
		}
	}
}

