package com.popcap.flash.framework.utils
{
   public class StringUtils
   {
       
      
      public function StringUtils()
      {
         super();
      }
      
      public static function InsertNumberCommas(value:int) : String
      {
         var str:String = "";
         var front:String = value.toString();
         while(front.length > 3)
         {
            str = "," + front.substr(front.length - 3,front.length) + str;
            front = front.substr(0,front.length - 3);
         }
         str = front + str;
         return str;
      }
   }
}
