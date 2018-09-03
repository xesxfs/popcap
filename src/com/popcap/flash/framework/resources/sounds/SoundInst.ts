module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module sounds {
						export class SoundInst extends egret.HashObject {
							private mIsDone:boolean = false;
							public source:com.popcap.flash.framework.resources.sounds.SoundResource;
							private mPosition:number = 0;
							private mChannel:flash.SoundChannel;
							public numPlays:number = 0;
							private mTrans:flash.SoundTransform;

							public constructor()
							{
								super();
								super();
								this.mTrans = new flash.SoundTransform();
							}

							public isDone():boolean
							{
								return this.mIsDone;
							}

							private die()
							{
								this.mIsDone = true;
								if(this.mChannel != null)
								{
									this.mChannel.removeEventListener(flash.Event.SOUND_COMPLETE,flash.bind(this.handleComplete,this),null);
								}
								this.mChannel = null;
							}

							private handleComplete(e:egret.Event)
							{
								this.mChannel.removeEventListener(flash.Event.SOUND_COMPLETE,flash.bind(this.handleComplete,this),null);
								this.mChannel = null;
								this.play(this.mTrans.volume);
							}

							public stop()
							{
								if(this.mChannel == null)
								{
									return ;
								}
								this.mChannel.stop();
								this.die();
							}

							public resume()
							{
								if(this.mIsDone)
								{
									return ;
								}
								if(this.mChannel != null)
								{
									return ;
								}
								this.mChannel = this.source.sound.play(this.mPosition,0,this.mTrans);
								if(this.mChannel == null)
								{
									this.die();
									return ;
								}
								this.mChannel.addEventListener(flash.Event.SOUND_COMPLETE,flash.bind(this.handleComplete,this),null);
							}

							public reset(res:com.popcap.flash.framework.resources.sounds.SoundResource)
							{
								this.source = res;
								this.mIsDone = false;
							}

							public play(volume:number = 1.0,position:number = 0)
							{
								if(this.source == null)
								{
									return ;
								}
								if(this.mIsDone)
								{
									return ;
								}
								if(this.mChannel != null)
								{
									return ;
								}
								if(this.numPlays == 0)
								{
									this.die();
									return ;
								}
								if(this.numPlays > 0)
								{
									this.numPlays--;
								}
								this.mTrans.volume = volume;
								this.mChannel = this.source.sound.play(position,0,this.mTrans);
								if(this.mChannel == null)
								{
									this.die();
									return ;
								}
								this.mChannel.addEventListener(flash.Event.SOUND_COMPLETE,flash.bind(this.handleComplete,this),null);
							}

							public pause()
							{
								if(this.mChannel == null)
								{
									return ;
								}
								this.mPosition = this.mChannel.position;
								this.mChannel.stop();
								this.mChannel.removeEventListener(flash.Event.SOUND_COMPLETE,flash.bind(this.handleComplete,this),null);
								this.mChannel = null;
							}

							public setVolume(volume:number)
							{
								this.mTrans.volume = volume;
								if(this.mChannel != null)
								{
									this.mChannel.soundTransform = this.mTrans;
								}
							}

						}
					}
				}
			}
		}
	}
}

