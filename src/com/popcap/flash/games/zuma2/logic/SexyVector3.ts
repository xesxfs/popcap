module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class SexyVector3 extends egret.HashObject {
							public x:number = NaN;
							public y:number = NaN;
							public z:number = NaN;

							public constructor(theX:number,theY:number,theZ:number)
							{
								super();
								super();
								this.x = theX;
								this.y = theY;
								this.z = theZ;
							}

							public Cross(v:com.popcap.flash.games.zuma2.logic.SexyVector3):com.popcap.flash.games.zuma2.logic.SexyVector3
							{
								return new com.popcap.flash.games.zuma2.logic.SexyVector3(this.y * v.z - this.z * v.y,this.z * v.x - this.x * v.z,this.x * v.y - this.y * v.x);
							}

							public Add(v:com.popcap.flash.games.zuma2.logic.SexyVector3):com.popcap.flash.games.zuma2.logic.SexyVector3
							{
								return new com.popcap.flash.games.zuma2.logic.SexyVector3(this.x + v.x,this.y + v.y,this.z + v.z);
							}

							public Sub(v:com.popcap.flash.games.zuma2.logic.SexyVector3):com.popcap.flash.games.zuma2.logic.SexyVector3
							{
								return new com.popcap.flash.games.zuma2.logic.SexyVector3(this.x - v.x,this.y - v.y,this.z - v.z);
							}

							public Dot(v:com.popcap.flash.games.zuma2.logic.SexyVector3):number
							{
								return this.x * v.x + this.y * v.y + this.z * v.z;
							}

							public Normalize():com.popcap.flash.games.zuma2.logic.SexyVector3
							{
								var aMag:number = this.Magnitude();
								return aMag != 0?this.Div(aMag):this;
							}

							public Div(t:number):com.popcap.flash.games.zuma2.logic.SexyVector3
							{
								return new com.popcap.flash.games.zuma2.logic.SexyVector3(this.x / t,this.y / t,this.z / t);
							}

							public Mult(t:number):com.popcap.flash.games.zuma2.logic.SexyVector3
							{
								return new com.popcap.flash.games.zuma2.logic.SexyVector3(t * this.x,t * this.y,t * this.z);
							}

							public Magnitude():number
							{
								return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
							}

						}
					}
				}
			}
		}
	}
}

