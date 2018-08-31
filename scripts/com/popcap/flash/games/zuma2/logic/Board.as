package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   import com.popcap.flash.framework.widgets.Widget;
   import com.popcap.flash.framework.widgets.WidgetContainer;
   import de.polygonal.ds.DLinkedList;
   
   public class Board extends WidgetContainer implements Widget
   {
       
      
      public var mBulletList:DLinkedList;
      
      public var mGameState:int;
      
      public var mLevel:Level;
      
      public var mLives:int;
      
      public var mScore:int;
      
      public var mAdventureMode:Boolean;
      
      public var mLevelNum:int;
      
      public var mFrog:Gun;
      
      private var mApp:Zuma2App;
      
      public function Board(app:Zuma2App)
      {
         super();
         this.mApp = app;
      }
      
      override public function draw(canvas:Canvas) : void
      {
      }
      
      override public function update() : void
      {
      }
      
      public function StartLevel(level_id:String) : void
      {
         this.SetupTunnels(this.mLevel);
         this.mLevel.StartLevel();
         this.mLevel.SetFrog(this.mFrog);
      }
      
      public function SetupTunnels(level:Level) : void
      {
      }
      
      override public function onMouseMove(x:Number, y:Number) : void
      {
         this.UpdateGunPos(x,y);
      }
      
      public function UpdateGunPos(x:Number, y:Number) : void
      {
         var cx:int = this.mFrog.GetCenterX();
         var cy:int = this.mFrog.GetCenterY();
         var dx:int = x - cx;
         var dy:int = cy - y;
         var rad:Number = Math.atan2(dy,dx) + Math.PI / 2;
         this.mFrog.SetDestAngle(rad);
      }
   }
}
