module de {
	export module polygonal {
		export module ds {
			export module sort {
				export module compare {
					export function compareStringCaseSensitive (a:string,b:string):number
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
								r = a.charCodeAt(i) - b.charCodeAt(i);
								if(r == 0)
								{
									i++;
									continue;
								}
								break;
							}
							return r;
						}
						return a.charCodeAt(0) - b.charCodeAt(0);
					}
				}
			}
		}
	}
}

