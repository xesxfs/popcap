package com.popcap.flash.games.zuma2.logic
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class Zuma2LevelData
   {
      
      public static const Level_5C:String = "level5c.dat";
      
      public static const Level_3D2:String = "level3d2.dat";
      
      public static const Level_3B2:String = "level3b2.dat";
      
      public static const Level_4B:String = "level4b.dat";
      
      public static const Level_2A:String = "level2a.dat";
      
      public static const Level_2B:String = "level2b.dat";
      
      public static const Level_2C:String = "level2c.dat";
      
      public static const Level_2D:String = "level2d.dat";
      
      public static const Level_4A:String = "level4a.dat";
      
      public static const Level_4C:String = "level4c.dat";
      
      public static const Level_3C2:String = "level3c2.dat";
      
      public static const Level_5B:String = "level5b.dat";
      
      public static const Level_3A:String = "level3a.dat";
      
      public static const Level_3B:String = "level3b.dat";
      
      public static const Level_1A:String = "level1a.dat";
      
      public static const Level_1B:String = "level1b.dat";
      
      public static const Level_1C:String = "level1c.dat";
      
      public static const Level_1D:String = "level1d.dat";
      
      public static const Level_3A2:String = "level3a2.dat";
      
      public static const Level_5D:String = "level5d.dat";
      
      public static const Level_3C:String = "level3c.dat";
      
      public static const Level_3D:String = "level3d.dat";
      
      public static const Level_5A:String = "level5a.dat";
      
      public static const Level_4D:String = "level4d.dat";
       
      
      private const Level_4B_Data:Class = Zuma2LevelData_Level_4B_Data;
      
      private const Level_2B_Data:Class = Zuma2LevelData_Level_2B_Data;
      
      private const Level_2C_Data:Class = Zuma2LevelData_Level_2C_Data;
      
      private const Level_1A_Data:Class = Zuma2LevelData_Level_1A_Data;
      
      private const Level_4C_Data:Class = Zuma2LevelData_Level_4C_Data;
      
      private const Level_3A_Data:Class = Zuma2LevelData_Level_3A_Data;
      
      private const Level_3C2_Data:Class = Zuma2LevelData_Level_3C2_Data;
      
      private const Level_3A2_Data:Class = Zuma2LevelData_Level_3A2_Data;
      
      private const Level_5A_Data:Class = Zuma2LevelData_Level_5A_Data;
      
      private const Level_2D_Data:Class = Zuma2LevelData_Level_2D_Data;
      
      private const Level_1B_Data:Class = Zuma2LevelData_Level_1B_Data;
      
      private const Level_3B_Data:Class = Zuma2LevelData_Level_3B_Data;
      
      private const Level_5B_Data:Class = Zuma2LevelData_Level_5B_Data;
      
      private const Level_4D_Data:Class = Zuma2LevelData_Level_4D_Data;
      
      private const Level_1C_Data:Class = Zuma2LevelData_Level_1C_Data;
      
      private const Level_3C_Data:Class = Zuma2LevelData_Level_3C_Data;
      
      private const Level_2A_Data:Class = Zuma2LevelData_Level_2A_Data;
      
      private const Level_5C_Data:Class = Zuma2LevelData_Level_5C_Data;
      
      private const Level_3B2_Data:Class = Zuma2LevelData_Level_3B2_Data;
      
      private const Level_3D2_Data:Class = Zuma2LevelData_Level_3D2_Data;
      
      private const Level_4A_Data:Class = Zuma2LevelData_Level_4A_Data;
      
      public var mLevels:Dictionary;
      
      private const Level_1D_Data:Class = Zuma2LevelData_Level_1D_Data;
      
      private const Level_3D_Data:Class = Zuma2LevelData_Level_3D_Data;
      
      private const Level_5D_Data:Class = Zuma2LevelData_Level_5D_Data;
      
      public function Zuma2LevelData()
      {
         super();
         this.mLevels = new Dictionary();
         this.init();
      }
      
      private function init() : void
      {
         this.mLevels[Level_1A] = new this.Level_1A_Data() as ByteArray;
         this.mLevels[Level_1B] = new this.Level_1B_Data() as ByteArray;
         this.mLevels[Level_1C] = new this.Level_1C_Data() as ByteArray;
         this.mLevels[Level_1D] = new this.Level_1D_Data() as ByteArray;
         this.mLevels[Level_2A] = new this.Level_2A_Data() as ByteArray;
         this.mLevels[Level_2B] = new this.Level_2B_Data() as ByteArray;
         this.mLevels[Level_2C] = new this.Level_2C_Data() as ByteArray;
         this.mLevels[Level_2D] = new this.Level_2D_Data() as ByteArray;
         this.mLevels[Level_3A] = new this.Level_3A_Data() as ByteArray;
         this.mLevels[Level_3B] = new this.Level_3B_Data() as ByteArray;
         this.mLevels[Level_3C] = new this.Level_3C_Data() as ByteArray;
         this.mLevels[Level_3D] = new this.Level_3D_Data() as ByteArray;
         this.mLevels[Level_3A2] = new this.Level_3A2_Data() as ByteArray;
         this.mLevels[Level_3B2] = new this.Level_3B2_Data() as ByteArray;
         this.mLevels[Level_3C2] = new this.Level_3C2_Data() as ByteArray;
         this.mLevels[Level_3D2] = new this.Level_3D2_Data() as ByteArray;
         this.mLevels[Level_4A] = new this.Level_4A_Data() as ByteArray;
         this.mLevels[Level_4B] = new this.Level_4B_Data() as ByteArray;
         this.mLevels[Level_4C] = new this.Level_4C_Data() as ByteArray;
         this.mLevels[Level_4D] = new this.Level_4D_Data() as ByteArray;
         this.mLevels[Level_5A] = new this.Level_5A_Data() as ByteArray;
         this.mLevels[Level_5B] = new this.Level_5B_Data() as ByteArray;
         this.mLevels[Level_5C] = new this.Level_5C_Data() as ByteArray;
         this.mLevels[Level_5D] = new this.Level_5D_Data() as ByteArray;
      }
   }
}
