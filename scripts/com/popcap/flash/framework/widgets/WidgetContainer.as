package com.popcap.flash.framework.widgets
{
   import com.popcap.flash.framework.Canvas;
   
   public class WidgetContainer extends BaseWidget implements Widget
   {
       
      
      private var mOverWidget:Widget;
      
      public var mChildren:Vector.<Widget>;
      
      public var mParent:WidgetContainer;
      
      public function WidgetContainer()
      {
         super();
         this.mChildren = new Vector.<Widget>();
      }
      
      override public function onKeyUp(keyCode:int) : void
      {
      }
      
      override public function draw(canvas:Canvas) : void
      {
         var child:Widget = null;
         var numChildren:int = this.mChildren.length;
         for(var i:int = 0; i < numChildren; i++)
         {
            child = this.mChildren[i];
            if(child.isVisible)
            {
               canvas.getMatrix().translate(child.x,child.y);
               child.draw(canvas);
               canvas.getMatrix().translate(-child.x,-child.y);
            }
         }
      }
      
      override public function onMouseMove(x:Number, y:Number) : void
      {
         var widget:Widget = this.getChildAt(x,y);
         if(widget != this.mOverWidget)
         {
            if(this.mOverWidget != null)
            {
               this.mOverWidget.onMouseOut(x - this.mOverWidget.x,y - this.mOverWidget.y);
            }
            this.mOverWidget = widget;
            if(this.mOverWidget != null)
            {
               this.mOverWidget.onMouseOver(x - this.mOverWidget.x,y - this.mOverWidget.y);
            }
         }
         if(this.mOverWidget != null)
         {
            this.mOverWidget.onMouseMove(x - this.mOverWidget.x,y - this.mOverWidget.y);
         }
      }
      
      override public function update() : void
      {
         var child:Widget = null;
         var numChildren:int = this.mChildren.length;
         for(var i:int = 0; i < numChildren; i++)
         {
            child = this.mChildren[i];
            child.update();
         }
      }
      
      override public function onMouseDown(x:Number, y:Number) : void
      {
         if(this.mOverWidget != null)
         {
            this.mOverWidget.onMouseDown(x - this.mOverWidget.x,y - this.mOverWidget.y);
         }
      }
      
      override public function onMouseUp(x:Number, y:Number) : void
      {
         if(this.mOverWidget != null)
         {
            this.mOverWidget.onMouseUp(x - this.mOverWidget.x,y - this.mOverWidget.y);
         }
      }
      
      override public function onKeyDown(keyCode:int) : void
      {
      }
      
      override public function contains(x:Number, y:Number) : Boolean
      {
         var child:Widget = null;
         var numChildren:int = this.mChildren.length;
         for(var i:int = 0; i < numChildren; i++)
         {
            child = this.mChildren[i];
            if(!(!child.isEnabled || !child.isVisible))
            {
               if(child.contains(x - child.x,y - child.y))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      override public function onMouseOut(x:Number, y:Number) : void
      {
         if(this.mOverWidget != null)
         {
            this.mOverWidget.onMouseOut(x - this.mOverWidget.x,y - this.mOverWidget.y);
         }
         this.mOverWidget = null;
      }
      
      override public function set isEnabled(value:Boolean) : void
      {
         var child:Widget = null;
         super.isEnabled = value;
         var numChildren:int = this.mChildren.length;
         for(var i:int = 0; i < numChildren; i++)
         {
            child = this.mChildren[i];
            child.isEnabled = value;
         }
      }
      
      public function removeChild(node:Widget) : void
      {
         var index:int = this.mChildren.indexOf(node);
         if(index >= 0)
         {
            this.mChildren.splice(index,1);
         }
      }
      
      public function getChildAt(x:Number, y:Number) : Widget
      {
         var child:Widget = null;
         var numChildren:int = this.mChildren.length;
         for(var i:int = numChildren - 1; i >= 0; i--)
         {
            child = this.mChildren[i];
            if(!(!child.isEnabled || !child.isVisible))
            {
               if(child.contains(x - child.x,y - child.y))
               {
                  return child;
               }
            }
         }
         return null;
      }
      
      override public function onMouseOver(x:Number, y:Number) : void
      {
      }
      
      public function addChild(node:Widget) : void
      {
         var index:int = this.mChildren.indexOf(node);
         if(index >= 0)
         {
            this.mChildren.splice(index,1);
         }
         this.mChildren.push(node);
      }
   }
}
