module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module images {
						export class ImageResource extends egret.HashObject {
							public mCols:number = 1;
							public mFrames:Array<flash.BitmapData>;
							public mRows:number = 1;
							public mSrcRect:egret.Rectangle;
							public mNumFrames:number = 1;

							public constructor()
							{
								super();
								super();
								this.mSrcRect = new egret.Rectangle();
							}

						}
					}
				}
			}
		}
	}
}

