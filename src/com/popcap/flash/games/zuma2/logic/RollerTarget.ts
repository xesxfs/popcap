module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class RollerTarget extends egret.HashObject {
							public mRestingY:number = 0;
							public mX:number = NaN;
							public mVY:number = NaN;
							public mY:number = NaN;
							public mApp:Zuma2App;
							public mNum:number = 0;
							public mBounceState:number = 0;
							public mDelay:number = 0;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mApp = app;
								this.mNum = flash.checkInt(-1);
								this.mX = 0;
								this.mY = 0;
							}

						}
					}
				}
			}
		}
	}
}

