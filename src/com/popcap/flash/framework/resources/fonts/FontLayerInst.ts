module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module fonts {
						export class FontLayerInst extends egret.HashObject {
							public color:flash.ColorTransform;
							private mSourceLayer:com.popcap.flash.framework.resources.fonts.FontLayer;

							public constructor(source:com.popcap.flash.framework.resources.fonts.FontLayer)
							{
								super();
								super();
								this.color = new flash.ColorTransform();
								this.mSourceLayer = source;
							}

							public get sourceLayer():com.popcap.flash.framework.resources.fonts.FontLayer
							{
								return this.mSourceLayer;
							}

						}
					}
				}
			}
		}
	}
}

