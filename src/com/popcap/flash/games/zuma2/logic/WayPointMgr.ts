module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class WayPointMgr extends egret.HashObject {
							public mDoorX:number = 0;
							public mWayPoints:Array<com.popcap.flash.games.zuma2.logic.WayPoint>;
							public v1:com.popcap.flash.games.zuma2.logic.SexyVector3;
							public mApp:Zuma2App;
							public v3:com.popcap.flash.games.zuma2.logic.SexyVector3;
							public mDoorY:number = 0;

							public constructor(app:Zuma2App)
							{
								super();
								super();
								this.mWayPoints = new Array<com.popcap.flash.games.zuma2.logic.WayPoint>();
								this.v3 = new com.popcap.flash.games.zuma2.logic.SexyVector3(0,0,0);
								this.v1 = new com.popcap.flash.games.zuma2.logic.SexyVector3(1,0,0);
								this.mApp = app;
							}

							public GetPriority(thePoint:number):number
							{
								thePoint = flash.checkInt(thePoint);
								if(thePoint < 0 || thePoint >= flash.tranint(this.mWayPoints.length))
								{
									return 0;
								}
								return this.mWayPoints[thePoint].mPriority;
							}

							public SetWayPoint(theBall:com.popcap.flash.games.zuma2.logic.Ball,thePoint:number,loop_at_end:boolean)
							{
								var aNextPoint:number = flash.checkInt(0);
								var aMix:number = <any>NaN;
								if(this.mWayPoints.length == 0)
								{
									return ;
								}
								var aPoint:number = flash.checkInt(flash.tranint(thePoint));
								if(aPoint < 0)
								{
									aPoint = flash.checkInt(0);
									aNextPoint = flash.checkInt(1);
								}
								else if(aPoint >= flash.tranint(this.mWayPoints.length))
								{
									if(<any>!loop_at_end)
									{
										aPoint = flash.checkInt(flash.tranint(this.mWayPoints.length - 1));
										aNextPoint = flash.checkInt(aPoint + 1);
									}
									else
									{
										aPoint = flash.checkInt(flash.tranint(thePoint) % flash.tranint(this.mWayPoints.length));
										aNextPoint = flash.checkInt(flash.tranint(thePoint + 1) % flash.tranint(this.mWayPoints.length));
									}
								}
								else
								{
									aNextPoint = flash.checkInt(aPoint + 1);
								}
								var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[aPoint];
								var p2:com.popcap.flash.games.zuma2.logic.WayPoint = p1;
								if(aNextPoint < flash.tranint(this.mWayPoints.length))
								{
									p2 = this.mWayPoints[aNextPoint];
								}
								var ox:number = theBall.GetX();
								var oy:number = theBall.GetY();
								if(Math.abs(p2.x - p1.x) > 5 || Math.abs(p2.y - p1.y) > 5)
								{
									theBall.SetPos(p1.x,p1.y);
								}
								else
								{
									aMix = thePoint - flash.tranint(thePoint);
									theBall.SetPos(aMix * (p2.x - p1.x) + p1.x,aMix * (p2.y - p1.y) + p1.y);
								}
								var immediate:any = <any>Math.abs(theBall.GetX() - ox) + Math.abs(theBall.GetY() - oy) > 10;
								this.CalcAvgRotationForPoint(aPoint);
								theBall.SetRotation(p1.mAvgRotation,immediate);
								theBall.SetWayPoint(thePoint,p1.mInTunnel);
								theBall.SetPriority(p1.mPriority);
							}

							public LoadCurve(path:string,desc:com.popcap.flash.games.zuma2.logic.CurveDesc)
							{
								var x:number = <any>NaN;
								var y:number = <any>NaN;
								var aWayPoint:com.popcap.flash.games.zuma2.logic.WayPoint = <any>null;
								this.v3 = new com.popcap.flash.games.zuma2.logic.SexyVector3(0,0,0);
								this.v1 = new com.popcap.flash.games.zuma2.logic.SexyVector3(1,0,0);
								this.mWayPoints = new Array<com.popcap.flash.games.zuma2.logic.WayPoint>();
								var aData:com.popcap.flash.games.zuma2.logic.CurveData = new com.popcap.flash.games.zuma2.logic.CurveData(this.mApp);
								aData.Load(path);
								desc.GetValuesFrom(aData);
								var aList:Array<com.popcap.flash.games.zuma2.logic.PathPoint> = <any>aData.mPointList;
								var foundDoorPos:boolean = <any>false;
								var in_starting_tunnel:boolean = <any>aList[0];
								var end_of_tunnel_entry:number = flash.checkInt(15);
								for(var i:number = flash.checkInt(0);i < aList.length; i++)
								{
									x = aList[i].x;
									y = aList[i].x;
									if(<any>!foundDoorPos && x >= 0 && y >= 0 && x <= 540 && y <= 405)
									{
										this.mDoorX = flash.checkInt(x);
										this.mDoorY = flash.checkInt(y);
										foundDoorPos = true;
									}
									aWayPoint = new com.popcap.flash.games.zuma2.logic.WayPoint(aList[i].x,aList[i].y);
									aWayPoint.mInTunnel = aList[i].mInTunnel;
									aWayPoint.mPriority = flash.checkInt(aList[i].mPriority);
									this.mWayPoints.push(aWayPoint);
									if(in_starting_tunnel && aList[i].mInTunnel)
									{
										end_of_tunnel_entry = flash.checkInt(this.mWayPoints.length);
									}
									else
									{
										in_starting_tunnel = false;
									}
								}
								desc.mCutoffPoint = flash.checkInt(end_of_tunnel_entry - 18);
							}

							public Delete()
							{
								this.mWayPoints = null;
								this.v1 = null;
								this.v3 = null;
							}

							public InTunnel2(theBall:com.popcap.flash.games.zuma2.logic.Ball,inFront:boolean):boolean
							{
								var aWayPoint:number = flash.checkInt(theBall.GetWayPoint());
								if(inFront)
								{
									aWayPoint = flash.checkInt(aWayPoint + theBall.GetRadius());
								}
								else
								{
									aWayPoint = flash.checkInt(aWayPoint - theBall.GetRadius());
								}
								if(this.InTunnel(aWayPoint))
								{
									return true;
								}
								return false;
							}

							public InTunnel(theWayPoint:number):boolean
							{
								theWayPoint = flash.checkInt(theWayPoint);
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

							public CheckDiscontinuity(thePoint:number,theDist:number):boolean
							{
								thePoint = flash.checkInt(thePoint);
								theDist = flash.checkInt(theDist);
								var p2:com.popcap.flash.games.zuma2.logic.WayPoint = <any>null;
								var dist:number = <any>NaN;
								var aStartPoint:number = flash.checkInt(thePoint);
								var anEndPoint:number = flash.checkInt(thePoint + theDist);
								if(aStartPoint < 0)
								{
									aStartPoint = flash.checkInt(0);
								}
								if(aStartPoint > this.mWayPoints.length)
								{
									aStartPoint = flash.checkInt(this.mWayPoints.length);
								}
								if(anEndPoint < 0)
								{
									anEndPoint = flash.checkInt(0);
								}
								if(anEndPoint > this.mWayPoints.length)
								{
									anEndPoint = flash.checkInt(this.mWayPoints.length);
								}
								if(aStartPoint >= anEndPoint)
								{
									return false;
								}
								for(var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[aStartPoint++];aStartPoint < anEndPoint; )
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

							public GetEndPoint():number
							{
								return flash.tranint(this.mWayPoints.length - 1);
							}

							public GetCanonicalAngle(r:number):number
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

							public CalcPerpendicularForPoint(theWayPoint:number)
							{
								theWayPoint = flash.checkInt(theWayPoint);
								var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[theWayPoint];
								if(p1.mHavePerpendicular)
								{
									return ;
								}
								var p2:com.popcap.flash.games.zuma2.logic.WayPoint = p1;
								var opp:boolean = <any>false;
								if(theWayPoint + 1 < flash.tranint(this.mWayPoints.length))
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
									if((Math.abs(p1.x - p2.x) > 5 || Math.abs(p1.y - p2.y) > 5) && theWayPoint + 1 < flash.tranint(this.mWayPoints.length))
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

							public CalcAvgRotationForPoint(theWayPoint:number)
							{
								theWayPoint = flash.checkInt(theWayPoint);
								var i:number = flash.checkInt(0);
								var w1:com.popcap.flash.games.zuma2.logic.WayPoint = <any>null;
								var w2:com.popcap.flash.games.zuma2.logic.WayPoint = <any>null;
								var mix:number = <any>NaN;
								var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[theWayPoint];
								if(p1.mHaveAvgRotation)
								{
									return ;
								}
								this.CalcPerpendicularForPoint(theWayPoint);
								p1.mHaveAvgRotation = true;
								p1.mAvgRotation = p1.mRotation;
								var first:number = flash.checkInt(theWayPoint - 10);
								var last:number = flash.checkInt(theWayPoint + 10);
								if(first < 0)
								{
									first = flash.checkInt(0);
								}
								if(last >= flash.tranint(this.mWayPoints.length))
								{
									last = flash.checkInt(flash.tranint(this.mWayPoints.length) - 1);
								}
								var dr:number = <any>0;
								this.CalcPerpendicularForPoint(first);
								for(i = flash.checkInt(first + 1); i < last; i++)
								{
									this.CalcPerpendicularForPoint(i);
									dr = this.GetCanonicalAngle(this.mWayPoints[i].mRotation - this.mWayPoints[i - 1].mRotation);
									if(dr > 0.1 || dr < -0.1)
									{
										w1 = this.mWayPoints[i];
										w2 = this.mWayPoints[i - 1];
										if(<any>!(Math.abs(w1.x - w2.x) > 5 || Math.abs(w1.y - w2.y) > 5))
										{
											mix = 1 - flash.trannumber(i - first) / (last - first);
											p1.mAvgRotation = this.mWayPoints[first].mRotation + mix * dr;
											return ;
										}
									}
								}
							}

							public FindFreeWayPoint(theExistingBall:com.popcap.flash.games.zuma2.logic.Ball,theNewBall:com.popcap.flash.games.zuma2.logic.Ball,inFront:boolean,loop_at_end:boolean = false,thePad:number = 0)
							{
								var aWayPointMod:number = flash.checkInt(0);
								var dw:number = flash.checkInt(<any>!<any>!inFront?1:-1);
								var aWayPoint:number = flash.checkInt(flash.tranint(theExistingBall.GetWayPoint()));
								if(inFront && theNewBall.GetWayPoint() > aWayPoint)
								{
									aWayPoint = flash.checkInt(flash.tranint(theNewBall.GetWayPoint()));
								}
								else if(<any>!inFront && theNewBall.GetWayPoint() < aWayPoint)
								{
									aWayPoint = flash.checkInt(flash.tranint(theNewBall.GetWayPoint()));
								}
								var aPoint:com.popcap.flash.games.zuma2.logic.WayPoint = <any>null;
								while(aWayPoint >= 0 && (loop_at_end || aWayPoint < flash.tranint(this.mWayPoints.length)))
								{
									aPoint = this.mWayPoints[aWayPoint % flash.tranint(this.mWayPoints.length)];
									theNewBall.SetPos(aPoint.x,aPoint.y);
									if(<any>!theExistingBall.CollidesWithPhysically(theNewBall,thePad))
									{
										break;
									}
									aWayPointMod = flash.checkInt(aWayPoint % flash.tranint(this.mWayPoints.length));
									aWayPoint = flash.checkInt(aWayPoint + dw);
									if(loop_at_end && aWayPointMod + dw < 0)
									{
										aWayPoint = flash.checkInt(aWayPoint - dw);
										break;
									}
								}
								this.SetWayPointInt(theNewBall,aWayPoint,loop_at_end);
							}

							public GetPointPos(thePoint:number):egret.Point
							{
								var aPoint:number = flash.checkInt(flash.tranint(thePoint));
								if(aPoint < 0)
								{
									aPoint = flash.checkInt(0);
								}
								else if(aPoint >= flash.tranint(this.mWayPoints.length))
								{
									aPoint = flash.checkInt(flash.tranint(this.mWayPoints.length) - 1);
								}
								var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[aPoint];
								return new egret.Point(p1.x,p1.y);
							}

							public SetWayPointInt(theBall:com.popcap.flash.games.zuma2.logic.Ball,thePoint:number,loop_at_end:boolean)
							{
								thePoint = flash.checkInt(thePoint);
								if(this.mWayPoints.length == 0)
								{
									return ;
								}
								var aPoint:number = flash.checkInt(thePoint);
								if(aPoint < 0)
								{
									aPoint = flash.checkInt(0);
								}
								else if(aPoint >= flash.tranint(this.mWayPoints.length))
								{
									if(loop_at_end)
									{
										aPoint = flash.checkInt(flash.tranint(thePoint) % flash.tranint(this.mWayPoints.length));
									}
									else
									{
										aPoint = flash.checkInt(flash.tranint(this.mWayPoints.length) - 1);
									}
								}
								var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[aPoint];
								this.CalcAvgRotationForPoint(aPoint);
								theBall.SetPos(p1.x,p1.y);
								theBall.SetWayPoint(thePoint,p1.mInTunnel);
								theBall.SetRotation(p1.mAvgRotation,false);
							}

							public GetNumPoints():number
							{
								return this.mWayPoints.length;
							}

							public CalcPerpendicular(theWayPoint:number):com.popcap.flash.games.zuma2.logic.SexyVector3
							{
								var aPoint:number = flash.checkInt(flash.tranint(theWayPoint));
								if(aPoint < 0)
								{
									aPoint = flash.checkInt(0);
								}
								if(aPoint >= flash.tranint(this.mWayPoints.length))
								{
									aPoint = flash.checkInt(flash.tranint(this.mWayPoints.length - 1));
								}
								var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[aPoint];
								this.CalcPerpendicularForPoint(aPoint);
								return p1.mPerpendicular;
							}

							public GetRotationForPoint(theWayPoint:number):number
							{
								theWayPoint = flash.checkInt(theWayPoint);
								if(theWayPoint < 0)
								{
									theWayPoint = flash.checkInt(0);
								}
								if(theWayPoint >= this.mWayPoints.length - 1)
								{
									theWayPoint = flash.checkInt(this.mWayPoints.length - 1);
								}
								var p1:com.popcap.flash.games.zuma2.logic.WayPoint = this.mWayPoints[theWayPoint];
								this.CalcPerpendicularForPoint(theWayPoint);
								return p1.mRotation;
							}

						}
					}
				}
			}
		}
	}
}

