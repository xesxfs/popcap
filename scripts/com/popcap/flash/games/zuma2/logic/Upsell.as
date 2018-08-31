package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
   import flash.display.Bitmap;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class Upsell
   {
      
      public static const UPSELL_FULL:int = 1;
      
      public static const UPSELL_HEROIC:int = 2;
      
      public static const DOWN_TEXT:int = 2;
      
      public static const UP_TEXT:int = 0;
      
      public static const UPSELL_CHALLENGE:int = 3;
      
      public static const UPSELL_ADVENTURE:int = 0;
      
      public static const OVER_TEXT:int = 1;
       
      
      public var mMainMenu:MainMenu;
      
      public var mUpsellButton:SimpleButton;
      
      public var mApp:Zuma2App;
      
      public var mBoard:GameBoardWidget;
      
      public var mBackground:Bitmap;
      
      public var mCloseButton:SimpleButton;
      
      public function Upsell(app:Zuma2App, mainMenu:MainMenu, board:GameBoardWidget, type:int)
      {
         super();
         this.mApp = app;
         this.mMainMenu = mainMenu;
         this.mBoard = board;
         var upsellUp:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UPSELL_BUTTON_GETIT_UP));
         var upsellDown:Bitmap = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UPSELL_BUTTON_GETIT_DOWN));
         var closeUp:TextField = this.makeCloseText(UP_TEXT,this.mApp.stringManager.translateString("[UPSELL_BUTTON_CONTINUE]"));
         var closeDown:TextField = this.makeCloseText(DOWN_TEXT,this.mApp.stringManager.translateString("[UPSELL_BUTTON_CONTINUE]"));
         this.mUpsellButton = new SimpleButton(upsellUp,upsellDown,upsellDown,upsellDown);
         this.mUpsellButton.addEventListener(MouseEvent.CLICK,this.handleUpsell);
         this.mCloseButton = new SimpleButton(closeUp,closeDown,closeDown,closeDown);
         this.mCloseButton.addEventListener(MouseEvent.CLICK,this.handleClose);
         switch(type)
         {
            case UPSELL_ADVENTURE:
               this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UPSELL_ADVENTURE));
               this.mUpsellButton.x = 200;
               this.mUpsellButton.y = 273;
               this.mCloseButton.x = 180;
               this.mCloseButton.y = 307;
               break;
            case UPSELL_CHALLENGE:
               this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UPSELL_CHALLENGE));
               this.mUpsellButton.x = 200;
               this.mUpsellButton.y = 263;
               this.mCloseButton.x = 184;
               this.mCloseButton.y = 300;
               break;
            case UPSELL_FULL:
               this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UPSELL_FULL));
               this.mUpsellButton.x = 206;
               this.mUpsellButton.y = 282;
               this.mCloseButton.x = 188;
               this.mCloseButton.y = 320;
               break;
            case UPSELL_HEROIC:
               this.mBackground = new Bitmap(this.mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UPSELL_HEROIC));
               this.mUpsellButton.x = 220;
               this.mUpsellButton.y = 300;
               this.mCloseButton.x = 204;
               this.mCloseButton.y = 335;
         }
         this.mApp.mLayers[5].mForeground.addChild(this.mBackground);
         this.mApp.mLayers[5].mForeground.addChild(this.mUpsellButton);
         this.mApp.mLayers[5].mForeground.addChild(this.mCloseButton);
      }
      
      public function handleClose(e:MouseEvent) : void
      {
         if(this.mMainMenu != null)
         {
            this.mMainMenu.ToggleButtons(true);
            this.Close();
         }
         if(this.mBoard != null)
         {
            this.mBoard.KillUpsell();
            this.Close();
         }
         this.Close();
      }
      
      public function handleUpsell(e:MouseEvent) : void
      {
         var url:URLRequest = new URLRequest(this.mApp.mUpsellURL);
         "_blank";
         url;
         ;
         if(this.mApp.mAdAPI._isEnabled)
         {
            this.mApp.mAdAPI.CustomEvent(null);
         }
      }
      
      public function makeCloseText(state:int, text:String) : TextField
      {
         var aFormat:TextFormat = new TextFormat();
         aFormat.font = "TimeUpText";
         aFormat.align = TextFormatAlign.CENTER;
         aFormat.color = 16777215;
         aFormat.size = 16;
         aFormat.underline = true;
         var aGlow:GlowFilter = new GlowFilter(10790052,1,2,2,1,1);
         var tf:TextField = new TextField();
         tf.embedFonts = true;
         tf.defaultTextFormat = aFormat;
         tf.filters = [aGlow];
         tf.width = 150;
         tf.height = 20;
         tf.x = 0;
         tf.y = 0;
         tf.alpha = 1;
         tf.selectable = false;
         tf.multiline = false;
         tf.wordWrap = false;
         tf.text = text;
         return tf;
      }
      
      public function Close() : void
      {
         if(this.mBackground.parent != null)
         {
            this.mBackground.parent.removeChild(this.mBackground);
         }
         if(this.mUpsellButton.parent != null)
         {
            this.mUpsellButton.parent.removeChild(this.mUpsellButton);
         }
         if(this.mCloseButton.parent != null)
         {
            this.mCloseButton.parent.removeChild(this.mCloseButton);
         }
      }
   }
}
