package com.popcap.flash.games.zuma2.logic
{
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class ScoreBlip
   {
       
      
      public var mBulgeDir:Number;
      
      public var mLife:int;
      
      public var mAlphaDecRate:Number;
      
      public var mX:Number;
      
      public var mY:Number;
      
      public var mSize:Number;
      
      public var mDone:Boolean;
      
      public var mTextFormat:TextFormat;
      
      public var mAlphaDelay:Number;
      
      public var mBulgePct:Number;
      
      public var mUpdateCount:int;
      
      public var mSpeed:Number;
      
      public var mTextSprite:Sprite;
      
      public var mTextField:TextField;
      
      public var mAlpha:Number;
      
      public var mColor:uint;
      
      public var mBulgeDec:Number;
      
      public var mText:String;
      
      public var mApp:Zuma2App;
      
      public var mAlphaFadeDelay:Number;
      
      public var mBulgeAmt:Number;
      
      public function ScoreBlip(app:Zuma2App, text:String, x:Number, y:Number, color:uint)
      {
         super();
         this.mApp = app;
         this.mText = text;
         this.mColor = color;
         this.mX = x;
         this.mY = y;
         if(this.mX < 150)
         {
            this.mX = 150;
         }
         if(this.mX > 600)
         {
            this.mX = 600;
         }
         if(this.mY < 125)
         {
            this.mY = 125;
         }
         if(this.mY > 600)
         {
            this.mY = 600;
         }
         this.mSize = 1;
         this.mLife = 25;
         this.mSpeed = 0.5;
         this.mAlphaFadeDelay = 50;
         this.mAlphaDecRate = 5;
         this.mAlpha = 255;
         this.mDone = false;
         this.mTextSprite = new Sprite();
         this.mTextFormat = new TextFormat();
         this.mTextFormat.font = "BonusText";
         this.mTextFormat.align = TextFormatAlign.CENTER;
         this.mTextFormat.color = color;
         this.mTextFormat.size = 24;
         var aGlow:GlowFilter = new GlowFilter(0,1,2,2,200);
         this.mTextField = new TextField();
         this.mTextField.embedFonts = true;
         this.mTextField.defaultTextFormat = this.mTextFormat;
         this.mTextField.filters = [aGlow];
         this.mTextField.textColor = color;
         this.mTextField.width = 200;
         this.mTextField.height = 100;
         this.mTextField.x = -this.mTextField.width / 2;
         this.mTextField.y = -this.mTextField.height / 2;
         this.mTextField.alpha = 1;
         this.mTextField.selectable = false;
         this.mTextField.multiline = true;
         this.mTextField.wordWrap = true;
         this.mTextField.text = text;
         this.mTextSprite.alpha = 1;
         this.mTextSprite.addChild(this.mTextField);
         this.mTextSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
         this.mTextSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
         this.mApp.mLayers[3].mBackground.addChild(this.mTextSprite);
      }
      
      public function Update() : void
      {
         this.mUpdateCount++;
         if(this.mDone)
         {
            return;
         }
         if(this.mBulgeDir != 0)
         {
            this.mSize = this.mSize + this.mBulgeDir * this.mBulgeAmt;
            if(this.mBulgeDir > 0 && this.mSize >= this.mBulgePct)
            {
               this.mSize = this.mBulgePct;
               this.mBulgeDir = -1;
               this.mBulgePct = this.mBulgePct - this.mBulgeDec;
            }
            else if(this.mBulgeDir < 0 && this.mSize <= 1)
            {
               this.mSize = 1;
               this.mBulgeDir = 1;
            }
            if(this.mSize <= 1 && this.mBulgePct <= 1)
            {
               this.mSize = 1;
               this.mBulgeDir = 0;
            }
         }
         this.mY = this.mY - this.mSpeed;
         if(this.mY < -this.mTextField.height)
         {
            this.mDone = true;
         }
         if(--this.mLife <= 0)
         {
            this.mLife = 0;
            if(this.mAlpha <= 0)
            {
               this.mDone = true;
            }
         }
         if(--this.mAlphaFadeDelay <= 0)
         {
            this.mAlpha = this.mAlpha - this.mAlphaDecRate;
            if(this.mAlpha < 0)
            {
               this.mAlpha = 0;
               if(this.mLife <= 0)
               {
                  this.mDone = true;
               }
            }
         }
      }
      
      public function Delete() : void
      {
         if(this.mTextSprite != null)
         {
            if(this.mTextSprite.parent != null)
            {
               this.mTextSprite.parent.removeChild(this.mTextSprite);
            }
         }
      }
      
      public function Draw() : void
      {
         var aFade:Number = NaN;
         if(!this.mDone)
         {
            aFade = this.mLife / 18;
            if(aFade > 1)
            {
               aFade = 1;
            }
            this.mTextSprite.scaleX = this.mSize;
            this.mTextSprite.scaleY = this.mSize;
            this.mTextSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
            this.mTextSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
            this.mTextSprite.alpha = this.mAlpha / 255;
         }
      }
      
      public function Bulge(pct:Number, rate:Number, count:int) : void
      {
         this.mSize = 1;
         this.mBulgePct = pct;
         this.mBulgeAmt = rate;
         this.mBulgeDir = 1;
         this.mBulgeDec = (pct - 1) / Number(count);
      }
   }
}
