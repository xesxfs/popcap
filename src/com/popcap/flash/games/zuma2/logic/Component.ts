module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Component extends egret.HashObject {
							public mValue:number = NaN;
							public mTargetValue:number = NaN;
							public mValueDelta:number = NaN;
							public mStartFrame:number = 0;
							public mOriginalValue:number = NaN;
							public mEndFrame:number = 0;

							public constructor(val:number,target:number,start:number = 0,end:number = 0)
							{
								super();
								super();
								this.mValue = val;
								this.mOriginalValue = val;
								this.mTargetValue = target;
								this.mStartFrame = flash.checkInt(start);
								this.mEndFrame = flash.checkInt(end);
								this.mValueDelta = end - start == 0?flash.trannumber(0):flash.trannumber((target - val) / flash.trannumber(end - start));
							}

							public Update()
							{
								this.mValue = this.mValue + this.mValueDelta;
								if(this.mValueDelta > 0 && this.mValue > this.mTargetValue || this.mValueDelta < 0 && this.mValue < this.mTargetValue)
								{
									this.mValue = this.mTargetValue;
								}
							}

							public Active(count:number):boolean
							{
								count = flash.checkInt(count);
								return count >= this.mStartFrame && count <= this.mEndFrame;
							}

						}
					}
				}
			}
		}
	}
}

