package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.Canvas;
   
   public class HoleMgr
   {
      
      public static const HOLE_SIZE:int = 0;
       
      
      public var mApp:Zuma2App;
      
      public var mHoles:Array;
      
      public var mNumHoles:int;
      
      public var v1:SexyVector3;
      
      public var mPctOpen:Number;
      
      public function HoleMgr(app:Zuma2App)
      {
         this.v1 = new SexyVector3(0,0,0);
         super();
         this.mApp = app;
         this.mNumHoles = 0;
         this.mPctOpen = 0;
         this.mHoles = new Array();
      }
      
      public function Draw(canvas:Canvas) : void
      {
         for(var i:int = 0; i < this.mNumHoles; i++)
         {
            if(this.mHoles[i].mVisible)
            {
               this.mHoles[i].Draw(canvas);
            }
         }
      }
      
      public function PlaceHole(curve_num:int, x:int, y:int, rot:Number, visible:Boolean = true) : int
      {
         var v3:SexyVector3 = new SexyVector3(x,y,rot);
         this.SetupHole(v3);
         var h:Hole = new Hole(this.mApp);
         h.mX = v3.x;
         h.mY = v3.y;
         h.mFrame = 0;
         h.mRotation = v3.z;
         h.mPercentOpen = 0;
         h.mVisible = visible;
         h.mCurve = null;
         h.mCurveNum = curve_num;
         h.SetPos();
         this.mHoles[this.mNumHoles] = h;
         this.mNumHoles++;
         return this.mNumHoles - 1;
      }
      
      public function Update() : void
      {
         var h:Hole = null;
         var j:int = 0;
         var shared_h:Hole = null;
         for(var i:int = 0; i < this.mNumHoles; i++)
         {
            h = this.mHoles[i];
            for(j = 0; j < h.mShared.length; j++)
            {
               shared_h = this.mHoles[h.mShared[j]];
               if(h.GetPctOpen() > shared_h.GetPctOpen())
               {
                  shared_h.SetPctOpen(h.GetPctOpen());
               }
            }
            h.Update();
         }
      }
      
      public function Delete() : void
      {
         for(var i:int = 0; i < this.mHoles.length; i++)
         {
            this.mHoles[i].Delete();
            this.mHoles[i] = null;
         }
      }
      
      public function SetPctOpen(curve_num:int, pct_open:Number) : void
      {
         if(pct_open != this.mPctOpen)
         {
            this.mPctOpen = pct_open;
         }
         for(var i:int = 0; i < this.mHoles.length; i++)
         {
            this.mHoles[i].SetPctOpen(this.mPctOpen);
         }
         this.mHoles[curve_num].SetPctOpen(pct_open);
      }
      
      public function UpdateHoleInfo(hole_index:int, x:int, y:int, rot:Number, visible:Boolean = true) : void
      {
         var h:Hole = this.mHoles[hole_index];
         this.v1.x = 0;
         this.v1.y = 0;
         this.v1.z = 0;
         this.SetupHole(this.v1);
         h.mX = this.v1.x;
         h.mY = this.v1.y;
         h.mRotation = this.v1.z;
         h.mVisible = visible;
      }
      
      public function SetupHole(v3:SexyVector3) : void
      {
         v3.x = v3.x - HOLE_SIZE / 2;
         v3.y = v3.y - HOLE_SIZE / 2;
         while(v3.z < 0)
         {
            v3.z = v3.z + 2 * Zuma2App.MY_PI;
         }
         while(v3.z > 2 * Zuma2App.MY_PI)
         {
            v3.z = v3.z - 2 * Zuma2App.MY_PI;
         }
         if(Math.abs(v3.z) < 0.2)
         {
            v3.z = 0;
         }
         else if(Math.abs(v3.z - Zuma2App.MY_PI / 2) < 0.2)
         {
            v3.z = Zuma2App.MY_PI / 2;
         }
         else if(Math.abs(v3.z - Zuma2App.MY_PI) < 0.2)
         {
            v3.z = Zuma2App.MY_PI;
         }
         else if(Math.abs(v3.z - 3 * Zuma2App.MY_PI / 2) < 0.2)
         {
            v3.z = 3 * Zuma2App.MY_PI / 2;
         }
         else if(Math.abs(v3.z - 2 * Zuma2App.MY_PI) < 0.2)
         {
            v3.z = 0;
         }
      }
      
      public function DrawRings(canvas:Canvas) : void
      {
      }
   }
}
