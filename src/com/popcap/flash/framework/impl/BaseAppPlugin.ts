module com {
	export module popcap {
		export module flash {
			export module framework {
				export module impl {
					export class BaseAppPlugin extends egret.HashObject implements com.popcap.flash.framework.IAppPlugin {
						private mContext:com.popcap.flash.framework.impl.BaseAppPluginContext;
						private mLoader:flash.Loader;
						private mProperties:flash.XML;
						private mLoaded:boolean = false;
						private mApp:com.popcap.flash.framework.BaseApp;
						private mActivator:com.popcap.flash.framework.IAppPluginActivator;

						public constructor(app:com.popcap.flash.framework.BaseApp,properties:flash.XML)
						{
							super();
							super();
							this.mApp = app;
							this.mLoader = new flash.Loader();
							var info:flash.LoaderInfo = this.mLoader.contentLoaderInfo;
							info.addEventListener(egret.IOErrorEvent.IO_ERROR,flash.bind(this.handleLoadFailure,this),null);
							info.addEventListener(egret.Event.COMPLETE,flash.bind(this.handleLoadSuccess,this),null);
							this.mProperties = properties;
						}

						public load()
						{
							var url:egret.URLRequest = new egret.URLRequest(this.mProperties.dotAlt("source"));
							this.mLoader.load(url);
						}

						public getProperties():flash.XML
						{
							return this.mProperties;
						}

						private handleLoadSuccess(e:egret.Event)
						{
							var loader:flash.LoaderInfo = flash.As3As(e.target,flash.LoaderInfo);
							this.mContext = new com.popcap.flash.framework.impl.BaseAppPluginContext(this.mApp,this);
							this.mActivator = <com.popcap.flash.framework.IAppPluginActivator>flash.As3As(loader.content,null,"com.popcap.flash.framework.IAppPluginActivator");
							this.mActivator.start(this.mContext);
							this.mLoaded = true;
						}

						public isLoaded():boolean
						{
							return this.mLoaded;
						}

						private handleLoadFailure(e:flash.IOErrorEvent)
						{
							this.mLoaded = true;
						}

					}
				}
			}
		}
	}
}

flash.implementsClass("com.popcap.flash.framework.impl.BaseAppPlugin",["com.popcap.flash.framework.IAppPlugin"]);