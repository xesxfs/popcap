module de {
	export module polygonal {
		export module ds {
			export module sort {
				export module compare {
					export function compareStringCaseSensitiveDesc (a:string,b:string):number
					{
						var r:number = flash.checkInt(0);
						var k:number = flash.checkInt(0);
						var i:number = flash.checkInt(0);
						if(a.length + b.length > 2)
						{
							r = 0;
							k = a.length > b.length?flash.tranint(a.length):flash.tranint(b.length);
							for(i = 0; i < k; )
							{
								r = b.charCodeAt(i) - a.charCodeAt(i);
								if(r == 0)
								{
									i++;
									continue;
								}
								break;
							}
							return r;
						}
						return b.charCodeAt(0) - a.charCodeAt(0);
					}
				}
			}
		}
	}
}

