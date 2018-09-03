module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class MainMenu extends egret.HashObject {
							public mBackground:flash.Bitmap;
							public mMusicText:flash.TextField;
							public mChallengeButton:egret.SwfButton;
							public mSoundToggle:com.popcap.flash.games.zuma2.logic.CheckBox;
							public mHelpScreen:com.popcap.flash.games.zuma2.logic.HelpScreen;
							public mHighscoresButton:egret.SwfButton;
							public mGameWidget:com.popcap.flash.games.zuma2.widgets.GameWidget;
							public mSoundText:flash.TextField;
							public mMusicToggle:com.popcap.flash.games.zuma2.logic.CheckBox;
							public mApp:Zuma2App;
							public mAdventureButton:egret.SwfButton;
							public mHeroicFrogButton:egret.SwfButton;
							public mShowingHelp:boolean = false;
							public mHighScoresScreen:com.popcap.flash.games.zuma2.logic.HighScores;

							public constructor(app:Zuma2App,gameWidget:com.popcap.flash.games.zuma2.widgets.GameWidget)
							{
								super();
								super();
								var upText:flash.Bitmap = <any>null;
								var overText:flash.Bitmap = <any>null;
								var downText:flash.Bitmap = <any>null;
								var upSprite:egret.Sprite = <any>null;
								var overSprite:egret.Sprite = <any>null;
								var downSprite:egret.Sprite = <any>null;
								var upText4:flash.Bitmap = <any>null;
								var overText4:flash.Bitmap = <any>null;
								var downText4:flash.Bitmap = <any>null;
								this.mApp = app;
								this.mGameWidget = gameWidget;
								this.mShowingHelp = false;
								var upImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
								var overImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
								var downImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN));
								this.mBackground = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BACKGROUND));
								upText = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP));
								upText.x = 45;
								upText.y = 15;
								overText = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER));
								overText.x = 45;
								overText.y = 15;
								downText = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN));
								downText.x = 45;
								downText.y = 15;
								upSprite = new egret.Sprite();
								upSprite.addChild(upImage);
								upSprite.addChild(upText);
								overSprite = new egret.Sprite();
								overSprite.addChild(overImage);
								overSprite.addChild(overText);
								downSprite = new egret.Sprite();
								downSprite.addChild(downImage);
								downSprite.addChild(downText);
								this.mAdventureButton = new egret.SwfButton(upSprite,overSprite,downSprite,downSprite);
								this.mAdventureButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleAdventure,this),null);
								this.mAdventureButton.addEventListener(flash.MouseEvent.ROLL_OVER,flash.bind(this.handleOverSound,this),null);
								this.mAdventureButton.x = 373;
								this.mAdventureButton.y = 162;
								var upImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
								var overImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
								var downImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN));
								var upText2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP));
								upText2.x = 27;
								upText2.y = 12;
								var overText2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER));
								overText2.x = 27;
								overText2.y = 12;
								var downText2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN));
								downText2.x = 27;
								downText2.y = 12;
								var upSprite2:egret.Sprite = new egret.Sprite();
								upSprite2.addChild(upText2);
								var overSprite2:egret.Sprite = new egret.Sprite();
								overSprite2.addChild(overText2);
								var downSprite2:egret.Sprite = new egret.Sprite();
								downSprite2.addChild(downText2);
								this.mChallengeButton = new egret.SwfButton(upSprite2,overSprite2,downSprite2,downImage2);
								this.mChallengeButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleChallenge,this),null);
								this.mChallengeButton.addEventListener(flash.MouseEvent.ROLL_OVER,flash.bind(this.handleOverSound,this),null);
								this.mChallengeButton.x = 373;
								this.mChallengeButton.y = 220;
								var upImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
								var overImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
								var downImage3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN));
								var upText3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP));
								upText3.x = 25;
								upText3.y = 6;
								var overText3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER));
								overText3.x = 25;
								overText3.y = 6;
								var downText3:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN));
								downText3.x = 25;
								downText3.y = 6;
								var upSprite3:egret.Sprite = new egret.Sprite();
								upSprite3.addChild(upText3);
								var overSprite3:egret.Sprite = new egret.Sprite();
								overSprite3.addChild(overText3);
								var downSprite3:egret.Sprite = new egret.Sprite();
								downSprite3.addChild(downText3);
								this.mHeroicFrogButton = new egret.SwfButton(upSprite3,overSprite3,downSprite3,downImage3);
								this.mHeroicFrogButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleHeroicfrog,this),null);
								this.mHeroicFrogButton.addEventListener(flash.MouseEvent.ROLL_OVER,flash.bind(this.handleOverSound,this),null);
								this.mHeroicFrogButton.x = 373;
								this.mHeroicFrogButton.y = 278;
								if(this.mApp["mMoreGames"])
								{
									upText4 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP));
									upText4.x = 45;
									upText4.y = 15;
									overText4 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER));
									overText4.x = 45;
									overText4.y = 15;
									downText4 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER));
									downText4.x = 45;
									downText4.y = 15;
								}
								else
								{
									upText4 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP));
									upText4.x = 45;
									upText4.y = 15;
									overText4 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER));
									overText4.x = 45;
									overText4.y = 15;
									downText4 = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN));
									downText4.x = 45;
									downText4.y = 15;
								}
								var upSprite4:egret.Sprite = new egret.Sprite();
								upSprite4.addChild(upText4);
								var overSprite4:egret.Sprite = new egret.Sprite();
								overSprite4.addChild(overText4);
								var downSprite4:egret.Sprite = new egret.Sprite();
								downSprite4.addChild(downText4);
								this.mHighscoresButton = new egret.SwfButton(upSprite4,overSprite4,downSprite4,downSprite4);
								if(this.mApp["mMoreGames"])
								{
									this.mHighscoresButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleMoregames,this),null);
								}
								else
								{
									this.mHighscoresButton.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleHighscores,this),null);
								}
								this.mHighscoresButton.addEventListener(flash.MouseEvent.ROLL_OVER,flash.bind(this.handleOverSound,this),null);
								this.mHighscoresButton.x = -45;
								this.mHighscoresButton.y = 208;
								var checkedImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
								var checkedOverImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
								var uncheckedImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
								var uncheckedOverImage:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
								var checked:boolean = this.mApp["mVolume"] == 0?false:true;
								this.mSoundToggle = new com.popcap.flash.games.zuma2.logic.CheckBox(this.mApp,checkedImage,checkedOverImage,uncheckedImage,uncheckedOverImage,checked);
								this.mSoundToggle.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleSound,this),null);
								this.mSoundToggle.x = 373;
								this.mSoundToggle.y = 340;
								var checkedImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
								var checkedOverImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
								var uncheckedImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
								var uncheckedOverImage2:flash.Bitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
								checked = <any>!<any>!this.mApp["soundManager"].isMuted()?false:true;
								this.mMusicToggle = new com.popcap.flash.games.zuma2.logic.CheckBox(this.mApp,checkedImage2,checkedOverImage2,uncheckedImage2,uncheckedOverImage2,checked);
								this.mMusicToggle.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleMusic,this),null);
								this.mMusicToggle.x = 373;
								this.mMusicToggle.y = 356;
								var aFormat:flash.TextFormat = new flash.TextFormat();
								aFormat.font = "BonusText";
								aFormat.align = flash.TextFormatAlign.CENTER;
								aFormat.color = 15315221;
								aFormat.size = 20;
								var aGlow:flash.GlowFilter = new flash.GlowFilter(7354630,1,2,2,10,5);
								this.mSoundText = new flash.TextField();
								this.mSoundText.embedFonts = true;
								this.mSoundText.defaultTextFormat = aFormat;
								this.mSoundText.width = 120;
								this.mSoundText.height = 100;
								this.mSoundText.x = 399;
								this.mSoundText.y = 339;
								this.mSoundText.alpha = 1;
								this.mSoundText["selectable"] = false;
								this.mSoundText.multiline = false;
								this.mSoundText["wordWrap"] = false;
								this.mSoundText.text = this.mApp["stringManager"].translateString("[MAINMENU_SOUND]");
								this.mSoundText.antiAliasType = flash.AntiAliasType.ADVANCED;
								this.mMusicText = new flash.TextField();
								this.mMusicText.embedFonts = true;
								this.mMusicText.defaultTextFormat = aFormat;
								this.mMusicText.width = 120;
								this.mMusicText.height = 100;
								this.mMusicText.x = 399;
								this.mMusicText.y = 355;
								this.mMusicText.alpha = 1;
								this.mMusicText["selectable"] = false;
								this.mMusicText.multiline = false;
								this.mMusicText["wordWrap"] = false;
								this.mMusicText.text = "Music";
								this.mMusicText.antiAliasType = flash.AntiAliasType.ADVANCED;
								this.mApp["mLayers"][4].mBackground.addChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.addChild(this.mAdventureButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mChallengeButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mHeroicFrogButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mSoundToggle);
								this.mApp["mLayers"][4].mForeground.addChild(this.mHighscoresButton);
								this.mApp["mLayers"][4].mForeground.addChild(this.mSoundText);
								this.mGameWidget["Reset"]();
							}

							public handleHeroicfrog(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.ToggleButtons(false);
								var upsell:com.popcap.flash.games.zuma2.logic.Upsell = new com.popcap.flash.games.zuma2.logic.Upsell(this.mApp,this,null,com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_HEROIC);
							}

							public handleSound(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								if(this.mSoundToggle.mChecked)
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

							public handleHelp(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.ToggleButtons(false);
								this.mHelpScreen = new com.popcap.flash.games.zuma2.logic.HelpScreen(this.mApp,null,null,this,com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_MAINMENU);
								this.mShowingHelp = true;
							}

							public handleMoregames(e:flash.MouseEvent)
							{
								var url:egret.URLRequest = new egret.URLRequest(this.mApp["mMoreGamesURL"]);
								"_blank";
								url;
							}

							public handleAdventure(e:flash.MouseEvent)
							{
								if(this.mApp["mAdAPI"]._isEnabled)
								{
									this.mApp["mAdAPI"].addEventListener(AdAPIEvent.GAME_START,flash.bind(this.GameStart,this));
									this.mApp["mAdAPI"].GameReady(0,1);
								}
								else
								{
									this.GameStart(null);
								}
							}

							public handleHighscores(e:flash.MouseEvent)
							{
								this.ToggleButtons(false);
								var anArray:Array<any> = new Array();
								for(var i:number = flash.checkInt(0);i < 10; i++)
								{
									anArray[i] = 5000 * i;
								}
								this.mHighScoresScreen = new com.popcap.flash.games.zuma2.logic.HighScores(this.mApp,this,this.mApp["mHighScores"],this.mApp["mHighScoreLevels"]);
							}

							public handleOverSound(e:flash.MouseEvent)
							{
								if(<any>!this.mShowingHelp)
								{
									this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_MAINMENU_BUTTON_OVER);
								}
							}

							public CloseMenu()
							{
								this.mApp["mLayers"][4].mBackground.removeChild(this.mBackground);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mAdventureButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mChallengeButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mHeroicFrogButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mSoundToggle);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mHighscoresButton);
								this.mApp["mLayers"][4].mForeground.removeChild(this.mSoundText);
							}

							public handleChallenge(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								this.ToggleButtons(false);
								var upsell:com.popcap.flash.games.zuma2.logic.Upsell = new com.popcap.flash.games.zuma2.logic.Upsell(this.mApp,this,null,com.popcap.flash.games.zuma2.logic.Upsell.UPSELL_CHALLENGE);
							}

							public handleMusic(e:flash.MouseEvent)
							{
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								if(this.mMusicToggle.mChecked)
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

							public ToggleButtons(toggle:boolean)
							{
								this.mAdventureButton.visible = toggle;
								this.mChallengeButton.visible = toggle;
								this.mHeroicFrogButton.visible = toggle;
								this.mHighscoresButton.visible = toggle;
								this.mAdventureButton.enabled = toggle;
								this.mChallengeButton.enabled = toggle;
								this.mHeroicFrogButton.enabled = toggle;
								this.mHighscoresButton.enabled = toggle;
							}

							public GameStart(e:com.popcap.flash.framework.ads.AdAPIEvent)
							{
								this.mApp["mAdAPI"].removeEventListener(AdAPIEvent.GAME_START,flash.bind(this.GameStart,this));
								this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
								if(this.mApp["mSharedObject"].data.help)
								{
									this.ToggleButtons(false);
									this.mHelpScreen = new com.popcap.flash.games.zuma2.logic.HelpScreen(this.mApp,null,null,this,com.popcap.flash.games.zuma2.logic.HelpScreen.STATE_INTRO);
									this.mShowingHelp = true;
								}
								else
								{
									this.mGameWidget["StartNewGame"]();
									this.CloseMenu();
								}
							}

						}
					}
				}
			}
		}
	}
}

