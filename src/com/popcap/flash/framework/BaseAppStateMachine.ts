module com {
	export module popcap {
		export module flash {
			export module framework {
				export class BaseAppStateMachine extends egret.EventDispatcher implements com.popcap.flash.framework.IAppStateMachine,egret.IEventDispatcher {
					private mState:com.popcap.flash.framework.IAppState;
					private mStates:flash.Dictionary;
					private mStack:Array<com.popcap.flash.framework.IAppState>;

					public constructor()
					{
						super();
						this.mStates = new flash.Dictionary();
						this.mStack = new Array<com.popcap.flash.framework.IAppState>();
					}

					public popState(id:string)
					{
						var newState:com.popcap.flash.framework.IAppState = <any>null;
						if(this.mStack.length == 0)
						{
							return ;
						}
						var oldState:com.popcap.flash.framework.IAppState = <com.popcap.flash.framework.IAppState>flash.As3As(this.mStack.pop(),null,"com.popcap.flash.framework.IAppState");
						oldState.onExit();
						if(this.mStack.length > 0)
						{
							newState = <com.popcap.flash.framework.IAppState>flash.As3As(this.mStack[this.mStack.length - 1],null,"com.popcap.flash.framework.IAppState");
							this.mState = newState;
							newState.onPop();
						}
					}

					public bindState(id:string,state:com.popcap.flash.framework.IAppState)
					{
						this.mStates.setItem(id,state);
					}

					public getCurrentState():com.popcap.flash.framework.IAppState
					{
						return this.mState;
					}

					public pushState(id:string)
					{
						var oldState:com.popcap.flash.framework.IAppState = <any>null;
						var newState:com.popcap.flash.framework.IAppState = <com.popcap.flash.framework.IAppState>flash.As3As(this.mStates.getItem(id),null,"com.popcap.flash.framework.IAppState");
						if(newState == null)
						{
							throw new flash.ArgumentError("ID " + id + " is unbound, cannot push onto stack.").message;
						}
						if(this.mStack.length > 0)
						{
							oldState = <com.popcap.flash.framework.IAppState>flash.As3As(this.mStack[this.mStack.length - 1],null,"com.popcap.flash.framework.IAppState");
							oldState.onPush();
						}
						this.mStack.push(newState);
						this.mState = newState;
						newState.onEnter();
					}

					public switchState(id:string)
					{
						var state:com.popcap.flash.framework.IAppState = <any>null;
						var newState:com.popcap.flash.framework.IAppState = <com.popcap.flash.framework.IAppState>flash.As3As(this.mStates.getItem(id),null,"com.popcap.flash.framework.IAppState");
						if(newState == null)
						{
							throw new flash.ArgumentError("ID " + id + " is unbound, cannot change states.").message;
						}
						var aNumStates:number = flash.checkInt(this.mStack.length);
						for(var i:number = flash.checkInt(aNumStates - 1);i >= 0; i--)
						{
							state = <com.popcap.flash.framework.IAppState>flash.As3As(this.mStack[i],null,"com.popcap.flash.framework.IAppState");
							state.onExit();
						}
						this.mStack.length = 0;
						this.mStack.push(newState);
						this.mState = newState;
						newState.onEnter();
					}

	public once(type: string, listener: Function, thisObject: any, useCapture?: boolean, priority?: number): void{
	}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.framework.BaseAppStateMachine","egret.EventDispatcher")
flash.implementsClass("com.popcap.flash.framework.BaseAppStateMachine",["com.popcap.flash.framework.IAppStateMachine","egret.IEventDispatcher"]);