package com.popcap.flash.games.zuma2.states
{
   import com.popcap.flash.framework.BaseAppStateMachine;
   import com.popcap.flash.framework.IAppState;
   import flash.display.Sprite;
   
   public class PlayLevelState extends Sprite implements IAppState
   {
       
      
      private var mStateMachine:BaseAppStateMachine;
      
      private var mApp:Zuma2App;
      
      public function PlayLevelState(app:Zuma2App)
      {
         super();
         this.mApp = app;
         this.mStateMachine = new BaseAppStateMachine();
      }
      
      public function onEnter() : void
      {
      }
      
      public function onMouseUp(x:Number, y:Number) : void
      {
      }
      
      public function draw(elapsed:int) : void
      {
      }
      
      public function onMouseDown(x:Number, y:Number) : void
      {
      }
      
      public function onPop() : void
      {
      }
      
      public function update() : void
      {
      }
      
      public function onKeyDown(keyCode:int) : void
      {
      }
      
      public function onPush() : void
      {
      }
      
      public function onExit() : void
      {
      }
      
      public function onKeyUp(keyCode:int) : void
      {
      }
      
      public function onMouseMove(x:Number, y:Number) : void
      {
      }
   }
}
