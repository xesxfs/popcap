module com {
	export module popcap {
		export module flash {
			export module framework {
				export module math {
					export class Random extends egret.HashObject {
						private mPRNG:com.popcap.flash.framework.math.PseudoRandomNumberGenerator;

						public constructor(prng:com.popcap.flash.framework.math.PseudoRandomNumberGenerator)
						{
							super();
							super();
							this.mPRNG = prng;
						}

						public Bool(chance:number = 0.5):boolean
						{
							return this.Next() < chance;
						}

						public Next():number
						{
							return this.mPRNG.Next();
						}

						public SetSeed(seed:number)
						{
							this.mPRNG.SetSeed(seed);
						}

						public Bit(chance:number = 0.5,shift:number = 0):number
						{
							return this.Next() < chance?1 << shift:0;
						}

						public Reset()
						{
							this.mPRNG.Reset();
						}

						public Float(min:number,max:number = NaN):number
						{
							if(isNaN(max))
							{
								max = min;
								min = 0;
							}
							return this.Next() * (max - min) + min;
						}

						public Sign(chance:number = 0.5):number
						{
							return this.Next() < chance?1:-1;
						}

						public Int(min:number,max:number = NaN):number
						{
							if(isNaN(max))
							{
								max = min;
								min = 0;
							}
							return flash.tranint(this.Float(min,max));
						}

					}
				}
			}
		}
	}
}

