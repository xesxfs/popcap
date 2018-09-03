module com {
	export module popcap {
		export module flash {
			export module framework {
				export interface IAppPluginContext extends egret.IEventDispatcher {
					getPlugin():com.popcap.flash.framework.IAppPlugin;
					getPlugins():Array<com.popcap.flash.framework.IAppPlugin>;
					registerService(param1:Array<string>,param2:any,param3:flash.XML):com.popcap.flash.framework.IAppService;
					getServices(param1:string):Array<com.popcap.flash.framework.IAppService>;
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.framework.IAppPluginContext","egret.IEventDispatcher")
