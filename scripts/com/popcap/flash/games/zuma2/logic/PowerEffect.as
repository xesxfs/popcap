package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.resources.images.ImageInst;
   import flash.geom.ColorTransform;
   
   public class PowerEffect
   {
      
      public static const PowerEffect_Cannon:int = 4;
      
      public static const WHITE:ColorTransform = new ColorTransform(1,1,1,1,0,0,0);
      
      public static const PowerEffect_Stop:int = 3;
      
      public static const PowerEffect_Laser:int = 5;
      
      public static const PowerEffect_Accuracy:int = 1;
      
      public static const PowerEffect_Reverse:int = 2;
      
      public static const PowerEffect_Bomb:int = 0;
       
      
      public var mType:int;
      
      public var mY:Number;
      
      public var mDone:Boolean;
      
      public var mColorType:int;
      
      public var mDrawReverse:Boolean;
      
      public var mX:Number;
      
      public var mItems:Vector.<EffectItem>;
      
      public var mUpdateCount:int;
      
      public var mApp:Zuma2App;
      
      public function PowerEffect(app:Zuma2App, x:Number = 0, y:Number = 0)
      {
         this.mItems = new Vector.<EffectItem>();
         super();
         this.mApp = app;
         this.mX = x;
         this.mY = y;
         this.mType = -1;
         this.mColorType = -1;
         this.mDone = false;
         this.mDrawReverse = false;
         this.mUpdateCount = 0;
      }
      
      public function GetComponentValue(v:Vector.<Component>, def_value:Number, update_count:int) : Number
      {
         var comp:Component = null;
         for(var i:int = 0; i < v.length; i++)
         {
            comp = v[i];
            if(update_count < comp.mStartFrame)
            {
               return comp.mValue;
            }
            if(comp.Active(update_count))
            {
               return comp.mValue;
            }
            if(i == v.length - 1)
            {
               return comp.mValue;
            }
         }
         return def_value;
      }
      
      public function Delete() : void
      {
         for(var i:int = 0; i < this.mItems.length; i++)
         {
            this.mItems[i].Delete();
         }
      }
      
      public function AddDefaultEffectType(eff_type:int, color_type:int, init_rotation:Number = 0) : void
      {
         var c1:ColorTransform = null;
         var c2:ColorTransform = null;
         var item:EffectItem = null;
         var time_sub:int = 0;
         var img:ImageInst = null;
         var d:Number = NaN;
         var rot:Number = NaN;
         var target:Number = NaN;
         switch(color_type)
         {
            case Zuma2App.Blue_Ball:
               c1 = new ColorTransform(150 / 255,150 / 255,150 / 255);
               c2 = new ColorTransform(75 / 255,75 / 255,255 / 255);
               break;
            case Zuma2App.Yellow_Ball:
               c1 = new ColorTransform(255 / 255,255 / 255,150 / 255);
               c2 = new ColorTransform(255 / 255,255 / 255,0 / 255);
               break;
            case Zuma2App.Red_Ball:
               c1 = new ColorTransform(250 / 255,140 / 255,0 / 255);
               c2 = new ColorTransform(250 / 255,50 / 255,1 / 255);
               break;
            case Zuma2App.Green_Ball:
               c1 = new ColorTransform(200 / 255,200 / 255,0 / 255);
               c2 = new ColorTransform(0 / 255,185 / 255,118 / 255);
               break;
            case Zuma2App.Purple_Ball:
               c1 = new ColorTransform(255 / 255,100 / 255,255 / 255);
               c2 = new ColorTransform(255 / 255,50 / 255,255 / 255);
            case Zuma2App.White_Ball:
               c1 = new ColorTransform(255 / 255,255 / 255,255 / 255);
               c2 = new ColorTransform(200 / 255,200 / 255,200 / 255);
         }
         this.mType = eff_type;
         this.mColorType = color_type;
         if(eff_type == PowerEffect_Bomb)
         {
            time_sub = 83;
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_POWERUP_POWERPULSES),c2,3);
            item.mScale.push(new Component(1,1.63,83 - time_sub,115 - time_sub));
            item.mOpacity.push(new Component(255,0,100 - time_sub,130 - time_sub));
            img = this.mApp.imageManager.getImageInst("IMAGE_BLOOM_BLAST_" + this.GetColorName(color_type));
            item = this.AddItem(img,WHITE);
            item.mScale.push(new Component(0.2,1,83 - time_sub,105 - time_sub));
            item.mAngle.push(new Component(init_rotation,init_rotation + Zuma2App.MY_PI,83 - time_sub,105 - time_sub));
            item.mOpacity.push(new Component(0,128,83 - time_sub,105 - time_sub));
            item.mOpacity.push(new Component(128,0,106 - time_sub,120 - time_sub));
            item = this.AddItem(img,WHITE);
            item.mScale.push(new Component(0.2,1,83 - time_sub,131 - time_sub));
            item.mAngle.push(new Component(init_rotation,init_rotation - Zuma2App.MY_PI,83 - time_sub,105 - time_sub));
            item.mOpacity.push(new Component(0,128,83 - time_sub,105 - time_sub));
            item.mOpacity.push(new Component(128,0,106 - time_sub,145 - time_sub));
         }
         else if(eff_type == PowerEffect_Accuracy)
         {
            time_sub = 35;
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_BALL_GLOW),c1);
            item.mOpacity.push(new Component(128,255,35 - time_sub,50 - time_sub));
            item.mOpacity.push(new Component(255,0,51 - time_sub,95 - time_sub));
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_POWERUP_POWERPULSES),c1,0);
            item.mScale.push(new Component(0.1,2,50 - time_sub,65 - time_sub));
            item.mAngle.push(new Component(init_rotation,init_rotation + Zuma2App.MY_PI,55 - time_sub,75 - time_sub));
            item.mOpacity.push(new Component(25,255,35 - time_sub,50 - time_sub));
            item.mOpacity.push(new Component(255,0,36 - time_sub,95 - time_sub));
            item = this.AddItem(this.mApp.imageManager.getImageInst("IMAGE_BLOOM_ACCURACY_" + this.GetColorName(color_type)),c1);
            item.mScale.push(new Component(0.1,1.1,50 - time_sub,95 - time_sub));
            item.mScale.push(new Component(1.1,1,96 - time_sub,101 - time_sub));
            item.mAngle.push(new Component(init_rotation,init_rotation + Zuma2App.MY_PI / 2,55 - time_sub,95 - time_sub));
            item.mOpacity.push(new Component(0,0,35 - time_sub,49 - time_sub));
            item.mOpacity.push(new Component(25,255,50 - time_sub,75 - time_sub));
            item.mOpacity.push(new Component(255,0,115 - time_sub,135 - time_sub));
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_BALL_RING),c1);
            item.mOpacity.push(new Component(0,0,35 - time_sub,79 - time_sub));
            item.mOpacity.push(new Component(128,255,80 - time_sub,90 - time_sub));
            item.mOpacity.push(new Component(255,0,91 - time_sub,135 - time_sub));
            item.mScale.push(new Component(1,10,80 - time_sub,135 - time_sub));
         }
         else if(eff_type == PowerEffect_Reverse)
         {
            d = 8;
            time_sub = 70 / d;
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_BALL_GLOW),c1);
            item.mOpacity.push(new Component(128,255,70 / d - time_sub,210 / d - time_sub));
            item.mOpacity.push(new Component(255,0,211 / d - time_sub,310 / d - time_sub));
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_POWERUP_POWERPULSES),c2,4);
            item.mScale.push(new Component(1,2,109 / d - time_sub,385 / d - time_sub));
            item.mOpacity.push(new Component(0,0,70 / d - time_sub,108 / d - time_sub));
            item.mOpacity.push(new Component(255,255,109 / d - time_sub,360 / d - time_sub));
            item.mOpacity.push(new Component(255,0,361 / d - time_sub,485 / d - time_sub));
            item.mBitmap.rotation = -90;
            img = this.mApp.imageManager.getImageInst("IMAGE_BLOOM_REVERSE_" + this.GetColorName(color_type));
            item = this.AddItem(img,WHITE);
            item.mOpacity.push(new Component(0,0,70 / d - time_sub,160 / d - time_sub));
            item.mOpacity.push(new Component(0,128,161 / d - time_sub,360 / d - time_sub));
            item.mOpacity.push(new Component(128,153,361 / d - time_sub,485 / d - time_sub));
            item.mOpacity.push(new Component(153,0,486 / d - time_sub,560 / d - time_sub));
            item.mScale.push(new Component(0.2,1,160 / d - time_sub,360 / d - time_sub));
            item = this.AddItem(img,WHITE);
            item.mOpacity.push(new Component(0,0,70 / d - time_sub,335 / d - time_sub));
            item.mOpacity.push(new Component(0,255,336 / d - time_sub,585 / d - time_sub));
            item.mScale.push(new Component(0.2,1,335 / d - time_sub,535 / d - time_sub));
         }
         else if(eff_type == PowerEffect_Stop)
         {
            rot = init_rotation - Zuma2App.MY_PI / 2;
            if(rot > Zuma2App.MY_PI)
            {
               target = Zuma2App.MY_PI * 2;
            }
            else
            {
               target = 0;
            }
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_POWERUP_POWERPULSES),WHITE,2);
            item.mOpacity.push(new Component(255,255,0,15));
            item.mOpacity.push(new Component(255,0,16,21));
            item.mScale.push(new Component(1,1,0,9));
            item.mScale.push(new Component(1,2,10,21));
            item.mAngle.push(new Component(rot,target,0,20));
            item = this.AddItem(this.mApp.imageManager.getImageInst("IMAGE_BLOOM_STOP_" + this.GetColorName(color_type)),WHITE);
            item.mOpacity.push(new Component(0,0,0,9));
            item.mOpacity.push(new Component(128,255,10,20));
            item.mOpacity.push(new Component(255,0,40,50));
            item.mScale.push(new Component(0.5,1.1,10,22));
            item.mScale.push(new Component(1.1,1,23,30));
            item.mScale.push(new Component(1,0.5,40,50));
            item.mYOffset.push(new Component(0,-10,10,20));
            item.mAngle.push(new Component(rot,target,0,20));
            item = this.AddItem(this.mApp.imageManager.getImageInst("IMAGE_BLOOM_STOP_" + this.GetColorName(color_type)),WHITE);
            item.mOpacity.push(new Component(0,0,0,20));
            item.mOpacity.push(new Component(0,255,21,26));
            item.mOpacity.push(new Component(255,0,27,37));
            item.mScale.push(new Component(1,1.1,20,22));
            item.mScale.push(new Component(1.1,1,23,27));
            item.mYOffset.push(new Component(-10,-10,20,20));
            item.mAngle.push(new Component(rot,target,0,20));
            item = this.AddItem(this.mApp.imageManager.getImageInst(Zuma2Images.IMAGE_STOP_OUTLINE),WHITE);
            item.mOpacity.push(new Component(0,0,0,24));
            item.mOpacity.push(new Component(255,0,25,50));
            item.mScale.push(new Component(1,3,25,50));
            item.mAngle.push(new Component(rot,target,0,20));
         }
         else if(eff_type == PowerEffect_Laser)
         {
         }
      }
      
      public function Draw() : void
      {
         var item:EffectItem = null;
         if(this.mDone)
         {
            return;
         }
         var start_idx:int = !!this.mDrawReverse?int(this.mItems.length - 1):0;
         var end_idx:int = !!this.mDrawReverse?0:int(this.mItems.length);
         var idx:int = start_idx;
         while(!!this.mDrawReverse?idx >= end_idx:idx < end_idx)
         {
            item = this.mItems[idx];
            item.mSprite.alpha = this.GetComponentValue(item.mOpacity,255,this.mUpdateCount) / 255;
            item.mSprite.rotation = this.GetComponentValue(item.mAngle,0,this.mUpdateCount) * Zuma2App.RAD_TO_DEG;
            item.mSprite.scaleX = this.GetComponentValue(item.mScale,1,this.mUpdateCount);
            item.mSprite.scaleY = this.GetComponentValue(item.mScale,1,this.mUpdateCount);
            item.mSprite.x = this.GetComponentValue(item.mXOffset,0,this.mUpdateCount) + this.mX * Zuma2App.SHRINK_PERCENT;
            item.mSprite.y = this.GetComponentValue(item.mYOffset,0,this.mUpdateCount) + this.mY * Zuma2App.SHRINK_PERCENT;
            idx = idx + (!!this.mDrawReverse?-1:1);
         }
      }
      
      public function UpdateComponentVec(v:Vector.<Component>, update_count:int) : Boolean
      {
         var comp:Component = null;
         var passed_all:Boolean = true;
         for(var idx:int = 0; idx < v.length; idx++)
         {
            comp = v[idx];
            if(comp.Active(update_count))
            {
               comp.Update();
               return false;
            }
            if(update_count < comp.mStartFrame)
            {
               passed_all = false;
            }
         }
         return passed_all;
      }
      
      public function Update() : void
      {
         var item:EffectItem = null;
         var sdone:Boolean = false;
         var adone:Boolean = false;
         var odone:Boolean = false;
         var xdone:Boolean = false;
         var ydone:Boolean = false;
         if(this.mDone)
         {
            return;
         }
         this.mUpdateCount++;
         var all_done:Boolean = true;
         for(var i:int = 0; i < this.mItems.length; i++)
         {
            item = this.mItems[i];
            sdone = this.UpdateComponentVec(item.mScale,this.mUpdateCount);
            adone = this.UpdateComponentVec(item.mAngle,this.mUpdateCount);
            odone = this.UpdateComponentVec(item.mOpacity,this.mUpdateCount);
            xdone = this.UpdateComponentVec(item.mXOffset,this.mUpdateCount);
            ydone = this.UpdateComponentVec(item.mYOffset,this.mUpdateCount);
            all_done = all_done && sdone && adone && odone && xdone && ydone;
         }
         this.mDone = all_done;
      }
      
      public function IsDone() : Boolean
      {
         return this.mDone;
      }
      
      public function GetColorName(color:int) : String
      {
         var colorString:String = null;
         switch(color)
         {
            case 0:
               colorString = "BLUE";
               break;
            case 1:
               colorString = "YELLOW";
               break;
            case 2:
               colorString = "RED";
               break;
            case 3:
               colorString = "GREEN";
               break;
            case 4:
               colorString = "PURPLE";
               break;
            case 5:
               colorString = "WHITE";
               break;
            default:
               colorString = "BLUE";
         }
         return colorString;
      }
      
      public function AddItem(img:ImageInst, c:ColorTransform, cel:int = 0) : EffectItem
      {
         this.mItems.push(new EffectItem(this.mApp));
         var item:EffectItem = this.mItems[this.mItems.length - 1];
         item.mImage = img;
         item.mCel = cel;
         item.mColor = c;
         item.Init(this.mX,this.mY);
         return item;
      }
   }
}
