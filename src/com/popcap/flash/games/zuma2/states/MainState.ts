module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module states {
						export class MainState extends egret.Sprite implements com.popcap.flash.framework.IAppState {
							public static STATE_TITLE_SCREEN:string;
							public static STATE_LEVEL_INTRO:string;
							public static STATE_MAIN_MENU:string;
							public static STATE_LOADING:string;
							public static STATE_PLAY_LEVEL:string;
							private mStateMachine:com.popcap.flash.framework.BaseAppStateMachine;
							private mPlayState:com.popcap.flash.games.zuma2.states.PlayLevelState;
							private mApp:Zuma2App;
							public mPaused:boolean = false;

							public constructor(app:Zuma2App)
							{
								super();
								this.mApp = app;
								this.mPaused = false;
								this.mPlayState = new com.popcap.flash.games.zuma2.states.PlayLevelState(app);
								this.mStateMachine = new BaseAppStateMachine();
								this.mApp["mAdAPI"].addEventListener(AdAPIEvent.PAUSE,flash.bind(this.handlePause,this));
								this.mApp["mAdAPI"].addEventListener(AdAPIEvent.UNPAUSE,flash.bind(this.handleUnpause,this));
							}

							public onMouseUp(x:number,y:number)
							{
								this.mApp["widgets"].onMouseUp(x,y);
							}

							public togglePause(paused:boolean)
							{
								this.mPaused = paused;
							}

							public draw(elapsed:number)
							{
								elapsed = flash.checkInt(elapsed);
								if(this.mPaused)
								{
									return ;
								}
								this.mApp["widgets"].draw(this.mApp["canvas"]);
							}

							public onEnter()
							{
							}

							public update()
							{
								if(this.mPaused)
								{
									return ;
								}
								this.mApp["widgets"].update();
							}

							public onKeyUp(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
								this.mApp["widgets"].onKeyUp(keyCode);
							}

							public onMouseDown(x:number,y:number)
							{
								this.mApp["widgets"].onMouseDown(x,y);
							}

							public onKeyDown(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
								this.mApp["widgets"].onKeyDown(keyCode);
							}

							public onPush()
							{
							}

							public onExit()
							{
							}

							public handlePause(e:com.popcap.flash.framework.ads.AdAPIEvent)
							{
								this.togglePause(true);
								this.mApp["soundManager"].mute();
							}

							public onPop()
							{
							}

							public handleUnpause(e:com.popcap.flash.framework.ads.AdAPIEvent)
							{
								this.togglePause(false);
								this.mApp["soundManager"].unmute();
							}

							public onMouseMove(x:number,y:number)
							{
								this.mApp["widgets"].onMouseMove(x,y);
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.states.MainState.STATE_TITLE_SCREEN = "TitleScreen";
com.popcap.flash.games.zuma2.states.MainState.STATE_LEVEL_INTRO = "LevelIntro";
com.popcap.flash.games.zuma2.states.MainState.STATE_MAIN_MENU = "MainMenu";
com.popcap.flash.games.zuma2.states.MainState.STATE_LOADING = "Loading";
com.popcap.flash.games.zuma2.states.MainState.STATE_PLAY_LEVEL = "PlayLevel";
flash.extendsClass("com.popcap.flash.games.zuma2.states.MainState","egret.Sprite")
flash.implementsClass("com.popcap.flash.games.zuma2.states.MainState",["com.popcap.flash.framework.IAppState"]);