module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Zuma2Fonts extends com.popcap.flash.framework.resources.fonts.BaseFontManager {
							public static FONT_TIMER_TEXT:string;
							public static FONT_BONUS_TEXT:string;
							public static FONT_TIME_UP_TEXT:string;

							public constructor()
							{
								super();
								this.init();
							}

							private init()
							{
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.Zuma2Fonts.FONT_TIMER_TEXT = "Zuma2Fonts_FONT_TIMER_TEXT";
com.popcap.flash.games.zuma2.logic.Zuma2Fonts.FONT_BONUS_TEXT = "Zuma2Fonts_FONT_BONUS_TEXT";
com.popcap.flash.games.zuma2.logic.Zuma2Fonts.FONT_TIME_UP_TEXT = "Zuma2Fonts_FONT_TIME_UP_TEXT";
flash.extendsClass("com.popcap.flash.games.zuma2.logic.Zuma2Fonts","com.popcap.flash.framework.resources.fonts.BaseFontManager")
