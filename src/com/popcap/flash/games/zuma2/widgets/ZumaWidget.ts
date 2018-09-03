module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module widgets {
						export class ZumaWidget extends com.popcap.flash.framework.widgets.WidgetContainer implements com.popcap.flash.framework.widgets.Widget {
							public game:com.popcap.flash.games.zuma2.widgets.GameWidget;

							public constructor(app:Zuma2App)
							{
								super();
								this.game = new com.popcap.flash.games.zuma2.widgets.GameWidget(app);
								addChild(this.game);
							}

							public onKeyDown(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
								for(var i:number = flash.checkInt(0);i < mChildren.length; i++)
								{
									mChildren[i].onKeyDown(keyCode);
								}
							}

							public onKeyUp(keyCode:number)
							{
								keyCode = flash.checkInt(keyCode);
								for(var i:number = flash.checkInt(0);i < mChildren.length; i++)
								{
									mChildren[i].onKeyUp(keyCode);
								}
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.widgets.ZumaWidget","com.popcap.flash.framework.widgets.WidgetContainer")
flash.implementsClass("com.popcap.flash.games.zuma2.widgets.ZumaWidget",["com.popcap.flash.framework.widgets.Widget"]);