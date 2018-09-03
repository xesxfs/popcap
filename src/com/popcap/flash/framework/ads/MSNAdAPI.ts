module com {
	export module popcap {
		export module flash {
			export module framework {
				export module ads {
					export class MSNAdAPI extends egret.EventDispatcher {
						public static DEFAULT_LOAD_BROADCAST_RATE:number;
						public static MILLIS_PER_UPDATE:number;
						public static DEFAULT_SCORE_BROADCAST_RATE:number;
						public static MIN_BROADCAST_RATE:number;
						private _loadBroadcastRate:number = 3000;
						private _score:number = 0;
						private _isPlaying:boolean = false;
						private _isLoading:boolean = true;
						private _gameTime:number = 0;
						public _isEnabled:boolean = false;
						private _loadPercent:number = 0;
						private _timer:egret.Timer;
						private _updateTime:number = 0;
						private _scoreBroadcastRate:number = 3000;
						private _numBreaks:number = 0;

						public constructor()
						{
							super();
							this._timer = new egret.Timer(10);
							this._timer.addEventListener(egret.TimerEvent.TIMER,flash.bind(this.HandleTimer,this),null);
						}

						private onGamePause(str:string)
						{
							var isPaused:boolean = this.OnOffAsBoolean(str);
							this.TogglePause(isPaused);
						}

						private OnOffAsBoolean(str:string):boolean
						{
							if(str == "on")
							{
								return true;
							}
							return false;
						}

						private onCustomReturn(sXML:string = null)
						{
							this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.CUSTOM_RETURN);
						}

						public CustomEvent(data:flash.XML)
						{
							if(<any>!this._isEnabled || <any>!flash.ExternalInterface.available)
							{
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.CUSTOM_RETURN);
								return ;
							}
							var xml:string = "<data>DeluxeDownload</data>";
							flash.ExternalInterface.call("CustomEvent",xml);
						}

						public PauseBroadcast()
						{
							this._isPlaying = false;
						}

						public GameBreak(levelCompleted:number)
						{
							this._isPlaying = false;
							this._numBreaks = this._numBreaks + 1;
							if(<any>!this._isEnabled || <any>!flash.ExternalInterface.available)
							{
								this._isPlaying = true;
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.GAME_CONTINUE);
								return ;
							}
							var xml:any = <any>"<data><breakpoint>" + this._numBreaks + "</breakpoint></data>";
							flash.ExternalInterface.call("GameBreak",xml);
						}

						public init()
						{
							var result:boolean = <any>false;
							this._isEnabled = true;
							this._loadBroadcastRate = com.popcap.flash.framework.ads.MSNAdAPI.DEFAULT_LOAD_BROADCAST_RATE;
							this._scoreBroadcastRate = com.popcap.flash.framework.ads.MSNAdAPI.DEFAULT_SCORE_BROADCAST_RATE;
							if(<any>!this._isEnabled)
							{
								return ;
							}
							if(flash.ExternalInterface.available)
							{
								flash.ExternalInterface.addCallback("onGameMenu",flash.bind(this.onGameMenu,this));
								flash.ExternalInterface.addCallback("onGameMute",flash.bind(this.onGameMute,this));
								flash.ExternalInterface.addCallback("onMuteOn",flash.bind(this.onMuteOn,this));
								flash.ExternalInterface.addCallback("onMuteOff",flash.bind(this.onMuteOff,this));
								flash.ExternalInterface.addCallback("onGamePause",flash.bind(this.onGamePause,this));
								flash.ExternalInterface.addCallback("onPauseOn",flash.bind(this.onPauseOn,this));
								flash.ExternalInterface.addCallback("onPauseOff",flash.bind(this.onPauseOff,this));
								flash.ExternalInterface.addCallback("onGameContinue",flash.bind(this.onGameContinue,this));
								flash.ExternalInterface.addCallback("onGameStart",flash.bind(this.onGameStart,this));
								flash.ExternalInterface.addCallback("onSessionStart",flash.bind(this.onSessionStart,this));
								flash.ExternalInterface.addCallback("onCustomReturn",flash.bind(this.onCustomReturn,this));
								result = flash.ExternalInterface.call("isProxyReady");
								if(result == true)
								{
									flash.ExternalInterface.call("setSWFIsReady");
								}
								else
								{
									this._isEnabled = false;
								}
							}
							this._timer.start();
						}

						public GameError(str:string)
						{
							if(<any>!this._isEnabled || <any>!flash.ExternalInterface.available)
							{
								return ;
							}
							flash.ExternalInterface.call("GameError",str);
						}

						private onMuteOn()
						{
							this.ToggleMute(true);
						}

						private onPauseOff()
						{
							this.TogglePause(false);
						}

						private onPauseOn()
						{
							this.TogglePause(true);
						}

						private onGameMute(str:string)
						{
							this.ToggleMute(this.OnOffAsBoolean(str));
						}

						private ToggleMute(isMuted:boolean)
						{
							if(isMuted)
							{
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.MUTE);
							}
							else
							{
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.UNMUTE);
							}
						}

						private onMuteOff()
						{
							this.ToggleMute(false);
						}

						private onGameContinue(sXML:string = null)
						{
							this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.GAME_CONTINUE);
						}

						public ScoreSubmit()
						{
							if(<any>!this._isEnabled || <any>!flash.ExternalInterface.available)
							{
								return ;
							}
							var xml:any = <any>"<game><score>" + this._score + "</score><time>" + flash.tranint(this._gameTime / 1000) + "</time></game>";
							flash.ExternalInterface.call("ScoreSubmit",xml);
						}

						private DispatchAdEvent(type:string)
						{
							var _self__:any = this;
							var event:com.popcap.flash.framework.ads.AdAPIEvent = new com.popcap.flash.framework.ads.AdAPIEvent(type);
							_self__.dispatchEvent(event);
						}

						public GameReady(mode:number,level:number)
						{
							this._gameTime = 0;
							if(<any>!this._isEnabled || <any>!flash.ExternalInterface.available)
							{
								this._gameTime = 0;
								this._isPlaying = true;
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.GAME_START);
								return ;
							}
							var xml:any = <any>"<data><mode>" + mode + "</mode><startlevel>" + level + "</startlevel></data>";
							flash.ExternalInterface.call("GameReady",xml);
						}

						public SessionReady()
						{
							this._isLoading = false;
							var xml:any = <any>"<data><percentcomplete>" + this._loadPercent + "</percentcomplete></data>";
							if(<any>!this._isEnabled || <any>!flash.ExternalInterface.available)
							{
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.SESSION_START);
								return ;
							}
							flash.ExternalInterface.call("LoadBroadcast",xml);
							flash.ExternalInterface.call("SessionReady","<data></data>");
						}

						public SetLoadPercent(loadPercent:number)
						{
							this._loadPercent = loadPercent < 0?flash.trannumber(0):flash.trannumber(loadPercent);
							this._loadPercent = this._loadPercent > 100?flash.trannumber(100):flash.trannumber(this._loadPercent);
							this._loadPercent = flash.tranint(this._loadPercent);
						}

						private TogglePause(isPaused:boolean)
						{
							if(isPaused)
							{
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.PAUSE);
							}
							else
							{
								this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.UNPAUSE);
							}
						}

						private HandleTimer(e:egret.TimerEvent)
						{
							this.Update();
						}

						private Update()
						{
							var xml:any = null;
							var isLoadBroadcastTime:any = false;
							var isTime:any = false;
							if(<any>!this._isEnabled)
							{
								return ;
							}
							this._updateTime = this._updateTime + com.popcap.flash.framework.ads.MSNAdAPI.MILLIS_PER_UPDATE;
							if(this._isLoading)
							{
								isLoadBroadcastTime = this._updateTime % this._loadBroadcastRate == 0;
								if(isLoadBroadcastTime)
								{
									xml = "<data><percentcomplete>" + this._loadPercent + "</percentcomplete></data>";
									if(flash.ExternalInterface.available)
									{
										flash.ExternalInterface.call("LoadBroadcast",xml);
									}
								}
							}
							if(this._isPlaying)
							{
								this._gameTime = this._gameTime + com.popcap.flash.framework.ads.MSNAdAPI.MILLIS_PER_UPDATE;
								isTime = this._gameTime % this._scoreBroadcastRate == 0;
								if(isTime)
								{
									xml = "<game><score>" + this._score + "</score><time>" + flash.tranint(this._gameTime / 1000) + "</time></game>";
									if(flash.ExternalInterface.available)
									{
										flash.ExternalInterface.call("ScoreBroadcast",xml);
									}
								}
							}
						}

						private onSessionStart()
						{
							this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.SESSION_START);
						}

						private onGameMenu()
						{
							this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.MENU);
						}

						private onGameStart()
						{
							this._gameTime = 0;
							this.DispatchAdEvent(com.popcap.flash.framework.ads.AdAPIEvent.GAME_START);
						}

						public ResumeBroadcast()
						{
							this._isPlaying = true;
						}

						public GameEnd()
						{
							this._isPlaying = false;
							if(<any>!this._isEnabled || <any>!flash.ExternalInterface.available)
							{
								return ;
							}
							flash.ExternalInterface.call("GameEnd","<gamedata></gamedata>");
						}

						public SetScore(score:number)
						{
							this._score = score;
						}

					}
				}
			}
		}
	}
}

com.popcap.flash.framework.ads.MSNAdAPI.DEFAULT_LOAD_BROADCAST_RATE = 3000;
com.popcap.flash.framework.ads.MSNAdAPI.MILLIS_PER_UPDATE = 10;
com.popcap.flash.framework.ads.MSNAdAPI.DEFAULT_SCORE_BROADCAST_RATE = 3000;
com.popcap.flash.framework.ads.MSNAdAPI.MIN_BROADCAST_RATE = 1000;
flash.extendsClass("com.popcap.flash.framework.ads.MSNAdAPI","egret.EventDispatcher")
