module com {
	export module popcap {
		export module flash {
			export module framework {
				export module ads {
					export class AdAPIEvent extends egret.Event {
						public static MUTE:string;
						public static UNMUTE:string;
						public static CUSTOM_RETURN:string;
						public static GAME_CONTINUE:string;
						public static GAME_START:string;
						public static PAUSE:string;
						public static SESSION_START:string;
						public static UNPAUSE:string;
						public static MENU:string;

						public constructor(type:string)
						{
							super(type);
						}

					}
				}
			}
		}
	}
}

com.popcap.flash.framework.ads.AdAPIEvent.MUTE = "AdAPIEvent:Mute";
com.popcap.flash.framework.ads.AdAPIEvent.UNMUTE = "AdAPIEvent:UnMute";
com.popcap.flash.framework.ads.AdAPIEvent.CUSTOM_RETURN = "AdAPIEvent:CustomReturn";
com.popcap.flash.framework.ads.AdAPIEvent.GAME_CONTINUE = "AdAPIEvent:GameContinue";
com.popcap.flash.framework.ads.AdAPIEvent.GAME_START = "AdAPIEvent:GameStart";
com.popcap.flash.framework.ads.AdAPIEvent.PAUSE = "AdAPIEvent:Pause";
com.popcap.flash.framework.ads.AdAPIEvent.SESSION_START = "AdAPIEvent:SessionStart";
com.popcap.flash.framework.ads.AdAPIEvent.UNPAUSE = "AdAPIEvent:UnPause";
com.popcap.flash.framework.ads.AdAPIEvent.MENU = "AdAPIEvent:Menu";
flash.extendsClass("com.popcap.flash.framework.ads.AdAPIEvent","egret.Event")
