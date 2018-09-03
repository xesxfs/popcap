module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module sounds {
						export class SoundEvent extends egret.Event {
							public static SOUND_UNMUTED:string;
							public static SOUND_MUTED:string;

							public constructor(type:string)
							{
								super(type);
							}

							public static Unmuted():com.popcap.flash.framework.resources.sounds.SoundEvent
							{
								return new com.popcap.flash.framework.resources.sounds.SoundEvent(com.popcap.flash.framework.resources.sounds.SoundEvent.SOUND_UNMUTED);
							}

							public static Muted():com.popcap.flash.framework.resources.sounds.SoundEvent
							{
								return new com.popcap.flash.framework.resources.sounds.SoundEvent(com.popcap.flash.framework.resources.sounds.SoundEvent.SOUND_MUTED);
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.framework.resources.sounds.SoundEvent.SOUND_UNMUTED = "SoundUnmuted";
com.popcap.flash.framework.resources.sounds.SoundEvent.SOUND_MUTED = "SoundMuted";
flash.extendsClass("com.popcap.flash.framework.resources.sounds.SoundEvent","egret.Event")
