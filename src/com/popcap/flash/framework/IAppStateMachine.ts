module com {
	export module popcap {
		export module flash {
			export module framework {
				export interface IAppStateMachine {
					popState(param1:string);
					bindState(param1:string,param2:com.popcap.flash.framework.IAppState);
					pushState(param1:string);
					switchState(param1:string);
					getCurrentState():com.popcap.flash.framework.IAppState;
				}
			}
		}
	}
}

