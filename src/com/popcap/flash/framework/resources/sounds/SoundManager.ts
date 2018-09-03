module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module sounds {
						export interface SoundManager extends egret.IEventDispatcher {
							isMuted():boolean;
							getSoundResource(param1:string):com.popcap.flash.framework.resources.sounds.SoundResource;
							loopSound(param1:string):com.popcap.flash.framework.resources.sounds.SoundInst;
							toggleMute();
							unmute();
							resumeAll();
							mute();
							pauseAll();
							playSound(param1:string,param2?:number):com.popcap.flash.framework.resources.sounds.SoundInst;
							setVolume(param1:number);
							stopAll();
						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.framework.resources.sounds.SoundManager","egret.IEventDispatcher")
