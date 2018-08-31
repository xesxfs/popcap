package com.popcap.flash.games.zuma2.widgets
{
   import com.popcap.flash.framework.widgets.Widget;
   import com.popcap.flash.framework.widgets.WidgetContainer;
   
   public class ZumaWidget extends WidgetContainer implements Widget
   {
       
      
      public var game:GameWidget;
      
      public function ZumaWidget(app:Zuma2App)
      {
         super();
         this.game = new GameWidget(app);
         addChild(this.game);
      }
      
      override public function onKeyDown(keyCode:int) : void
      {
         for(var i:int = 0; i < mChildren.length; i++)
         {
            mChildren[i].onKeyDown(keyCode);
         }
      }
      
      override public function onKeyUp(keyCode:int) : void
      {
         for(var i:int = 0; i < mChildren.length; i++)
         {
            mChildren[i].onKeyUp(keyCode);
         }
      }
   }
}
