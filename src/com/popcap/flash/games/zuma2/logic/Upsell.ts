module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Upsell extends egret.HashObject {
							public static UPSELL_FULL:number;
							public static UPSELL_HEROIC:number;
							public static DOWN_TEXT:number;
							public static UP_TEXT:number;
							public static UPSELL_CHALLENGE:number;
							public static UPSELL_ADVENTURE:number;
							public static OVER_TEXT:number;
							public mMainMenu:com.popcap.flash.games.zuma2.logic.MainMenu;
							public mUpsellButton:egret.SwfButton;
							public mApp:Zuma2App;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mBackground:flash.Bitmap;
							public mCloseButton:egret.SwfButton;

							public constructor(app:Zuma2App,mainMenu:com.popcap.flash.games.zuma2.logic.MainMenu,board:com.popcap.flash.games.zuma2.widgets.GameBoardWidget,type:number)
							{
								super();
								type = flash.checkInt(type);
								super();
								this.mApp = app;
								this.mMainMenu = mainMenu;
								this.mBoard = board;
								var upsellUp:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UPSELL_BUTTON_GETIT_UP));
								var upsellDown:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UPSELL_BUTTON_GETIT_DOWN));
								var closeUp:flash.TextField = this.makeCloseText(com.popcap.flash.games.zuma2.logic.Upsell.UP_TEXT,this.mApp["stringManager"].translateString("[UPSELL_BUTTON_CONTINUE]"));
								var closeDown:flash.TextField = this.makeCloseText(com.popcap.flash.games.zuma2.logic.Upsell.DOWN_TEXT,this.mApp["stringManager"].translateString("[UPSELL_BUTTON_CONTINUE]"));
								this.mUpsellButton = new egret.SwfButton(upsellUp,upsellDown,upsellDown,upsellDown);
								this.mUpsellButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleUpsell,this),null);
								this.mCloseButton = new egret.SwfButton(closeUp,closeDown,closeDown,closeDown);
								this.mCloseButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleClose,this),null);
								switch(type)
								{
								case com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_ADVENTURE :
									this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UPSELL_ADVENTURE));
									this.mUpsellButton.x = 200;
									this.mUpsellButton.y = 273;
									this.mCloseButton.x = 180;
									this.mCloseButton.y = 307;
									break;
								case com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_CHALLENGE :
									this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UPSELL_CHALLENGE));
									this.mUpsellButton.x = 200;
									this.mUpsellButton.y = 263;
									this.mCloseButton.x = 184;
									this.mCloseButton.y = 300;
									break;
								case com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_FULL :
									this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UPSELL_FULL));
									this.mUpsellButton.x = 206;
									this.mUpsellButton.y = 282;
									this.mCloseButton.x = 188;
									this.mCloseButton.y = 320;
									break;
								case com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_HEROIC :
									this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_UPSELL_HEROIC));
									this.mUpsellButton.x = 220;
									this.mUpsellButton.y = 300;
									this.mCloseButton.x = 204;
									this.mCloseButton.y = 335;
								}
								this.mApp["mLayers"][5].mForeground.addChild(this.mBackground);
								this.mApp["mLayers"][5].mForeground.addChild(this.mUpsellButton);
								this.mApp["mLayers"][5].mForeground.addChild(this.mCloseButton);
							}

							public handleClose(e:flash.MouseEvent)
							{
								if(this.mMainMenu != null)
								{
									this.mMainMenu.ToggleButtons(true);
									this.Close();
								}
								if(this.mBoard != null)
								{
									this.mBoard["KillUpsell"]();
									this.Close();
								}
								this.Close();
							}

							public handleUpsell(e:flash.MouseEvent)
							{
								var url:egret.URLRequest = new egret.URLRequest(this.mApp["mUpsellURL"]);
								"_blank";
								url;
								if(this.mApp["mAdAPI"]._isEnabled)
								{
									this.mApp["mAdAPI"].CustomEvent(null);
								}
							}

							public makeCloseText(state:number,text:string):flash.TextField
							{
								state = flash.checkInt(state);
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "TimeUpText";
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = 16777215;
								aFormat.size = 16;
								aFormat.underline = true;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(10790052,1,2,2,1,1);
								var tf:flash.TextField = new flash.TextField();
								tf.embedFonts = true;
								tf.defaultTextFormat = aFormat;
								tf.filters = [aGlow];
								tf.width = 150;
								tf.height = 20;
								tf.x = 0;
								tf.y = 0;
								tf.alpha = 1;
								tf["selectable"] = false;
								tf.multiline = false;
								tf["wordWrap"] = false;
								tf.text = text;
								return tf;
							}

							public Close()
							{
								if(this.mBackground.parent != null)
								{
									this.mBackground.parent.removeChild(this.mBackground);
								}
								if(this.mUpsellButton.parent != null)
								{
									this.mUpsellButton.parent.removeChild(this.mUpsellButton);
								}
								if(this.mCloseButton.parent != null)
								{
									this.mCloseButton.parent.removeChild(this.mCloseButton);
								}
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_FULL = 1;
com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_HEROIC = 2;
com.popcap.flash.games.zuma2.logic.Upsell.DOWN_TEXT = 2;
com.popcap.flash.games.zuma2.logic.Upsell.UP_TEXT = 0;
com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_CHALLENGE = 3;
com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_ADVENTURE = 0;
com.popcap.flash.games.zuma2.logic.Upsell.OVER_TEXT = 1;
