module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module states {
						export class PlayLevelState extends egret.Sprite implements com.popcap.flash.framework.IAppState {
							private mStateMachine:com.popcap.flash.framework.BaseAppStateMachine;
							private mApp:Zuma2App;

							public constructor(app:Zuma2App)
							{
								super();
								this.mApp = app;
								this.mStateMachine = new BaseAppStateMachine();
							}

							public onEnter()
							{
							}

							public onMouseUp(x:number,y:number)
							{
							}

							public draw(elapsed:number)
							{
								elapsed = flash.checkInt(elapsed);
							}

							public onMouseDown(x:number,y:number)
							{
							}

							public onPop()
							{
							}

							public update()
							{
							}

							public onKeyDown(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
							}

							public onPush()
							{
							}

							public onExit()
							{
							}

							public onKeyUp(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
							}

							public onMouseMove(x:number,y:number)
							{
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.states.PlayLevelState","egret.Sprite")
flash.implementsClass("com.popcap.flash.games.zuma2.states.PlayLevelState",["com.popcap.flash.framework.IAppState"]);