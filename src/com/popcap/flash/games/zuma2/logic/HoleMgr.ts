module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class HoleMgr extends egret.HashObject {
							public static HOLE_SIZE:number;
							public mApp:Zuma2App;
							public mHoles:Array<any>;
							public mNumHoles:number = 0;
							public v1:com.popcap.flash.games.zuma2.logic.SexyVector3;
							public mPctOpen:number = NaN;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.v1 = new com.popcap.flash.games.zuma2.logic.SexyVector3(0,0,0);
								this.mApp = app;
								this.mNumHoles = flash.checkInt(0);
								this.mPctOpen = 0;
								this.mHoles = new Array();
							}

							public Draw(canvas:com.popcap.flash.framework.Canvas)
							{
								for(var i:number = flash.checkInt(0);i < this.mNumHoles; i++)
								{
									if(this.mHoles[i].mVisible)
									{
										this.mHoles[i].Draw(canvas);
									}
								}
							}

							public PlaceHole(curve_num:number,x:number,y:number,rot:number,visible:boolean = true):number
							{
								var v3:com.popcap.flash.games.zuma2.logic.SexyVector3 = new com.popcap.flash.games.zuma2.logic.SexyVector3(x,y,rot);
								this.SetupHole(v3);
								var h:com.popcap.flash.games.zuma2.logic.Hole = new com.popcap.flash.games.zuma2.logic.Hole(this.mApp);
								h.mX = flash.checkInt(v3.x);
								h.mY = flash.checkInt(v3.y);
								h.mFrame = flash.checkInt(0);
								h.mRotation = v3.z;
								h.mPercentOpen = 0;
								h.mVisible = visible;
								h.mCurve = null;
								h.mCurveNum = flash.checkInt(curve_num);
								h.SetPos();
								this.mHoles[this.mNumHoles] = h;
								this.mNumHoles++;
								return this.mNumHoles - 1;
							}

							public Update()
							{
								var h:com.popcap.flash.games.zuma2.logic.Hole = <any>null;
								var j:number = flash.checkInt(0);
								var shared_h:com.popcap.flash.games.zuma2.logic.Hole = <any>null;
								for(var i:number = flash.checkInt(0);i < this.mNumHoles; i++)
								{
									h = this.mHoles[i];
									for(j = flash.checkInt(0); j < h.mShared.length; j++)
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

							public Delete()
							{
								for(var i:number = flash.checkInt(0);i < this.mHoles.length; i++)
								{
									this.mHoles[i].Delete();
									this.mHoles[i] = null;
								}
							}

							public SetPctOpen(curve_num:number,pct_open:number)
							{
								curve_num = flash.checkInt(curve_num);
								if(pct_open != this.mPctOpen)
								{
									this.mPctOpen = pct_open;
								}
								for(var i:number = flash.checkInt(0);i < this.mHoles.length; i++)
								{
									this.mHoles[i].SetPctOpen(this.mPctOpen);
								}
								this.mHoles[curve_num].SetPctOpen(pct_open);
							}

							public UpdateHoleInfo(hole_index:number,x:number,y:number,rot:number,visible:boolean = true)
							{
								var h:com.popcap.flash.games.zuma2.logic.Hole = <any>this.mHoles[hole_index];
								this.v1.x = 0;
								this.v1.y = 0;
								this.v1.z = 0;
								this.SetupHole(this.v1);
								h.mX = flash.checkInt(this.v1.x);
								h.mY = flash.checkInt(this.v1.y);
								h.mRotation = this.v1.z;
								h.mVisible = visible;
							}

							public SetupHole(v3:com.popcap.flash.games.zuma2.logic.SexyVector3)
							{
								v3.x = v3.x - com.popcap.flash.games.zuma2.logic.HoleMgr.HOLE_SIZE / 2;
								v3.y = v3.y - com.popcap.flash.games.zuma2.logic.HoleMgr.HOLE_SIZE / 2;
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

							public DrawRings(canvas:com.popcap.flash.framework.Canvas)
							{
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.HoleMgr.HOLE_SIZE = 0;
