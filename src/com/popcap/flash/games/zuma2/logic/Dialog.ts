module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class Dialog extends egret.Sprite {
							public static STATE_CLEARSCORES:number;
							public static STATE_BUTTON_DOWN:number;
							public static STATE_BUTTON_UP:number;
							public static MENU_OFFSET_X:number;
							public static MENU_OFFSET_Y:number;
							public static STATE_BUTTON_OVER:number;
							public static BUTTON_OFFSET_X:number;
							public static BUTTON_OFFSET_Y:number;
							public static BUTTON_DISTANCE_X:number;
							public static STATE_ENDGAME:number;
							public mState:number = 0;
							public mYesButton:egret.SwfButton;
							public mNoButton:egret.SwfButton;
							public mOptionsMenu:com.popcap.flash.games.zuma2.logic.OptionsMenu;
							public mApp:Zuma2App;
							public mHighScores:com.popcap.flash.games.zuma2.logic.HighScores;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mText:flash.TextField;
							public mBackground:flash.Bitmap;

							public constructor(app:Zuma2App,board:com.popcap.flash.games.zuma2.widgets.GameBoardWidget,optionsMenu:com.popcap.flash.games.zuma2.logic.OptionsMenu,highScores:com.popcap.flash.games.zuma2.logic.HighScores,state:number)
							{
								super();
								state = flash.checkInt(state);
								var upImage:flash.Bitmap = <any>null;
								var downImage:flash.Bitmap = <any>null;
								var overImage:flash.Bitmap = <any>null;
								this.mApp = app;
								this.mBoard = board;
								this.mOptionsMenu = optionsMenu;
								this.mHighScores = highScores;
								this.mState = flash.checkInt(state);
								this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DIALOG_BACKGROUND));
								this.mBackground.x = com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_X;
								this.mBackground.y = com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_Y;
								upImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DIALOG_BUTTON_YES_UP));
								downImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DIALOG_BUTTON_YES_DOWN));
								overImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DIALOG_BUTTON_YES_OVER));
								var upText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[ENDGAME_DIALOGBOX_YESBUTTON]"),com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_UP);
								upText.x = 10;
								upText.y = 8;
								var downText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[ENDGAME_DIALOGBOX_YESBUTTON]"),com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_DOWN);
								downText.x = 10;
								downText.y = 8;
								var overText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[ENDGAME_DIALOGBOX_YESBUTTON]"),com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_OVER);
								overText.x = 10;
								overText.y = 8;
								var upSprite:egret.Sprite = new egret.Sprite();
								var downSprite:egret.Sprite = new egret.Sprite();
								var overSprite:egret.Sprite = new egret.Sprite();
								upSprite.addChild(upImage);
								upSprite.addChild(upText);
								downSprite.addChild(downImage);
								downSprite.addChild(downText);
								overSprite.addChild(overImage);
								overSprite.addChild(overText);
								this.mYesButton = new egret.SwfButton(upSprite,overSprite,downSprite,downSprite);
								this.mYesButton.x = com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_OFFSET_X;
								this.mYesButton.y = com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_OFFSET_Y;
								this.mYesButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleYes,this),null);
								var upImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DIALOG_BUTTON_YES_UP));
								var downImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DIALOG_BUTTON_YES_DOWN));
								var overImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DIALOG_BUTTON_YES_OVER));
								var upText2:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[ENDGAME_DIALOGBOX_NOBUTTON]"),com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_UP);
								upText2.x = 10;
								upText2.y = 8;
								var downText2:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[ENDGAME_DIALOGBOX_NOBUTTON]"),com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_DOWN);
								downText2.x = 10;
								downText2.y = 8;
								var overText2:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[ENDGAME_DIALOGBOX_NOBUTTON]"),com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_OVER);
								overText2.x = 10;
								overText2.y = 8;
								var upSprite2:egret.Sprite = new egret.Sprite();
								var downSprite2:egret.Sprite = new egret.Sprite();
								var overSprite2:egret.Sprite = new egret.Sprite();
								upSprite2.addChild(upImage2);
								upSprite2.addChild(upText2);
								downSprite2.addChild(downImage2);
								downSprite2.addChild(downText2);
								overSprite2.addChild(overImage2);
								overSprite2.addChild(overText2);
								this.mNoButton = new egret.SwfButton(upSprite2,overSprite2,downSprite2,downSprite2);
								this.mNoButton.x = com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_OFFSET_X + com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_DISTANCE_X;
								this.mNoButton.y = com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_OFFSET_Y;
								this.mNoButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleNo,this),null);
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "BonusText";
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = 15030548;
								aFormat.size = 16;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(7354630,1,2,2,2,2);
								this.mText = new flash.TextField();
								this.mText.embedFonts = true;
								this.mText.defaultTextFormat = aFormat;
								this.mText.filters = [aGlow];
								this.mText.width = 200;
								this.mText.height = 200;
								this.mText.x = 180;
								this.mText.y = 115;
								this.mText.alpha = 1;
								this.mText["selectable"] = false;
								this.mText.multiline = false;
								this.mText["wordWrap"] = true;
								switch(this.mState)
								{
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_ENDGAME :
									this.mText.text = this.mApp["stringManager"].translateString("[ENDGAME_DIALOGBOX_DIALOG]");
									break;
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_CLEARSCORES :
									this.mText.text = this.mApp["stringManager"].translateString("[HIGHSCORESCREEN_DIALOG_CONFIRM]");
								}
								this.mText.antiAliasType = flash.AntiAliasType.ADVANCED;
								this.mApp["mLayers"][4].mForeground.addChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.addChild(this.mText);
								this.mApp["mLayers"][4].mForeground.addChild(this.mYesButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mNoButton);
							}

							public handleNo(e:flash.MouseEvent)
							{
								switch(this.mState)
								{
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_ENDGAME :
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_CLEARSCORES :
									this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
									this.CloseDialog();
								}
							}

							public CloseDialog()
							{
								this.mApp["mLayers"][4].mForeground.removeChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mText);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mYesButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mNoButton);
								if(this.mState == com.popcap.flash.games.zuma2.logic.Dialog.STATE_ENDGAME)
								{
									this.mOptionsMenu.HideOptionsMenu(false);
								}
								else if(this.mState == com.popcap.flash.games.zuma2.logic.Dialog.STATE_CLEARSCORES)
								{
									this.mHighScores.ToggleButtons(true);
								}
							}

							public makeText(text:string,state:number):flash.TextField
							{
								state = flash.checkInt(state);
								var color:number = flash.checkUint(0);
								var glow:number = flash.checkUint(0);
								switch(state)
								{
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_UP :
									color = flash.checkUint(7645475);
									glow = flash.checkUint(2043904);
									break;
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_OVER :
									color = flash.checkUint(13238069);
									glow = flash.checkUint(2043904);
									break;
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_DOWN :
									color = flash.checkUint(13238069);
									glow = flash.checkUint(2043904);
								}
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "BonusText";
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = color;
								aFormat.size = 16;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(glow,1,2,2,10,5);
								var tf:flash.TextField = new flash.TextField();
								tf.embedFonts = true;
								tf.defaultTextFormat = aFormat;
								tf.filters = [aGlow];
								tf.width = 40;
								tf.height = 40;
								tf.x = -5;
								tf.y = 0;
								tf.alpha = 1;
								tf["selectable"] = false;
								tf.multiline = false;
								tf["wordWrap"] = false;
								tf.text = text;
								return tf;
							}

							public handleYes(e:flash.MouseEvent)
							{
								switch(this.mState)
								{
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_ENDGAME :
									this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
									this.CloseDialog();
									this.mOptionsMenu.CloseMenu();
									this.mBoard["CloseMenu"]();
									this.mBoard["KillMenuButton"]();
									this.mBoard["ClearAll"]();
									this.mApp["mAdAPI"].SetScore(this.mBoard["mScore"]);
									this.mApp["mAdAPI"].ScoreSubmit();
									this.mApp["mAdAPI"].GameEnd();
									this.mApp["soundManager"].stopAll();
									this.mApp["widgets"].game.ShowMainMenu();
									break;
								case com.popcap.flash.games.zuma2.logic.Dialog.STATE_CLEARSCORES :
									this.mApp["mSharedObject"].clear();
									this.mHighScores.ResetScores();
									this.CloseDialog();
								}
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.Dialog.STATE_CLEARSCORES = 1;
com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_DOWN = 2;
com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_UP = 0;
com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_X = 140;
com.popcap.flash.games.zuma2.logic.Dialog.MENU_OFFSET_Y = 20;
com.popcap.flash.games.zuma2.logic.Dialog.STATE_BUTTON_OVER = 1;
com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_OFFSET_X = 40;
com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_OFFSET_Y = 165;
com.popcap.flash.games.zuma2.logic.Dialog.BUTTON_DISTANCE_X = 125;
com.popcap.flash.games.zuma2.logic.Dialog.STATE_ENDGAME = 0;
flash.extendsClass("com.popcap.flash.games.zuma2.logic.Dialog","egret.Sprite")
