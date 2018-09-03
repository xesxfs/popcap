module com {
	export module popcap {
		export module flash {
			export module framework {
				export module widgets {
					export interface Widget {
						onMouseDown(param1:number,param2:number);
						onMouseUp(param1:number,param2:number);
						onKeyDown(param1:number);
						draw(param1:com.popcap.flash.framework.Canvas);
						isVisible:boolean;
						update();
						onMouseOut(param1:number,param2:number);
						isEnabled:boolean;
						x:number;
						y:number;
						onMouseOver(param1:number,param2:number);
						onKeyUp(param1:number);
						onMouseMove(param1:number,param2:number);
						contains(param1:number,param2:number):boolean;
					}
				}
			}
		}
	}
}

