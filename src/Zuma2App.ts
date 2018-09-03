 class Zuma2App extends com.popcap.flash.framework.BaseApp {
	public static Blue_Ball:number;
	public static STATE_LOADING:string;
	public static SCREEN_WIDTH:number;
	public static White_Ball:number;
	public static STATE_MAIN_MENU:string;
	public static APP_ID:string;
	public static SCREEN_HEIGHT:number;
	public static STATE_LEVEL_INTRO:string;
	public static STATE_PLAY_LEVEL:string;
	public static STATE_TITLE_SCREEN:string;
	public static Purple_Ball:number;
	public static Yellow_Ball:number;
	public static MY_PI:number;
	public static Red_Ball:number;
	public static SHRINK_PERCENT:number;
	public static DEG_TO_RAD:number;
	public static RAD_TO_DEG:number;
	public static VERSION:string;
	public static Green_Ball:number;
	public mUpsells:boolean = false;
	public mLevelMgr:com.popcap.flash.games.zuma2.logic.LevelMgr;
	public mAdAPI:com.popcap.flash.framework.ads.MSNAdAPI;
	public gDieAtEnd:boolean = false;
	public mSharedObject:flash.SharedObject;
	public gSuckMode:boolean = false;
	public gBallColors:Array<any>;
	public gGotPowerUp:Array<any>;
	public mHighScore:number = 0;
	public gUpdateBalls:boolean = false;
	public mLayers:Array<com.popcap.flash.games.zuma2.logic.LayerSprite>;
	public soundManager:com.popcap.flash.framework.resources.sounds.SoundManager;
	public widgets:com.popcap.flash.games.zuma2.widgets.ZumaWidget;
	public mHideHelp:boolean = false;
	public mRand:com.popcap.flash.framework.math.Random;
	public gDarkBallColors:Array<any>;
	public gForceFruit:boolean = false;
	public gAddBalls:boolean = false;
	public gStopSuckbackImmediately:boolean = false;
	public imageManager:com.popcap.flash.framework.resources.images.ImageManager;
	public mBestTimes:Array<any>;
	public canvas:com.popcap.flash.framework.Canvas;
	public stringManager:com.popcap.flash.games.zuma2.logic.Zuma2Strings;
	public mHighScores:Array<any>;
	public fontManager:com.popcap.flash.framework.resources.fonts.FontManager;
	public mLevelData:com.popcap.flash.games.zuma2.logic.Zuma2LevelData;
	public fpsMon:com.popcap.flash.framework.utils.FPSMonitor;
	public mUpsellURL:string;
	public mMainState:com.popcap.flash.games.zuma2.states.MainState;
	public mNewHighScore:number = 0;
	public mVolume:number = 0;
	public gBrightBallColors:Array<any>;
	public mHighScoreLevels:Array<any>;
	public mMoreGamesURL:string;
	public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
	public mMoreGames:boolean = false;

	public constructor()
	{
		super();
		this.gBallColors = new Array(1671423,16776960,16711680,65280,16711935,16777215);
		this.gBrightBallColors = new Array(8454143,16777024,16755370,8454016,16744703,16777215);
		this.gDarkBallColors = new Array(2299513,6312202,10489620,2114594,5641795,3676962);
		this.mLayers = new Array<com.popcap.flash.games.zuma2.logic.LayerSprite>();
		this.gGotPowerUp = new Array();
		flash.Security["allowDomain"]("labs.test.vte.internal.popcap.com","labs.eric.popcap.com","labs.popcap.com","www.popcap.com","dl.labs.popcap.com");
		if(stage)
		{
			LoadData("",flash.bind(this.Init,this));
		}
		else
		{
			addEventListener(egret.Event.ADDED_TO_STAGE,flash.bind(this.HandleAdded,this));
		}
	}

	public HandleAdded(e:egret.Event)
	{
		LoadData("",flash.bind(this.Init,this));
		removeEventListener(egret.Event.ADDED_TO_STAGE,flash.bind(this.HandleAdded,this));
	}

	public handleMute(e:com.popcap.flash.framework.ads.AdAPIEvent)
	{
		this.soundManager["mute"]();
	}

	public Init(loaded:boolean)
	{
		var i:number = flash.checkInt(0);
		var counter:number = flash.checkInt(0);
		var aDate:flash.As3Date = new flash.As3Date();
		this.mRand = new Random(new MersenneTwister());
		this.mRand["SetSeed"](aDate.time);
		if(parent == stage)
		{
			this.mAdAPI = new MSNAdAPI();
			this.mAdAPI["init"]();
		}
		else
		{
			this.mAdAPI = flash.AS3Object(parent)["mAdAPI"];
		}
		if(GetProperties() != null)
		{
			this.mAdAPI["_isEnabled"] = AppUtils.asBoolean(GetProperties().MSN.enabled);
			this.mUpsells = AppUtils.asBoolean(GetProperties().upsells.enabled);
			this.mUpsellURL = GetProperties().upsells.url;
			this.mMoreGames = AppUtils.asBoolean(GetProperties().moregames.enabled);
			this.mMoreGamesURL = GetProperties().moregames.url;
		}
		this.mSharedObject = flash.SharedObject.getLocal("ZumasRevenge");
		if(this.mSharedObject.data["help"] == null)
		{
			this.mSharedObject.data["help"] = true;
		}
		if(this.mSharedObject.data["highscore"] == null)
		{
			this.mSharedObject.data["highscore"] = 0;
		}
		if(this.mSharedObject.data["besttimes"] == null)
		{
			this.mBestTimes = new Array();
			for(i = flash.checkInt(0); i < 21; i++)
			{
				this.mBestTimes[i] = 0;
			}
			this.mSharedObject.data["besttimes"] = this.mBestTimes;
		}
		else
		{
			this.mBestTimes = this.mSharedObject.data["besttimes"];
		}
		this.mHighScore = flash.checkInt(this.mSharedObject.data["highscore"]);
		if(this.mSharedObject.data["highscores"] == null)
		{
			this.mHighScores = new Array();
			counter = flash.checkInt(11);
			for(i = flash.checkInt(0); i < 10; i++)
			{
				counter--;
				this.mHighScores[i] = counter * 10000;
			}
			this.mSharedObject.data["highscores"] = this.mHighScores;
		}
		else
		{
			this.mHighScores = this.mSharedObject.data["highscores"];
		}
		if(this.mSharedObject.data["highscorelevels"] == null)
		{
			this.mHighScoreLevels = new Array();
			counter = flash.checkInt(20);
			for(i = flash.checkInt(0); i < 10; i++)
			{
				this.mHighScoreLevels[i] = counter;
				counter--;
			}
			this.mSharedObject.data["highscorelevels"] = this.mHighScoreLevels;
		}
		else
		{
			this.mHighScoreLevels = this.mSharedObject.data["highscorelevels"];
		}
		this.mNewHighScore = flash.checkInt(-1);
		this.canvas = new Canvas(Zuma2App.SCREEN_WIDTH,Zuma2App.SCREEN_HEIGHT);
		this.widgets = new ZumaWidget(this);
		this.imageManager = new Zuma2Images();
		this.fontManager = new Zuma2Fonts();
		this.mLevelData = new Zuma2LevelData();
		this.soundManager = new Zuma2Sounds();
		this.mVolume = flash.checkInt(1);
		this.stringManager = new Zuma2Strings();
		this["addChild"](new flash.Bitmap(this.canvas["getData"]()));
		for(i = flash.checkInt(0); i < 6; i++)
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
		this.fpsMon["x"] = 0;
		this.fpsMon["y"] = 305;
		this.fpsMon["visible"] = false;
		this.mLayers[5]["addChild"](this.fpsMon);
		if(this.mAdAPI["_isEnabled"])
		{
			this.mAdAPI["addEventListener"](AdAPIEvent.MUTE,flash.bind(this.handleMute,this));
			this.mAdAPI["addEventListener"](AdAPIEvent.UNMUTE,flash.bind(this.handleUnmute,this));
			this.mAdAPI["SessionReady"]();
			this.mAdAPI["addEventListener"](AdAPIEvent.SESSION_START,flash.bind(this.StartSession,this));
		}
		else
		{
			this.StartSession(null);
		}
	}

	public handleUnmute(e:com.popcap.flash.framework.ads.AdAPIEvent)
	{
		this.soundManager["unmute"]();
	}

	public StartSession(e:com.popcap.flash.framework.ads.AdAPIEvent)
	{
		this.mAdAPI["removeEventListener"](AdAPIEvent.SESSION_START,flash.bind(this.StartSession,this));
		this.mMainState = new MainState(this);
		Start(this.mMainState);
	}

}

Zuma2App.Blue_Ball = 0;
Zuma2App.STATE_LOADING = "Loading";
Zuma2App.SCREEN_WIDTH = 540;
Zuma2App.White_Ball = 5;
Zuma2App.STATE_MAIN_MENU = "MainMenu";
Zuma2App.APP_ID = "Zuma2";
Zuma2App.SCREEN_HEIGHT = 405;
Zuma2App.STATE_LEVEL_INTRO = "LevelIntro";
Zuma2App.STATE_PLAY_LEVEL = "PlayLevel";
Zuma2App.STATE_TITLE_SCREEN = "TitleScreen";
Zuma2App.Purple_Ball = 4;
Zuma2App.Yellow_Ball = 1;
Zuma2App.MY_PI = 3.14159;
Zuma2App.Red_Ball = 2;
Zuma2App.SHRINK_PERCENT = 0.675;
Zuma2App.DEG_TO_RAD = Zuma2App.MY_PI / 180;
Zuma2App.RAD_TO_DEG = 180 / Zuma2App.MY_PI;
Zuma2App.VERSION = "0.0.5.8740";
Zuma2App.Green_Ball = 3;
flash.extendsClass("Zuma2App","com.popcap.flash.framework.BaseApp")
