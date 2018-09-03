module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class PathPoint extends egret.HashObject {
							public mSplinePoint:boolean = false;
							public mEndPoint:boolean = false;
							public mSelected:boolean = false;
							public mPriority:number = 0;
							public mDist:number = NaN;
							public t:number = NaN;
							public x:number = NaN;
							public y:number = NaN;
							public mInTunnel:boolean = false;

							public constructor(tx:number = 0,ty:number = 0,dist:number = 0)
							{
								super();
								super();
								this.x = tx;
								this.y = ty;
								this.mDist = dist;
								this.mInTunnel = false;
								this.mSelected = false;
								this.mPriority = flash.checkInt(0);
								this.mEndPoint = false;
								this.t = 0;
								this.mSplinePoint = false;
							}

						}
					}
				}
			}
		}
	}
}

