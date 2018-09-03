module com {
	export module popcap {
		export module flash {
			export module framework {
				export module impl {
					export class BaseAppPluginContext extends egret.HashObject implements com.popcap.flash.framework.IAppPluginContext {
						private mPlugin:com.popcap.flash.framework.impl.BaseAppPlugin;
						private mApp:com.popcap.flash.framework.BaseApp;

						public constructor(app:com.popcap.flash.framework.BaseApp,plugin:com.popcap.flash.framework.impl.BaseAppPlugin)
						{
							super();
							super();
							this.mApp = app;
							this.mPlugin = plugin;
						}

						public getPlugins():Array<com.popcap.flash.framework.IAppPlugin>
						{
							return this.mApp.getPlugins();
						}

						public hasEventListener(type:string):boolean
						{
							return this.mApp.hasEventListener(type);
						}

						public willTrigger(type:string):boolean
						{
							return this.mApp.willTrigger(type);
						}

						public getPlugin():com.popcap.flash.framework.IAppPlugin
						{
							return this.mPlugin;
						}

						public removeEventListener(type:string,listener:Function,thisObject:any,useCapture:boolean = false)
						{
							this.mApp.removeEventListener(type,listener,null,useCapture);
						}

						public getServices(id:string):Array<com.popcap.flash.framework.IAppService>
						{
							return this.mApp.getServices(id);
						}

						public registerService(ids:Array<string>,service:any,properties:flash.XML):com.popcap.flash.framework.IAppService
						{
							return this.mApp.registerService(this.mPlugin,ids,service,properties);
						}

						public dispatchEvent(event:egret.Event):boolean
						{
							return this.mApp.dispatchEvent(event);
						}

						public addEventListener(type:string,listener:Function,thisObject:any,useCapture:boolean = false,priority:number = 0,useWeakReference:boolean = false)
						{
							this.mApp.addEventListener(type,listener,null,useCapture,priority);
						}

					}
				}
			}
		}
	}
}

flash.implementsClass("com.popcap.flash.framework.impl.BaseAppPluginContext",["com.popcap.flash.framework.IAppPluginContext"]);