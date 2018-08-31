package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.utils.StringUtils;
   import flash.display.Bitmap;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   
   public class HighScores
   {
      
      public static const STATE_BUTTON_DOWN:int = 2;
      
      public static const SCORE_DISTANCE:int = 22;
      
      public static const STATE_BUTTON_UP:int = 0;
      
      public static const STATE_BUTTON_OVER:int = 1;
      
      public static const MAX_NUM_SCORES:int = 10;
      
      public static const SCORE_OFFSET_Y:int = 75;
       
      
      public var mScoreText:Vector.<TextField>;
      
      public var mMainMenu:MainMenu;
      
      public var mGlowTimer:Number;
      
      public var mDialog:Dialog;
      
      public var mTimer:Timer;
      
      public var mGlowUp:Boolean;
      
      public var mNumberText:Vector.<TextField>;
      
      public var mHighScores:Array;
      
      public var mClearButton:SimpleButton;
      
      public var mApp:Zuma2App;
      
      public var mHighScoreText:TextField;
      
      public var mHighScoreLevels:Array;
      
      public var mBackground:Bitmap;
      
      public var mLevelText:Vector.<TextField>;
      
      public var mMenuButton:SimpleButton;
      
      public function HighScores(app:Zuma2App, mainMenu:MainMenu, highScores:Array, highScoreLevels:Array)
      {
         super();
         this.mApp = app;
         this.mMainMenu = mainMenu;
         this.mHighScores = highScores;
         this.mHighScoreLevels = highScoreLevels;
         this.mScoreText = new Vector.<TextField>();
         this.mNumberText = new Vector.<TextField>();
         this.mLevelText = new Vector.<TextField>();
         this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HIGHSCORES_BACKGROUND));
         var upImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HIGHSCORES_BUTTON_MENU_UP));
         var downImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HIGHSCORES_BUTTON_MENU_DOWN));
         var overImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_HIGHSCORES_BUTTON_MENU_OVER));
         this.mMenuButton = new SimpleButton(upImage,overImage,downImage,downImage);
         this.mMenuButton.x = 218;
         this.mMenuButton.y = 347;
         this.mMenuButton.addEventListener(MouseEvent.CLICK,this.handleMenu);
         this.mApp.mLayers[4].mForeground.addChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.addChild(this.mMenuButton);
         this.CreateClearButton();
         this.CreateTextFields();
         this.mTimer = new Timer(10);
         this.mTimer.addEventListener(TimerEvent.TIMER,this.handleUpdate);
         this.mTimer.start();
         this.mGlowTimer = 0;
         this.mGlowUp = true;
      }
      
      public function CreateTextFields() : void
      {
         var i:int = 0;
         var aTextField:TextField = null;
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "TimeUpText";
         aFormat.align = TextFormatAlign.LEFT;
         aFormat.color = 16777215;
         aFormat.size = 16;
         var aGlow:GlowFilter = new GlowFilter(5910702,1,2,2,10,5);
         for(i = 0; i < MAX_NUM_SCORES; i++)
         {
            aTextField = new TextField();
            aTextField.embedFonts = true;
            aTextField.defaultTextFormat = aFormat;
            aTextField.filters = [aGlow];
            aTextField.width = 30;
            aTextField.height = 20;
            aTextField.x = 160;
            aTextField.y = SCORE_OFFSET_Y + i * SCORE_DISTANCE;
            aTextField.alpha = 1;
            aTextField.selectable = false;
            aTextField.multiline = false;
            aTextField.wordWrap = false;
            aTextField.text = String(i + 1) + ".";
            this.mScoreText[i] = aTextField;
            this.mApp.mLayers[4].mForeground.addChild(this.mScoreText[i]);
         }
         aFormat.align = TextFormatAlign.RIGHT;
         for(i = 0; i < MAX_NUM_SCORES; i++)
         {
            aTextField = new TextField();
            aTextField.embedFonts = true;
            aTextField.defaultTextFormat = aFormat;
            aTextField.filters = [aGlow];
            aTextField.width = 100;
            aTextField.height = 20;
            aTextField.x = 270;
            aTextField.y = SCORE_OFFSET_Y + i * SCORE_DISTANCE;
            aTextField.alpha = 1;
            aTextField.selectable = false;
            aTextField.multiline = false;
            aTextField.wordWrap = false;
            aTextField.text = StringUtils.InsertNumberCommas(this.mHighScores[i]);
            this.mNumberText[i] = aTextField;
            this.mApp.mLayers[4].mForeground.addChild(this.mNumberText[i]);
         }
         aFormat.align = TextFormatAlign.LEFT;
         for(i = 0; i < MAX_NUM_SCORES; i++)
         {
            aTextField = new TextField();
            aTextField.embedFonts = true;
            aTextField.defaultTextFormat = aFormat;
            aTextField.filters = [aGlow];
            aTextField.width = 100;
            aTextField.height = 20;
            aTextField.x = 220;
            aTextField.y = SCORE_OFFSET_Y + i * SCORE_DISTANCE;
            aTextField.alpha = 1;
            aTextField.selectable = false;
            aTextField.multiline = false;
            aTextField.wordWrap = false;
            if(this.mHighScoreLevels[i] >= 21)
            {
               aTextField.text = "Complete!";
            }
            else
            {
               aTextField.text = String(this.mApp.stringManager.translateString("[HIGHSCORESCREEN_LEVEL]") + "   " + this.mHighScoreLevels[i]);
            }
            this.mLevelText[i] = aTextField;
            this.mApp.mLayers[4].mForeground.addChild(this.mLevelText[i]);
         }
         aGlow.color = 16777215;
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 5910702;
         aFormat.size = 48;
         aTextField = new TextField();
         aTextField.embedFonts = true;
         aTextField.defaultTextFormat = aFormat;
         aTextField.filters = [aGlow];
         aTextField.width = 300;
         aTextField.height = 100;
         aTextField.x = 115;
         aTextField.y = 5;
         aTextField.alpha = 1;
         aTextField.selectable = false;
         aTextField.multiline = false;
         aTextField.wordWrap = false;
         aTextField.text = this.mApp.stringManager.translateString("[HIGHSCORESCREEN_HEADER]");
         this.mHighScoreText = aTextField;
         this.mApp.mLayers[4].mForeground.addChild(this.mHighScoreText);
      }
      
      public function handleClear(e:MouseEvent) : void
      {
         if(!this.mClearButton.enabled)
         {
            return;
         }
         this.ToggleButtons(false);
         this.mDialog = new Dialog(this.mApp,null,null,this,Dialog.STATE_CLEARSCORES);
      }
      
      public function CreateClearButton() : void
      {
         var upText:TextField = this.makeText(this.mApp.stringManager.translateString("[HIGHSCORESCREEN_BUTTON_RESET]"),STATE_BUTTON_UP);
         upText.y = 8;
         var downText:TextField = this.makeText(this.mApp.stringManager.translateString("[HIGHSCORESCREEN_BUTTON_RESET]"),STATE_BUTTON_DOWN);
         downText.y = 8;
         var overText:TextField = this.makeText(this.mApp.stringManager.translateString("[HIGHSCORESCREEN_BUTTON_RESET]"),STATE_BUTTON_OVER);
         overText.y = 8;
         this.mClearButton = new SimpleButton(upText,overText,downText,downText);
         this.mClearButton.x = 395;
         this.mClearButton.y = 330;
         this.mClearButton.addEventListener(MouseEvent.CLICK,this.handleClear);
         this.mApp.mLayers[4].mForeground.addChild(this.mClearButton);
      }
      
      public function handleUpdate(e:TimerEvent) : void
      {
         var aGlow:GlowFilter = null;
         var aGlow2:GlowFilter = null;
         if(this.mApp.mNewHighScore != -1)
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
            aGlow = new GlowFilter(5910702,1,2,2,10,5);
            aGlow2 = new GlowFilter(16777215,1,this.mGlowTimer,this.mGlowTimer,10,5);
            this.mNumberText[this.mApp.mNewHighScore].filters = [aGlow,aGlow2];
            this.mScoreText[this.mApp.mNewHighScore].filters = [aGlow,aGlow2];
            this.mLevelText[this.mApp.mNewHighScore].filters = [aGlow,aGlow2];
         }
      }
      
      public function ResetScores() : void
      {
         this.mApp.mNewHighScore = -1;
         this.mApp.mLayers[4].mForeground.removeChild(this.mHighScoreText);
         for(var i:int = 0; i < MAX_NUM_SCORES; i++)
         {
            this.mApp.mLayers[4].mForeground.removeChild(this.mScoreText[i]);
            this.mApp.mLayers[4].mForeground.removeChild(this.mNumberText[i]);
            this.mApp.mLayers[4].mForeground.removeChild(this.mLevelText[i]);
         }
         this.mApp.mHighScores = new Array();
         var counter:int = 11;
         for(i = 0; i < 10; i++)
         {
            counter--;
            this.mApp.mHighScores[i] = counter * 10000;
         }
         this.mApp.mSharedObject.data.highscores = this.mApp.mHighScores;
         this.mHighScores = this.mApp.mHighScores;
         this.mApp.mHighScoreLevels = new Array();
         counter = 20;
         for(i = 0; i < 10; i++)
         {
            this.mApp.mHighScoreLevels[i] = counter;
            counter--;
         }
         this.mApp.mSharedObject.data.highscorelevels = this.mApp.mHighScoreLevels;
         this.mHighScoreLevels = this.mApp.mHighScoreLevels;
         this.mApp.mBestTimes = new Array();
         for(i = 0; i < 21; i++)
         {
            this.mApp.mBestTimes[i] = 0;
         }
         this.mApp.mSharedObject.data.besttimes = this.mApp.mBestTimes;
         this.CreateTextFields();
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
         tf.height = 70;
         tf.x = -5;
         tf.y = 0;
         tf.alpha = 1;
         tf.selectable = false;
         tf.multiline = false;
         tf.wordWrap = false;
         tf.text = text;
         return tf;
      }
      
      public function CloseHighScore() : void
      {
         this.mApp.mNewHighScore = -1;
         this.mApp.mLayers[4].mForeground.removeChild(this.mBackground);
         this.mApp.mLayers[4].mForeground.removeChild(this.mHighScoreText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mMenuButton);
         this.mApp.mLayers[4].mForeground.removeChild(this.mClearButton);
         for(var i:int = 0; i < MAX_NUM_SCORES; i++)
         {
            this.mApp.mLayers[4].mForeground.removeChild(this.mScoreText[i]);
            this.mApp.mLayers[4].mForeground.removeChild(this.mNumberText[i]);
            this.mApp.mLayers[4].mForeground.removeChild(this.mLevelText[i]);
         }
      }
      
      public function ToggleButtons(on:Boolean) : void
      {
         this.mMenuButton.enabled = on;
         this.mClearButton.enabled = on;
      }
      
      public function handleMenu(e:MouseEvent) : void
      {
         if(!this.mMenuButton.enabled)
         {
            return;
         }
         this.CloseHighScore();
         this.mMainMenu.ToggleButtons(true);
      }
   }
}
