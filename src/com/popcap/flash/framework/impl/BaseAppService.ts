module com {
	export module popcap {
		export module flash {
			export module framework {
				export module impl {
					export class BaseAppService extends egret.HashObject implements com.popcap.flash.framework.IAppService {
						private mProperties:flash.XML;
						private mPlugin:com.popcap.flash.framework.impl.BaseAppPlugin;
						private mImpl:any;

						public constructor(impl:any,props:flash.XML,plugin:com.popcap.flash.framework.impl.BaseAppPlugin)
						{
							super();
							super();
							this.mImpl = impl;
							this.mProperties = props;
							this.mPlugin = plugin;
						}

						public getProperties():flash.XML
						{
							return this.mProperties;
						}

						public getImplementation():any
						{
							return this.mImpl;
						}

						public getPlugin():com.popcap.flash.framework.IAppPlugin
						{
							return this.mPlugin;
						}

					}
				}
			}
		}
	}
}

flash.implementsClass("com.popcap.flash.framework.impl.BaseAppService",["com.popcap.flash.framework.IAppService"]);