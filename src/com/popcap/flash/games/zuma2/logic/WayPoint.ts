module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class WayPoint extends egret.HashObject {
							public mInTunnel:boolean = false;
							public mAvgRotation:number = NaN;
							public mRotation:number = NaN;
							public mPriority:number = 0;
							public mHavePerpendicular:boolean = false;
							public x:number = NaN;
							public y:number = NaN;
							public mHaveAvgRotation:boolean = false;
							public mPerpendicular:com.popcap.flash.games.zuma2.logic.SexyVector3;

							public constructor(x:number,y:number)
							{
								super();
								super();
								this.x = x;
								this.y = y;
								this.mHaveAvgRotation = false;
								this.mHavePerpendicular = false;
								this.mInTunnel = false;
								this.mPriority = flash.checkInt(0);
							}

						}
					}
				}
			}
		}
	}
}

