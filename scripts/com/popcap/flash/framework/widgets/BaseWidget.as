package com.popcap.flash.framework.widgets
{
   import com.popcap.flash.framework.Canvas;
   import flash.geom.Point;
   
   public class BaseWidget implements Widget
   {
       
      
      private var mIsEnabled:Boolean = true;
      
      private var mX:Number = 0;
      
      private var mY:Number = 0;
      
      protected var mousePos:Point;
      
      private var mIsVisible:Boolean = true;
      
      public function BaseWidget()
      {
         this.mousePos = new Point();
         super();
      }
      
      public function onKeyUp(keyCode:int) : void
      {
      }
      
      public function draw(canvas:Canvas) : void
      {
      }
      
      public function onMouseMove(x:Number, y:Number) : void
      {
         this.mousePos.x = x;
         this.mousePos.y = y;
      }
      
      public function get x() : Number
      {
         return this.mX;
      }
      
      public function get y() : Number
      {
         return this.mY;
      }
      
      public function update() : void
      {
      }
      
      public function onMouseDown(x:Number, y:Number) : void
      {
         this.mousePos.x = x;
         this.mousePos.y = y;
      }
      
      public function set isVisible(value:Boolean) : void
      {
         this.mIsVisible = value;
      }
      
      public function onKeyDown(keyCode:int) : void
      {
      }
      
      public function onMouseOut(x:Number, y:Number) : void
      {
         this.mousePos.x = x;
         this.mousePos.y = y;
      }
      
      public function onMouseUp(x:Number, y:Number) : void
      {
         this.mousePos.x = x;
         this.mousePos.y = y;
      }
      
      public function contains(x:Number, y:Number) : Boolean
      {
         return false;
      }
      
      public function get isVisible() : Boolean
      {
         return this.mIsVisible;
      }
      
      public function set x(value:Number) : void
      {
         this.mX = value;
      }
      
      public function set y(value:Number) : void
      {
         this.mY = value;
      }
      
      public function set isEnabled(value:Boolean) : void
      {
         this.mIsEnabled = value;
      }
      
      public function onMouseOver(x:Number, y:Number) : void
      {
         this.mousePos.x = x;
         this.mousePos.y = y;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.mIsEnabled;
      }
   }
}
