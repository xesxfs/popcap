module com {
	export module popcap {
		export module flash {
			export module framework {
				export class BaseApp extends egret.Sprite implements com.popcap.flash.framework.IApp {
					public static SHIFT_FLAG:number;
					public static ALT_FLAG:number;
					public static MILLIS_PER_UPDATE:number;
					public static CONTROL_FLAG:number;
					private _FPS:number = 1000.0;
					private _state:com.popcap.flash.framework.IAppState = null;
					private _fixedUpdates:Array<any>;
					private _commandBindings:flash.Dictionary;
					private _mouseDownPos:egret.Point;
					private _paused:boolean = false;
					private _dataXML:flash.XML = null;
					private _updateBuffer:number = 0;
					private _mousePos:egret.Point;
					private _servicesMap:flash.Dictionary;
					private _plugins:Array<com.popcap.flash.framework.IAppPlugin>;
					private _lastTime:number = 0;
					private _commands:flash.Dictionary;
					private _mouseDown:boolean = false;
					private _dataCallback:Function = null;

					public constructor()
					{
						super();
						this._mousePos = new egret.Point();
						this._mouseDownPos = new egret.Point();
						this._commands = new flash.Dictionary();
						this._commandBindings = new flash.Dictionary();
						this._fixedUpdates = [];
					}

					private HandleFrame(e:egret.Event)
					{
						var thisTime:number = flash.checkInt(egret.getTimer());
						var elapsed:number = flash.checkInt(thisTime - this._lastTime);
						this._lastTime = flash.checkInt(thisTime);
						if(<any>!this._paused)
						{
							this._updateBuffer = flash.checkInt(this._updateBuffer + elapsed);
							while(this._updateBuffer >= com.popcap.flash.framework.BaseApp.MILLIS_PER_UPDATE)
							{
								this.doFixedUpdate();
								this._updateBuffer = flash.checkInt(this._updateBuffer - com.popcap.flash.framework.BaseApp.MILLIS_PER_UPDATE);
							}
						}
						this.doVariableUpdate(elapsed);
					}

					private HandleMouseDown(e:flash.MouseEvent)
					{
						this._mousePos.x = e.stageX;
						this._mousePos.y = e.stageY;
						this._mouseDown = true;
						this._mouseDownPos.x = e.stageX;
						this._mouseDownPos.y = e.stageY;
						if(this._state != null)
						{
							this._state.onMouseDown(e.stageX,e.stageY);
						}
					}

					public RegisterCommand(command:string,callback:Function)
					{
						this._commands.setItem(command,callback);
					}

					public GetProperties():flash.XML
					{
						return this._dataXML;
					}

					private HandleDataSuccess(e:egret.Event)
					{
						var properties:flash.XML = <any>null;
						var plugin:com.popcap.flash.framework.impl.BaseAppPlugin = <any>null;
						var bind:flash.XML = <any>null;
						var command:string = <any>null;
						var keyCombo:string = <any>null;
						var loader:egret.URLLoader = flash.As3As(e.target,egret.URLLoader);
						loader.removeEventListener(egret.Event.COMPLETE,flash.bind(this.HandleDataSuccess,this),null);
						var xml:flash.XML = new flash.XML(e.target["data"]);
						this._dataXML = xml;
						var len:number = flash.checkInt(xml.dot("plugins").dot("plugin").length());
						for(var i:number = flash.checkInt(0);i < len; i++)
						{
							properties = xml.dot("plugins").dot("plugin").dot(i);
							plugin = new com.popcap.flash.framework.impl.BaseAppPlugin(this,properties);
						}
						var numBindings:number = flash.checkInt(xml.dot("commands").dot("bind").length());
						for(i = flash.checkInt(0); i < numBindings; i++)
						{
							bind = xml.dot("commands").dot("bind").dot(i);
							command = bind.toString();
							keyCombo = bind.dotAlt("keyCombo");
							this.BindCommand(command,keyCombo);
						}
						if(this._dataCallback != null)
						{
							this._dataCallback(true);
						}
					}

					public registerService(plugin:com.popcap.flash.framework.impl.BaseAppPlugin,ids:Array<string>,impl:any,properties:flash.XML):com.popcap.flash.framework.IAppService
					{
						var id:string = <any>null;
						var list:Array<com.popcap.flash.framework.impl.BaseAppService> = <any>null;
						var service:com.popcap.flash.framework.impl.BaseAppService = new com.popcap.flash.framework.impl.BaseAppService(impl,properties,plugin);
						var id_key_a;
						for(id_key_a in ids)
						{
							id = ids[id_key_a];
							list = this._servicesMap.getItem(id);
							if(list == null)
							{
								list = new Array<com.popcap.flash.framework.impl.BaseAppService>();
								this._servicesMap.setItem(id,list);
							}
							list.push(service);
						}
						return service;
					}

					private HandleDataFailure(e:flash.IOErrorEvent)
					{
						var loader:egret.URLLoader = flash.As3As(e.target,egret.URLLoader);
						loader.removeEventListener(egret.Event.COMPLETE,flash.bind(this.HandleDataSuccess,this),null);
						if(this._dataCallback != null)
						{
							this._dataCallback(false);
						}
					}

					public Stop()
					{
						this._state = null;
					}

					public SetVersionDisplay(versionString:string)
					{
						var menu:flash.ContextMenu = new flash.ContextMenu();
						menu["hideBuiltInItems"]();
						var versionItem:flash.ContextMenuItem = new flash.ContextMenuItem(versionString);
						menu.customItems.push(versionItem);
						this.contextMenu = menu;
					}

					public BindCommand(command:string,keyCombo:string)
					{
						var piece:string = <any>null;
						var matcher:string = <any>null;
						var code:number = flash.checkInt(com.popcap.flash.framework.input.keyboard.KeyCode.GetCodeFromString(keyCombo));
						if(code > 0)
						{
							this._commandBindings.setItem(code << 3,command);
							return ;
						}
						var pieces:Array<any> = keyCombo.split("+");
						var modifiers:any = 0;
						var piece_key_a;
						for(piece_key_a in pieces)
						{
							piece = pieces[piece_key_a];
							matcher = piece.toUpperCase();
							if(matcher == "CONTROL")
							{
								modifiers = modifiers | com.popcap.flash.framework.BaseApp.CONTROL_FLAG;
							}
							else if(matcher == "ALT")
							{
								modifiers = modifiers | com.popcap.flash.framework.BaseApp.ALT_FLAG;
							}
							else if(matcher == "SHIFT")
							{
								modifiers = modifiers | com.popcap.flash.framework.BaseApp.SHIFT_FLAG;
							}
							else
							{
								code = flash.checkInt(com.popcap.flash.framework.input.keyboard.KeyCode.GetCodeFromString(matcher));
								if(code == 0)
								{
									return ;
								}
							}
						}
						this._commandBindings.setItem(code << 3 | modifiers,command);
					}

					private HandleMouseUp(e:flash.MouseEvent)
					{
						this._mouseDown = false;
						if(this._state != null)
						{
							this._state.onMouseUp(e.stageX,e.stageY);
						}
					}

					private HandleKeyDown(e:flash.KeyboardEvent)
					{
						var code:any = 0;
						var key:string = <any>null;
						var command:Function = <any>null;
						var props:flash.XML = this.GetProperties();
						var commandsEnabled:boolean = props != null && com.popcap.flash.framework.AppUtils.asBoolean(props.dot("commands").dot("enabled"));
						if(commandsEnabled)
						{
							code = e.keyCode << 3;
							if(e.ctrlKey)
							{
								code = code | com.popcap.flash.framework.BaseApp.CONTROL_FLAG;
							}
							if(e.altKey)
							{
								code = code | com.popcap.flash.framework.BaseApp.ALT_FLAG;
							}
							if(e.shiftKey)
							{
								code = code | com.popcap.flash.framework.BaseApp.SHIFT_FLAG;
							}
							key = this._commandBindings.getItem(code);
							if(key != null)
							{
								command = this._commands.getItem(key);
								if(command != null)
								{
									command();
								}
							}
						}
						if(this._state != null)
						{
							this._state.onKeyDown(e.keyCode);
						}
					}

					private ResumeUpdates(args:Array<any> = null)
					{
						this._paused = false;
					}

					private StepUpdates(args:Array<any> = null)
					{
						this._paused = true;
						this.doFixedUpdate();
					}

					private HandleMouseMove(e:flash.MouseEvent)
					{
						this._mousePos.x = e.stageX;
						this._mousePos.y = e.stageY;
						if(this._state != null)
						{
							this._state.onMouseMove(e.stageX,e.stageY);
						}
					}

					public getStage():egret.Stage
					{
						return this.stage;
					}

					public Start(state:com.popcap.flash.framework.IAppState)
					{
						this._state = state;
						if(this._state == null)
						{
							return ;
						}
						this.stage.addEventListener(egret.TouchEvent.TOUCH_END,flash.bind(this.HandleMouseUp,this),null);
						this.stage.addEventListener(egret.TouchEvent.TOUCH_BEGIN,flash.bind(this.HandleMouseDown,this),null);
						this.stage.addEventListener(egret.TouchEvent.TOUCH_MOVE,flash.bind(this.HandleMouseMove,this),null);
						this.stage.addEventListener(flash.KeyboardEvent.KEY_UP,flash.bind(this.HandleKeyUp,this),null);
						this.stage.addEventListener(flash.KeyboardEvent.KEY_DOWN,flash.bind(this.HandleKeyDown,this),null);
						this._state.onEnter();
						this._lastTime = flash.checkInt(egret.getTimer());
						this.stage.addEventListener(egret.Event.ENTER_FRAME,flash.bind(this.HandleFrame,this),null);
					}

					private doVariableUpdate(elapsed:number)
					{
						elapsed = flash.checkInt(elapsed);
						if(this._state != null)
						{
							this._state.draw(elapsed);
						}
					}

					private doFixedUpdate()
					{
						var handler:Function = <any>null;
						if(this._state != null)
						{
							this._state.update();
						}
						var numHandlers:number = flash.checkInt(this._fixedUpdates.length);
						for(var i:number = flash.checkInt(0);i < numHandlers; i++)
						{
							handler = this._fixedUpdates[i];
							handler();
						}
					}

					public getServices(id:string):Array<com.popcap.flash.framework.IAppService>
					{
						var list:Array<com.popcap.flash.framework.IAppService> = <any>this._servicesMap.getItem(id);
						if(list == null)
						{
							list = new Array<com.popcap.flash.framework.impl.BaseAppService>();
							this._servicesMap.setItem(id,list);
						}
						return list;
					}

					public OnFixedUpdate(handler:Function)
					{
						this._fixedUpdates.push(handler);
					}

					public get fps():number
					{
						return this._FPS;
					}

					public getPlugins():Array<com.popcap.flash.framework.IAppPlugin>
					{
						return this._plugins;
					}

					public LoadData(pathPrefix:string,callback:Function = null)
					{
						this._servicesMap = new flash.Dictionary(false);
						this._plugins = new Array<com.popcap.flash.framework.IAppPlugin>();
						this._dataCallback = callback;
						this.RegisterCommand("StepUpdates",flash.bind(this.StepUpdates,this));
						this.RegisterCommand("ResumeUpdates",flash.bind(this.ResumeUpdates,this));
						var loader:egret.URLLoader = new egret.URLLoader();
						var dataURL:egret.URLRequest = new egret.URLRequest(pathPrefix + "data.xml");
						loader.addEventListener(egret.Event.COMPLETE,flash.bind(this.HandleDataSuccess,this),null);
						loader.addEventListener(egret.IOErrorEvent.IO_ERROR,flash.bind(this.HandleDataFailure,this),null);
						loader.load(dataURL);
					}

					public isPaused():boolean
					{
						return this._paused;
					}

					private HandleKeyUp(e:flash.KeyboardEvent)
					{
						if(this._state != null)
						{
							this._state.onKeyUp(e.keyCode);
						}
					}

				}
			}
		}
	}
}

com.popcap.flash.framework.BaseApp.SHIFT_FLAG = 4;
com.popcap.flash.framework.BaseApp.ALT_FLAG = 2;
com.popcap.flash.framework.BaseApp.MILLIS_PER_UPDATE = 10;
com.popcap.flash.framework.BaseApp.CONTROL_FLAG = 1;
flash.extendsClass("com.popcap.flash.framework.BaseApp","egret.Sprite")
flash.implementsClass("com.popcap.flash.framework.BaseApp",["com.popcap.flash.framework.IApp"]);