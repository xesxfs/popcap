package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.ads.AdAPIEvent;
   import com.popcap.flash.framework.utils.StringUtils;
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import flash.display.Bitmap;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class StatsScreen
   {
       
      
      public var mTotalScore:TextField;
      
      public var mFruitText:TextField;
      
      public var mGapShotText:TextField;
      
      public var mUpsellButton:SimpleButton;
      
      public var mContinueButton:SimpleButton;
      
      public var mApp:Zuma2App;
      
      public var mLevel:TextField;
      
      public var mAceTimeText:TextField;
      
      public var mChainText:TextField;
      
      public var mScore:TextField;
      
      public var mFruit:TextField;
      
      public var mCombo:TextField;
      
      public var mBestTimeText:TextField;
      
      public var mPerfectText:TextField;
      
      public var mYourTime:TextField;
      
      public var mSplat:Bitmap;
      
      public var mAceBonusText:TextField;
      
      public var mGapShot:TextField;
      
      public var mTotalScoreText:TextField;
      
      public var mAceTime:TextField;
      
      public var mChain:TextField;
      
      public var mBestTime:TextField;
      
      public var mPerfect:TextField;
      
      public var mAceBonus:TextField;
      
      public var mLevelText:TextField;
      
      public var mComboText:TextField;
      
      public var mScoreText:TextField;
      
      public var mBoard:GameBoardWidget;
      
      public var mYourTimeText:TextField;
      
      public var mBackground:Bitmap;
      
      public function StatsScreen(app:Zuma2App, board:GameBoardWidget, combo:int, chain:int, gap:int, fruit:int, acetime:int, yourtime:int, acebonus:int, besttime:int, perfect:int, levelpoints:int, totalpoints:int, levelnum:int)
      {
         super();
         this.mApp = app;
         this.mBoard = board;
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.PauseBroadcast();
         }
         var upImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP));
         var downImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN));
         var overImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER));
         var upsellImage:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP));
         this.mContinueButton = new SimpleButton(upImage,overImage,downImage,downImage);
         this.mContinueButton.addEventListener(MouseEvent.CLICK,this.handlePlayagain);
         this.mContinueButton.x = 280;
         this.mContinueButton.y = 362;
         this.mUpsellButton = new SimpleButton(upsellImage,upsellImage,upsellImage,upsellImage);
         this.mUpsellButton.addEventListener(MouseEvent.CLICK,this.handleUpsell);
         this.mUpsellButton.x = 275;
         this.mUpsellButton.y = 355;
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "TimeUpText";
         aFormat.align = TextFormatAlign.RIGHT;
         aFormat.color = 15030548;
         aFormat.size = 16;
         var aGlow:GlowFilter = new GlowFilter(7354630,1,2,2,10,5);
         this.mComboText = new TextField();
         this.mComboText.embedFonts = true;
         this.mComboText.defaultTextFormat = aFormat;
         this.mComboText.filters = [aGlow];
         this.mComboText.width = 120;
         this.mComboText.height = 100;
         this.mComboText.x = 230;
         this.mComboText.y = 120;
         this.mComboText.alpha = 1;
         this.mComboText.selectable = false;
         this.mComboText.multiline = false;
         this.mComboText.wordWrap = false;
         this.mComboText.text = "x" + combo.toString();
         this.mComboText.antiAliasType = AntiAliasType.ADVANCED;
         this.mChainText = new TextField();
         this.mChainText.embedFonts = true;
         this.mChainText.defaultTextFormat = aFormat;
         this.mChainText.filters = [aGlow];
         this.mChainText.width = 120;
         this.mChainText.height = 100;
         this.mChainText.x = 230;
         this.mChainText.y = 140;
         this.mChainText.alpha = 1;
         this.mChainText.selectable = false;
         this.mChainText.multiline = false;
         this.mChainText.wordWrap = false;
         this.mChainText.text = "x" + chain.toString();
         this.mGapShotText = new TextField();
         this.mGapShotText.embedFonts = true;
         this.mGapShotText.defaultTextFormat = aFormat;
         this.mGapShotText.filters = [aGlow];
         this.mGapShotText.width = 120;
         this.mGapShotText.height = 100;
         this.mGapShotText.x = 230;
         this.mGapShotText.y = 160;
         this.mGapShotText.alpha = 1;
         this.mGapShotText.selectable = false;
         this.mGapShotText.multiline = false;
         this.mGapShotText.wordWrap = false;
         this.mGapShotText.text = "x" + gap.toString();
         this.mFruitText = new TextField();
         this.mFruitText.embedFonts = true;
         this.mFruitText.defaultTextFormat = aFormat;
         this.mFruitText.filters = [aGlow];
         this.mFruitText.width = 120;
         this.mFruitText.height = 100;
         this.mFruitText.x = 230;
         this.mFruitText.y = 180;
         this.mFruitText.alpha = 1;
         this.mFruitText.selectable = false;
         this.mFruitText.multiline = false;
         this.mFruitText.wordWrap = false;
         this.mFruitText.text = "x" + fruit.toString();
         this.mAceTimeText = new TextField();
         this.mAceTimeText.embedFonts = true;
         this.mAceTimeText.defaultTextFormat = aFormat;
         this.mAceTimeText.filters = [aGlow];
         this.mAceTimeText.width = 250;
         this.mAceTimeText.height = 100;
         this.mAceTimeText.x = 250;
         this.mAceTimeText.y = 120;
         this.mAceTimeText.alpha = 1;
         this.mAceTimeText.selectable = false;
         this.mAceTimeText.multiline = false;
         this.mAceTimeText.wordWrap = false;
         this.mAceTimeText.text = this.GetTimeText(acetime);
         this.mYourTimeText = new TextField();
         this.mYourTimeText.embedFonts = true;
         this.mYourTimeText.defaultTextFormat = aFormat;
         this.mYourTimeText.filters = [aGlow];
         this.mYourTimeText.width = 250;
         this.mYourTimeText.height = 100;
         this.mYourTimeText.x = 250;
         this.mYourTimeText.y = 140;
         this.mYourTimeText.alpha = 1;
         this.mYourTimeText.selectable = false;
         this.mYourTimeText.multiline = false;
         this.mYourTimeText.wordWrap = false;
         this.mYourTimeText.text = this.GetTimeText(yourtime);
         this.mAceBonusText = new TextField();
         this.mAceBonusText.embedFonts = true;
         this.mAceBonusText.defaultTextFormat = aFormat;
         this.mAceBonusText.filters = [aGlow];
         this.mAceBonusText.width = 250;
         this.mAceBonusText.height = 100;
         this.mAceBonusText.x = 250;
         this.mAceBonusText.y = 160;
         this.mAceBonusText.alpha = 1;
         this.mAceBonusText.selectable = false;
         this.mAceBonusText.multiline = false;
         this.mAceBonusText.wordWrap = false;
         this.mAceBonusText.text = StringUtils.InsertNumberCommas(acebonus);
         this.mBestTimeText = new TextField();
         this.mBestTimeText.embedFonts = true;
         this.mBestTimeText.defaultTextFormat = aFormat;
         this.mBestTimeText.filters = [aGlow];
         this.mBestTimeText.width = 250;
         this.mBestTimeText.height = 100;
         this.mBestTimeText.x = 250;
         this.mBestTimeText.y = 180;
         this.mBestTimeText.alpha = 1;
         this.mBestTimeText.selectable = false;
         this.mBestTimeText.multiline = false;
         this.mBestTimeText.wordWrap = false;
         this.mBestTimeText.text = this.GetTimeText(besttime);
         aFormat.size = 30;
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 16777215;
         this.mTotalScoreText = new TextField();
         this.mTotalScoreText.embedFonts = true;
         this.mTotalScoreText.defaultTextFormat = aFormat;
         this.mTotalScoreText.filters = [aGlow];
         this.mTotalScoreText.width = 170;
         this.mTotalScoreText.height = 100;
         this.mTotalScoreText.x = 320;
         this.mTotalScoreText.y = 282;
         this.mTotalScoreText.alpha = 1;
         this.mTotalScoreText.selectable = false;
         this.mTotalScoreText.multiline = false;
         this.mTotalScoreText.wordWrap = false;
         this.mTotalScoreText.text = StringUtils.InsertNumberCommas(totalpoints);
         aFormat.size = 18;
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 15030548;
         this.mPerfectText = new TextField();
         this.mPerfectText.embedFonts = true;
         this.mPerfectText.defaultTextFormat = aFormat;
         this.mPerfectText.filters = [aGlow];
         this.mPerfectText.width = 250;
         this.mPerfectText.height = 100;
         this.mPerfectText.x = 335;
         this.mPerfectText.y = 205;
         this.mPerfectText.alpha = 1;
         this.mPerfectText.selectable = false;
         this.mPerfectText.multiline = false;
         this.mPerfectText.wordWrap = false;
         if(perfect > 0)
         {
            this.mPerfectText.text = StringUtils.InsertNumberCommas(perfect);
         }
         aFormat.size = 30;
         aFormat.color = 16777215;
         var aShadow:DropShadowFilter = new DropShadowFilter(2,45,1,1,2,2,2,2);
         this.mLevelText = new TextField();
         this.mLevelText.embedFonts = true;
         this.mLevelText.defaultTextFormat = aFormat;
         this.mLevelText.filters = [aShadow];
         this.mLevelText.width = 250;
         this.mLevelText.height = 100;
         this.mLevelText.x = 280;
         this.mLevelText.y = 76;
         this.mLevelText.alpha = 1;
         this.mLevelText.selectable = false;
         this.mLevelText.multiline = false;
         this.mLevelText.wordWrap = false;
         if(levelnum < 20)
         {
            this.mLevelText.text = String(levelnum);
         }
         else
         {
            this.mLevelText.text = "";
         }
         aFormat.color = 15030548;
         aFormat.size = 24;
         aGlow = new GlowFilter(6305831,1,2,2,10,5);
         this.mScoreText = new TextField();
         this.mScoreText.embedFonts = true;
         this.mScoreText.defaultTextFormat = aFormat;
         this.mScoreText.filters = [aGlow];
         this.mScoreText.width = 250;
         this.mScoreText.height = 100;
         this.mScoreText.x = 320;
         this.mScoreText.y = 235;
         this.mScoreText.alpha = 1;
         this.mScoreText.selectable = false;
         this.mScoreText.multiline = false;
         this.mScoreText.wordWrap = false;
         this.mScoreText.text = StringUtils.InsertNumberCommas(levelpoints);
         aFormat.color = 16776960;
         aFormat.align = TextFormatAlign.LEFT;
         aFormat.size = 16;
         aGlow = new GlowFilter(7354630,1,2,2,10,5);
         this.mCombo = new TextField();
         this.mCombo.embedFonts = true;
         this.mCombo.defaultTextFormat = aFormat;
         this.mCombo.filters = [aGlow];
         this.mCombo.width = 120;
         this.mCombo.height = 100;
         this.mCombo.x = 240;
         this.mCombo.y = 120;
         this.mCombo.alpha = 1;
         this.mCombo.selectable = false;
         this.mCombo.multiline = false;
         this.mCombo.wordWrap = false;
         this.mCombo.text = this.mApp.stringManager.translateString("[STATS_MAXCOMBO]");
         this.mChain = new TextField();
         this.mChain.embedFonts = true;
         this.mChain.defaultTextFormat = aFormat;
         this.mChain.filters = [aGlow];
         this.mChain.width = 120;
         this.mChain.height = 100;
         this.mChain.x = 240;
         this.mChain.y = 140;
         this.mChain.alpha = 1;
         this.mChain.selectable = false;
         this.mChain.multiline = false;
         this.mChain.wordWrap = false;
         this.mChain.text = this.mApp.stringManager.translateString("[STATS_MAXCHAIN]");
         this.mGapShot = new TextField();
         this.mGapShot.embedFonts = true;
         this.mGapShot.defaultTextFormat = aFormat;
         this.mGapShot.filters = [aGlow];
         this.mGapShot.width = 120;
         this.mGapShot.height = 100;
         this.mGapShot.x = 240;
         this.mGapShot.y = 160;
         this.mGapShot.alpha = 1;
         this.mGapShot.selectable = false;
         this.mGapShot.multiline = false;
         this.mGapShot.wordWrap = false;
         this.mGapShot.text = this.mApp.stringManager.translateString("[STATS_GAPSHOTS]");
         this.mFruit = new TextField();
         this.mFruit.embedFonts = true;
         this.mFruit.defaultTextFormat = aFormat;
         this.mFruit.filters = [aGlow];
         this.mFruit.width = 120;
         this.mFruit.height = 100;
         this.mFruit.x = 240;
         this.mFruit.y = 180;
         this.mFruit.alpha = 1;
         this.mFruit.selectable = false;
         this.mFruit.multiline = false;
         this.mFruit.wordWrap = false;
         this.mFruit.text = this.mApp.stringManager.translateString("[STATS_FRUIT]");
         this.mAceTime = new TextField();
         this.mAceTime.embedFonts = true;
         this.mAceTime.defaultTextFormat = aFormat;
         this.mAceTime.filters = [aGlow];
         this.mAceTime.width = 120;
         this.mAceTime.height = 100;
         this.mAceTime.x = 370;
         this.mAceTime.y = 120;
         this.mAceTime.alpha = 1;
         this.mAceTime.selectable = false;
         this.mAceTime.multiline = false;
         this.mAceTime.wordWrap = false;
         this.mAceTime.text = this.mApp.stringManager.translateString("[STATS_ACETIME]");
         this.mAceBonus = new TextField();
         this.mAceBonus.embedFonts = true;
         this.mAceBonus.defaultTextFormat = aFormat;
         this.mAceBonus.filters = [aGlow];
         this.mAceBonus.width = 120;
         this.mAceBonus.height = 100;
         this.mAceBonus.x = 370;
         this.mAceBonus.y = 160;
         this.mAceBonus.alpha = 1;
         this.mAceBonus.selectable = false;
         this.mAceBonus.multiline = false;
         this.mAceBonus.wordWrap = false;
         this.mAceBonus.text = this.mApp.stringManager.translateString("[STATS_BONUS]");
         this.mYourTime = new TextField();
         this.mYourTime.embedFonts = true;
         this.mYourTime.defaultTextFormat = aFormat;
         this.mYourTime.filters = [aGlow];
         this.mYourTime.width = 120;
         this.mYourTime.height = 100;
         this.mYourTime.x = 370;
         this.mYourTime.y = 140;
         this.mYourTime.alpha = 1;
         this.mYourTime.selectable = false;
         this.mYourTime.multiline = false;
         this.mYourTime.wordWrap = false;
         this.mYourTime.text = this.mApp.stringManager.translateString("[STATS_YOURTIME]");
         this.mBestTime = new TextField();
         this.mBestTime.embedFonts = true;
         this.mBestTime.defaultTextFormat = aFormat;
         this.mBestTime.filters = [aGlow];
         this.mBestTime.width = 120;
         this.mBestTime.height = 100;
         this.mBestTime.x = 370;
         this.mBestTime.y = 180;
         this.mBestTime.alpha = 1;
         this.mBestTime.selectable = false;
         this.mBestTime.multiline = false;
         this.mBestTime.wordWrap = false;
         this.mBestTime.text = this.mApp.stringManager.translateString("[STATS_BEST]");
         aFormat.color = 16776960;
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.size = 18;
         this.mPerfect = new TextField();
         this.mPerfect.embedFonts = true;
         this.mPerfect.defaultTextFormat = aFormat;
         this.mPerfect.filters = [aGlow];
         this.mPerfect.width = 150;
         this.mPerfect.height = 100;
         this.mPerfect.x = 270;
         this.mPerfect.y = 205;
         this.mPerfect.alpha = 1;
         this.mPerfect.selectable = false;
         this.mPerfect.multiline = false;
         this.mPerfect.wordWrap = false;
         if(perfect > 0)
         {
            this.mPerfect.text = this.mApp.stringManager.translateString("[STATS_PERFECTLEVELBONUS]");
         }
         aFormat.color = 16777215;
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.size = 30;
         this.mLevel = new TextField();
         this.mLevel.embedFonts = true;
         this.mLevel.defaultTextFormat = aFormat;
         this.mLevel.filters = [aShadow];
         this.mLevel.width = 250;
         this.mLevel.height = 100;
         this.mLevel.x = 211;
         this.mLevel.y = 76;
         this.mLevel.alpha = 1;
         this.mLevel.selectable = false;
         this.mLevel.multiline = false;
         this.mLevel.wordWrap = false;
         if(levelnum < 20)
         {
            this.mLevel.text = this.mApp.stringManager.translateString("[STATS_LEVEL]");
         }
         else
         {
            this.mLevel.x = 237;
            this.mLevel.y = 76;
            this.mLevel.text = this.mApp.stringManager.translateString("[STATS_WINSCREEN]");
         }
         aFormat.color = 16776960;
         this.mTotalScore = new TextField();
         this.mTotalScore.embedFonts = true;
         this.mTotalScore.defaultTextFormat = aFormat;
         this.mTotalScore.filters = [aGlow];
         this.mTotalScore.width = 100;
         this.mTotalScore.height = 100;
         this.mTotalScore.x = 260;
         this.mTotalScore.y = 282;
         this.mTotalScore.alpha = 1;
         this.mTotalScore.selectable = false;
         this.mTotalScore.multiline = false;
         this.mTotalScore.wordWrap = false;
         this.mTotalScore.text = this.mApp.stringManager.translateString("[STATS_TOTAL]");
         aFormat.color = 16776960;
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.size = 24;
         this.mScore = new TextField();
         this.mScore.embedFonts = true;
         this.mScore.defaultTextFormat = aFormat;
         this.mScore.filters = [aGlow];
         this.mScore.width = 250;
         this.mScore.height = 100;
         this.mScore.x = 200;
         this.mScore.y = 235;
         this.mScore.alpha = 1;
         this.mScore.selectable = false;
         this.mScore.multiline = false;
         this.mScore.wordWrap = false;
         this.mScore.text = this.mApp.stringManager.translateString("[STATS_POINTSTHISLEVEL]");
         this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_STAT_SCREEN_BACKGROUND));
         this.mSplat = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_STAT_SCREEN_SPLAT));
         this.mSplat.x = 255;
         this.mSplat.y = 270;
         this.mApp.mLayers[4].mBalls.addChild(this.mBackground);
         this.mApp.mLayers[4].mBalls.addChild(this.mSplat);
         this.mApp.mLayers[4].mForeground.addChild(this.mComboText);
         this.mApp.mLayers[4].mForeground.addChild(this.mChainText);
         this.mApp.mLayers[4].mForeground.addChild(this.mGapShotText);
         this.mApp.mLayers[4].mForeground.addChild(this.mFruitText);
         this.mApp.mLayers[4].mForeground.addChild(this.mTotalScoreText);
         this.mApp.mLayers[4].mForeground.addChild(this.mScoreText);
         this.mApp.mLayers[4].mForeground.addChild(this.mAceTimeText);
         this.mApp.mLayers[4].mForeground.addChild(this.mAceBonusText);
         this.mApp.mLayers[4].mForeground.addChild(this.mYourTimeText);
         this.mApp.mLayers[4].mForeground.addChild(this.mBestTimeText);
         this.mApp.mLayers[4].mForeground.addChild(this.mPerfectText);
         this.mApp.mLayers[4].mForeground.addChild(this.mLevelText);
         this.mApp.mLayers[4].mForeground.addChild(this.mCombo);
         this.mApp.mLayers[4].mForeground.addChild(this.mChain);
         this.mApp.mLayers[4].mForeground.addChild(this.mGapShot);
         this.mApp.mLayers[4].mForeground.addChild(this.mFruit);
         this.mApp.mLayers[4].mForeground.addChild(this.mTotalScore);
         this.mApp.mLayers[4].mForeground.addChild(this.mScore);
         this.mApp.mLayers[4].mForeground.addChild(this.mAceTime);
         this.mApp.mLayers[4].mForeground.addChild(this.mAceBonus);
         this.mApp.mLayers[4].mForeground.addChild(this.mYourTime);
         this.mApp.mLayers[4].mForeground.addChild(this.mBestTime);
         this.mApp.mLayers[4].mForeground.addChild(this.mPerfect);
         this.mApp.mLayers[4].mForeground.addChild(this.mLevel);
         this.mApp.mLayers[4].mForeground.addChild(this.mContinueButton);
      }
      
      public function handleUpsell(e:MouseEvent) : void
      {
         var url:URLRequest = new URLRequest("http://ad.doubleclick.net/adi/wt.onlinegame.nav/attexit;sz=1x1;ord=0123456789");
         "_blank";
         url;
         ;
      }
      
      public function Clear() : void
      {
         this.mApp.mLayers[4].mBalls.removeChild(this.mBackground);
         this.mApp.mLayers[4].mBalls.removeChild(this.mSplat);
         this.mApp.mLayers[4].mForeground.removeChild(this.mComboText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mChainText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mGapShotText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mFruitText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mTotalScoreText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mScoreText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mAceTimeText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mAceBonusText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mYourTimeText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mBestTimeText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mPerfectText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mLevelText);
         this.mApp.mLayers[4].mForeground.removeChild(this.mCombo);
         this.mApp.mLayers[4].mForeground.removeChild(this.mChain);
         this.mApp.mLayers[4].mForeground.removeChild(this.mGapShot);
         this.mApp.mLayers[4].mForeground.removeChild(this.mFruit);
         this.mApp.mLayers[4].mForeground.removeChild(this.mTotalScore);
         this.mApp.mLayers[4].mForeground.removeChild(this.mScore);
         this.mApp.mLayers[4].mForeground.removeChild(this.mAceTime);
         this.mApp.mLayers[4].mForeground.removeChild(this.mAceBonus);
         this.mApp.mLayers[4].mForeground.removeChild(this.mYourTime);
         this.mApp.mLayers[4].mForeground.removeChild(this.mBestTime);
         this.mApp.mLayers[4].mForeground.removeChild(this.mPerfect);
         this.mApp.mLayers[4].mForeground.removeChild(this.mLevel);
         this.mApp.mLayers[4].mForeground.removeChild(this.mContinueButton);
         this.mBackground = null;
         this.mComboText = null;
         this.mChainText = null;
         this.mGapShotText = null;
         this.mFruitText = null;
         this.mTotalScoreText = null;
         this.mScoreText = null;
         this.mContinueButton = null;
         this.mUpsellButton = null;
      }
      
      public function GetTimeText(number:int) : String
      {
         var minute:String = String(int(number / 6000));
         var seconds:String = String(int(number % 6000 / 100));
         if(seconds.length == 1)
         {
            seconds = "0" + seconds;
         }
         var time:String = minute + ":" + seconds;
         return time;
      }
      
      public function GameContinue(e:AdAPIEvent) : void
      {
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.ResumeBroadcast();
         }
         this.mApp.mAdAPI.removeEventListener(AdAPIEvent.GAME_CONTINUE,this.GameContinue);
         this.mApp.soundManager.playSound(Zuma2Sounds.SOUND_BUTTON_CLICK);
         this.Clear();
         if(this.mApp.mUpsells)
         {
            if(this.mBoard.mUpsellLevelCount >= 3 && !this.mApp.mAdAPI._isEnabled || this.mBoard.mLevelNum >= 20)
            {
               this.mBoard.mUpsellLevelCount = 0;
               this.mBoard.ShowUpsell();
            }
            else
            {
               this.mBoard.RestartLevel();
            }
         }
         else
         {
            this.mBoard.RestartLevel();
         }
      }
      
      public function handlePlayagain(e:MouseEvent) : void
      {
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.addEventListener(AdAPIEvent.GAME_CONTINUE,this.GameContinue);
            this.mApp.mAdAPI.GameBreak(this.mBoard.mLevelNum);
         }
         else
         {
            this.GameContinue(null);
         }
      }
   }
}
