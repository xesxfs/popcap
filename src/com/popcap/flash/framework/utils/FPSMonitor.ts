module com {
	export module popcap {
		export module flash {
			export module framework {
				export module utils {
					export class FPSMonitor extends egret.Sprite {
						public static WIDTH:number;
						public static HEIGHT:number;
						public static COLOR_TIME:number;
						public static COLOR_BACKGROUND:number;
						public static COLOR_FPS:number;
						public static MAX_FPS:number;
						private mTime:number = 0;
						private mFPSText:flash.TextField;
						private mMonitor:flash.Bitmap;
						private mLastTime:number = 0;
						private mMonitorData:flash.BitmapData;
						private mFPSTmp:number = NaN;
						private mFPS:number = NaN;
						private mMilliseconds:number = 0;

						public constructor()
						{
							super();
							this.setupUI();
							this.start();
						}

						private start()
						{
							var _self__:any = this;
							this.mMilliseconds = flash.checkInt(egret.getTimer());
							this.mLastTime = flash.checkInt(egret.getTimer());
							this.mFPS = 0;
							this.mFPSTmp = 0;
							_self__.addEventListener(egret.Event.ENTER_FRAME,flash.bind(this.handleFrame,this),null);
						}

						private handleFrame(e:egret.Event)
						{
							if(<any>!this.visible)
							{
								return ;
							}
							this.mTime = flash.checkInt(egret.getTimer() - 1000);
							if(this.mTime > this.mMilliseconds)
							{
								this.mFPS = this.mFPSTmp + this.mFPSTmp * 0.001 * (this.mTime - this.mMilliseconds);
								this.mMilliseconds = flash.checkInt(egret.getTimer());
								this.mFPSTmp = 0;
							}
							else
							{
								this.mFPSTmp++;
							}
							var elapsed:number = flash.checkInt(egret.getTimer() - this.mLastTime);
							var fpsCapped:number = flash.checkInt(Math.min(com.popcap.flash.framework.utils.FPSMonitor.HEIGHT,flash.tranint(this.mFPS / com.popcap.flash.framework.utils.FPSMonitor.MAX_FPS * com.popcap.flash.framework.utils.FPSMonitor.HEIGHT)));
							var timeCapped:number = flash.checkInt(Math.min(com.popcap.flash.framework.utils.FPSMonitor.HEIGHT,flash.tranint(elapsed / 100 * com.popcap.flash.framework.utils.FPSMonitor.HEIGHT)));
							this.mMonitorData["scroll"](1,0);
							this.mMonitorData["setPixel32"](1,com.popcap.flash.framework.utils.FPSMonitor.HEIGHT - fpsCapped,com.popcap.flash.framework.utils.FPSMonitor.COLOR_FPS);
							this.mMonitorData["setPixel32"](1,com.popcap.flash.framework.utils.FPSMonitor.HEIGHT - timeCapped,com.popcap.flash.framework.utils.FPSMonitor.COLOR_TIME);
							this.mFPSText.text = "FPS: " + this.mFPS;
							this.mLastTime = flash.checkInt(egret.getTimer());
						}

						private setupUI()
						{
							var _self__:any = this;
							this.mMonitorData = new flash.BitmapData(com.popcap.flash.framework.utils.FPSMonitor.WIDTH,com.popcap.flash.framework.utils.FPSMonitor.HEIGHT,true,com.popcap.flash.framework.utils.FPSMonitor.COLOR_BACKGROUND);
							this.mMonitor = new flash.Bitmap(this.mMonitorData);
							var format:flash.TextFormat = new flash.TextFormat();
							format.color = 4294967295;
							format.font = "Verdana";
							format.size = 10;
							format.bold = true;
							this.mFPSText = new flash.TextField();
							this.mFPSText.defaultTextFormat = format;
							this.mFPSText.textAlign = "left";
							this.mFPSText["selectable"] = false;
							_self__.addChild(this.mMonitor);
							_self__.addChild(this.mFPSText);
						}

					}
				}
			}
		}
	}
}

com.popcap.flash.framework.utils.FPSMonitor.WIDTH = 100;
com.popcap.flash.framework.utils.FPSMonitor.HEIGHT = 100;
com.popcap.flash.framework.utils.FPSMonitor.COLOR_TIME = 4294967040;
com.popcap.flash.framework.utils.FPSMonitor.COLOR_BACKGROUND = 4278190080;
com.popcap.flash.framework.utils.FPSMonitor.COLOR_FPS = 4294902015;
com.popcap.flash.framework.utils.FPSMonitor.MAX_FPS = 120;
flash.extendsClass("com.popcap.flash.framework.utils.FPSMonitor","egret.Sprite")
