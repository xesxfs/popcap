module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module fonts {
						export class FontCharData extends egret.HashObject {
							public offset:egret.Point;
							public kerningOffsets:flash.Dictionary;
							public width:number = 0;
							public image:flash.BitmapData;
							public order:number = 0;

							public constructor()
							{
								super();
								super();
								this.offset = new egret.Point();
								this.kerningOffsets = new flash.Dictionary();
							}

						}
					}
				}
			}
		}
	}
}

