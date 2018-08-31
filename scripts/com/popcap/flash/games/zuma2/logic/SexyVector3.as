package com.popcap.flash.games.zuma2.logic
{
   public class SexyVector3
   {
       
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function SexyVector3(theX:Number, theY:Number, theZ:Number)
      {
         super();
         this.x = theX;
         this.y = theY;
         this.z = theZ;
      }
      
      public function Cross(v:SexyVector3) : SexyVector3
      {
         return new SexyVector3(this.y * v.z - this.z * v.y,this.z * v.x - this.x * v.z,this.x * v.y - this.y * v.x);
      }
      
      public function Add(v:SexyVector3) : SexyVector3
      {
         return new SexyVector3(this.x + v.x,this.y + v.y,this.z + v.z);
      }
      
      public function Sub(v:SexyVector3) : SexyVector3
      {
         return new SexyVector3(this.x - v.x,this.y - v.y,this.z - v.z);
      }
      
      public function Dot(v:SexyVector3) : Number
      {
         return this.x * v.x + this.y * v.y + this.z * v.z;
      }
      
      public function Normalize() : SexyVector3
      {
         var aMag:Number = this.Magnitude();
         return aMag != 0?this.Div(aMag):this;
      }
      
      public function Div(t:Number) : SexyVector3
      {
         return new SexyVector3(this.x / t,this.y / t,this.z / t);
      }
      
      public function Mult(t:Number) : SexyVector3
      {
         return new SexyVector3(t * this.x,t * this.y,t * this.z);
      }
      
      public function Magnitude() : Number
      {
         return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
      }
   }
}
