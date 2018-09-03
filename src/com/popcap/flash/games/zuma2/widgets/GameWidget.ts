module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module widgets {
						export class GameWidget extends com.popcap.flash.framework.widgets.WidgetContainer implements com.popcap.flash.framework.widgets.Widget {
							public board:GameBoardWidget;
							public mIsInited:boolean = false;
							public mApp:Zuma2App;
							public menu:com.popcap.flash.games.zuma2.logic.MainMenu;

							public constructor(app:Zuma2App)
							{
								super();
								this.mApp = app;
								this.mIsInited = false;
							}

							public onKeyUp(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
								for(var i:number = flash.checkInt(0);i < mChildren.length; i++)
								{
									mChildren[i].onKeyUp(keyCode);
								}
							}

							public Reset()
							{
								this.mApp["mLevelMgr"] = new LevelMgr(this.mApp);
								this.mApp["mLevelMgr"].LoadXML("levels.xml");
							}

							public init()
							{
								this.mIsInited = true;
								this.ShowMainMenu();
							}

							public onKeyDown(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
								for(var i:number = flash.checkInt(0);i < mChildren.length; i++)
								{
									mChildren[i].onKeyDown(keyCode);
								}
							}

							public StartNewGame()
							{
								this.mApp["gAddBalls"] = true;
								this.mApp["gDieAtEnd"] = true;
								this.mApp["gSuckMode"] = false;
								this.mApp["gUpdateBalls"] = true;
								this.mApp["gForceFruit"] = false;
								this.board = new GameBoardWidget(this.mApp);
								this.board["mGauntletMode"] = false;
								addChild(this.board);
							}

							public ShowMainMenu()
							{
								if(this.board != null)
								{
									this.board["ClearAll"]();
									removeChild(this.board);
									this.board = null;
								}
								this.menu = new MainMenu(this.mApp,this);
								if(this.mApp["mAdAPI"]._isEnabled)
								{
									this.mApp["mAdAPI"].PauseBroadcast();
								}
							}

							public CloseMainMenu()
							{
								this.menu = null;
							}

							public update()
							{
								if(<any>!this.mIsInited)
								{
									this.init();
								}
								if(this.mApp["mLevelMgr"] != null)
								{
									if(this.mApp["mLevelMgr"].mReady)
									{
										super["update"]();
									}
								}
							}

							public ShowHighScore()
							{
								if(this.board != null)
								{
									this.board["ClearAll"]();
									removeChild(this.board);
									this.board = null;
								}
								this.menu = new MainMenu(this.mApp,this);
								this.menu["handleHighscores"](new flash.MouseEvent(egret.TouchEvent.TOUCH_TAP));
								if(this.mApp["mAdAPI"]._isEnabled)
								{
									this.mApp["mAdAPI"].PauseBroadcast();
								}
							}

							public Clear()
							{
								for(var i:number = flash.checkInt(0);i < this.mApp["mLayers"].length; i++)
								{
									this.mApp["mLayers"][i].Clear();
								}
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.widgets.GameWidget","com.popcap.flash.framework.widgets.WidgetContainer")
flash.implementsClass("com.popcap.flash.games.zuma2.widgets.GameWidget",["com.popcap.flash.framework.widgets.Widget"]);