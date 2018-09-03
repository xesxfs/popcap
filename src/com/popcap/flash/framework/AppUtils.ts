module com {
	export module popcap {
		export module flash {
			export module framework {
				export class AppUtils extends egret.HashObject {

					public constructor()
					{
						super();
						super();
					}

					public static asNumber(value:string,defaultValue:number = 0):number
					{
						if(value == null)
						{
							return defaultValue;
						}
						var num:number = parseFloat(value);
						if(isNaN(num))
						{
							return defaultValue;
						}
						return num;
					}

					public static asBoolean(value:string,defaultValue:boolean = false):boolean
					{
						if(value == null || value.length == 0)
						{
							return defaultValue;
						}
						if(value.toLowerCase() == "true")
						{
							return true;
						}
						var num:number = parseFloat(value);
						if(isNaN(num))
						{
							return false;
						}
						if(num > 0)
						{
							return true;
						}
						return false;
					}

				}
			}
		}
	}
}

