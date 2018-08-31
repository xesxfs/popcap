package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.ads.AdAPIEvent;
   import com.popcap.flash.games.zuma2.widgets.GameWidget;
   import flash.display.Bitmap;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class MainMenu
   {
       
      
      public var mBackground:Bitmap;
      
      public var mMusicText:TextField;
      
      public var mChallengeButton:SimpleButton;
      
      public var mSoundToggle:CheckBox;
      
      public var mHelpScreen:HelpScreen;
      
      public var mHighscoresButton:SimpleButton;
      
      public var mGameWidget:GameWidget;
      
      public var mSoundText:TextField;
      
      public var mMusicToggle:CheckBox;
      
      public var mApp:Zuma2App;
      
      public var mAdventureButton:SimpleButton;
      
      public var mHeroicFrogButton:SimpleButton;
      
      public var mShowingHelp:Boolean;
      
      public var mHighScoresScreen:HighScores;
      
      public function MainMenu(app:Zuma2App, gameWidget:GameWidget)
      {
         var upText:Bitmap = null;
         var overText:Bitmap = null;
         var downText:Bitmap = null;
         var upSprite:Sprite = null;
         var overSprite:Sprite = null;
         var downSprite:Sprite = null;
         var upText4:Bitmap = null;
         var overText4:Bitmap = null;
         var downText4:Bitmap = null;
         super();
         this.mApp = app;
         this.mGameWidget = gameWidget;
         this.mShowingHelp = false;
         var upImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
         var overImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
         var downImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN));
         this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BACKGROUND));
         upText = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP));
         upText.x = 45;
         upText.y = 15;
         overText = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER));
         overText.x = 45;
         overText.y = 15;
         downText = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN));
         downText.x = 45;
         downText.y = 15;
         upSprite = new Sprite();
         upSprite.addChild(upImage);
         upSprite.addChild(upText);
         overSprite = new Sprite();
         overSprite.addChild(overImage);
         overSprite.addChild(overText);
         downSprite = new Sprite();
         downSprite.addChild(downImage);
         downSprite.addChild(downText);
         this.mAdventureButton = new SimpleButton(upSprite,overSprite,downSprite,downSprite);
         this.mAdventureButton.addEventListener(MouseEvent.CLICK,this.handleAdventure);
         this.mAdventureButton.addEventListener(MouseEvent.ROLL_OVER,this.handleOverSound);
         this.mAdventureButton.x = 373;
         this.mAdventureButton.y = 162;
         var upImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
         var overImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
         var downImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN));
         var upText2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP));
         upText2.x = 27;
         upText2.y = 12;
         var overText2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER));
         overText2.x = 27;
         overText2.y = 12;
         var downText2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN));
         downText2.x = 27;
         downText2.y = 12;
         var upSprite2:Sprite = new Sprite();
         upSprite2.addChild(upText2);
         var overSprite2:Sprite = new Sprite();
         overSprite2.addChild(overText2);
         var downSprite2:Sprite = new Sprite();
         downSprite2.addChild(downText2);
         this.mChallengeButton = new SimpleButton(upSprite2,overSprite2,downSprite2,downImage2);
         this.mChallengeButton.addEventListener(MouseEvent.CLICK,this.handleChallenge);
         this.mChallengeButton.addEventListener(MouseEvent.ROLL_OVER,this.handleOverSound);
         this.mChallengeButton.x = 373;
         this.mChallengeButton.y = 220;
         var upImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
         var overImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_UP));
         var downImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN));
         var upText3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP));
         upText3.x = 25;
         upText3.y = 6;
         var overText3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER));
         overText3.x = 25;
         overText3.y = 6;
         var downText3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN));
         downText3.x = 25;
         downText3.y = 6;
         var upSprite3:Sprite = new Sprite();
         upSprite3.addChild(upText3);
         var overSprite3:Sprite = new Sprite();
         overSprite3.addChild(overText3);
         var downSprite3:Sprite = new Sprite();
         downSprite3.addChild(downText3);
         this.mHeroicFrogButton = new SimpleButton(upSprite3,overSprite3,downSprite3,downImage3);
         this.mHeroicFrogButton.addEventListener(MouseEvent.CLICK,this.handleHeroicfrog);
         this.mHeroicFrogButton.addEventListener(MouseEvent.ROLL_OVER,this.handleOverSound);
         this.mHeroicFrogButton.x = 373;
         this.mHeroicFrogButton.y = 278;
         if(this.mApp.mMoreGames)
         {
            upText4 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP));
            upText4.x = 45;
            upText4.y = 15;
            overText4 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER));
            overText4.x = 45;
            overText4.y = 15;
            downText4 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER));
            downText4.x = 45;
            downText4.y = 15;
         }
         else
         {
            upText4 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP));
            upText4.x = 45;
            upText4.y = 15;
            overText4 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER));
            overText4.x = 45;
            overText4.y = 15;
            downText4 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN));
            downText4.x = 45;
            downText4.y = 15;
         }
         var upSprite4:Sprite = new Sprite();
         upSprite4.addChild(upText4);
         var overSprite4:Sprite = new Sprite();
         overSprite4.addChild(overText4);
         var downSprite4:Sprite = new Sprite();
         downSprite4.addChild(downText4);
         this.mHighscoresButton = new SimpleButton(upSprite4,overSprite4,downSprite4,downSprite4);
         if(this.mApp.mMoreGames)
         {
            this.mHighscoresButton.addEventListener(MouseEvent.CLICK,this.handleMoregames);
         }
         else
         {
            this.mHighscoresButton.addEventListener(MouseEvent.CLICK,this.handleHighscores);
         }
         this.mHighscoresButton.addEventListener(MouseEvent.ROLL_OVER,this.handleOverSound);
         this.mHighscoresButton.x = -45;
         this.mHighscoresButton.y = 208;
         var checkedImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
         var checkedOverImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
         var uncheckedImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
         var uncheckedOverImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
         var checked:Boolean = this.mApp.mVolume == 0?false:true;
         this.mSoundToggle = new CheckBox(this.mApp,checkedImage,checkedOverImage,uncheckedImage,uncheckedOverImage,checked);
         this.mSoundToggle.addEventListener(MouseEvent.CLICK,this.handleSound);
         this.mSoundToggle.x = 373;
         this.mSoundToggle.y = 340;
         var checkedImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
         var checkedOverImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
         var uncheckedImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
         var uncheckedOverImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
         checked = !!this.mApp.soundManager.isMuted()?false:true;
         this.mMusicToggle = new CheckBox(this.mApp,checkedImage2,checkedOverImage2,uncheckedImage2,uncheckedOverImage2,checked);
         this.mMusicToggle.addEventListener(MouseEvent.CLICK,this.handleMusic);
         this.mMusicToggle.x = 373;
         this.mMusicToggle.y = 356;
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "BonusText";
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 15315221;
         aFormat.size = 20;
         var aGlow:GlowFilter = new GlowFilter(7354630,1,2,2,10,5);
         this.mSoundText = new TextField();
         this.mSoundText.embedFonts = true;
         this.mSoundText.defaultTextFormat = aFormat;
         this.mSoundText.width = 120;
         this.mSoundText.height = 100;
         this.mSoundText.x = 399;
         this.mSoundText.y = 339;
         this.mSoundText.alpha = 1;
         this.mSoundText.selectable = false;
         this.mSoundText.multiline = false;
         this.mSoundText.wordWrap = false;
         this.mSoundText.text = this.mApp.stringManager.translateString("[MAINMENU_SOUND]");
         this.mSoundText.antiAliasType = AntiAliasType.ADVANCED;
         this.mMusicText = new TextField();
         this.mMusicText.embedFonts = true;
         this.mMusicText.defaultTextFormat = aFormat;
         this.mMusicText.width = 120;
         this.mMusicText.height = 100;
         this.mMusicText.x = 399;
         this.mMusicText.y = 355;
         this.mMusicText.alpha = 1;
         this.mMusicText.selectable = false;
         this.mMusicText.multiline = false;
         this.mMusicText.wordWrap = false;
         this.mMusicText.text = "Music";
         this.mMusicText.antiAliasType = AntiAliasType.ADVANCED;
         this.mApp.mLayers[4].mBackground.addChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.addChild(this.mAdventureButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mChallengeButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mHeroicFrogButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mSoundToggle);
         this.mApp.mLayers[4].mForeground.addChild(this.mHighscoresButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mSoundText);
         this.mGameWidget.Reset();
      }
      
      public function handleHeroicfrog(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.ToggleButtons(false);
         var upsell:Upsell = new Upsell(this.mApp,this,null,Upsell.UPSELL_HEROIC);
      }
      
      public function handleSound(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         if(this.mSoundToggle.mChecked)
         {
            this.mApp.soundManager.setVolume(1);
            this.mApp.mVolume = 1;
         }
         else
         {
            this.mApp.soundManager.setVolume(0);
            this.mApp.mVolume = 0;
         }
      }
      
      public function handleHelp(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.ToggleButtons(false);
         this.mHelpScreen = new HelpScreen(this.mApp,null,null,this,HelpScreen.STATE_MAINMENU);
         this.mShowingHelp = true;
      }
      
      public function handleMoregames(e:MouseEvent) : void
      {
         var url:URLRequest = new URLRequest(this.mApp.mMoreGamesURL);
         "_blank";
         url;
         ;
      }
      
      public function handleAdventure(e:MouseEvent) : void
      {
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.addEventListener(AdAPIEvent.GAME_START,this.GameStart);
            this.mApp.mAdAPI.GameReady(0,1);
         }
         else
         {
            this.GameStart(null);
         }
      }
      
      public function handleHighscores(e:MouseEvent) : void
      {
         this.ToggleButtons(false);
         var anArray:Array = new Array();
         for(var i:int = 0; i < 10; i++)
         {
            anArray[i] = 5000 * i;
         }
         this.mHighScoresScreen = new HighScores(this.mApp,this,this.mApp.mHighScores,this.mApp.mHighScoreLevels);
      }
      
      public function handleOverSound(e:MouseEvent) : void
      {
         if(!this.mShowingHelp)
         {
            this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_MAINMENU_BUTTON_OVER);
         }
      }
      
      public function CloseMenu() : void
      {
         this.mApp.mLayers[4].mBackground.removeChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.removeChild(this.mAdventureButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mChallengeButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mHeroicFrogButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mSoundToggle);
         this.mApp.mLayers[4].mForeground.removeChild(this.mHighscoresButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mSoundText);
      }
      
      public function handleChallenge(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.ToggleButtons(false);
         var upsell:Upsell = new Upsell(this.mApp,this,null,Upsell.UPSELL_CHALLENGE);
      }
      
      public function handleMusic(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         if(this.mMusicToggle.mChecked)
         {
            this.mApp.soundManager.setVolume(1);
            this.mApp.mVolume = 1;
         }
         else
         {
            this.mApp.soundManager.setVolume(0);
            this.mApp.mVolume = 0;
         }
      }
      
      public function ToggleButtons(toggle:Boolean) : void
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
      
      public function GameStart(e:AdAPIEvent) : void
      {
         this.mApp.mAdAPI.removeEventListener(AdAPIEvent.GAME_START,this.GameStart);
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         if(this.mApp.mSharedObject.data.help)
         {
            this.ToggleButtons(false);
            this.mHelpScreen = new HelpScreen(this.mApp,null,null,this,HelpScreen.STATE_INTRO);
            this.mShowingHelp = true;
         }
         else
         {
            this.mGameWidget.StartNewGame();
            this.CloseMenu();
         }
      }
   }
}
