module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module fonts {
						export class BaseFontManager extends egret.HashObject implements com.popcap.flash.framework.resources.fonts.FontManager {
							protected mFonts:flash.Dictionary;

							public constructor()
							{
								super();
								super();
								this.mFonts = new flash.Dictionary();
							}

							public getFontResource(id:string):com.popcap.flash.framework.resources.fonts.FontResource
							{
								var desc:com.popcap.flash.framework.resources.fonts.FontDescriptor = <any>this.mFonts.getItem(id);
								if(desc == null)
								{
									return null;
								}
								var res:com.popcap.flash.framework.resources.fonts.FontResource = desc.getResource();
								if(res == null)
								{
									return null;
								}
								return res;
							}

							public getFontInst(id:string):com.popcap.flash.framework.resources.fonts.FontInst
							{
								var res:com.popcap.flash.framework.resources.fonts.FontResource = this.getFontResource(id);
								if(res == null)
								{
									return null;
								}
								var inst:com.popcap.flash.framework.resources.fonts.FontInst = new com.popcap.flash.framework.resources.fonts.FontInst();
								inst.source = res;
								return inst;
							}

						}
					}
				}
			}
		}
	}
}

flash.implementsClass("com.popcap.flash.framework.resources.fonts.BaseFontManager",["com.popcap.flash.framework.resources.fonts.FontManager"]);