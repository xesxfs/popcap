module com {
	export module popcap {
		export module flash {
			export module framework {
				export module math {
					export class MersenneTwister extends egret.HashObject implements com.popcap.flash.framework.math.PseudoRandomNumberGenerator {
						public static MATRIX_A:number;
						public static UPPER_MASK:number;
						public static MTRAND_N:number;
						public static TEMPERING_MASK_B:number;
						public static TEMPERING_MASK_C:number;
						public static LOWER_MASK:number;
						public static MTRAND_M:number;
						private z:number = 0;
						private mt:Array<number>;
						private y:number = 0;
						private mSeed:number = 0;

						public constructor()
						{
							super();
							super();
							this.mt = new Array<number>();
						}

						public Next():number
						{
							var i:number = flash.checkInt(0);
							var capA:number = flash.checkInt(0);
							var capB:number = flash.checkInt(0);
							var mag01:Array<any> = [0,com.popcap.flash.framework.math.MersenneTwister.MATRIX_A];
							if(this.z >= com.popcap.flash.framework.math.MersenneTwister.MTRAND_N)
							{
								i = flash.checkInt(0);
								capA = flash.checkInt(com.popcap.flash.framework.math.MersenneTwister.MTRAND_N - com.popcap.flash.framework.math.MersenneTwister.MTRAND_M);
								for(i = flash.checkInt(0); i < capA; i++)
								{
									this.y = this.mt[i] & com.popcap.flash.framework.math.MersenneTwister.UPPER_MASK | this.mt[i + 1] & com.popcap.flash.framework.math.MersenneTwister.LOWER_MASK;
									this.mt[i] = this.mt[i + com.popcap.flash.framework.math.MersenneTwister.MTRAND_M] ^ this.y >> 1 ^ mag01[this.y & 1];
								}
								for(capB = flash.checkInt(com.popcap.flash.framework.math.MersenneTwister.MTRAND_N - 1); i < capB; )
								{
									this.y = this.mt[i] & com.popcap.flash.framework.math.MersenneTwister.UPPER_MASK | this.mt[i + 1] & com.popcap.flash.framework.math.MersenneTwister.LOWER_MASK;
									this.mt[i] = this.mt[i + (com.popcap.flash.framework.math.MersenneTwister.MTRAND_M - com.popcap.flash.framework.math.MersenneTwister.MTRAND_N)] ^ this.y >> 1 ^ mag01[this.y & 1];
									i++;
								}
								this.y = this.mt[com.popcap.flash.framework.math.MersenneTwister.MTRAND_N - 1] & com.popcap.flash.framework.math.MersenneTwister.UPPER_MASK | this.mt[0] & com.popcap.flash.framework.math.MersenneTwister.LOWER_MASK;
								this.mt[com.popcap.flash.framework.math.MersenneTwister.MTRAND_N - 1] = this.mt[com.popcap.flash.framework.math.MersenneTwister.MTRAND_M - 1] ^ this.y >> 1 ^ mag01[this.y & 1];
								this.z = 0;
							}
							this.y = this.mt[this.z++];
							this.y = this.y ^ this.y >> 11;
							this.y = this.y ^ this.y << 7 & com.popcap.flash.framework.math.MersenneTwister.TEMPERING_MASK_B;
							this.y = this.y ^ this.y << 15 & com.popcap.flash.framework.math.MersenneTwister.TEMPERING_MASK_C;
							this.y = this.y ^ this.y >> 18;
							this.y = this.y & 2147483647;
							return this.y / 2147483647;
						}

						public SetSeed(seed:number)
						{
							if(seed == 0)
							{
								seed = 4357;
							}
							this.mSeed = seed;
							this.mt[0] = seed & 4294967295;
							for(this.z = 1; this.z < com.popcap.flash.framework.math.MersenneTwister.MTRAND_N; this.z++)
							{
								this.mt[this.z] = 1812433253 * (this.mt[this.z - 1] ^ this.mt[this.z - 1] >> 30) + this.z;
								this.mt[this.z] = this.mt[this.z] & 4294967295;
							}
						}

						public Reset()
						{
							this.SetSeed(this.mSeed);
						}

					}
				}
			}
		}
	}
}

com.popcap.flash.framework.math.MersenneTwister.MATRIX_A = 2567483615;
com.popcap.flash.framework.math.MersenneTwister.UPPER_MASK = 2147483648;
com.popcap.flash.framework.math.MersenneTwister.MTRAND_N = 624;
com.popcap.flash.framework.math.MersenneTwister.TEMPERING_MASK_B = 2636928640;
com.popcap.flash.framework.math.MersenneTwister.TEMPERING_MASK_C = 4022730752;
com.popcap.flash.framework.math.MersenneTwister.LOWER_MASK = 2147483647;
com.popcap.flash.framework.math.MersenneTwister.MTRAND_M = 397;
flash.implementsClass("com.popcap.flash.framework.math.MersenneTwister",["com.popcap.flash.framework.math.PseudoRandomNumberGenerator"]);