module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class HighScores extends egret.HashObject {
							public static STATE_BUTTON_DOWN:number;
							public static SCORE_DISTANCE:number;
							public static STATE_BUTTON_UP:number;
							public static STATE_BUTTON_OVER:number;
							public static MAX_NUM_SCORES:number;
							public static SCORE_OFFSET_Y:number;
							public mScoreText:Array<flash.TextField>;
							public mMainMenu:com.popcap.flash.games.zuma2.logic.MainMenu;
							public mGlowTimer:number = NaN;
							public mDialog:com.popcap.flash.games.zuma2.logic.Dialog;
							public mTimer:egret.Timer;
							public mGlowUp:boolean = false;
							public mNumberText:Array<flash.TextField>;
							public mHighScores:Array<any>;
							public mClearButton:egret.SwfButton;
							public mApp:Zuma2App;
							public mHighScoreText:flash.TextField;
							public mHighScoreLevels:Array<any>;
							public mBackground:flash.Bitmap;
							public mLevelText:Array<flash.TextField>;
							public mMenuButton:egret.SwfButton;

							public constructor(app:Zuma2App,mainMenu:com.popcap.flash.games.zuma2.logic.MainMenu,highScores:Array<any>,highScoreLevels:Array<any>)
							{
								super();
								super();
								this.mApp = app;
								this.mMainMenu = mainMenu;
								this.mHighScores = highScores;
								this.mHighScoreLevels = highScoreLevels;
								this.mScoreText = new Array<flash.TextField>();
								this.mNumberText = new Array<flash.TextField>();
								this.mLevelText = new Array<flash.TextField>();
								this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HIGHSCORES_BACKGROUND));
								var upImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HIGHSCORES_BUTTON_MENU_UP));
								var downImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HIGHSCORES_BUTTON_MENU_DOWN));
								var overImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HIGHSCORES_BUTTON_MENU_OVER));
								this.mMenuButton = new egret.SwfButton(upImage,overImage,downImage,downImage);
								this.mMenuButton.x = 218;
								this.mMenuButton.y = 347;
								this.mMenuButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleMenu,this),null);
								this.mApp["mLayers"][4].mForeground.addChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.addChild(this.mMenuButton);
								this.CreateClearButton();
								this.CreateTextFields();
								this.mTimer = new egret.Timer(10);
								this.mTimer.addEventListener(egret.TimerEvent.TIMER,flash.bind(this.handleUpdate,this),null);
								this.mTimer.start();
								this.mGlowTimer = 0;
								this.mGlowUp = true;
							}

							public CreateTextFields()
							{
								var i:number = flash.checkInt(0);
								var aTextField:flash.TextField = <any>null;
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "TimeUpText";
								aFormat.align = flash.TextFormatAlign.LEFT;
								aFormat.color = 16777215;
								aFormat.size = 16;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(5910702,1,2,2,10,5);
								for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.HighScores.MAX_NUM_SCORES; i++)
								{
									aTextField = new flash.TextField();
									aTextField.embedFonts = true;
									aTextField.defaultTextFormat = aFormat;
									aTextField.filters = [aGlow];
									aTextField.width = 30;
									aTextField.height = 20;
									aTextField.x = 160;
									aTextField.y = com.popcap.flash.games.zuma2.logic.HighScores.SCORE_OFFSET_Y + i * com.popcap.flash.games.zuma2.logic.HighScores.SCORE_DISTANCE;
									aTextField.alpha = 1;
									aTextField["selectable"] = false;
									aTextField.multiline = false;
									aTextField["wordWrap"] = false;
									aTextField.text = String(i + 1) + ".";
									this.mScoreText[i] = aTextField;
									this.mApp["mLayers"][4].mForeground.addChild(this.mScoreText[i]);
								}
								aFormat.align = flash.TextFormatAlign.RIGHT;
								for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.HighScores.MAX_NUM_SCORES; i++)
								{
									aTextField = new flash.TextField();
									aTextField.embedFonts = true;
									aTextField.defaultTextFormat = aFormat;
									aTextField.filters = [aGlow];
									aTextField.width = 100;
									aTextField.height = 20;
									aTextField.x = 270;
									aTextField.y = com.popcap.flash.games.zuma2.logic.HighScores.SCORE_OFFSET_Y + i * com.popcap.flash.games.zuma2.logic.HighScores.SCORE_DISTANCE;
									aTextField.alpha = 1;
									aTextField["selectable"] = false;
									aTextField.multiline = false;
									aTextField["wordWrap"] = false;
									aTextField.text = StringUtils.InsertNumberCommas(this.mHighScores[i]);
									this.mNumberText[i] = aTextField;
									this.mApp["mLayers"][4].mForeground.addChild(this.mNumberText[i]);
								}
								aFormat.align = flash.TextFormatAlign.LEFT;
								for(i = flash.checkInt(0); i < com.popcap.flash.games.zuma2.logic.HighScores.MAX_NUM_SCORES; i++)
								{
									aTextField = new flash.TextField();
									aTextField.embedFonts = true;
									aTextField.defaultTextFormat = aFormat;
									aTextField.filters = [aGlow];
									aTextField.width = 100;
									aTextField.height = 20;
									aTextField.x = 220;
									aTextField.y = com.popcap.flash.games.zuma2.logic.HighScores.SCORE_OFFSET_Y + i * com.popcap.flash.games.zuma2.logic.HighScores.SCORE_DISTANCE;
									aTextField.alpha = 1;
									aTextField["selectable"] = false;
									aTextField.multiline = false;
									aTextField["wordWrap"] = false;
									if(this.mHighScoreLevels[i] >= 21)
									{
										aTextField.text = "Complete!";
									}
									else
									{
										aTextField.text = String(this.mApp["stringManager"].translateString("[HIGHSCORESCREEN_LEVEL]") + "   " + this.mHighScoreLevels[i]);
									}
									this.mLevelText[i] = aTextField;
									this.mApp["mLayers"][4].mForeground.addChild(this.mLevelText[i]);
								}
								aGlow.color = flash.checkUint(16777215);
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = 5910702;
								aFormat.size = 48;
								aTextField = new flash.TextField();
								aTextField.embedFonts = true;
								aTextField.defaultTextFormat = aFormat;
								aTextField.filters = [aGlow];
								aTextField.width = 300;
								aTextField.height = 100;
								aTextField.x = 115;
								aTextField.y = 5;
								aTextField.alpha = 1;
								aTextField["selectable"] = false;
								aTextField.multiline = false;
								aTextField["wordWrap"] = false;
								aTextField.text = this.mApp["stringManager"].translateString("[HIGHSCORESCREEN_HEADER]");
								this.mHighScoreText = aTextField;
								this.mApp["mLayers"][4].mForeground.addChild(this.mHighScoreText);
							}

							public handleClear(e:flash.MouseEvent)
							{
								if(<any>!this.mClearButton.enabled)
								{
									return ;
								}
								this.ToggleButtons(false);
								this.mDialog = new com.popcap.flash.games.zuma2.logic.Dialog(this.mApp,null,null,this,com.popcap.flash.games.zuma2.logic.Dialog.STATE_CLEARSCORES);
							}

							public CreateClearButton()
							{
								var upText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[HIGHSCORESCREEN_BUTTON_RESET]"),com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_UP);
								upText.y = 8;
								var downText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[HIGHSCORESCREEN_BUTTON_RESET]"),com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_DOWN);
								downText.y = 8;
								var overText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[HIGHSCORESCREEN_BUTTON_RESET]"),com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_OVER);
								overText.y = 8;
								this.mClearButton = new egret.SwfButton(upText,overText,downText,downText);
								this.mClearButton.x = 395;
								this.mClearButton.y = 330;
								this.mClearButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleClear,this),null);
								this.mApp["mLayers"][4].mForeground.addChild(this.mClearButton);
							}

							public handleUpdate(e:egret.TimerEvent)
							{
								var aGlow:flash.GlowFilter = <any>null;
								var aGlow2:flash.GlowFilter = <any>null;
								if(this.mApp["mNewHighScore"] != -1)
								{
									if(this.mGlowUp)
									{
										this.mGlowTimer = this.mGlowTimer + 0.1;
										if(this.mGlowTimer >= 10)
										{
											this.mGlowUp = false;
										}
									}
									else
									{
										this.mGlowTimer = this.mGlowTimer - 0.1;
										if(this.mGlowTimer <= 0)
										{
											this.mGlowUp = true;
										}
									}
									aGlow = new flash.GlowFilter(5910702,1,2,2,10,5);
									aGlow2 = new flash.GlowFilter(16777215,1,this.mGlowTimer,this.mGlowTimer,10,5);
									this.mNumberText[this.mApp["mNewHighScore"]].filters = [aGlow,aGlow2];
									this.mScoreText[this.mApp["mNewHighScore"]].filters = [aGlow,aGlow2];
									this.mLevelText[this.mApp["mNewHighScore"]].filters = [aGlow,aGlow2];
								}
							}

							public ResetScores()
							{
								this.mApp["mNewHighScore"] = -1;
								this.mApp["mLayers"][4].mForeground.removeChild(this.mHighScoreText);
								for(var i:number = flash.checkInt(0);i < com.popcap.flash.games.zuma2.logic.HighScores.MAX_NUM_SCORES; i++)
								{
									this.mApp["mLayers"][4].mForeground.removeChild(this.mScoreText[i]);
									this.mApp["mLayers"][4].mForeground.removeChild(this.mNumberText[i]);
									this.mApp["mLayers"][4].mForeground.removeChild(this.mLevelText[i]);
								}
								this.mApp["mHighScores"] = new Array();
								var counter:number = flash.checkInt(11);
								for(i = flash.checkInt(0); i < 10; i++)
								{
									counter--;
									this.mApp["mHighScores"][i] = counter * 10000;
								}
								this.mApp["mSharedObject"].data.highscores = this.mApp["mHighScores"];
								this.mHighScores = this.mApp["mHighScores"];
								this.mApp["mHighScoreLevels"] = new Array();
								counter = flash.checkInt(20);
								for(i = flash.checkInt(0); i < 10; i++)
								{
									this.mApp["mHighScoreLevels"][i] = counter;
									counter--;
								}
								this.mApp["mSharedObject"].data.highscorelevels = this.mApp["mHighScoreLevels"];
								this.mHighScoreLevels = this.mApp["mHighScoreLevels"];
								this.mApp["mBestTimes"] = new Array();
								for(i = flash.checkInt(0); i < 21; i++)
								{
									this.mApp["mBestTimes"][i] = 0;
								}
								this.mApp["mSharedObject"].data.besttimes = this.mApp["mBestTimes"];
								this.CreateTextFields();
							}

							public makeText(text:string,state:number):flash.TextField
							{
								state = flash.checkInt(state);
								var color:number = flash.checkUint(0);
								var glow:number = flash.checkUint(0);
								switch(state)
								{
								case com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_UP :
									color = flash.checkUint(7645475);
									glow = flash.checkUint(2043904);
									break;
								case com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_OVER :
									color = flash.checkUint(13238069);
									glow = flash.checkUint(2043904);
									break;
								case com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_DOWN :
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
								tf.width = 155;
								tf.height = 70;
								tf.x = -5;
								tf.y = 0;
								tf.alpha = 1;
								tf["selectable"] = false;
								tf.multiline = false;
								tf["wordWrap"] = false;
								tf.text = text;
								return tf;
							}

							public CloseHighScore()
							{
								this.mApp["mNewHighScore"] = -1;
								this.mApp["mLayers"][4].mForeground.removeChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mHighScoreText);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mMenuButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mClearButton);
								for(var i:number = flash.checkInt(0);i < com.popcap.flash.games.zuma2.logic.HighScores.MAX_NUM_SCORES; i++)
								{
									this.mApp["mLayers"][4].mForeground.removeChild(this.mScoreText[i]);
									this.mApp["mLayers"][4].mForeground.removeChild(this.mNumberText[i]);
									this.mApp["mLayers"][4].mForeground.removeChild(this.mLevelText[i]);
								}
							}

							public ToggleButtons(on:boolean)
							{
								this.mMenuButton.enabled = on;
								this.mClearButton.enabled = on;
							}

							public handleMenu(e:flash.MouseEvent)
							{
								if(<any>!this.mMenuButton.enabled)
								{
									return ;
								}
								this.CloseHighScore();
								this.mMainMenu.ToggleButtons(true);
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_DOWN = 2;
com.popcap.flash.games.zuma2.logic.HighScores.SCORE_DISTANCE = 22;
com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_UP = 0;
com.popcap.flash.games.zuma2.logic.HighScores.STATE_BUTTON_OVER = 1;
com.popcap.flash.games.zuma2.logic.HighScores.MAX_NUM_SCORES = 10;
com.popcap.flash.games.zuma2.logic.HighScores.SCORE_OFFSET_Y = 75;
