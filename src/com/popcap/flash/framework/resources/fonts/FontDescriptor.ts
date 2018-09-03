module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module fonts {
						export class FontDescriptor extends egret.HashObject {
							private mRes:com.popcap.flash.framework.resources.fonts.FontResource;
							private mClass:any;

							public constructor(fontClass:any)
							{
								super();
								super();
								this.mClass = fontClass;
							}

							public getResource():com.popcap.flash.framework.resources.fonts.FontResource
							{
								if(this.mRes == null)
								{
									this.mRes = new this.mClass();
								}
								return this.mRes;
							}

						}
					}
				}
			}
		}
	}
}

