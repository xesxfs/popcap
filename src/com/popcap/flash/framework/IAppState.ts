module com {
	export module popcap {
		export module flash {
			export module framework {
				export interface IAppState extends egret.IEventDispatcher {
					onEnter();
					onMouseUp(param1:number,param2:number);
					onKeyDown(param1:number);
					draw(param1:number);
					onMouseDown(param1:number,param2:number);
					update();
					onPop();
					onMouseMove(param1:number,param2:number);
					onPush();
					onKeyUp(param1:number);
					onExit();
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.framework.IAppState","egret.IEventDispatcher")
