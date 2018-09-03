module com {
	export module popcap {
		export module flash {
			export module framework {
				export interface IAppService {
					getImplementation():any;
					getProperties():flash.XML;
					getPlugin():com.popcap.flash.framework.IAppPlugin;
				}
			}
		}
	}
}

