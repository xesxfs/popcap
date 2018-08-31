package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import flash.display.Bitmap;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class Dialog extends Sprite
   {
      
      public static const STATE_CLEARSCORES:int = 1;
      
      public static const STATE_BUTTON_DOWN:int = 2;
      
      public static const STATE_BUTTON_UP:int = 0;
      
      public static const MENU_OFFSET_X:int = 140;
      
      public static const MENU_OFFSET_Y:int = 20;
      
      public static const STATE_BUTTON_OVER:int = 1;
      
      public static const BUTTON_OFFSET_X:int = 40;
      
      public static const BUTTON_OFFSET_Y:int = 165;
      
      public static const BUTTON_DISTANCE_X:int = 125;
      
      public static const STATE_ENDGAME:int = 0;
       
      
      public var mState:int;
      
      public var mYesButton:SimpleButton;
      
      public var mNoButton:SimpleButton;
      
      public var mOptionsMenu:OptionsMenu;
      
      public var mApp:Zuma2App;
      
      public var mHighScores:HighScores;
      
      public var mBoard:GameBoardWidget;
      
      public var mText:TextField;
      
      public var mBackground:Bitmap;
      
      public function Dialog(app:Zuma2App, board:GameBoardWidget, optionsMenu:OptionsMenu, highScores:HighScores, state:int)
      {
         var upImage:Bitmap = null;
         var downImage:Bitmap = null;
         var overImage:Bitmap = null;
         super();
         this.mApp = app;
         this.mBoard = board;
         this.mOptionsMenu = optionsMenu;
         this.mHighScores = highScores;
         this.mState = state;
         this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DIALOG_BACKGROUND));
         this.mBackground.x = MENU_OFFSET_X;
         this.mBackground.y = MENU_OFFSET_Y;
         upImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DIALOG_BUTTON_YES_UP));
         downImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DIALOG_BUTTON_YES_DOWN));
         overImage = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DIALOG_BUTTON_YES_OVER));
         var upText:TextField = this.makeText(this.mApp.stringManager.translateString("[ENDGAME_DIALOGBOX_YESBUTTON]"),STATE_BUTTON_UP);
         upText.x = 10;
         upText.y = 8;
         var downText:TextField = this.makeText(this.mApp.stringManager.translateString("[ENDGAME_DIALOGBOX_YESBUTTON]"),STATE_BUTTON_DOWN);
         downText.x = 10;
         downText.y = 8;
         var overText:TextField = this.makeText(this.mApp.stringManager.translateString("[ENDGAME_DIALOGBOX_YESBUTTON]"),STATE_BUTTON_OVER);
         overText.x = 10;
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
         this.mYesButton = new SimpleButton(upSprite,overSprite,downSprite,downSprite);
         this.mYesButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X;
         this.mYesButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y;
         this.mYesButton.addEventListener(MouseEvent.CLICK,this.handleYes);
         var upImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DIALOG_BUTTON_YES_UP));
         var downImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DIALOG_BUTTON_YES_DOWN));
         var overImage2:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_DIALOG_BUTTON_YES_OVER));
         var upText2:TextField = this.makeText(this.mApp.stringManager.translateString("[ENDGAME_DIALOGBOX_NOBUTTON]"),STATE_BUTTON_UP);
         upText2.x = 10;
         upText2.y = 8;
         var downText2:TextField = this.makeText(this.mApp.stringManager.translateString("[ENDGAME_DIALOGBOX_NOBUTTON]"),STATE_BUTTON_DOWN);
         downText2.x = 10;
         downText2.y = 8;
         var overText2:TextField = this.makeText(this.mApp.stringManager.translateString("[ENDGAME_DIALOGBOX_NOBUTTON]"),STATE_BUTTON_OVER);
         overText2.x = 10;
         overText2.y = 8;
         var upSprite2:Sprite = new Sprite();
         var downSprite2:Sprite = new Sprite();
         var overSprite2:Sprite = new Sprite();
         upSprite2.addChild(upImage2);
         upSprite2.addChild(upText2);
         downSprite2.addChild(downImage2);
         downSprite2.addChild(downText2);
         overSprite2.addChild(overImage2);
         overSprite2.addChild(overText2);
         this.mNoButton = new SimpleButton(upSprite2,overSprite2,downSprite2,downSprite2);
         this.mNoButton.x = MENU_OFFSET_X + BUTTON_OFFSET_X + BUTTON_DISTANCE_X;
         this.mNoButton.y = MENU_OFFSET_Y + BUTTON_OFFSET_Y;
         this.mNoButton.addEventListener(MouseEvent.CLICK,this.handleNo);
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "BonusText";
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 15030548;
         aFormat.size = 16;
         var aGlow:GlowFilter = new GlowFilter(7354630,1,2,2,2,2);
         this.mText = new TextField();
         this.mText.embedFonts = true;
         this.mText.defaultTextFormat = aFormat;
         this.mText.filters = [aGlow];
         this.mText.width = 200;
         this.mText.height = 200;
         this.mText.x = 180;
         this.mText.y = 115;
         this.mText.alpha = 1;
         this.mText.selectable = false;
         this.mText.multiline = false;
         this.mText.wordWrap = true;
         switch(this.mState)
         {
            case STATE_ENDGAME:
               this.mText.text = this.mApp.stringManager.translateString("[ENDGAME_DIALOGBOX_DIALOG]");
               break;
            case STATE_CLEARSCORES:
               this.mText.text = this.mApp.stringManager.translateString("[HIGHSCORESCREEN_DIALOG_CONFIRM]");
         }
         this.mText.antiAliasType = AntiAliasType.ADVANCED;
         this.mApp.mLayers[4].mForeground.addChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.addChild(this.mText);
         this.mApp.mLayers[4].mForeground.addChild(this.mYesButton);
         this.mApp.mLayers[4].mForeground.addChild(this.mNoButton);
      }
      
      public function handleNo(e:MouseEvent) : void
      {
         switch(this.mState)
         {
            case STATE_ENDGAME:
            case STATE_CLEARSCORES:
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
               this.CloseDialog();
         }
      }
      
      public function CloseDialog() : void
      {
         this.mApp.mLayers[4].mForeground.removeChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.removeChild(this.mText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mYesButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mNoButton);
         if(this.mState == STATE_ENDGAME)
         {
            this.mOptionsMenu.HideOptionsMenu(false);
         }
         else if(this.mState == STATE_CLEARSCORES)
         {
            this.mHighScores.ToggleButtons(true);
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
         tf.width = 40;
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
      
      public function handleYes(e:MouseEvent) : void
      {
         switch(this.mState)
         {
            case STATE_ENDGAME:
               this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
               this.CloseDialog();
               this.mOptionsMenu.CloseMenu();
               this.mBoard.CloseMenu();
               this.mBoard.KillMenuButton();
               this.mBoard.ClearAll();
               this.mApp.mAdAPI.SetScore(this.mBoard.mScore);
               this.mApp.mAdAPI.ScoreSubmit();
               this.mApp.mAdAPI.GameEnd();
               this.mApp.soundManager.stopAll();
               this.mApp.widgets.game.ShowMainMenu();
               break;
            case STATE_CLEARSCORES:
               this.mApp.mSharedObject.clear();
               this.mHighScores.ResetScores();
               this.CloseDialog();
         }
      }
   }
}
