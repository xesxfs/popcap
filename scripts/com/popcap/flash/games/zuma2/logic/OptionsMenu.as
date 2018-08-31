package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
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
   
   public class OptionsMenu extends Sprite
   {
      
      public static const BUTTON_DISTANCE_Y:int = 50;
      
      public static const BUTTON_OFFSET_Y:int = 100;
      
      public static const BUTTON_OFFSET_X:int = 30;
      
      public static const MENU_OFFSET_X:int = 65;
      
      public static const MENU_OFFSET_Y:int = 45;
       
      
      public var mBackground:Bitmap;
      
      public var mMusicText:TextField;
      
      public var mMusicBackground:Bitmap;
      
      public var mMusicButton:CheckBox;
      
      public var mUpsellButton:SimpleButton;
      
      public var mDialog:Dialog;
      
      public var mMainMenuButton:SimpleButton;
      
      public var mHelpScreen:HelpScreen;
      
      public var mHelpButton:SimpleButton;
      
      public var mSoundText:TextField;
      
      public var mSoundBackground:Bitmap;
      
      public var mBackToGameButton:SimpleButton;
      
      public var mApp:Zuma2App;
      
      public var mBoard:GameBoardWidget;
      
      public var mSoundButton:CheckBox;
      
      public function OptionsMenu(app:Zuma2App, board:GameBoardWidget)
      {
         var upImage:Bitmap = null;
         var downImage:Bitmap = null;
         var overImage:Bitmap = null;
         super();
         this.mApp = app;
         this.mBoard = board;
         this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BACKGROUND));
         this.mBackground.x = MENU_OFFSET_X;
         this.mBackground.y = MENU_OFFSET_Y;
         this.mSoundBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND));
         this.mSoundBackground.x = MENU_OFFSET_X + 120;
         this.mSoundBackground.y = MENU_OFFSET_Y + 205;
         this.mMusicBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND));
         this.mMusicBackground.x = MENU_OFFSET_X + 210;
         this.mMusicBackground.y = MENU_OFFSET_Y + 110;
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "BonusText";
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 15315221;
         aFormat.size = 16;
         var aGlow:GlowFilter = new GlowFilter(7354630,1,2,2,10,5);
         var upText:TextField = new TextField();
         upText.embedFonts = true;
         upText.defaultTextFormat = aFormat;
         upText.filters = [aGlow];
         upText.width = 174;
         upText.height = 41;
         upText.x = 0;
         upText.y = 10;
         upText.alpha = 1;
         upText.selectable = false;
         upText.multiline = false;
         upText.wordWrap = false;
         upText.text = this.mApp.stringManager.translateString("[OPTIONS_HELP]");
         upText.antiAliasType = AntiAliasType.ADVANCED;
         var upText2:TextField = new TextField();
         upText2.embedFonts = true;
         upText2.defaultTextFormat = aFormat;
         upText2.filters = [aGlow];
         upText2.width = 174;
         upText2.height = 41;
         upText2.x = 0;
         upText2.y = 10;
         upText2.alpha = 1;
         upText2.selectable = false;
         upText2.multiline = false;
         upText2.wordWrap = false;
         upText2.text = this.mApp.stringManager.translateString("[OPTIONS_MAINMENU]");
         upText2.antiAliasType = AntiAliasType.ADVANCED;
         var upText3:TextField = new TextField();
         upText3.embedFonts = true;
         upText3.defaultTextFormat = aFormat;
         upText3.filters = [aGlow];
         upText3.width = 174;
         upText3.height = 41;
         upText3.x = 0;
         upText3.y = 10;
         upText3.alpha = 1;
         upText3.selectable = false;
         upText3.multiline = false;
         upText3.wordWrap = false;
         upText3.text = this.mApp.stringManager.translateString("[OPTIONS_UPSELL]");
         upText3.antiAliasType = AntiAliasType.ADVANCED;
         var upText4:TextField = new TextField();
         upText4.embedFonts = true;
         upText4.defaultTextFormat = aFormat;
         upText4.filters = [aGlow];
         upText4.width = 174;
         upText4.height = 41;
         upText4.x = 0;
         upText4.y = 10;
         upText4.alpha = 1;
         upText4.selectable = false;
         upText4.multiline = false;
         upText4.wordWrap = false;
         upText4.text = this.mApp.stringManager.translateString("[OPTIONS_BACKTOGAME]");
         upText4.antiAliasType = AntiAliasType.ADVANCED;
         var downText:TextField = new TextField();
         downText.embedFonts = true;
         downText.defaultTextFormat = aFormat;
         downText.filters = [aGlow];
         downText.width = 174;
         downText.height = 41;
         downText.x = 0;
         downText.y = 10;
         downText.alpha = 1;
         downText.selectable = false;
         downText.multiline = false;
         downText.wordWrap = false;
         downText.text = this.mApp.stringManager.translateString("[OPTIONS_HELP]");
         downText.antiAliasType = AntiAliasType.ADVANCED;
         var downText2:TextField = new TextField();
         downText2.embedFonts = true;
         downText2.defaultTextFormat = aFormat;
         downText2.filters = [aGlow];
         downText2.width = 174;
         downText2.height = 41;
         downText2.x = 0;
         downText2.y = 10;
         downText2.alpha = 1;
         downText2.selectable = false;
         downText2.multiline = false;
         downText2.wordWrap = false;
         downText2.text = this.mApp.stringManager.translateString("[OPTIONS_MAINMENU]");
         downText2.antiAliasType = AntiAliasType.ADVANCED;
         var downText3:TextField = new TextField();
         downText3.embedFonts = true;
         downText3.defaultTextFormat = aFormat;
         downText3.filters = [aGlow];
         downText3.width = 174;
         downText3.height = 41;
         downText3.x = 0;
         downText3.y = 10;
         downText3.alpha = 1;
         downText3.selectable = false;
         downText3.multiline = false;
         downText3.wordWrap = false;
         downText3.text = this.mApp.stringManager.translateString("[OPTIONS_UPSELL]");
         downText3.antiAliasType = AntiAliasType.ADVANCED;
         var downText4:TextField = new TextField();
         downText4.embedFonts = true;
         downText4.defaultTextFormat = aFormat;
         downText4.filters = [aGlow];
         downText4.width = 174;
         downText4.height = 41;
         downText4.x = 0;
         downText4.y = 10;
         downText4.alpha = 1;
         downText4.selectable = false;
         downText4.multiline = false;
         downText4.wordWrap = false;
         downText4.text = this.mApp.stringManager.translateString("[OPTIONS_BACKTOGAME]");
         downText4.antiAliasType = AntiAliasType.ADVANCED;
         var overText:TextField = new TextField();
         overText.embedFonts = true;
         overText.defaultTextFormat = aFormat;
         overText.filters = [aGlow];
         overText.width = 174;
         overText.height = 41;
         overText.x = 0;
         overText.y = 10;
         overText.alpha = 1;
         overText.selectable = false;
         overText.multiline = false;
         overText.wordWrap = false;
         overText.text = this.mApp.stringManager.translateString("[OPTIONS_HELP]");
         overText.antiAliasType = AntiAliasType.ADVANCED;
         var overText2:TextField = new TextField();
         overText2.embedFonts = true;
         overText2.defaultTextFormat = aFormat;
         overText2.filters = [aGlow];
         overText2.width = 174;
         overText2.height = 41;
         overText2.x = 0;
         overText2.y = 10;
         overText2.alpha = 1;
         overText2.selectable = false;
         overText2.multiline = false;
         overText2.wordWrap = false;
         overText2.text = this.mApp.stringManager.translateString("[OPTIONS_MAINMENU]");
         overText2.antiAliasType = AntiAliasType.ADVANCED;
         var overText3:TextField = new TextField();
         overText3.embedFonts = true;
         overText3.defaultTextFormat = aFormat;
         overText3.filters = [aGlow];
         overText3.width = 174;
         overText3.height = 41;
         overText3.x = 0;
         overText3.y = 10;
         overText3.alpha = 1;
         overText3.selectable = false;
         overText3.multiline = false;
         overText3.wordWrap = false;
         overText3.text = this.mApp.stringManager.translateString("[OPTIONS_UPSELL]");
         overText3.antiAliasType = AntiAliasType.ADVANCED;
         var overText4:TextField = new TextField();
         overText4.embedFonts = true;
         overText4.defaultTextFormat = aFormat;
         overText4.filters = [aGlow];
         overText4.width = 174;
         overText4.height = 41;
         overText4.x = 0;
         overText4.y = 10;
         overText4.alpha = 1;
         overText4.selectable = false;
         overText4.multiline = false;
         overText4.wordWrap = false;
         overText4.text = this.mApp.stringManager.translateString("[OPTIONS_BACKTOGAME]");
         overText4.antiAliasType = AntiAliasType.ADVANCED;
         this.mSoundText = new TextField();
         this.mSoundText.embedFonts = true;
         this.mSoundText.defaultTextFormat = aFormat;
         this.mSoundText.filters = [aGlow];
         this.mSoundText.width = 174;
         this.mSoundText.height = 41;
         this.mSoundText.x = MENU_OFFSET_X + 120;
         this.mSoundText.y = MENU_OFFSET_Y + 212;
         this.mSoundText.alpha = 1;
         this.mSoundText.selectable = false;
         this.mSoundText.multiline = false;
         this.mSoundText.wordWrap = false;
         this.mSoundText.text = this.mApp.stringManager.translateString("[OPTIONS_SOUND]");
         this.mSoundText.antiAliasType = AntiAliasType.ADVANCED;
         this.mMusicText = new TextField();
         this.mMusicText.embedFonts = true;
         this.mMusicText.defaultTextFormat = aFormat;
         this.mMusicText.filters = [aGlow];
         this.mMusicText.width = 174;
         this.mMusicText.height = 41;
         this.mMusicText.x = MENU_OFFSET_X + 210;
         this.mMusicText.y = MENU_OFFSET_Y + 115;
         this.mMusicText.alpha = 1;
         this.mMusicText.selectable = false;
         this.mMusicText.multiline = false;
         this.mMusicText.wordWrap = false;
         this.mMusicText.text = "Music";
         this.mMusicText.antiAliasType = AntiAliasType.ADVANCED;
         upImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
         downImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
         overImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
         var upImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
         var downImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
         var overImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
         var upImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
         var downImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
         var overImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
         var upImage4:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_UP));
         var downImage4:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_DOWN));
         var overImage4:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_OVER));
         var upSprite:Sprite = new Sprite();
         upSprite.addChild(upImage);
         upSprite.addChild(upText);
         var overSprite:Sprite = new Sprite();
         overSprite.addChild(overImage);
         overSprite.addChild(overText);
         var downSprite:Sprite = new Sprite();
         downSprite.addChild(downImage);
         downSprite.addChild(downText);
         var upSprite2:Sprite = new Sprite();
         upSprite2.addChild(upImage2);
         upSprite2.addChild(upText2);
         var overSprite2:Sprite = new Sprite();
         overSprite2.addChild(overImage2);
         overSprite2.addChild(overText2);
         var downSprite2:Sprite = new Sprite();
         downSprite2.addChild(downImage2);
         downSprite2.addChild(downText2);
         var upSprite3:Sprite = new Sprite();
         upSprite3.addChild(upImage3);
         upSprite3.addChild(upText3);
         var overSprite3:Sprite = new Sprite();
         overSprite3.addChild(overImage3);
         overSprite3.addChild(overText3);
         var downSprite3:Sprite = new Sprite();
         downSprite3.addChild(downImage3);
         downSprite3.addChild(downText3);
         var upSprite4:Sprite = new Sprite();
         upSprite4.addChild(upImage4);
         upSprite4.addChild(upText4);
         var overSprite4:Sprite = new Sprite();
         overSprite4.addChild(overImage4);
         overSprite4.addChild(overText4);
         var downSprite4:Sprite = new Sprite();
         downSprite4.addChild(downImage4);
         downSprite4.addChild(downText4);
         this.mHelpButton = new SimpleButton(upSprite,overSprite,downSprite,downSprite);
         this.mHelpButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X;
         this.mHelpButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y;
         this.mHelpButton.addEventListener(MouseEvent.CLICK,this.handleHelp);
         this.mMainMenuButton = new SimpleButton(upSprite2,overSprite2,downSprite2,downSprite2);
         this.mMainMenuButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X + 180;
         this.mMainMenuButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y;
         this.mMainMenuButton.addEventListener(MouseEvent.CLICK,this.handleMainMenu);
         this.mUpsellButton = new SimpleButton(upSprite3,overSprite3,downSprite3,downSprite3);
         this.mUpsellButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X;
         this.mUpsellButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y + BUTTON_DISTANCE_Y * 1;
         this.mUpsellButton.addEventListener(MouseEvent.CLICK,this.handleUpsell);
         this.mBackToGameButton = new SimpleButton(upSprite4,overSprite4,downSprite4,downSprite4);
         this.mBackToGameButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X + 180;
         this.mBackToGameButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y + BUTTON_DISTANCE_Y * 1;
         this.mBackToGameButton.addEventListener(MouseEvent.CLICK,this.handleBackToGame);
         var checkedImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
         var checkedOverImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
         var uncheckedImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
         var uncheckedOverImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
         var checked:Boolean = this.mApp.mVolume == 0?false:true;
         this.mSoundButton = new CheckBox(this.mApp,checkedImage,checkedOverImage,uncheckedImage,uncheckedOverImage,checked);
         this.mSoundButton.addEventListener(MouseEvent.CLICK,this.handleSoundClick);
         this.mSoundButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X + 100;
         this.mSoundButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y + BUTTON_DISTANCE_Y * 2 + 10;
         var checkedImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED));
         var checkedOverImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER));
         var uncheckedImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED));
         var uncheckedOverImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER));
         checked = !!this.mApp.soundManager.isMuted()?false:true;
         this.mMusicButton = new CheckBox(this.mApp,checkedImage2,checkedOverImage2,uncheckedImage2,uncheckedOverImage2,checked);
         this.mMusicButton.addEventListener(MouseEvent.CLICK,this.handleSoundClick);
         this.mMusicButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X + 200;
         this.mMusicButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y + 75;
         this.mApp.mLayers[4].mForeground.addChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.addChild(this.mBackToGameButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mHelpButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mUpsellButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mMainMenuButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mSoundBackground);
         this.mApp.mLayers[4].mForeground.addChild(this.mSoundText);
         this.mApp.mLayers[4].mForeground.addChild(this.mSoundButton);
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
      }
      
      public function handleSoundClick(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         if(this.mSoundButton.mChecked)
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
      
      public function CloseMenu() : void
      {
         this.mApp.mLayers[4].mForeground.removeChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.removeChild(this.mSoundButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mBackToGameButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mHelpButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mMainMenuButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mUpsellButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mSoundText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mSoundBackground);
         this.mDialog = null;
         this.mHelpScreen = null;
      }
      
      public function handleMainMenu(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.DisplayDialog();
      }
      
      public function handleHelp(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.DisplayHelp();
      }
      
      public function handleRestart(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.DisplayDialog();
      }
      
      public function DisplayHelp() : void
      {
         this.HideOptionsMenu(true);
         this.mHelpScreen = new HelpScreen(this.mApp,this.mBoard,this,null,HelpScreen.STATE_IN_GAME);
      }
      
      public function DisplayDialog() : void
      {
         this.HideOptionsMenu(true);
         this.mDialog = new Dialog(this.mApp,this.mBoard,this,null,Dialog.STATE_ENDGAME);
      }
      
      public function HideOptionsMenu(hide:Boolean) : void
      {
         this.mBackground.visible = !hide;
         this.mBackToGameButton.visible = !hide;
         this.mMainMenuButton.visible = !hide;
         this.mHelpButton.visible = !hide;
         this.mUpsellButton.visible = !hide;
         this.mSoundText.visible = !hide;
         this.mSoundButton.visible = !hide;
         this.mMusicText.visible = !hide;
         this.mMusicButton.visible = !hide;
         this.mSoundBackground.visible = !hide;
         this.mMusicBackground.visible = !hide;
      }
      
      public function handleBackToGame(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.CloseMenu();
         this.mBoard.CloseMenu();
      }
      
      public function handleUpsell(e:MouseEvent) : void
      {
         var url:URLRequest = new URLRequest(this.mApp.mUpsellURL);
         "_blank";
         url;
         ;
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.CustomEvent(null);
         }
      }
   }
}
