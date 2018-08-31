package com.popcap.flash.games.zuma2.logic
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class Zuma2Strings
   {
       
      
      private const strings:Class = Zuma2Strings_strings;
      
      public var mStrings:Dictionary;
      
      public var mStringFile:String;
      
      public function Zuma2Strings()
      {
         super();
         var aByteArray:ByteArray = ByteArray(new this.strings());
         this.mStringFile = aByteArray.readUTFBytes(aByteArray.length);
         this.mStrings = new Dictionary();
         this.init();
      }
      
      public function init() : void
      {
         var aLine:String = null;
         var index:Number = NaN;
         var aTextFile:String = this.mStringFile;
         aTextFile = aTextFile.replace(/\r\n/g,"\n");
         aTextFile = aTextFile.replace(/\r/g,"\n");
         var aLines:Array = aTextFile.split(/\n/);
         var aCurrentKey:String = null;
         var aCurrentValue:String = null;
         var aNumLines:int = aLines.length;
         for(var i:int = 0; i < aNumLines; i++)
         {
            aLine = aLines[i];
            if(aLine.length != 0)
            {
               index = aLine.search(/\[[A-Z0-9_]+\]/);
               if(index == 0)
               {
                  if(aCurrentKey == null)
                  {
                     aCurrentKey = aLine;
                  }
                  else
                  {
                     this.mStrings[aCurrentKey] = aCurrentValue;
                     aCurrentKey = aLine;
                     aCurrentValue = null;
                  }
               }
               else if(aCurrentValue == null)
               {
                  aCurrentValue = aLine;
               }
               else
               {
                  aCurrentValue = aCurrentValue + "\n" + aLine;
               }
            }
         }
         this.mStrings[aCurrentKey] = aCurrentValue;
      }
      
      public function translateString(key:String) : String
      {
         var aValue:String = this.mStrings[key];
         if(aValue == null)
         {
            return "\'" + key + "\' string has not been loaded.";
         }
         return aValue;
      }
   }
}
