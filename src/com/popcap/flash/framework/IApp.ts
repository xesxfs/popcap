module com {
	export module popcap {
		export module flash {
			export module framework {
				export interface IApp {
					isPaused():boolean;
					RegisterCommand(param1:string,param2:Function);
					BindCommand(param1:string,param2:string);
					getStage():egret.Stage;
				}
			}
		}
	}
}

