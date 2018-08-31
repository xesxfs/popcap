package
{
   import com.popcap.flash.framework.AppUtils;
   import com.popcap.flash.framework.BaseApp;
   import com.popcap.flash.framework.Canvas;
   import com.popcap.flash.framework.ads.AdAPIEvent;
   import com.popcap.flash.framework.ads.MSNAdAPI;
   import com.popcap.flash.framework.math.MersenneTwister;
   import com.popcap.flash.framework.math.Random;
   import com.popcap.flash.framework.resources.fonts.FontManager;
   import com.popcap.flash.framework.resources.images.ImageManager;
   import com.popcap.flash.framework.resources.sounds.SoundManager;
   import com.popcap.flash.framework.utils.FPSMonitor;
   import com.popcap.flash.games.zuma2.logic.LayerSprite;
   import com.popcap.flash.games.zuma2.logic.LevelMgr;
   import com.popcap.flash.games.zuma2.logic.Zuma2Fonts;
   import com.popcap.flash.games.zuma2.logic.Zuma2Images;
   import com.popcap.flash.games.zuma2.logic.Zuma2LevelData;
   import com.popcap.flash.games.zuma2.logic.Zuma2Sounds;
   import com.popcap.flash.games.zuma2.logic.Zuma2Strings;
   import com.popcap.flash.games.zuma2.states.MainState;
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import com.popcap.flash.games.zuma2.widgets.ZumaWidget;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.net.SharedObject;
   import flash.system.Security;
   
   public class Zuma2App extends BaseApp
   {
      
      public static const Blue_Ball:int = 0;
      
      public static const STATE_LOADING:String = "Loading";
      
      public static const SCREEN_WIDTH:int = 540;
      
      public static const White_Ball:int = 5;
      
      public static const STATE_MAIN_MENU:String = "MainMenu";
      
      public static const APP_ID:String = "Zuma2";
      
      public static const SCREEN_HEIGHT:int = 405;
      
      public static const STATE_LEVEL_INTRO:String = "LevelIntro";
      
      public static const STATE_PLAY_LEVEL:String = "PlayLevel";
      
      public static const STATE_TITLE_SCREEN:String = "TitleScreen";
      
      public static const Purple_Ball:int = 4;
      
      public static const Yellow_Ball:int = 1;
      
      public static const MY_PI:Number = 3.14159;
      
      public static const Red_Ball:int = 2;
      
      public static const SHRINK_PERCENT:Number = 0.675;
      
      public static const DEG_TO_RAD:Number = MY_PI / 180;
      
      public static const RAD_TO_DEG:Number = 180 / MY_PI;
      
      public static const VERSION:String = "0.0.5.8740";
      
      public static const Green_Ball:int = 3;
       
      
      public var mUpsells:Boolean;
      
      public var mLevelMgr:LevelMgr;
      
      public var mAdAPI:MSNAdAPI;
      
      public var gDieAtEnd:Boolean;
      
      public var mSharedObject:SharedObject;
      
      public var gSuckMode:Boolean;
      
      public var gBallColors:Array;
      
      public var gGotPowerUp:Array;
      
      public var mHighScore:int = 0;
      
      public var gUpdateBalls:Boolean;
      
      public var mLayers:Vector.<LayerSprite>;
      
      public var soundManager:SoundManager;
      
      public var widgets:ZumaWidget;
      
      public var mHideHelp:Boolean = false;
      
      public var mRand:Random;
      
      public var gDarkBallColors:Array;
      
      public var gForceFruit:Boolean;
      
      public var gAddBalls:Boolean;
      
      public var gStopSuckbackImmediately:Boolean = false;
      
      public var imageManager:ImageManager;
      
      public var mBestTimes:Array;
      
      public var canvas:Canvas;
      
      public var stringManager:Zuma2Strings;
      
      public var mHighScores:Array;
      
      public var fontManager:FontManager;
      
      public var mLevelData:Zuma2LevelData;
      
      public var fpsMon:FPSMonitor;
      
      public var mUpsellURL:String;
      
      public var mMainState:MainState;
      
      public var mNewHighScore:int;
      
      public var mVolume:int;
      
      public var gBrightBallColors:Array;
      
      public var mHighScoreLevels:Array;
      
      public var mMoreGamesURL:String;
      
      public var mBoard:GameBoardWidget;
      
      public var mMoreGames:Boolean;
      
      public function Zuma2App()
      {
         this.gBallColors = new Array(1671423,16776960,16711680,65280,16711935,16777215);
         this.gBrightBallColors = new Array(8454143,16777024,16755370,8454016,16744703,16777215);
         this.gDarkBallColors = new Array(2299513,6312202,10489620,2114594,5641795,3676962);
         this.mLayers = new Vector.<LayerSprite>();
         this.gGotPowerUp = new Array();
         super();
         Security.allowDomain("labs.test.vte.internal.popcap.com","labs.eric.popcap.com","labs.popcap.com","www.popcap.com","dl.labs.popcap.com");
         if(stage)
         {
            LoadData("",this.Init);
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.HandleAdded);
         }
      }
      
      public function HandleAdded(e:Event) : void
      {
         LoadData("",this.Init);
         removeEventListener(Event.ADDED_TO_STAGE,this.HandleAdded);
      }
      
      public function handleMute(e:AdAPIEvent) : void
      {
         this.soundManager.mute();
      }
      
      public function Init(loaded:Boolean) : void
      {
         var i:int = 0;
         var counter:int = 0;
         var aDate:Date = new Date();
         this.mRand = new Random(new MersenneTwister());
         this.mRand.SetSeed(aDate.time);
         if(parent == stage)
         {
            this.mAdAPI = new MSNAdAPI();
            this.mAdAPI.init();
         }
         else
         {
            this.mAdAPI = Object(parent).mAdAPI;
         }
         if(GetProperties() != null)
         {
            this.mAdAPI._isEnabled = AppUtils.asBoolean(GetProperties().MSN.enabled);
            this.mUpsells = AppUtils.asBoolean(GetProperties().upsells.enabled);
            this.mUpsellURL = GetProperties().upsells.url;
            this.mMoreGames = AppUtils.asBoolean(GetProperties().moregames.enabled);
            this.mMoreGamesURL = GetProperties().moregames.url;
         }
         this.mSharedObject = SharedObject.getLocal("ZumasRevenge");
         if(this.mSharedObject.data.help == null)
         {
            this.mSharedObject.data.help = true;
         }
         if(this.mSharedObject.data.highscore == null)
         {
            this.mSharedObject.data.highscore = 0;
         }
         if(this.mSharedObject.data.besttimes == null)
         {
            this.mBestTimes = new Array();
            for(i = 0; i < 21; i++)
            {
               this.mBestTimes[i] = 0;
            }
            this.mSharedObject.data.besttimes = this.mBestTimes;
         }
         else
         {
            this.mBestTimes = this.mSharedObject.data.besttimes;
         }
         this.mHighScore = this.mSharedObject.data.highscore;
         if(this.mSharedObject.data.highscores == null)
         {
            this.mHighScores = new Array();
            counter = 11;
            for(i = 0; i < 10; i++)
            {
               counter--;
               this.mHighScores[i] = counter * 10000;
            }
            this.mSharedObject.data.highscores = this.mHighScores;
         }
         else
         {
            this.mHighScores = this.mSharedObject.data.highscores;
         }
         if(this.mSharedObject.data.highscorelevels == null)
         {
            this.mHighScoreLevels = new Array();
            counter = 20;
            for(i = 0; i < 10; i++)
            {
               this.mHighScoreLevels[i] = counter;
               counter--;
            }
            this.mSharedObject.data.highscorelevels = this.mHighScoreLevels;
         }
         else
         {
            this.mHighScoreLevels = this.mSharedObject.data.highscorelevels;
         }
         this.mNewHighScore = -1;
         this.canvas = new Canvas(SCREEN_WIDTH,SCREEN_HEIGHT);
         this.widgets = new ZumaWidget(this);
         this.imageManager = new Zuma2Images();
         this.fontManager = new Zuma2Fonts();
         this.mLevelData = new Zuma2LevelData();
         this.soundManager = new Zuma2Sounds();
         this.mVolume = 1;
         this.stringManager = new Zuma2Strings();
         this.addChild(new Bitmap(this.canvas.getData()));
         for(i = 0; i < 6; i++)
         {
            this.mLayers[i] = new LayerSprite();
            addChild(this.mLayers[i]);
         }
         this.gAddBalls = true;
         this.gDieAtEnd = true;
         this.gSuckMode = false;
         this.gUpdateBalls = true;
         this.gForceFruit = false;
         this.fpsMon = new FPSMonitor();
         this.fpsMon.x = 0;
         this.fpsMon.y = 305;
         this.fpsMon.visible = false;
         this.mLayers[5].addChild(this.fpsMon);
         if(this.mAdAPI._isEnabled)
         {
            this.mAdAPI.addEventListener(AdAPIEvent.MUTE,this.handleMute);
            this.mAdAPI.addEventListener(AdAPIEvent.UNMUTE,this.handleUnmute);
            this.mAdAPI.SessionReady();
            this.mAdAPI.addEventListener(AdAPIEvent.SESSION_START,this.StartSession);
         }
         else
         {
            this.StartSession(null);
         }
      }
      
      public function handleUnmute(e:AdAPIEvent) : void
      {
         this.soundManager.unmute();
      }
      
      public function StartSession(e:AdAPIEvent) : void
      {
         this.mAdAPI.removeEventListener(AdAPIEvent.SESSION_START,this.StartSession);
         this.mMainState = new MainState(this);
         Start(this.mMainState);
      }
   }
}
