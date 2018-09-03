module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Bouncy extends egret.HashObject {
							public mStartingRate:number = NaN;
							public mDone:boolean = false;
							public mRateDivFactor:number = NaN;
							public mFinalPct:number = NaN;
							public mStartingPct:number = NaN;
							public mCount:number = 0;
							public mMaxPct:number = NaN;
							public mRate:number = NaN;
							public mStartInc:boolean = false;
							public mInc:boolean = false;
							public mPct:number = NaN;
							public mMaxBounces:number = 0;
							public mMinPct:number = NaN;

							public constructor()
							{
								super();
								super();
								this.mCount = flash.checkInt(0);
								this.mMaxBounces = flash.checkInt(0);
								this.mPct = 0;
								this.mRate = 0;
								this.mStartingPct = 0;
								this.mStartInc = true;
								this.mInc = true;
								this.mDone = false;
								this.mRateDivFactor = 2;
								this.mStartingRate = 0;
							}

							public Update()
							{
								var targetp:number = <any>NaN;
								if(this.mDone)
								{
									return ;
								}
								this.mPct = this.mPct + (<any>!<any>!this.mInc?this.mRate:-this.mRate);
								if(this.mCount == this.mMaxBounces)
								{
									targetp = this.mFinalPct;
								}
								else
								{
									targetp = <any>!<any>!this.mInc?flash.trannumber(this.mMaxPct):flash.trannumber(this.mMinPct);
								}
								if(this.mInc && this.mPct >= targetp)
								{
									this.mPct = targetp;
									this.mInc = false;
									this.mCount++;
									this.mRate = this.mRate / this.mRateDivFactor;
								}
								else if(<any>!this.mInc && this.mPct <= targetp)
								{
									this.mPct = targetp;
									this.mInc = true;
									this.mCount++;
									this.mRate = this.mRate / this.mRateDivFactor;
								}
								if(this.mCount > this.mMaxBounces)
								{
									this.mDone = true;
								}
							}

							public SetRate(r:number)
							{
								this.mRate = this.mStartingRate = r;
							}

							public SetTargetPercents(minp:number,maxp:number,finalp:number)
							{
								this.mMinPct = minp;
								this.mMaxPct = maxp;
								this.mFinalPct = finalp;
							}

							public GetPct():number
							{
								return this.mPct;
							}

							public SetRateDivFactor(d:number)
							{
								this.mRateDivFactor = d;
							}

							public SetNumBounces(b:number)
							{
								b = flash.checkInt(b);
								this.mMaxBounces = flash.checkInt(b);
							}

							public IsDone():boolean
							{
								return this.mDone;
							}

							public Reset()
							{
								this.mCount = flash.checkInt(0);
								this.mPct = this.mStartingPct;
								this.mInc = this.mStartInc;
								this.mDone = false;
								this.mRate = this.mStartingRate;
							}

							public GetCount():number
							{
								return this.mCount;
							}

							public SetPct(p:number,inc:boolean = true)
							{
								this.mPct = this.mStartingPct = p;
								this.mInc = this.mStartInc = inc;
							}

						}
					}
				}
			}
		}
	}
}

