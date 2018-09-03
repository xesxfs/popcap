module com {
	export module popcap {
		export module flash {
			export module framework {
				export module resources {
					export module sounds {
						export class SoundResource extends egret.HashObject {
							private mVolume:number = 1.0;
							public resourceId:number = -1;
							public sound:flash.Sound;
							private mLastTime:number = 0;
							private mInstances:Array<com.popcap.flash.framework.resources.sounds.SoundInst>;

							public constructor()
							{
								super();
								super();
								this.mInstances = new Array<com.popcap.flash.framework.resources.sounds.SoundInst>();
							}

							public loop():com.popcap.flash.framework.resources.sounds.SoundInst
							{
								var tmp:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								var inst:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								var numInst:number = flash.checkInt(this.mInstances.length);
								for(var i:number = flash.checkInt(0);i < numInst; i++)
								{
									tmp = this.mInstances[i];
									if(tmp.isDone())
									{
										inst = tmp;
										break;
									}
								}
								if(inst == null)
								{
									inst = new com.popcap.flash.framework.resources.sounds.SoundInst();
									this.mInstances.push(inst);
								}
								inst.reset(this);
								inst.numPlays = flash.checkInt(-1);
								inst.play(this.mVolume);
								return inst;
							}

							public resume()
							{
								var tmp:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								var numInst:number = flash.checkInt(this.mInstances.length);
								for(var i:number = flash.checkInt(0);i < numInst; i++)
								{
									tmp = this.mInstances[i];
									tmp.resume();
								}
							}

							public play(numPlays:number):com.popcap.flash.framework.resources.sounds.SoundInst
							{
								numPlays = flash.checkInt(numPlays);
								var tmp:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								var thisTime:number = flash.checkInt(egret.getTimer());
								if(thisTime - 10 <= this.mLastTime)
								{
									return null;
								}
								this.mLastTime = flash.checkInt(thisTime);
								var inst:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								var numInst:number = flash.checkInt(this.mInstances.length);
								for(var i:number = flash.checkInt(0);i < numInst; i++)
								{
									tmp = this.mInstances[i];
									if(tmp.isDone())
									{
										inst = tmp;
										break;
									}
								}
								if(inst == null)
								{
									inst = new com.popcap.flash.framework.resources.sounds.SoundInst();
									this.mInstances.push(inst);
								}
								inst.reset(this);
								inst.numPlays = flash.checkInt(numPlays);
								inst.play(this.mVolume);
								return inst;
							}

							public pause()
							{
								var tmp:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								var numInst:number = flash.checkInt(this.mInstances.length);
								for(var i:number = flash.checkInt(0);i < numInst; i++)
								{
									tmp = this.mInstances[i];
									tmp.pause();
								}
							}

							public stop()
							{
								var tmp:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								var numInst:number = flash.checkInt(this.mInstances.length);
								for(var i:number = flash.checkInt(0);i < numInst; i++)
								{
									tmp = this.mInstances[i];
									tmp.stop();
								}
							}

							public setVolume(volume:number)
							{
								var tmp:com.popcap.flash.framework.resources.sounds.SoundInst = <any>null;
								this.mVolume = volume;
								var numInst:number = flash.checkInt(this.mInstances.length);
								for(var i:number = flash.checkInt(0);i < numInst; i++)
								{
									tmp = this.mInstances[i];
									tmp.setVolume(volume);
								}
							}

						}
					}
				}
			}
		}
	}
}

