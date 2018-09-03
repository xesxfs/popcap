module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class QRand extends egret.HashObject {
							public mPrevLastHitUpdate:Array<number>;
							public mWeights:Array<number>;
							public mCurSway:Array<number>;
							public mUpdateCnt:number = 0;
							public mLastIndex:number = 0;
							public mLastHitUpdate:Array<number>;

							public constructor()
							{
								super();
								super();
								this.mWeights = new Array<number>();
								this.mCurSway = new Array<number>();
								this.mLastHitUpdate = new Array<number>();
								this.mPrevLastHitUpdate = new Array<number>();
								this.Init();
							}

							public SetWeights(v:Array<number>)
							{
								var aTotal:number = <any>NaN;
								var anArgNum:number = flash.checkInt(0);
								var aWeightNum:number = flash.checkInt(0);
								this.mWeights = new Array<number>();
								if(v.length == 1)
								{
									this.mWeights.push(1 - v[0]);
									this.mWeights.push(v[0]);
								}
								else
								{
									aTotal = 0;
									for(anArgNum = flash.checkInt(0); anArgNum < v.length; anArgNum++)
									{
										this.mWeights.push(v[anArgNum]);
										aTotal = aTotal + this.mWeights[anArgNum];
									}
									for(aWeightNum = flash.checkInt(0); aWeightNum < this.mWeights.length; aWeightNum++)
									{
										this.mWeights[aWeightNum] = this.mWeights[aWeightNum] / aTotal;
									}
								}
								for(var i:number = flash.checkInt(flash.tranint(this.mLastHitUpdate.length));i < this.mWeights.length; i++)
								{
									this.mLastHitUpdate.push(0);
									this.mPrevLastHitUpdate.push(0);
								}
								this.mCurSway = new Array<number>();
							}

							public HasWeight(idx:number):boolean
							{
								idx = flash.checkInt(idx);
								if(idx >= this.mWeights.length)
								{
									return false;
								}
								return this.mWeights[idx] > 0;
							}

							public Next():number
							{
								var aWeight:number = <any>NaN;
								var anAvgLength:number = <any>NaN;
								var aPctOff:number = <any>NaN;
								var aPrevPctOff:number = <any>NaN;
								var aSway:number = <any>NaN;
								this.mUpdateCnt++;
								var aTotalWeight:number = <any>0;
								for(var i:number = flash.checkInt(0);i < this.mWeights.length; i++)
								{
									aWeight = this.mWeights[i];
									if(aWeight != 0)
									{
										anAvgLength = 1 / aWeight;
										aPctOff = 1 + (flash.trannumber(this.mUpdateCnt - this.mLastHitUpdate[i]) - anAvgLength) / anAvgLength;
										aPrevPctOff = 1 + (flash.trannumber(this.mUpdateCnt - this.mPrevLastHitUpdate[i]) - anAvgLength * 2) / (anAvgLength * 2);
										aSway = aWeight * Math.max(Math.min(aPctOff * 0.75 + aPrevPctOff * 0.25,3),0.333);
										this.mCurSway[i] = aSway;
										aTotalWeight = aTotalWeight + aSway;
									}
									else
									{
										this.mCurSway[i] = 0;
									}
								}
								var aRand:number = Math.random() * aTotalWeight;
								var anIdx:number = flash.checkInt(0);
								while(anIdx < this.mCurSway.length && aRand > this.mCurSway[anIdx])
								{
									aRand = aRand - this.mCurSway[anIdx];
									anIdx++;
								}
								if(anIdx >= this.mCurSway.length)
								{
									anIdx--;
								}
								this.mPrevLastHitUpdate[anIdx] = flash.checkInt(this.mLastHitUpdate[anIdx]);
								this.mLastHitUpdate[anIdx] = flash.checkInt(this.mUpdateCnt);
								this.mLastIndex = flash.checkInt(anIdx);
								return anIdx;
							}

							public Init()
							{
								this.mUpdateCnt = flash.checkInt(0);
								this.mLastIndex = flash.checkInt(-1);
							}

							public Clear()
							{
								this.mWeights = new Array<number>();
								this.mCurSway = new Array<number>();
								this.mLastHitUpdate = new Array<number>();
								this.mPrevLastHitUpdate = new Array<number>();
							}

							public NumNonZeroWeights():number
							{
								var num:number = flash.checkInt(0);
								for(var i:number = flash.checkInt(0);i < this.mWeights.length; i++)
								{
									if(this.mWeights[i] != 0)
									{
										num++;
									}
								}
								return num;
							}

						}
					}
				}
			}
		}
	}
}

