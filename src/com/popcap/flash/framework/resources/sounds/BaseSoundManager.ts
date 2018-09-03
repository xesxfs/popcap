module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module sounds {
						export class BaseSoundManager extends egret.EventDispatcher implements com.popcap.flash.framework.resources.sounds.SoundManager {
							private mTrans:flash.SoundTransform;
							private mResources:Array<com.popcap.flash.framework.resources.sounds.SoundResource>;
							protected mSounds:flash.Dictionary;
							private mMutedVolume:number = 1.0;
							private mMuted:boolean = false;

							public constructor()
							{
								super();
								this.mSounds = new flash.Dictionary();
								this.mResources = new Array<com.popcap.flash.framework.resources.sounds.SoundResource>();
								this.mTrans = new flash.SoundTransform();
								var blankSound:flash.Sound = new flash.Sound();
								blankSound.addEventListener(SampleDataEvent.SAMPLE_DATA,flash.bind(this.HandleBlankSound,this),null);
								blankSound.play();
							}

							private HandleBlankSound(e:flash.events.SampleDataEvent)
							{
							}

							public playSound(id:string,numPlays:number = 1):com.popcap.flash.framework.resources.sounds.SoundInst
							{
								var res:com.popcap.flash.framework.resources.sounds.SoundResource = this.getSoundResource(id);
								if(res == null)
								{
									return new com.popcap.flash.framework.resources.sounds.SoundInst();
								}
								return res.play(numPlays);
							}

							public pauseAll()
							{
								var res:com.popcap.flash.framework.resources.sounds.SoundResource = <any>null;
								var len:number = flash.checkInt(this.mResources.length);
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									res = this.mResources[i];
									res.pause();
								}
							}

							public toggleMute()
							{
								if(this.mMuted)
								{
									this.unmute();
								}
								else
								{
									this.mute();
								}
							}

							public getSoundResource(id:string):com.popcap.flash.framework.resources.sounds.SoundResource
							{
								var desc:com.popcap.flash.framework.resources.sounds.SoundDescriptor = <any>this.mSounds.getItem(id);
								if(desc == null)
								{
									return null;
								}
								var res:com.popcap.flash.framework.resources.sounds.SoundResource = desc.getResource();
								if(res == null)
								{
									return null;
								}
								if(res.resourceId < 0)
								{
									res.resourceId = flash.checkInt(this.mResources.length);
									this.mResources[this.mResources.length] = res;
								}
								return res;
							}

							public loopSound(id:string):com.popcap.flash.framework.resources.sounds.SoundInst
							{
								var res:com.popcap.flash.framework.resources.sounds.SoundResource = this.getSoundResource(id);
								if(res == null)
								{
									return new com.popcap.flash.framework.resources.sounds.SoundInst();
								}
								return res.loop();
							}

							public setVolume(volume:number)
							{
								if(this.mMuted)
								{
									this.mMutedVolume = volume;
									return ;
								}
								this.mTrans.volume = volume;
								SoundMixer.soundTransform = this.mTrans;
							}

							public mute()
							{
								var _self__:any = this;
								this.mMutedVolume = this.mTrans.volume;
								this.setVolume(0);
								this.mMuted = true;
								_self__.dispatchEvent(com.popcap.flash.framework.resources.sounds.SoundEvent.Muted());
							}

							public isMuted():boolean
							{
								return this.mMuted;
							}

							public resumeAll()
							{
								var res:com.popcap.flash.framework.resources.sounds.SoundResource = <any>null;
								var len:number = flash.checkInt(this.mResources.length);
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									res = this.mResources[i];
									res.resume();
								}
							}

							public unmute()
							{
								var _self__:any = this;
								this.mMuted = false;
								this.setVolume(this.mMutedVolume);
								_self__.dispatchEvent(com.popcap.flash.framework.resources.sounds.SoundEvent.Unmuted());
							}

							public stopAll()
							{
								var res:com.popcap.flash.framework.resources.sounds.SoundResource = <any>null;
								var len:number = flash.checkInt(this.mResources.length);
								for(var i:number = flash.checkInt(0);i < len; i++)
								{
									res = this.mResources[i];
									res.stop();
								}
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.framework.resources.sounds.BaseSoundManager","egret.EventDispatcher")
flash.implementsClass("com.popcap.flash.framework.resources.sounds.BaseSoundManager",["com.popcap.flash.framework.resources.sounds.SoundManager"]);