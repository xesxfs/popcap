module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class HelpScreen extends egret.HashObject {
							public static STATE_BUTTON_DOWN:number;
							public static STATE_INTRO:number;
							public static STATE_MAINMENU:number;
							public static PAGE2:number;
							public static PAGE3:number;
							public static PAGE1:number;
							public static STATE_BUTTON_OVER:number;
							public static STATE_BUTTON_UP:number;
							public static STATE_IN_GAME:number;
							public mMainMenu:com.popcap.flash.games.zuma2.logic.MainMenu;
							public mContinueButton:egret.SwfButton;
							public mDontShowButton:egret.SwfButton;
							public mBackground2:flash.Bitmap;
							public mBackground3:flash.Bitmap;
							public mHelpText:Array<any>;
							public mState:number = 0;
							public mPage1Button:egret.SwfButton;
							public mPage2Button:egret.SwfButton;
							public mPage3Button:egret.SwfButton;
							public mApp:Zuma2App;
							public mOptionsMenu:com.popcap.flash.games.zuma2.logic.OptionsMenu;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mBackground:flash.Bitmap;

							public constructor(app:Zuma2App,board:com.popcap.flash.games.zuma2.widgets.GameBoardWidget,optionsMenu:com.popcap.flash.games.zuma2.logic.OptionsMenu,mainMenu:com.popcap.flash.games.zuma2.logic.MainMenu,state:number)
							{
								super();
								state = flash.checkInt(state);
								super();
								var upImage:flash.Bitmap = <any>null;
								var downImage:flash.Bitmap = <any>null;
								var overImage:flash.Bitmap = <any>null;
								var upImage2:flash.Bitmap = <any>null;
								var downImage2:flash.Bitmap = <any>null;
								var overImage2:flash.Bitmap = <any>null;
								var upText2:flash.TextField = <any>null;
								var downText2:flash.TextField = <any>null;
								var overText2:flash.TextField = <any>null;
								var upSprite2:egret.Sprite = <any>null;
								var downSprite2:egret.Sprite = <any>null;
								var overSprite2:egret.Sprite = <any>null;
								this.mApp = app;
								this.mBoard = board;
								this.mOptionsMenu = optionsMenu;
								this.mMainMenu = mainMenu;
								this.mState = flash.checkInt(state);
								this.mHelpText = new Array();
								this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BACKGROUND));
								this.mBackground2 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BACKGROUND2));
								this.mBackground2.visible = false;
								this.mBackground3 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BACKGROUND3));
								this.mBackground3.visible = false;
								this.mApp["mLayers"][4].mForeground.addChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.addChild(this.mBackground2);
								this.mApp["mLayers"][4].mForeground.addChild(this.mBackground3);
								upImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP));
								downImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN));
								overImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER));
								var upText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[HELP_BUTTON_CONTINUE]"),com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_UP);
								upText.y = 8;
								var downText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[HELP_BUTTON_CONTINUE]"),com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_DOWN);
								downText.y = 8;
								var overText:flash.TextField = this.makeText(this.mApp["stringManager"].translateString("[HELP_BUTTON_CONTINUE]"),com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_OVER);
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
								this.mContinueButton = new egret.SwfButton(upSprite,overSprite,downSprite,downSprite);
								switch(this.mState)
								{
								case com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_IN_GAME :
									this.mContinueButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleInGameCont,this),null);
									this.mContinueButton.x = 200;
									this.mContinueButton.y = 360;
									break;
								case com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_INTRO :
									this.mContinueButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleIntroCont,this),null);
									this.mContinueButton.x = 320;
									this.mContinueButton.y = 360;
									upImage2 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP));
									downImage2 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN));
									overImage2 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER));
									upText2 = this.makeText(this.mApp["stringManager"].translateString("[HELP_BUTTON_DONTSHOW]"),com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_UP);
									upText2.x = 25;
									upText2.y = 8;
									downText2 = this.makeText(this.mApp["stringManager"].translateString("[HELP_BUTTON_DONTSHOW]"),com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_DOWN);
									downText2.x = 25;
									downText2.y = 8;
									overText2 = this.makeText(this.mApp["stringManager"].translateString("[HELP_BUTTON_DONTSHOW]"),com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_OVER);
									overText2.x = 25;
									overText2.y = 8;
									upSprite2 = new egret.Sprite();
									downSprite2 = new egret.Sprite();
									overSprite2 = new egret.Sprite();
									upSprite2.addChild(upImage2);
									upSprite2.addChild(upText2);
									downSprite2.addChild(downImage2);
									downSprite2.addChild(downText2);
									overSprite2.addChild(overImage2);
									overSprite2.addChild(overText2);
									this.mDontShowButton = new egret.SwfButton(upSprite2,overSprite2,downSprite2,downSprite2);
									this.mDontShowButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleDontShow,this),null);
									this.mDontShowButton.x = 60;
									this.mDontShowButton.y = 360;
									this.mApp["mLayers"][4].mForeground.addChild(this.mDontShowButton);
									break;
								case com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_MAINMENU :
									this.mContinueButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleMainMenuCont,this),null);
									this.mContinueButton.x = 195;
									this.mContinueButton.y = 360;
								}
								var upImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE1_UP));
								var downImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER));
								var overImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER));
								this.mPage1Button = new egret.SwfButton(upImage3,overImage3,downImage3,downImage3);
								this.mPage1Button.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handlePage1,this),null);
								this.mPage1Button.x = 28;
								this.mPage1Button.y = 28;
								this.mPage1Button.visible = false;
								var upImage4:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE2_UP));
								var downImage4:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER));
								var overImage4:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER));
								this.mPage2Button = new egret.SwfButton(upImage4,overImage4,downImage4,downImage4);
								this.mPage2Button.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handlePage2,this),null);
								this.mPage2Button.x = 445;
								this.mPage2Button.y = 28;
								var upImage5:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE3_UP));
								var downImage5:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER));
								var overImage5:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER));
								this.mPage3Button = new egret.SwfButton(upImage5,overImage5,downImage5,downImage5);
								this.mPage3Button.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handlePage3,this),null);
								this.mPage3Button.x = 445;
								this.mPage3Button.y = 28;
								this.mPage3Button.visible = false;
								this.loadPage1Text();
								this.mApp["mLayers"][4].mForeground.addChild(this.mPage1Button);
								this.mApp["mLayers"][4].mForeground.addChild(this.mPage2Button);
								this.mApp["mLayers"][4].mForeground.addChild(this.mPage3Button);
								this.mApp["mLayers"][4].mForeground.addChild(this.mContinueButton);
							}

							public CloseHelp()
							{
								this.mApp["mLayers"][4].mForeground.removeChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mBackground2);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mBackground3);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mPage1Button);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mPage2Button);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mPage3Button);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mContinueButton);
								for(var i:number = flash.checkInt(0);i < this.mHelpText.length; i++)
								{
									if(this.mHelpText[i].parent != null)
									{
										this.mHelpText[i].parent.removeChild(this.mHelpText[i]);
									}
								}
								if(this.mDontShowButton != null)
								{
									if(this.mDontShowButton.parent != null)
									{
										this.mDontShowButton.parent.removeChild(this.mDontShowButton);
									}
								}
							}

							public makeText(text:string,state:number):flash.TextField
							{
								state = flash.checkInt(state);
								var color:number = flash.checkUint(0);
								var glow:number = flash.checkUint(0);
								switch(state)
								{
								case com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_UP :
									color = flash.checkUint(7645475);
									glow = flash.checkUint(2043904);
									break;
								case com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_OVER :
									color = flash.checkUint(13238069);
									glow = flash.checkUint(2043904);
									break;
								case com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_DOWN :
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

							public makeHelpSubtitle(type:number,text:string,x:number,y:number,width:number,height:number):flash.TextField
							{
								type = flash.checkInt(type);
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "TimeUpText";
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = 12883257;
								aFormat.size = 20;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(0,1,2,2,10,5);
								var tf:flash.TextField = new flash.TextField();
								tf.embedFonts = true;
								tf.defaultTextFormat = aFormat;
								tf.filters = [aGlow];
								tf.width = width;
								tf.height = height;
								tf.x = x;
								tf.y = y;
								tf.alpha = 1;
								tf["selectable"] = false;
								tf.multiline = false;
								tf["wordWrap"] = false;
								tf.text = text;
								return tf;
							}

							public loadPage1Text()
							{
								this.clearHelpText();
								var tf:flash.TextField = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1,this.mApp["stringManager"].translateString("[HOWTOPLAY_THEBASICS_BLOCK1]"),70,100,200,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1,this.mApp["stringManager"].translateString("[HOWTOPLAY_THEBASICS_BLOCK2]"),270,130,200,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1,this.mApp["stringManager"].translateString("[HOWTOPLAY_THEBASICS_BLOCK3]"),50,195,200,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1,this.mApp["stringManager"].translateString("[HOWTOPLAY_THEBASICS_BLOCK4]"),270,245,200,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpTitle(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1,this.mApp["stringManager"].translateString("[HOWTOPLAY_HEADER]"),180,5,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpSubtitle(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1,this.mApp["stringManager"].translateString("[HOWTOPLAY_THEBASICS_TITLE]"),182,50,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
							}

							public loadPage3Text()
							{
								var aString:any = null;
								var y:number = <any>NaN;
								var tf:flash.TextField = <any>null;
								this.clearHelpText();
								for(var i:number = flash.checkInt(0);i < 10; i++)
								{
									aString = "[HOWTOPLAY_TIPS_TIP" + String(i + 1) + "]";
									y = 90 + i * 25;
									tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE3,this.mApp["stringManager"].translateString(aString),15,y,520,50);
									this.mApp["mLayers"][4].mForeground.addChild(tf);
									this.mHelpText.push(tf);
								}
								tf = this.makeHelpTitle(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE3,this.mApp["stringManager"].translateString("[HOWTOPLAY_HEADER]"),180,5,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpSubtitle(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE3,this.mApp["stringManager"].translateString("[HOWTOPLAY_TIPS_TITLE]"),182,50,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
							}

							public loadPage2Text()
							{
								this.clearHelpText();
								var tf:flash.TextField = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK1]"),50,125,200,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makePowerupHeading(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK1TITLE]"),50,100,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK2]"),325,122,250,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makePowerupHeading(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK2TITLE]"),325,100,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK3]"),50,205,250,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makePowerupHeading(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK3TITLE]"),50,180,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK4]"),325,205,250,120);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makePowerupHeading(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK4TITLE]"),325,180,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpText(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK5]"),190,280,250,60);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makePowerupHeading(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_BLOCK5TITLE]"),190,255,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpTitle(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_HEADER]"),180,5,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
								tf = this.makeHelpSubtitle(com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2,this.mApp["stringManager"].translateString("[HOWTOPLAY_POWERUPS_TITLE]"),182,50,200,50);
								this.mApp["mLayers"][4].mForeground.addChild(tf);
								this.mHelpText.push(tf);
							}

							public clearHelpText()
							{
								for(var i:number = flash.checkInt(0);i < this.mHelpText.length; i++)
								{
									if(this.mHelpText[i].parent != null)
									{
										this.mHelpText[i].parent.removeChild(this.mHelpText[i]);
									}
								}
							}

							public handleMainMenuCont(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.mMainMenu.ToggleButtons(true);
								this.mMainMenu.mShowingHelp = false;
								this.CloseHelp();
							}

							public makeHelpText(type:number,text:string,x:number,y:number,width:number,height:number):flash.TextField
							{
								type = flash.checkInt(type);
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "BonusText";
								aFormat.align = flash.TextFormatAlign.LEFT;
								aFormat.color = 13618638;
								aFormat.size = 16;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(0,1,2,2,5,5);
								switch(type)
								{
								case com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1 :
									break;
								case com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2 :
									aFormat.size = 14;
									break;
								case com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE3 :
									aFormat.size = 16;
								}
								var tf:flash.TextField = new flash.TextField();
								tf.embedFonts = true;
								tf.defaultTextFormat = aFormat;
								tf.filters = [aGlow];
								tf.width = width;
								tf.height = height;
								tf.x = x;
								tf.y = y;
								tf.alpha = 1;
								tf["selectable"] = false;
								tf.multiline = false;
								tf["wordWrap"] = false;
								tf.text = text;
								return tf;
							}

							public handlePage2(e:flash.MouseEvent)
							{
								this.loadPage2Text();
								this.mBackground.visible = false;
								this.mBackground2.visible = true;
								this.mBackground3.visible = false;
								this.mPage2Button.visible = false;
								this.mPage1Button.visible = true;
								this.mPage3Button.visible = true;
							}

							public handleDontShow(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.mApp["mSharedObject"].data.help = false;
								this.mApp["mHideHelp"] = true;
								this.mMainMenu.mGameWidget["StartNewGame"]();
								this.mMainMenu.CloseMenu();
								this.CloseHelp();
							}

							public makePowerupHeading(type:number,text:string,x:number,y:number,width:number,height:number):flash.TextField
							{
								type = flash.checkInt(type);
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "TimeUpText";
								aFormat.align = flash.TextFormatAlign.LEFT;
								aFormat.color = 12883257;
								aFormat.size = 20;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(0,1,2,2,10,5);
								var tf:flash.TextField = new flash.TextField();
								tf.embedFonts = true;
								tf.defaultTextFormat = aFormat;
								tf.filters = [aGlow];
								tf.width = width;
								tf.height = height;
								tf.x = x;
								tf.y = y;
								tf.alpha = 1;
								tf["selectable"] = false;
								tf.multiline = false;
								tf["wordWrap"] = false;
								tf.text = text;
								return tf;
							}

							public makeHelpTitle(type:number,text:string,x:number,y:number,width:number,height:number):flash.TextField
							{
								type = flash.checkInt(type);
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "TimeUpText";
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = 12883257;
								aFormat.size = 38;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(0,1,2,2,10,5);
								var tf:flash.TextField = new flash.TextField();
								tf.embedFonts = true;
								tf.defaultTextFormat = aFormat;
								tf.filters = [aGlow];
								tf.width = width;
								tf.height = height;
								tf.x = x;
								tf.y = y;
								tf.alpha = 1;
								tf["selectable"] = false;
								tf.multiline = false;
								tf["wordWrap"] = false;
								tf.text = text;
								return tf;
							}

							public handleIntroCont(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.mMainMenu.mGameWidget["StartNewGame"]();
								this.mMainMenu.CloseMenu();
								this.CloseHelp();
							}

							public handlePage1(e:flash.MouseEvent)
							{
								this.loadPage1Text();
								this.mBackground.visible = true;
								this.mBackground2.visible = false;
								this.mBackground3.visible = false;
								this.mPage1Button.visible = false;
								this.mPage2Button.visible = true;
								this.mPage3Button.visible = false;
								this.mPage2Button.x = 445;
								this.mPage2Button.y = 28;
							}

							public handlePage3(e:flash.MouseEvent)
							{
								this.loadPage3Text();
								this.mBackground.visible = false;
								this.mBackground2.visible = false;
								this.mBackground3.visible = true;
								this.mPage2Button.visible = true;
								this.mPage2Button.x = 28;
								this.mPage2Button.y = 28;
								this.mPage3Button.visible = false;
							}

							public handleInGameCont(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.CloseHelp();
								this.mOptionsMenu.HideOptionsMenu(false);
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_DOWN = 2;
com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_INTRO = 1;
com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_MAINMENU = 2;
com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE2 = 1;
com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE3 = 2;
com.popcap.flash.games.zuma2.logic.HelpScreen.PAGE1 = 0;
com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_OVER = 1;
com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_BUTTON_UP = 0;
com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_IN_GAME = 0;
