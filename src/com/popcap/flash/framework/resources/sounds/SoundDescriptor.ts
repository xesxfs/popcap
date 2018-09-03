module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module sounds {
						export class SoundDescriptor extends egret.HashObject {
							private mResource:com.popcap.flash.framework.resources.sounds.SoundResource = null;
							private mSoundClass:any = null;

							public constructor(soundClass:any)
							{
								super();
								super();
								this.mSoundClass = soundClass;
							}

							public getResource():com.popcap.flash.framework.resources.sounds.SoundResource
							{
								if(this.mResource != null)
								{
									return this.mResource;
								}
								var sound:flash.Sound = <any>new this.mSoundClass();
								this.mResource = new com.popcap.flash.framework.resources.sounds.SoundResource();
								this.mResource.sound = sound;
								return this.mResource;
							}

						}
					}
				}
			}
		}
	}
}

