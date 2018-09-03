module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class OptionsMenu extends egret.Sprite {
							public static BUTTON_DISTANCE_Y:number;
							public static BUTTON_OFFSET_Y:number;
							public static BUTTON_OFFSET_X:number;
							public static MENU_OFFSET_X:number;
							public static MENU_OFFSET_Y:number;
							public mBackground:flash.Bitmap;
							public mMusicText:flash.TextField;
							public mMusicBackground:flash.Bitmap;
							public mMusicButton:com.popcap.flash.games.zuma2.logic.CheckBox;
							public mUpsellButton:egret.SwfButton;
							public mDialog:com.popcap.flash.games.zuma2.logic.Dialog;
							public mMainMenuButton:egret.SwfButton;
							public mHelpScreen:com.popcap.flash.games.zuma2.logic.HelpScreen;
							public mHelpButton:egret.SwfButton;
							public mSoundText:flash.TextField;
							public mSoundBackground:flash.Bitmap;
							public mBackToGameButton:egret.SwfButton;
							public mApp:Zuma2App;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mSoundButton:com.popcap.flash.games.zuma2.logic.CheckBox;

							public constructor(app:Zuma2App,board:com.popcap.flash.games.zuma2.widgets.GameBoardWidget)
							{
								super();
								var upImage:flash.Bitmap = <any>null;
								var downImage:flash.Bitmap = <any>null;
								var overImage:flash.Bitmap = <any>null;
								this.mApp = app;
								this.mBoard = board;
								this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BACKGROUND));
								this.mBackground.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X;
								this.mBackground.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y;
								this.mSoundBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND));
								this.mSoundBackground.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + 120;
								this.mSoundBackground.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + 205;
								this.mMusicBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND));
								this.mMusicBackground.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + 210;
								this.mMusicBackground.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + 110;
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "BonusText";
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = 15315221;
								aFormat.size = 16;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(7354630,1,2,2,10,5);
								var upText:flash.TextField = new flash.TextField();
								upText.embedFonts = true;
								upText.defaultTextFormat = aFormat;
								upText.filters = [aGlow];
								upText.width = 174;
								upText.height = 41;
								upText.x = 0;
								upText.y = 10;
								upText.alpha = 1;
								upText["selectable"] = false;
								upText.multiline = false;
								upText["wordWrap"] = false;
								upText.text = this.mApp["stringManager"].translateString("[OPTIONS_HELP]");
								upText.antiAliasType = flash.AntiAliasType.ADVANCED;
								var upText2:flash.TextField = new flash.TextField();
								upText2.embedFonts = true;
								upText2.defaultTextFormat = aFormat;
								upText2.filters = [aGlow];
								upText2.width = 174;
								upText2.height = 41;
								upText2.x = 0;
								upText2.y = 10;
								upText2.alpha = 1;
								upText2["selectable"] = false;
								upText2.multiline = false;
								upText2["wordWrap"] = false;
								upText2.text = this.mApp["stringManager"].translateString("[OPTIONS_MAINMENU]");
								upText2.antiAliasType = flash.AntiAliasType.ADVANCED;
								var upText3:flash.TextField = new flash.TextField();
								upText3.embedFonts = true;
								upText3.defaultTextFormat = aFormat;
								upText3.filters = [aGlow];
								upText3.width = 174;
								upText3.height = 41;
								upText3.x = 0;
								upText3.y = 10;
								upText3.alpha = 1;
								upText3["selectable"] = false;
								upText3.multiline = false;
								upText3["wordWrap"] = false;
								upText3.text = this.mApp["stringManager"].translateString("[OPTIONS_UPSELL]");
								upText3.antiAliasType = flash.AntiAliasType.ADVANCED;
								var upText4:flash.TextField = new flash.TextField();
								upText4.embedFonts = true;
								upText4.defaultTextFormat = aFormat;
								upText4.filters = [aGlow];
								upText4.width = 174;
								upText4.height = 41;
								upText4.x = 0;
								upText4.y = 10;
								upText4.alpha = 1;
								upText4["selectable"] = false;
								upText4.multiline = false;
								upText4["wordWrap"] = false;
								upText4.text = this.mApp["stringManager"].translateString("[OPTIONS_BACKTOGAME]");
								upText4.antiAliasType = flash.AntiAliasType.ADVANCED;
								var downText:flash.TextField = new flash.TextField();
								downText.embedFonts = true;
								downText.defaultTextFormat = aFormat;
								downText.filters = [aGlow];
								downText.width = 174;
								downText.height = 41;
								downText.x = 0;
								downText.y = 10;
								downText.alpha = 1;
								downText["selectable"] = false;
								downText.multiline = false;
								downText["wordWrap"] = false;
								downText.text = this.mApp["stringManager"].translateString("[OPTIONS_HELP]");
								downText.antiAliasType = flash.AntiAliasType.ADVANCED;
								var downText2:flash.TextField = new flash.TextField();
								downText2.embedFonts = true;
								downText2.defaultTextFormat = aFormat;
								downText2.filters = [aGlow];
								downText2.width = 174;
								downText2.height = 41;
								downText2.x = 0;
								downText2.y = 10;
								downText2.alpha = 1;
								downText2["selectable"] = false;
								downText2.multiline = false;
								downText2["wordWrap"] = false;
								downText2.text = this.mApp["stringManager"].translateString("[OPTIONS_MAINMENU]");
								downText2.antiAliasType = flash.AntiAliasType.ADVANCED;
								var downText3:flash.TextField = new flash.TextField();
								downText3.embedFonts = true;
								downText3.defaultTextFormat = aFormat;
								downText3.filters = [aGlow];
								downText3.width = 174;
								downText3.height = 41;
								downText3.x = 0;
								downText3.y = 10;
								downText3.alpha = 1;
								downText3["selectable"] = false;
								downText3.multiline = false;
								downText3["wordWrap"] = false;
								downText3.text = this.mApp["stringManager"].translateString("[OPTIONS_UPSELL]");
								downText3.antiAliasType = flash.AntiAliasType.ADVANCED;
								var downText4:flash.TextField = new flash.TextField();
								downText4.embedFonts = true;
								downText4.defaultTextFormat = aFormat;
								downText4.filters = [aGlow];
								downText4.width = 174;
								downText4.height = 41;
								downText4.x = 0;
								downText4.y = 10;
								downText4.alpha = 1;
								downText4["selectable"] = false;
								downText4.multiline = false;
								downText4["wordWrap"] = false;
								downText4.text = this.mApp["stringManager"].translateString("[OPTIONS_BACKTOGAME]");
								downText4.antiAliasType = flash.AntiAliasType.ADVANCED;
								var overText:flash.TextField = new flash.TextField();
								overText.embedFonts = true;
								overText.defaultTextFormat = aFormat;
								overText.filters = [aGlow];
								overText.width = 174;
								overText.height = 41;
								overText.x = 0;
								overText.y = 10;
								overText.alpha = 1;
								overText["selectable"] = false;
								overText.multiline = false;
								overText["wordWrap"] = false;
								overText.text = this.mApp["stringManager"].translateString("[OPTIONS_HELP]");
								overText.antiAliasType = flash.AntiAliasType.ADVANCED;
								var overText2:flash.TextField = new flash.TextField();
								overText2.embedFonts = true;
								overText2.defaultTextFormat = aFormat;
								overText2.filters = [aGlow];
								overText2.width = 174;
								overText2.height = 41;
								overText2.x = 0;
								overText2.y = 10;
								overText2.alpha = 1;
								overText2["selectable"] = false;
								overText2.multiline = false;
								overText2["wordWrap"] = false;
								overText2.text = this.mApp["stringManager"].translateString("[OPTIONS_MAINMENU]");
								overText2.antiAliasType = flash.AntiAliasType.ADVANCED;
								var overText3:flash.TextField = new flash.TextField();
								overText3.embedFonts = true;
								overText3.defaultTextFormat = aFormat;
								overText3.filters = [aGlow];
								overText3.width = 174;
								overText3.height = 41;
								overText3.x = 0;
								overText3.y = 10;
								overText3.alpha = 1;
								overText3["selectable"] = false;
								overText3.multiline = false;
								overText3["wordWrap"] = false;
								overText3.text = this.mApp["stringManager"].translateString("[OPTIONS_UPSELL]");
								overText3.antiAliasType = flash.AntiAliasType.ADVANCED;
								var overText4:flash.TextField = new flash.TextField();
								overText4.embedFonts = true;
								overText4.defaultTextFormat = aFormat;
								overText4.filters = [aGlow];
								overText4.width = 174;
								overText4.height = 41;
								overText4.x = 0;
								overText4.y = 10;
								overText4.alpha = 1;
								overText4["selectable"] = false;
								overText4.multiline = false;
								overText4["wordWrap"] = false;
								overText4.text = this.mApp["stringManager"].translateString("[OPTIONS_BACKTOGAME]");
								overText4.antiAliasType = flash.AntiAliasType.ADVANCED;
								this.mSoundText = new flash.TextField();
								this.mSoundText.embedFonts = true;
								this.mSoundText.defaultTextFormat = aFormat;
								this.mSoundText.filters = [aGlow];
								this.mSoundText.width = 174;
								this.mSoundText.height = 41;
								this.mSoundText.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + 120;
								this.mSoundText.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + 212;
								this.mSoundText.alpha = 1;
								this.mSoundText["selectable"] = false;
								this.mSoundText.multiline = false;
								this.mSoundText["wordWrap"] = false;
								this.mSoundText.text = this.mApp["stringManager"].translateString("[OPTIONS_SOUND]");
								this.mSoundText.antiAliasType = flash.AntiAliasType.ADVANCED;
								this.mMusicText = new flash.TextField();
								this.mMusicText.embedFonts = true;
								this.mMusicText.defaultTextFormat = aFormat;
								this.mMusicText.filters = [aGlow];
								this.mMusicText.width = 174;
								this.mMusicText.height = 41;
								this.mMusicText.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + 210;
								this.mMusicText.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + 115;
								this.mMusicText.alpha = 1;
								this.mMusicText["selectable"] = false;
								this.mMusicText.multiline = false;
								this.mMusicText["wordWrap"] = false;
								this.mMusicText.text = "Music";
								this.mMusicText.antiAliasType = flash.AntiAliasType.ADVANCED;
								upImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
								downImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
								overImage = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
								var upImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
								var downImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
								var overImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
								var upImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
								var downImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
								var overImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
								var upImage4:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
								var downImage4:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
								var overImage4:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
								var upSprite:egret.Sprite = new egret.Sprite();
								upSprite.addChild(upImage);
								upSprite.addChild(upText);
								var overSprite:egret.Sprite = new egret.Sprite();
								overSprite.addChild(overImage);
								overSprite.addChild(overText);
								var downSprite:egret.Sprite = new egret.Sprite();
								downSprite.addChild(downImage);
								downSprite.addChild(downText);
								var upSprite2:egret.Sprite = new egret.Sprite();
								upSprite2.addChild(upImage2);
								upSprite2.addChild(upText2);
								var overSprite2:egret.Sprite = new egret.Sprite();
								overSprite2.addChild(overImage2);
								overSprite2.addChild(overText2);
								var downSprite2:egret.Sprite = new egret.Sprite();
								downSprite2.addChild(downImage2);
								downSprite2.addChild(downText2);
								var upSprite3:egret.Sprite = new egret.Sprite();
								upSprite3.addChild(upImage3);
								upSprite3.addChild(upText3);
								var overSprite3:egret.Sprite = new egret.Sprite();
								overSprite3.addChild(overImage3);
								overSprite3.addChild(overText3);
								var downSprite3:egret.Sprite = new egret.Sprite();
								downSprite3.addChild(downImage3);
								downSprite3.addChild(downText3);
								var upSprite4:egret.Sprite = new egret.Sprite();
								upSprite4.addChild(upImage4);
								upSprite4.addChild(upText4);
								var overSprite4:egret.Sprite = new egret.Sprite();
								overSprite4.addChild(overImage4);
								overSprite4.addChild(overText4);
								var downSprite4:egret.Sprite = new egret.Sprite();
								downSprite4.addChild(downImage4);
								downSprite4.addChild(downText4);
								this.mHelpButton = new egret.SwfButton(upSprite,overSprite,downSprite,downSprite);
								this.mHelpButton.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_X;
								this.mHelpButton.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_Y;
								this.mHelpButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleHelp,this),null);
								this.mMainMenuButton = new egret.SwfButton(upSprite2,overSprite2,downSprite2,downSprite2);
								this.mMainMenuButton.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_X + 180;
								this.mMainMenuButton.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_Y;
								this.mMainMenuButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleMainMenu,this),null);
								this.mUpsellButton = new egret.SwfButton(upSprite3,overSprite3,downSprite3,downSprite3);
								this.mUpsellButton.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_X;
								this.mUpsellButton.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_DISTANCE_Y * 1;
								this.mUpsellButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleUpsell,this),null);
								this.mBackToGameButton = new egret.SwfButton(upSprite4,overSprite4,downSprite4,downSprite4);
								this.mBackToGameButton.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_X + 180;
								this.mBackToGameButton.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_DISTANCE_Y * 1;
								this.mBackToGameButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleBackToGame,this),null);
								var checkedImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
								var checkedOverImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
								var uncheckedImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
								var uncheckedOverImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
								var checked:boolean = this.mApp["mVolume"] == 0?false:true;
								this.mSoundButton = new com.popcap.flash.games.zuma2.logic.CheckBox(this.mApp,checkedImage,checkedOverImage,uncheckedImage,uncheckedOverImage,checked);
								this.mSoundButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleSoundClick,this),null);
								this.mSoundButton.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_X + 100;
								this.mSoundButton.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_DISTANCE_Y * 2 + 10;
								var checkedImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
								var checkedOverImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
								var uncheckedImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
								var uncheckedOverImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
								checked = <any>!<any>!this.mApp["soundManager"].isMuted()?false:true;
								this.mMusicButton = new com.popcap.flash.games.zuma2.logic.CheckBox(this.mApp,checkedImage2,checkedOverImage2,uncheckedImage2,uncheckedOverImage2,checked);
								this.mMusicButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleSoundClick,this),null);
								this.mMusicButton.x = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_X + 200;
								this.mMusicButton.y = com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y + com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_Y + 75;
								this.mApp["mLayers"][4].mForeground.addChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.addChild(this.mBackToGameButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mHelpButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mUpsellButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mMainMenuButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mSoundBackground);
								this.mApp["mLayers"][4].mForeground.addChild(this.mSoundText);
								this.mApp["mLayers"][4].mForeground.addChild(this.mSoundButton);
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
							}

							public handleSoundClick(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								if(this.mSoundButton.mChecked)
								{
									this.mApp["soundManager"].setVolume(1);
									this.mApp["mVolume"] = 1;
								}
								else
								{
									this.mApp["soundManager"].setVolume(0);
									this.mApp["mVolume"] = 0;
								}
							}

							public CloseMenu()
							{
								this.mApp["mLayers"][4].mForeground.removeChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mSoundButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mBackToGameButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mHelpButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mMainMenuButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mUpsellButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mSoundText);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mSoundBackground);
								this.mDialog = null;
								this.mHelpScreen = null;
							}

							public handleMainMenu(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.DisplayDialog();
							}

							public handleHelp(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.DisplayHelp();
							}

							public handleRestart(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.DisplayDialog();
							}

							public DisplayHelp()
							{
								this.HideOptionsMenu(true);
								this.mHelpScreen = new com.popcap.flash.games.zuma2.logic.HelpScreen(this.mApp,this.mBoard,this,null,com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_IN_GAME);
							}

							public DisplayDialog()
							{
								this.HideOptionsMenu(true);
								this.mDialog = new com.popcap.flash.games.zuma2.logic.Dialog(this.mApp,this.mBoard,this,null,com.popcap.flash.games.zuma2.logic.Dialog.STATE_ENDGAME);
							}

							public HideOptionsMenu(hide:boolean)
							{
								this.mBackground.visible = <any>!hide;
								this.mBackToGameButton.visible = <any>!hide;
								this.mMainMenuButton.visible = <any>!hide;
								this.mHelpButton.visible = <any>!hide;
								this.mUpsellButton.visible = <any>!hide;
								this.mSoundText.visible = <any>!hide;
								this.mSoundButton.visible = <any>!hide;
								this.mMusicText.visible = <any>!hide;
								this.mMusicButton.visible = <any>!hide;
								this.mSoundBackground.visible = <any>!hide;
								this.mMusicBackground.visible = <any>!hide;
							}

							public handleBackToGame(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.CloseMenu();
								this.mBoard["CloseMenu"]();
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

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_DISTANCE_Y = 50;
com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_Y = 100;
com.popcap.flash.games.zuma2.logic.OptionsMenu.BUTTON_OFFSET_X = 30;
com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_X = 65;
com.popcap.flash.games.zuma2.logic.OptionsMenu.MENU_OFFSET_Y = 45;
flash.extendsClass("com.popcap.flash.games.zuma2.logic.OptionsMenu","egret.Sprite")
