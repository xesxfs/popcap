module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class TimerBar extends egret.HashObject {
							public static GAME_TIME:number;
							public static BAR_WIDTH:number;
							public mTimerBarSprite:egret.Sprite;
							public mTimerBarEmptyBitmap:flash.Bitmap;
							public mTimerText:string;
							public mTimerNumber:number = 0;
							public mTimerBarFillBitmap:flash.Bitmap;
							public mTextFormat:flash.TextFormat;
							public mApp:Zuma2App;
							public mTimerTextField:flash.TextField;
							public mTimerBarMask:egret.Sprite;
							public mInited:boolean = false;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mApp = app;
							}

							public Draw()
							{
								var barPct:number = this.mTimerNumber / com.popcap.flash.games.zuma2.logic.TimerBar.GAME_TIME;
								var maskWidth:number = barPct * com.popcap.flash.games.zuma2.logic.TimerBar.BAR_WIDTH;
								this.mTimerBarMask.width = maskWidth;
								this.mTimerBarFillBitmap.mask = this.mTimerBarMask;
							}

							public Update()
							{
								if(<any>!this.mInited)
								{
									this.Init();
								}
								this.mTimerNumber--;
								if(this.mTimerNumber < 0)
								{
									this.mTimerNumber = flash.checkInt(0);
								}
								this.mTimerText = this.GetTimeText();
								this.mTimerTextField.text = this.mTimerText;
							}

							public Init()
							{
								this.mInited = true;
								this.mTimerNumber = flash.checkInt(com.popcap.flash.games.zuma2.logic.TimerBar.GAME_TIME);
								this.mTextFormat = new flash.TextFormat();
								this.mTextFormat.font = "TimerText";
								this.mTextFormat.align = flash.TextFormatAlign.CENTER;
								this.mTextFormat.color = 12641891;
								this.mTextFormat.size = 20;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(0,1,2,2,200);
								this.mTimerTextField = new flash.TextField();
								this.mTimerTextField.antiAliasType = flash.AntiAliasType.ADVANCED;
								this.mTimerTextField.embedFonts = true;
								this.mTimerTextField.defaultTextFormat = this.mTextFormat;
								this.mTimerTextField.filters = [aGlow];
								this.mTimerTextField.width = 120;
								this.mTimerTextField.height = 20;
								this.mTimerTextField.x = 50;
								this.mTimerTextField.y = -1;
								this.mTimerTextField.alpha = 1;
								this.mTimerTextField["selectable"] = false;
								this.mTimerTextField.text = "3:00";
								this.mTimerBarEmptyBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UI_TIMERBAR_EMPTY),flash.PixelSnapping.NEVER,true);
								this.mTimerBarFillBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UI_TIMERBAR_FULL),flash.PixelSnapping.NEVER,true);
								this.mTimerBarSprite = new egret.Sprite();
								this.mTimerBarMask = new egret.Sprite();
								this.mTimerBarMask.graphics.beginFill(16777215);
								this.mTimerBarMask.graphics.drawRect(0,0,225,21);
								this.mTimerBarFillBitmap.mask = this.mTimerBarMask;
								this.mTimerBarSprite.addChild(this.mTimerBarEmptyBitmap);
								this.mTimerBarSprite.addChild(this.mTimerBarFillBitmap);
								this.mTimerBarSprite.addChild(this.mTimerBarMask);
								this.mTimerBarSprite.addChild(this.mTimerTextField);
								this.mTimerBarSprite.x = 163;
								this.mTimerBarSprite.y = 3;
								this.mApp["mLayers"][0].mBalls.addChild(this.mTimerBarSprite);
							}

							public GetTimeText():string
							{
								var minute:string = String(flash.tranint(this.mTimerNumber / 6000));
								var seconds:string = String(flash.tranint(this.mTimerNumber % 6000 / 100));
								if(seconds.length == 1)
								{
									seconds = "0" + seconds;
								}
								var time:string = minute + ":" + seconds;
								return time;
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.TimerBar.GAME_TIME = 18000;
com.popcap.flash.games.zuma2.logic.TimerBar.BAR_WIDTH = 225;
