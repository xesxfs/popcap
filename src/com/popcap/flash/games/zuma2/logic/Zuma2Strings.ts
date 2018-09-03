module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Zuma2Strings extends egret.HashObject {
							private strings:any = com.popcap.flash.games.zuma2.logic.Zuma2Strings_strings;
							public mStrings:flash.Dictionary;
							public mStringFile:string;

							public constructor()
							{
								super();
								super();
								var aByteArray:flash.ByteArray = (<flash.ByteArray>(new this.strings()));
								this.mStringFile = aByteArray.readUTFBytes(aByteArray.length);
								this.mStrings = new flash.Dictionary();
								this.init();
							}

							public init()
							{
								var aLine:string = <any>null;
								var index:number = <any>NaN;
								var aTextFile:string = this.mStringFile;
								aTextFile = aTextFile.replace(/\r\n/g,"\n");
								aTextFile = aTextFile.replace(/\r/g,"\n");
								var aLines:Array<any> = aTextFile.split(/\n/);
								var aCurrentKey:string = <any>null;
								var aCurrentValue:string = <any>null;
								var aNumLines:number = flash.checkInt(aLines.length);
								for(var i:number = flash.checkInt(0);i < aNumLines; i++)
								{
									aLine = aLines[i];
									if(aLine.length != 0)
									{
										index = aLine.search(/\[[A-Z0-9_]+\]/);
										if(index == 0)
										{
											if(aCurrentKey == null)
											{
												aCurrentKey = aLine;
											}
											else
											{
												this.mStrings.setItem(aCurrentKey,aCurrentValue);
												aCurrentKey = aLine;
												aCurrentValue = null;
											}
										}
										else if(aCurrentValue == null)
										{
											aCurrentValue = aLine;
										}
										else
										{
											aCurrentValue = aCurrentValue + "\n" + aLine;
										}
									}
								}
								this.mStrings.setItem(aCurrentKey,aCurrentValue);
							}

							public translateString(key:string):string
							{
								var aValue:string = <any>this.mStrings.getItem(key);
								if(aValue == null)
								{
									return "\'" + key + "\' string has not been loaded.";
								}
								return aValue;
							}

						}
					}
				}
			}
		}
	}
}

