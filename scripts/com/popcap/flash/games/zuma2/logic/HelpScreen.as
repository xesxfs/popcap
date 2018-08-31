package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import flash.display.Bitmap;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class HelpScreen
   {
      
      public static const STATE_BUTTON_DOWN:int = 2;
      
      public static const STATE_INTRO:int = 1;
      
      public static const STATE_MAINMENU:int = 2;
      
      public static const PAGE2:int = 1;
      
      public static const PAGE3:int = 2;
      
      public static const PAGE1:int = 0;
      
      public static const STATE_BUTTON_OVER:int = 1;
      
      public static const STATE_BUTTON_UP:int = 0;
      
      public static const STATE_IN_GAME:int = 0;
       
      
      public var mMainMenu:MainMenu;
      
      public var mContinueButton:SimpleButton;
      
      public var mDontShowButton:SimpleButton;
      
      public var mBackground2:Bitmap;
      
      public var mBackground3:Bitmap;
      
      public var mHelpText:Array;
      
      public var mState:int;
      
      public var mPage1Button:SimpleButton;
      
      public var mPage2Button:SimpleButton;
      
      public var mPage3Button:SimpleButton;
      
      public var mApp:Zuma2App;
      
      public var mOptionsMenu:OptionsMenu;
      
      public var mBoard:GameBoardWidget;
      
      public var mBackground:Bitmap;
      
      public function HelpScreen(app:Zuma2App, board:GameBoardWidget, optionsMenu:OptionsMenu, mainMenu:MainMenu, state:int)
      {
         var upImage:Bitmap = null;
         var downImage:Bitmap = null;
         var overImage:Bitmap = null;
         var upImage2:Bitmap = null;
         var downImage2:Bitmap = null;
         var overImage2:Bitmap = null;
         var upText2:TextField = null;
         var downText2:TextField = null;
         var overText2:TextField = null;
         var upSprite2:Sprite = null;
         var downSprite2:Sprite = null;
         var overSprite2:Sprite = null;
         super();
         this.mApp = app;
         this.mBoard = board;
         this.mOptionsMenu = optionsMenu;
         this.mMainMenu = mainMenu;
         this.mState = state;
         this.mHelpText = new Array();
         this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BACKGROUND));
         this.mBackground2 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BACKGROUND2));
         this.mBackground2.visible = false;
         this.mBackground3 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BACKGROUND3));
         this.mBackground3.visible = false;
         this.mApp.mLayers[4].mForeground.addChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.addChild(this.mBackground2);
         this.mApp.mLayers[4].mForeground.addChild(this.mBackground3);
         upImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP));
         downImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN));
         overImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER));
         var upText:TextField = this.makeText(this.mApp.stringManager.translateString("[HELP_BUTTON_CONTINUE]"),STATE_BUTTON_UP);
         upText.y = 8;
         var downText:TextField = this.makeText(this.mApp.stringManager.translateString("[HELP_BUTTON_CONTINUE]"),STATE_BUTTON_DOWN);
         downText.y = 8;
         var overText:TextField = this.makeText(this.mApp.stringManager.translateString("[HELP_BUTTON_CONTINUE]"),STATE_BUTTON_OVER);
         overText.y = 8;
         var upSprite:Sprite = new Sprite();
         var downSprite:Sprite = new Sprite();
         var overSprite:Sprite = new Sprite();
         upSprite.addChild(upImage);
         upSprite.addChild(upText);
         downSprite.addChild(downImage);
         downSprite.addChild(downText);
         overSprite.addChild(overImage);
         overSprite.addChild(overText);
         this.mContinueButton = new SimpleButton(upSprite,overSprite,downSprite,downSprite);
         switch(this.mState)
         {
            case STATE_IN_GAME:
               this.mContinueButton.addEventListener(MouseEvent.CLICK,this.handleInGameCont);
               this.mContinueButton.x = 200;
               this.mContinueButton.y = 360;
               break;
            case STATE_INTRO:
               this.mContinueButton.addEventListener(MouseEvent.CLICK,this.handleIntroCont);
               this.mContinueButton.x = 320;
               this.mContinueButton.y = 360;
               upImage2 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP));
               downImage2 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN));
               overImage2 = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER));
               upText2 = this.makeText(this.mApp.stringManager.translateString("[HELP_BUTTON_DONTSHOW]"),STATE_BUTTON_UP);
               upText2.x = 25;
               upText2.y = 8;
               downText2 = this.makeText(this.mApp.stringManager.translateString("[HELP_BUTTON_DONTSHOW]"),STATE_BUTTON_DOWN);
               downText2.x = 25;
               downText2.y = 8;
               overText2 = this.makeText(this.mApp.stringManager.translateString("[HELP_BUTTON_DONTSHOW]"),STATE_BUTTON_OVER);
               overText2.x = 25;
               overText2.y = 8;
               upSprite2 = new Sprite();
               downSprite2 = new Sprite();
               overSprite2 = new Sprite();
               upSprite2.addChild(upImage2);
               upSprite2.addChild(upText2);
               downSprite2.addChild(downImage2);
               downSprite2.addChild(downText2);
               overSprite2.addChild(overImage2);
               overSprite2.addChild(overText2);
               this.mDontShowButton = new SimpleButton(upSprite2,overSprite2,downSprite2,downSprite2);
               this.mDontShowButton.addEventListener(MouseEvent.CLICK,this.handleDontShow);
               this.mDontShowButton.x = 60;
               this.mDontShowButton.y = 360;
               this.mApp.mLayers[4].mForeground.addChild(this.mDontShowButton);
               break;
            case STATE_MAINMENU:
               this.mContinueButton.addEventListener(MouseEvent.CLICK,this.handleMainMenuCont);
               this.mContinueButton.x = 195;
               this.mContinueButton.y = 360;
         }
         var upImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE1_UP));
         var downImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER));
         var overImage3:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER));
         this.mPage1Button = new SimpleButton(upImage3,overImage3,downImage3,downImage3);
         this.mPage1Button.addEventListener(MouseEvent.CLICK,this.handlePage1);
         this.mPage1Button.x = 28;
         this.mPage1Button.y = 28;
         this.mPage1Button.visible = false;
         var upImage4:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE2_UP));
         var downImage4:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER));
         var overImage4:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER));
         this.mPage2Button = new SimpleButton(upImage4,overImage4,downImage4,downImage4);
         this.mPage2Button.addEventListener(MouseEvent.CLICK,this.handlePage2);
         this.mPage2Button.x = 445;
         this.mPage2Button.y = 28;
         var upImage5:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE3_UP));
         var downImage5:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER));
         var overImage5:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER));
         this.mPage3Button = new SimpleButton(upImage5,overImage5,downImage5,downImage5);
         this.mPage3Button.addEventListener(MouseEvent.CLICK,this.handlePage3);
         this.mPage3Button.x = 445;
         this.mPage3Button.y = 28;
         this.mPage3Button.visible = false;
         this.loadPage1Text();
         this.mApp.mLayers[4].mForeground.addChild(this.mPage1Button);
         this.mApp.mLayers[4].mForeground.addChild(this.mPage2Button);
         this.mApp.mLayers[4].mForeground.addChild(this.mPage3Button);
         this.mApp.mLayers[4].mForeground.addChild(this.mContinueButton);
      }
      
      public function CloseHelp() : void
      {
         this.mApp.mLayers[4].mForeground.removeChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.removeChild(this.mBackground2);
         this.mApp.mLayers[4].mForeground.removeChild(this.mBackground3);
         this.mApp.mLayers[4].mForeground.removeChild(this.mPage1Button);
         this.mApp.mLayers[4].mForeground.removeChild(this.mPage2Button);
         this.mApp.mLayers[4].mForeground.removeChild(this.mPage3Button);
         this.mApp.mLayers[4].mForeground.removeChild(this.mContinueButton);
         for(var i:int = 0; i < this.mHelpText.length; i++)
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
      
      public function makeText(text:String, state:int) : TextField
      {
         var color:uint = 0;
         var glow:uint = 0;
         switch(state)
         {
            case STATE_BUTTON_UP:
               color = 7645475;
               glow = 2043904;
               break;
            case STATE_BUTTON_OVER:
               color = 13238069;
               glow = 2043904;
               break;
            case STATE_BUTTON_DOWN:
               color = 13238069;
               glow = 2043904;
         }
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "BonusText";
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = color;
         aFormat.size = 16;
         var aGlow:GlowFilter = new GlowFilter(glow,1,2,2,10,5);
         var tf:TextField = new TextField();
         tf.embedFonts = true;
         tf.defaultTextFormat = aFormat;
         tf.filters = [aGlow];
         tf.width = 155;
         tf.height = 40;
         tf.x = -5;
         tf.y = 0;
         tf.alpha = 1;
         tf.selectable = false;
         tf.multiline = false;
         tf.wordWrap = false;
         tf.text = text;
         return tf;
      }
      
      public function makeHelpSubtitle(type:int, text:String, x:Number, y:Number, width:Number, height:Number) : TextField
      {
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "TimeUpText";
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 12883257;
         aFormat.size = 20;
         var aGlow:GlowFilter = new GlowFilter(0,1,2,2,10,5);
         var tf:TextField = new TextField();
         tf.embedFonts = true;
         tf.defaultTextFormat = aFormat;
         tf.filters = [aGlow];
         tf.width = width;
         tf.height = height;
         tf.x = x;
         tf.y = y;
         tf.alpha = 1;
         tf.selectable = false;
         tf.multiline = false;
         tf.wordWrap = false;
         tf.text = text;
         return tf;
      }
      
      public function loadPage1Text() : void
      {
         this.clearHelpText();
         var tf:TextField = this.makeHelpText(PAGE1,this.mApp.stringManager.translateString("[HOWTOPLAY_THEBASICS_BLOCK1]"),70,100,200,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpText(PAGE1,this.mApp.stringManager.translateString("[HOWTOPLAY_THEBASICS_BLOCK2]"),270,130,200,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpText(PAGE1,this.mApp.stringManager.translateString("[HOWTOPLAY_THEBASICS_BLOCK3]"),50,195,200,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpText(PAGE1,this.mApp.stringManager.translateString("[HOWTOPLAY_THEBASICS_BLOCK4]"),270,245,200,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpTitle(PAGE1,this.mApp.stringManager.translateString("[HOWTOPLAY_HEADER]"),180,5,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpSubtitle(PAGE1,this.mApp.stringManager.translateString("[HOWTOPLAY_THEBASICS_TITLE]"),182,50,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
      }
      
      public function loadPage3Text() : void
      {
         var aString:* = null;
         var y:Number = NaN;
         var tf:TextField = null;
         this.clearHelpText();
         for(var i:int = 0; i < 10; i++)
         {
            aString = "[HOWTOPLAY_TIPS_TIP" + String(i + 1) + "]";
            y = 90 + i * 25;
            tf = this.makeHelpText(PAGE3,this.mApp.stringManager.translateString(aString),15,y,520,50);
            this.mApp.mLayers[4].mForeground.addChild(tf);
            this.mHelpText.push(tf);
         }
         tf = this.makeHelpTitle(PAGE3,this.mApp.stringManager.translateString("[HOWTOPLAY_HEADER]"),180,5,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpSubtitle(PAGE3,this.mApp.stringManager.translateString("[HOWTOPLAY_TIPS_TITLE]"),182,50,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
      }
      
      public function loadPage2Text() : void
      {
         this.clearHelpText();
         var tf:TextField = this.makeHelpText(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK1]"),50,125,200,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makePowerupHeading(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK1TITLE]"),50,100,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpText(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK2]"),325,122,250,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makePowerupHeading(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK2TITLE]"),325,100,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpText(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK3]"),50,205,250,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makePowerupHeading(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK3TITLE]"),50,180,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpText(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK4]"),325,205,250,120);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makePowerupHeading(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK4TITLE]"),325,180,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpText(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK5]"),190,280,250,60);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makePowerupHeading(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_BLOCK5TITLE]"),190,255,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpTitle(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_HEADER]"),180,5,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
         tf = this.makeHelpSubtitle(PAGE2,this.mApp.stringManager.translateString("[HOWTOPLAY_POWERUPS_TITLE]"),182,50,200,50);
         this.mApp.mLayers[4].mForeground.addChild(tf);
         this.mHelpText.push(tf);
      }
      
      public function clearHelpText() : void
      {
         for(var i:int = 0; i < this.mHelpText.length; i++)
         {
            if(this.mHelpText[i].parent != null)
            {
               this.mHelpText[i].parent.removeChild(this.mHelpText[i]);
            }
         }
      }
      
      public function handleMainMenuCont(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.mMainMenu.ToggleButtons(true);
         this.mMainMenu.mShowingHelp = false;
         this.CloseHelp();
      }
      
      public function makeHelpText(type:int, text:String, x:Number, y:Number, width:Number, height:Number) : TextField
      {
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "BonusText";
         aFormat.align = TextFormatAlign.LEFT;
         aFormat.color = 13618638;
         aFormat.size = 16;
         var aGlow:GlowFilter = new GlowFilter(0,1,2,2,5,5);
         switch(type)
         {
            case PAGE1:
               break;
            case PAGE2:
               aFormat.size = 14;
               break;
            case PAGE3:
               aFormat.size = 16;
         }
         var tf:TextField = new TextField();
         tf.embedFonts = true;
         tf.defaultTextFormat = aFormat;
         tf.filters = [aGlow];
         tf.width = width;
         tf.height = height;
         tf.x = x;
         tf.y = y;
         tf.alpha = 1;
         tf.selectable = false;
         tf.multiline = false;
         tf.wordWrap = false;
         tf.text = text;
         return tf;
      }
      
      public function handlePage2(e:MouseEvent) : void
      {
         this.loadPage2Text();
         this.mBackground.visible = false;
         this.mBackground2.visible = true;
         this.mBackground3.visible = false;
         this.mPage2Button.visible = false;
         this.mPage1Button.visible = true;
         this.mPage3Button.visible = true;
      }
      
      public function handleDontShow(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.mApp.mSharedObject.data.help = false;
         this.mApp.mHideHelp = true;
         this.mMainMenu.mGameWidget.StartNewGame();
         this.mMainMenu.CloseMenu();
         this.CloseHelp();
      }
      
      public function makePowerupHeading(type:int, text:String, x:Number, y:Number, width:Number, height:Number) : TextField
      {
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "TimeUpText";
         aFormat.align = TextFormatAlign.LEFT;
         aFormat.color = 12883257;
         aFormat.size = 20;
         var aGlow:GlowFilter = new GlowFilter(0,1,2,2,10,5);
         var tf:TextField = new TextField();
         tf.embedFonts = true;
         tf.defaultTextFormat = aFormat;
         tf.filters = [aGlow];
         tf.width = width;
         tf.height = height;
         tf.x = x;
         tf.y = y;
         tf.alpha = 1;
         tf.selectable = false;
         tf.multiline = false;
         tf.wordWrap = false;
         tf.text = text;
         return tf;
      }
      
      public function makeHelpTitle(type:int, text:String, x:Number, y:Number, width:Number, height:Number) : TextField
      {
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "TimeUpText";
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 12883257;
         aFormat.size = 38;
         var aGlow:GlowFilter = new GlowFilter(0,1,2,2,10,5);
         var tf:TextField = new TextField();
         tf.embedFonts = true;
         tf.defaultTextFormat = aFormat;
         tf.filters = [aGlow];
         tf.width = width;
         tf.height = height;
         tf.x = x;
         tf.y = y;
         tf.alpha = 1;
         tf.selectable = false;
         tf.multiline = false;
         tf.wordWrap = false;
         tf.text = text;
         return tf;
      }
      
      public function handleIntroCont(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.mMainMenu.mGameWidget.StartNewGame();
         this.mMainMenu.CloseMenu();
         this.CloseHelp();
      }
      
      public function handlePage1(e:MouseEvent) : void
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
      
      public function handlePage3(e:MouseEvent) : void
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
      
      public function handleInGameCont(e:MouseEvent) : void
      {
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.CloseHelp();
         this.mOptionsMenu.HideOptionsMenu(false);
      }
   }
}
