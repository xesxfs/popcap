package com.popcap.flash.framework
{
   import com.popcap.flash.framework.impl.BaseAppPlugin;
   import com.popcap.flash.framework.impl.BaseAppService;
   import com.popcap.flash.framework.input.keyboard.KeyCode;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class BaseApp extends Sprite implements IApp
   {
      
      private static const SHIFT_FLAG:int = 4;
      
      private static const ALT_FLAG:int = 2;
      
      public static const MILLIS_PER_UPDATE:int = 10;
      
      private static const CONTROL_FLAG:int = 1;
       
      
      private var _FPS:Number = 1000.0;
      
      private var _state:IAppState = null;
      
      private var _fixedUpdates:Array;
      
      private var _commandBindings:Dictionary;
      
      private var _mouseDownPos:Point;
      
      private var _paused:Boolean = false;
      
      private var _dataXML:XML = null;
      
      private var _updateBuffer:int = 0;
      
      private var _mousePos:Point;
      
      private var _servicesMap:Dictionary;
      
      private var _plugins:Vector.<IAppPlugin>;
      
      private var _lastTime:int = 0;
      
      private var _commands:Dictionary;
      
      private var _mouseDown:Boolean = false;
      
      private var _dataCallback:Function = null;
      
      public function BaseApp()
      {
         this._mousePos = new Point();
         this._mouseDownPos = new Point();
         this._commands = new Dictionary();
         this._commandBindings = new Dictionary();
         this._fixedUpdates = [];
         super();
      }
      
      private function HandleFrame(e:Event) : void
      {
         var thisTime:int = getTimer();
         var elapsed:int = thisTime - this._lastTime;
         this._lastTime = thisTime;
         if(!this._paused)
         {
            this._updateBuffer = this._updateBuffer + elapsed;
            while(this._updateBuffer >= MILLIS_PER_UPDATE)
            {
               this.doFixedUpdate();
               this._updateBuffer = this._updateBuffer - MILLIS_PER_UPDATE;
            }
         }
         this.doVariableUpdate(elapsed);
      }
      
      private function HandleMouseDown(e:MouseEvent) : void
      {
         this._mousePos.x = e.stageX;
         this._mousePos.y = e.stageY;
         this._mouseDown = true;
         this._mouseDownPos.x = e.stageX;
         this._mouseDownPos.y = e.stageY;
         if(this._state != null)
         {
            this._state.onMouseDown(e.stageX,e.stageY);
         }
      }
      
      public function RegisterCommand(command:String, callback:Function) : void
      {
         this._commands[command] = callback;
      }
      
      public function GetProperties() : XML
      {
         return this._dataXML;
      }
      
      private function HandleDataSuccess(e:Event) : void
      {
         var properties:XML = null;
         var plugin:BaseAppPlugin = null;
         var bind:XML = null;
         var command:String = null;
         var keyCombo:String = null;
         var loader:URLLoader = e.target as URLLoader;
         loader.removeEventListener(Event.COMPLETE,this.HandleDataSuccess);
         var xml:XML = new XML(e.target.data);
         this._dataXML = xml;
         var len:int = xml.plugins.plugin.length();
         for(var i:int = 0; i < len; i++)
         {
            properties = xml.plugins.plugin[i];
            plugin = new BaseAppPlugin(this,properties);
         }
         var numBindings:int = xml.commands.bind.length();
         for(i = 0; i < numBindings; i++)
         {
            bind = xml.commands.bind[i];
            command = bind.toString();
            keyCombo = bind.@keyCombo;
            this.BindCommand(command,keyCombo);
         }
         if(this._dataCallback != null)
         {
            this._dataCallback(true);
         }
      }
      
      public function registerService(plugin:BaseAppPlugin, ids:Vector.<String>, impl:Object, properties:XML) : IAppService
      {
         var id:String = null;
         var list:Vector.<BaseAppService> = null;
         var service:BaseAppService = new BaseAppService(impl,properties,plugin);
         for each(id in ids)
         {
            list = this._servicesMap[id];
            if(list == null)
            {
               list = new Vector.<BaseAppService>();
               this._servicesMap[id] = list;
            }
            list.push(service);
         }
         return service;
      }
      
      private function HandleDataFailure(e:IOErrorEvent) : void
      {
         var loader:URLLoader = e.target as URLLoader;
         loader.removeEventListener(Event.COMPLETE,this.HandleDataSuccess);
         if(this._dataCallback != null)
         {
            this._dataCallback(false);
         }
      }
      
      public function Stop() : void
      {
         this._state = null;
      }
      
      public function SetVersionDisplay(versionString:String) : void
      {
         var menu:ContextMenu = new ContextMenu();
         menu.hideBuiltInItems();
         var versionItem:ContextMenuItem = new ContextMenuItem(versionString);
         menu.customItems.push(versionItem);
         contextMenu = menu;
      }
      
      public function BindCommand(command:String, keyCombo:String) : void
      {
         var piece:String = null;
         var matcher:String = null;
         var code:int = KeyCode.GetCodeFromString(keyCombo);
         if(code > 0)
         {
            this._commandBindings[code << 3] = command;
            return;
         }
         var pieces:Array = keyCombo.split("+");
         var modifiers:* = 0;
         for each(piece in pieces)
         {
            matcher = piece.toUpperCase();
            if(matcher == "CONTROL")
            {
               modifiers = modifiers | CONTROL_FLAG;
            }
            else if(matcher == "ALT")
            {
               modifiers = modifiers | ALT_FLAG;
            }
            else if(matcher == "SHIFT")
            {
               modifiers = modifiers | SHIFT_FLAG;
            }
            else
            {
               code = KeyCode.GetCodeFromString(matcher);
               if(code == 0)
               {
                  return;
               }
            }
         }
         this._commandBindings[code << 3 | modifiers] = command;
      }
      
      private function HandleMouseUp(e:MouseEvent) : void
      {
         this._mouseDown = false;
         if(this._state != null)
         {
            this._state.onMouseUp(e.stageX,e.stageY);
         }
      }
      
      private function HandleKeyDown(e:KeyboardEvent) : void
      {
         var code:* = 0;
         var key:String = null;
         var command:Function = null;
         var props:XML = this.GetProperties();
         var commandsEnabled:Boolean = props != null && AppUtils.asBoolean(props.commands.enabled);
         if(commandsEnabled)
         {
            code = e.keyCode << 3;
            if(e.ctrlKey)
            {
               code = code | CONTROL_FLAG;
            }
            if(e.altKey)
            {
               code = code | ALT_FLAG;
            }
            if(e.shiftKey)
            {
               code = code | SHIFT_FLAG;
            }
            key = this._commandBindings[code];
            if(key != null)
            {
               command = this._commands[key];
               if(command != null)
               {
                  command();
               }
            }
         }
         if(this._state != null)
         {
            this._state.onKeyDown(e.keyCode);
         }
      }
      
      private function ResumeUpdates(args:Array = null) : void
      {
         this._paused = false;
      }
      
      private function StepUpdates(args:Array = null) : void
      {
         this._paused = true;
         this.doFixedUpdate();
      }
      
      private function HandleMouseMove(e:MouseEvent) : void
      {
         this._mousePos.x = e.stageX;
         this._mousePos.y = e.stageY;
         if(this._state != null)
         {
            this._state.onMouseMove(e.stageX,e.stageY);
         }
      }
      
      public function getStage() : Stage
      {
         return stage;
      }
      
      public function Start(state:IAppState) : void
      {
         this._state = state;
         if(this._state == null)
         {
            return;
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this.HandleMouseUp);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.HandleMouseDown);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.HandleMouseMove);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.HandleKeyUp);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.HandleKeyDown);
         this._state.onEnter();
         this._lastTime = getTimer();
         stage.addEventListener(Event.ENTER_FRAME,this.HandleFrame);
      }
      
      private function doVariableUpdate(elapsed:int) : void
      {
         if(this._state != null)
         {
            this._state.draw(elapsed);
         }
      }
      
      private function doFixedUpdate() : void
      {
         var handler:Function = null;
         if(this._state != null)
         {
            this._state.update();
         }
         var numHandlers:int = this._fixedUpdates.length;
         for(var i:int = 0; i < numHandlers; i++)
         {
            handler = this._fixedUpdates[i];
            handler();
         }
      }
      
      public function getServices(id:String) : Vector.<IAppService>
      {
         var list:Vector.<IAppService> = this._servicesMap[id];
         if(list == null)
         {
            list = new Vector.<BaseAppService>();
            this._servicesMap[id] = list;
         }
         return list;
      }
      
      public function OnFixedUpdate(handler:Function) : void
      {
         this._fixedUpdates.push(handler);
      }
      
      public function get fps() : Number
      {
         return this._FPS;
      }
      
      public function getPlugins() : Vector.<IAppPlugin>
      {
         return this._plugins;
      }
      
      public function LoadData(pathPrefix:String, callback:Function = null) : void
      {
         this._servicesMap = new Dictionary(false);
         this._plugins = new Vector.<IAppPlugin>();
         this._dataCallback = callback;
         this.RegisterCommand("StepUpdates",this.StepUpdates);
         this.RegisterCommand("ResumeUpdates",this.ResumeUpdates);
         var loader:URLLoader = new URLLoader();
         var dataURL:URLRequest = new URLRequest(pathPrefix + "data.xml");
         loader.addEventListener(Event.COMPLETE,this.HandleDataSuccess);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.HandleDataFailure);
         loader.load(dataURL);
      }
      
      public function isPaused() : Boolean
      {
         return this._paused;
      }
      
      private function HandleKeyUp(e:KeyboardEvent) : void
      {
         if(this._state != null)
         {
            this._state.onKeyUp(e.keyCode);
         }
      }
   }
}
