package com.popcap.flash.games.zuma2.widgets
{
   import com.popcap.flash.framework.widgets.Widget;
   import com.popcap.flash.framework.widgets.WidgetContainer;
   import com.popcap.flash.games.zuma2.logic.LevelMgr;
   import com.popcap.flash.games.zuma2.logic.MainMenu;
   import flash.events.MouseEvent;
   
   public class GameWidget extends WidgetContainer implements Widget
   {
       
      
      public var board:GameBoardWidget;
      
      public var mIsInited:Boolean;
      
      public var mApp:Zuma2App;
      
      public var menu:MainMenu;
      
      public function GameWidget(app:Zuma2App)
      {
         super();
         this.mApp = app;
         this.mIsInited = false;
      }
      
      override public function onKeyUp(keyCode:int) : void
      {
         for(var i:int = 0; i < mChildren.length; i++)
         {
            mChildren[i].onKeyUp(keyCode);
         }
      }
      
      public function Reset() : void
      {
         this.mApp.mLevelMgr = new LevelMgr(this.mApp);
         this.mApp.mLevelMgr.LoadXML("levels.xml");
      }
      
      public function init() : void
      {
         this.mIsInited = true;
         this.ShowMainMenu();
      }
      
      override public function onKeyDown(keyCode:int) : void
      {
         for(var i:int = 0; i < mChildren.length; i++)
         {
            mChildren[i].onKeyDown(keyCode);
         }
      }
      
      public function StartNewGame() : void
      {
         this.mApp.gAddBalls = true;
         this.mApp.gDieAtEnd = true;
         this.mApp.gSuckMode = false;
         this.mApp.gUpdateBalls = true;
         this.mApp.gForceFruit = false;
         this.board = new GameBoardWidget(this.mApp);
         this.board.mGauntletMode = false;
         addChild(this.board);
      }
      
      public function ShowMainMenu() : void
      {
         if(this.board != null)
         {
            this.board.ClearAll();
            removeChild(this.board);
            this.board = null;
         }
         this.menu = new MainMenu(this.mApp,this);
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.PauseBroadcast();
         }
      }
      
      public function CloseMainMenu() : void
      {
         this.menu = null;
      }
      
      override public function update() : void
      {
         if(!this.mIsInited)
         {
            this.init();
         }
         if(this.mApp.mLevelMgr != null)
         {
            if(this.mApp.mLevelMgr.mReady)
            {
               super.update();
            }
         }
      }
      
      public function ShowHighScore() : void
      {
         if(this.board != null)
         {
            this.board.ClearAll();
            removeChild(this.board);
            this.board = null;
         }
         this.menu = new MainMenu(this.mApp,this);
         this.menu.handleHighscores(new MouseEvent(MouseEvent.CLICK));
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.PauseBroadcast();
         }
      }
      
      public function Clear() : void
      {
         for(var i:int = 0; i < this.mApp.mLayers.length; i++)
         {
            this.mApp.mLayers[i].Clear();
         }
      }
   }
}
