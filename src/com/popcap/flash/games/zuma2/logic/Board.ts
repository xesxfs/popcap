module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Board extends com.popcap.flash.framework.widgets.WidgetContainer implements com.popcap.flash.framework.widgets.Widget {
							public mBulletList:de.polygonal.ds.DLinkedList;
							public mGameState:number = 0;
							public mLevel:com.popcap.flash.games.zuma2.logic.Level;
							public mLives:number = 0;
							public mScore:number = 0;
							public mAdventureMode:boolean = false;
							public mLevelNum:number = 0;
							public mFrog:com.popcap.flash.games.zuma2.logic.Gun;
							private mApp:Zuma2App;

							public constructor(app:Zuma2App)
							{
								super();
								this.mApp = app;
							}

							public draw(canvas:com.popcap.flash.framework.Canvas)
							{
							}

							public update()
							{
							}

							public StartLevel(level_id:string)
							{
								this.SetupTunnels(this.mLevel);
								this.mLevel.StartLevel();
								this.mLevel.SetFrog(this.mFrog);
							}

							public SetupTunnels(level:com.popcap.flash.games.zuma2.logic.Level)
							{
							}

							public onMouseMove(x:number,y:number)
							{
								this.UpdateGunPos(x,y);
							}

							public UpdateGunPos(x:number,y:number)
							{
								var cx:number = flash.checkInt(this.mFrog.GetCenterX());
								var cy:number = flash.checkInt(this.mFrog.GetCenterY());
								var dx:number = flash.checkInt(x - cx);
								var dy:number = flash.checkInt(cy - y);
								var rad:number = Math.atan2(dy,dx) + Math.PI / 2;
								this.mFrog.SetDestAngle(rad);
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.logic.Board","com.popcap.flash.framework.widgets.WidgetContainer")
flash.implementsClass("com.popcap.flash.games.zuma2.logic.Board",["com.popcap.flash.framework.widgets.Widget"]);