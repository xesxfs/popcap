package com.popcap.flash.games.zuma2.logic
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class CheckBox extends Sprite
   {
       
      
      public var mCheckedImage:Bitmap;
      
      public var mApp:Zuma2App;
      
      public var mUncheckedOverImage:Bitmap;
      
      public var mOver:Boolean;
      
      public var mUncheckedImage:Bitmap;
      
      public var mCheckedOverImage:Bitmap;
      
      public var mBoard:Board;
      
      public var mChecked:Boolean;
      
      public function CheckBox(app:Zuma2App, checkedImage:Bitmap, checkedOverImage:Bitmap, uncheckedImage:Bitmap, uncheckedOverImage:Bitmap, checked:Boolean)
      {
         super();
         this.mApp = app;
         this.mChecked = checked;
         this.mCheckedImage = checkedImage;
         this.mCheckedImage.visible = false;
         this.mCheckedOverImage = checkedOverImage;
         this.mCheckedOverImage.visible = false;
         this.mUncheckedImage = uncheckedImage;
         this.mUncheckedImage.visible = false;
         this.mUncheckedOverImage = uncheckedOverImage;
         this.mUncheckedOverImage.visible = false;
         if(this.mChecked)
         {
            this.mCheckedImage.visible = true;
         }
         else
         {
            this.mUncheckedImage.visible = true;
         }
         addChild(this.mCheckedImage);
         addChild(this.mCheckedOverImage);
         addChild(this.mUncheckedImage);
         addChild(this.mUncheckedOverImage);
         this.addEventListener(MouseEvent.CLICK,this.handleClick);
         this.addEventListener(MouseEvent.ROLL_OVER,this.handleOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.handleOut);
         buttonMode = true;
         useHandCursor = true;
      }
      
      public function handleClick(e:MouseEvent) : void
      {
         if(this.mChecked)
         {
            this.SetChecked(false);
         }
         else
         {
            this.SetChecked(true);
         }
      }
      
      public function SetChecked(checked:Boolean) : void
      {
         this.mChecked = checked;
         if(this.mChecked)
         {
            if(this.mOver)
            {
               this.mCheckedOverImage.visible = true;
            }
            else
            {
               this.mCheckedImage.visible = true;
            }
            this.mUncheckedImage.visible = false;
            this.mUncheckedOverImage.visible = false;
         }
         else
         {
            if(this.mOver)
            {
               this.mUncheckedOverImage.visible = true;
            }
            else
            {
               this.mUncheckedImage.visible = true;
            }
            this.mCheckedImage.visible = false;
            this.mCheckedOverImage.visible = false;
         }
      }
      
      public function handleOut(e:MouseEvent) : void
      {
         this.mOver = false;
         this.mCheckedOverImage.visible = false;
         this.mUncheckedOverImage.visible = false;
         if(this.mChecked)
         {
            this.mCheckedImage.visible = true;
         }
         else
         {
            this.mUncheckedImage.visible = true;
         }
      }
      
      public function handleOver(e:MouseEvent) : void
      {
         this.mOver = true;
         this.mUncheckedImage.visible = false;
         this.mCheckedImage.visible = false;
         if(this.mChecked)
         {
            this.mCheckedOverImage.visible = true;
         }
         else
         {
            this.mUncheckedOverImage.visible = true;
         }
      }
   }
}
