package com.popcap.flash.framework.impl
{
   import com.popcap.flash.framework.IAppPlugin;
   import com.popcap.flash.framework.IAppService;
   
   public class BaseAppService implements IAppService
   {
       
      
      private var mProperties:XML;
      
      private var mPlugin:BaseAppPlugin;
      
      private var mImpl:Object;
      
      public function BaseAppService(impl:Object, props:XML, plugin:BaseAppPlugin)
      {
         super();
         this.mImpl = impl;
         this.mProperties = props;
         this.mPlugin = plugin;
      }
      
      public function getProperties() : XML
      {
         return this.mProperties;
      }
      
      public function getImplementation() : Object
      {
         return this.mImpl;
      }
      
      public function getPlugin() : IAppPlugin
      {
         return this.mPlugin;
      }
   }
}
