package com.popcap.flash.games.zuma2.logic
{
   import flash.geom.Point;
   
   public class WayPointMgr
   {
       
      
      public var mDoorX:int;
      
      public var mWayPoints:Vector.<WayPoint>;
      
      public var v1:SexyVector3;
      
      public var mApp:Zuma2App;
      
      public var v3:SexyVector3;
      
      public var mDoorY:int;
      
      public function WayPointMgr(app:Zuma2App)
      {
         this.mWayPoints = new Vector.<WayPoint>();
         this.v3 = new SexyVector3(0,0,0);
         this.v1 = new SexyVector3(1,0,0);
         super();
         this.mApp = app;
      }
      
      public function GetPriority(thePoint:int) : int
      {
         if(thePoint < 0 || thePoint >= int(this.mWayPoints.length))
         {
            return 0;
         }
         return this.mWayPoints[thePoint].mPriority;
      }
      
      public function SetWayPoint(theBall:Ball, thePoint:Number, loop_at_end:Boolean) : void
      {
         var aNextPoint:int = 0;
         var aMix:Number = NaN;
         if(this.mWayPoints.length == 0)
         {
            return;
         }
         var aPoint:int = int(thePoint);
         if(aPoint < 0)
         {
            aPoint = 0;
            aNextPoint = 1;
         }
         else if(aPoint >= int(this.mWayPoints.length))
         {
            if(!loop_at_end)
            {
               aPoint = int(this.mWayPoints.length - 1);
               aNextPoint = aPoint + 1;
            }
            else
            {
               aPoint = int(thePoint) % int(this.mWayPoints.length);
               aNextPoint = int(thePoint + 1) % int(this.mWayPoints.length);
            }
         }
         else
         {
            aNextPoint = aPoint + 1;
         }
         var p1:WayPoint = this.mWayPoints[aPoint];
         var p2:WayPoint = p1;
         if(aNextPoint < int(this.mWayPoints.length))
         {
            p2 = this.mWayPoints[aNextPoint];
         }
         var ox:Number = theBall.GetX();
         var oy:Number = theBall.GetY();
         if(Math.abs(p2.x - p1.x) > 5 || Math.abs(p2.y - p1.y) > 5)
         {
            theBall.SetPos(p1.x,p1.y);
         }
         else
         {
            aMix = thePoint - int(thePoint);
            theBall.SetPos(aMix * (p2.x - p1.x) + p1.x,aMix * (p2.y - p1.y) + p1.y);
         }
         var immediate:* = Math.abs(theBall.GetX() - ox) + Math.abs(theBall.GetY() - oy) > 10;
         this.CalcAvgRotationForPoint(aPoint);
         theBall.SetRotation(p1.mAvgRotation,immediate);
         theBall.SetWayPoint(thePoint,p1.mInTunnel);
         theBall.SetPriority(p1.mPriority);
      }
      
      public function LoadCurve(path:String, desc:CurveDesc) : void
      {
         var x:Number = NaN;
         var y:Number = NaN;
         var aWayPoint:WayPoint = null;
         this.v3 = new SexyVector3(0,0,0);
         this.v1 = new SexyVector3(1,0,0);
         this.mWayPoints = new Vector.<WayPoint>();
         var aData:CurveData = new CurveData(this.mApp);
         aData.Load(path);
         desc.GetValuesFrom(aData);
         var aList:Vector.<PathPoint> = aData.mPointList;
         var foundDoorPos:Boolean = false;
         var in_starting_tunnel:Boolean = aList[0];
         var end_of_tunnel_entry:int = 15;
         for(var i:int = 0; i < aList.length; i++)
         {
            x = aList[i].x;
            y = aList[i].x;
            if(!foundDoorPos && x >= 0 && y >= 0 && x <= 540 && y <= 405)
            {
               this.mDoorX = x;
               this.mDoorY = y;
               foundDoorPos = true;
            }
            aWayPoint = new WayPoint(aList[i].x,aList[i].y);
            aWayPoint.mInTunnel = aList[i].mInTunnel;
            aWayPoint.mPriority = aList[i].mPriority;
            this.mWayPoints.push(aWayPoint);
            if(in_starting_tunnel && aList[i].mInTunnel)
            {
               end_of_tunnel_entry = this.mWayPoints.length;
            }
            else
            {
               in_starting_tunnel = false;
            }
         }
         desc.mCutoffPoint = end_of_tunnel_entry - 18;
      }
      
      public function Delete() : void
      {
         this.mWayPoints = null;
         this.v1 = null;
         this.v3 = null;
      }
      
      public function InTunnel2(theBall:Ball, inFront:Boolean) : Boolean
      {
         var aWayPoint:int = theBall.GetWayPoint();
         if(inFront)
         {
            aWayPoint = aWayPoint + theBall.GetRadius();
         }
         else
         {
            aWayPoint = aWayPoint - theBall.GetRadius();
         }
         if(this.InTunnel(aWayPoint))
         {
            return true;
         }
         return false;
      }
      
      public function InTunnel(theWayPoint:int) : Boolean
      {
         if(theWayPoint < 0)
         {
            return true;
         }
         if(theWayPoint >= this.mWayPoints.length)
         {
            return false;
         }
         return this.mWayPoints[theWayPoint].mInTunnel;
      }
      
      public function CheckDiscontinuity(thePoint:int, theDist:int) : Boolean
      {
         var p2:WayPoint = null;
         var dist:Number = NaN;
         var aStartPoint:int = thePoint;
         var anEndPoint:int = thePoint + theDist;
         if(aStartPoint < 0)
         {
            aStartPoint = 0;
         }
         if(aStartPoint > this.mWayPoints.length)
         {
            aStartPoint = this.mWayPoints.length;
         }
         if(anEndPoint < 0)
         {
            anEndPoint = 0;
         }
         if(anEndPoint > this.mWayPoints.length)
         {
            anEndPoint = this.mWayPoints.length;
         }
         if(aStartPoint >= anEndPoint)
         {
            return false;
         }
         for(var p1:WayPoint = this.mWayPoints[aStartPoint++]; aStartPoint < anEndPoint; )
         {
            p2 = this.mWayPoints[aStartPoint];
            dist = Math.abs(p1.x - p2.x) + Math.abs(p1.y - p2.y);
            if(dist > 10)
            {
               return true;
            }
            p1 = p2;
            aStartPoint++;
         }
         return false;
      }
      
      public function GetEndPoint() : int
      {
         return int(this.mWayPoints.length - 1);
      }
      
      public function GetCanonicalAngle(r:Number) : Number
      {
         if(r > 0)
         {
            while(r > Zuma2App.MY_PI)
            {
               r = r - 2 * Zuma2App.MY_PI;
            }
         }
         else if(r < 0)
         {
            while(r < -Zuma2App.MY_PI)
            {
               r = r + 2 * Zuma2App.MY_PI;
            }
         }
         return r;
      }
      
      public function CalcPerpendicularForPoint(theWayPoint:int) : void
      {
         var p1:WayPoint = this.mWayPoints[theWayPoint];
         if(p1.mHavePerpendicular)
         {
            return;
         }
         var p2:WayPoint = p1;
         var opp:Boolean = false;
         if(theWayPoint + 1 < int(this.mWayPoints.length))
         {
            p2 = this.mWayPoints[theWayPoint + 1];
            if(Math.abs(p1.x - p2.x) > 5 || Math.abs(p1.y - p2.y) > 5 && theWayPoint > 0)
            {
               opp = true;
               p2 = this.mWayPoints[theWayPoint - 1];
            }
         }
         else
         {
            p2 = this.mWayPoints[theWayPoint - 1];
            if((Math.abs(p1.x - p2.x) > 5 || Math.abs(p1.y - p2.y) > 5) && theWayPoint + 1 < int(this.mWayPoints.length))
            {
               p2 = this.mWayPoints[theWayPoint + 1];
            }
            else
            {
               opp = true;
            }
         }
         if(opp)
         {
            this.v3.x = p1.y - p2.y;
            this.v3.y = p2.x - p1.x;
            this.v3.z = 0;
            this.v3 = this.v3.Normalize();
            p1.mPerpendicular = this.v3;
         }
         else
         {
            this.v3.x = p2.y - p1.y;
            this.v3.y = p1.x - p2.x;
            this.v3.z = 0;
            this.v3 = this.v3.Normalize();
            p1.mPerpendicular = this.v3;
         }
         p1.mRotation = Math.acos(p1.mPerpendicular.Dot(this.v1));
         if(p1.mPerpendicular.y > 0)
         {
            p1.mRotation = p1.mRotation * -1;
         }
         if(p1.mRotation < 0)
         {
            p1.mRotation = p1.mRotation + 2 * Zuma2App.MY_PI;
         }
         p1.mHavePerpendicular = true;
      }
      
      public function CalcAvgRotationForPoint(theWayPoint:int) : void
      {
         var i:int = 0;
         var w1:WayPoint = null;
         var w2:WayPoint = null;
         var mix:Number = NaN;
         var p1:WayPoint = this.mWayPoints[theWayPoint];
         if(p1.mHaveAvgRotation)
         {
            return;
         }
         this.CalcPerpendicularForPoint(theWayPoint);
         p1.mHaveAvgRotation = true;
         p1.mAvgRotation = p1.mRotation;
         var first:int = theWayPoint - 10;
         var last:int = theWayPoint + 10;
         if(first < 0)
         {
            first = 0;
         }
         if(last >= int(this.mWayPoints.length))
         {
            last = int(this.mWayPoints.length) - 1;
         }
         var dr:Number = 0;
         this.CalcPerpendicularForPoint(first);
         for(i = first + 1; i < last; i++)
         {
            this.CalcPerpendicularForPoint(i);
            dr = this.GetCanonicalAngle(this.mWayPoints[i].mRotation - this.mWayPoints[i - 1].mRotation);
            if(dr > 0.1 || dr < -0.1)
            {
               w1 = this.mWayPoints[i];
               w2 = this.mWayPoints[i - 1];
               if(!(Math.abs(w1.x - w2.x) > 5 || Math.abs(w1.y - w2.y) > 5))
               {
                  mix = 1 - Number(i - first) / (last - first);
                  p1.mAvgRotation = this.mWayPoints[first].mRotation + mix * dr;
                  return;
               }
            }
         }
      }
      
      public function FindFreeWayPoint(theExistingBall:Ball, theNewBall:Ball, inFront:Boolean, loop_at_end:Boolean = false, thePad:int = 0) : void
      {
         var aWayPointMod:int = 0;
         var dw:int = !!inFront?1:-1;
         var aWayPoint:int = int(theExistingBall.GetWayPoint());
         if(inFront && theNewBall.GetWayPoint() > aWayPoint)
         {
            aWayPoint = int(theNewBall.GetWayPoint());
         }
         else if(!inFront && theNewBall.GetWayPoint() < aWayPoint)
         {
            aWayPoint = int(theNewBall.GetWayPoint());
         }
         var aPoint:WayPoint = null;
         while(aWayPoint >= 0 && (loop_at_end || aWayPoint < int(this.mWayPoints.length)))
         {
            aPoint = this.mWayPoints[aWayPoint % int(this.mWayPoints.length)];
            theNewBall.SetPos(aPoint.x,aPoint.y);
            if(!theExistingBall.CollidesWithPhysically(theNewBall,thePad))
            {
               break;
            }
            aWayPointMod = aWayPoint % int(this.mWayPoints.length);
            aWayPoint = aWayPoint + dw;
            if(loop_at_end && aWayPointMod + dw < 0)
            {
               aWayPoint = aWayPoint - dw;
               break;
            }
         }
         this.SetWayPointInt(theNewBall,aWayPoint,loop_at_end);
      }
      
      public function GetPointPos(thePoint:Number) : Point
      {
         var aPoint:int = int(thePoint);
         if(aPoint < 0)
         {
            aPoint = 0;
         }
         else if(aPoint >= int(this.mWayPoints.length))
         {
            aPoint = int(this.mWayPoints.length) - 1;
         }
         var p1:WayPoint = this.mWayPoints[aPoint];
         return new Point(p1.x,p1.y);
      }
      
      public function SetWayPointInt(theBall:Ball, thePoint:int, loop_at_end:Boolean) : void
      {
         if(this.mWayPoints.length == 0)
         {
            return;
         }
         var aPoint:int = thePoint;
         if(aPoint < 0)
         {
            aPoint = 0;
         }
         else if(aPoint >= int(this.mWayPoints.length))
         {
            if(loop_at_end)
            {
               aPoint = int(thePoint) % int(this.mWayPoints.length);
            }
            else
            {
               aPoint = int(this.mWayPoints.length) - 1;
            }
         }
         var p1:WayPoint = this.mWayPoints[aPoint];
         this.CalcAvgRotationForPoint(aPoint);
         theBall.SetPos(p1.x,p1.y);
         theBall.SetWayPoint(thePoint,p1.mInTunnel);
         theBall.SetRotation(p1.mAvgRotation,false);
      }
      
      public function GetNumPoints() : int
      {
         return this.mWayPoints.length;
      }
      
      public function CalcPerpendicular(theWayPoint:Number) : SexyVector3
      {
         var aPoint:int = int(theWayPoint);
         if(aPoint < 0)
         {
            aPoint = 0;
         }
         if(aPoint >= int(this.mWayPoints.length))
         {
            aPoint = int(this.mWayPoints.length - 1);
         }
         var p1:WayPoint = this.mWayPoints[aPoint];
         this.CalcPerpendicularForPoint(aPoint);
         return p1.mPerpendicular;
      }
      
      public function GetRotationForPoint(theWayPoint:int) : Number
      {
         if(theWayPoint < 0)
         {
            theWayPoint = 0;
         }
         if(theWayPoint >= this.mWayPoints.length - 1)
         {
            theWayPoint = this.mWayPoints.length - 1;
         }
         var p1:WayPoint = this.mWayPoints[theWayPoint];
         this.CalcPerpendicularForPoint(theWayPoint);
         return p1.mRotation;
      }
   }
}
