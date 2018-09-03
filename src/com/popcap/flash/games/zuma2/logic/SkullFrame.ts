module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class SkullFrame extends egret.HashObject {
							public mAngle:number = NaN;
							public mX:number = NaN;
							public mSize:number = NaN;
							public mAlpha:number = NaN;
							public mY:number = NaN;
							public mIsFinalFrame:boolean = false;
							public mPctOpen:number = NaN;

							public constructor()
							{
								super();
								super();
								this.mPctOpen = 1;
								this.mAngle = 0;
								this.mSize = 0;
								this.mAlpha = 128;
								this.mIsFinalFrame = false;
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

