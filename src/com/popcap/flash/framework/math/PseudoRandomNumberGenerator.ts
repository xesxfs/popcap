module com {
	export module popcap {
		export module flash {
			export module framework {
				export module math {
					export interface PseudoRandomNumberGenerator {
						Next():number;
						SetSeed(param1:number);
						Reset();
					}
				}
			}
		}
	}
}

