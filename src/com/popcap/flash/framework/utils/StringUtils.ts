module com {
	export module popcap {
		export module flash {
			export module framework {
				export module utils {
					export class StringUtils extends egret.HashObject {

						public constructor()
						{
							super();
							super();
						}

						public static InsertNumberCommas(value:number):string
						{
							value = flash.checkInt(value);
							var str:string = "";
							var front:string = value.toString();
							while(front.length > 3)
							{
								str = "," + front.substr(front.length - 3,front.length) + str;
								front = front.substr(0,front.length - 3);
							}
							str = front + str;
							return str;
						}

					}
				}
			}
		}
	}
}

