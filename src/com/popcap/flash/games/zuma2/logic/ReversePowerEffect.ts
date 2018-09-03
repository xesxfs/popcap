module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class ReversePowerEffect extends com.popcap.flash.games.zuma2.logic.PowerEffect {
							public mCurve:com.popcap.flash.games.zuma2.logic.CurveMgr;
							public mStartWaypoint:number = NaN;
							public mRotation:number = NaN;
							public mWaypoint:number = NaN;
							public mScale:number = NaN;

							public constructor(app:Zuma2App,b:com.popcap.flash.games.zuma2.logic.Ball,x:number = 0,y:number = 0)
							{
								super(app,x,y);
								this.mCurve = b.mCurve;
								this.mStartWaypoint = this.mWaypoint = b.GetWayPoint();
								var pos:egret.Point = this.mCurve.mWayPointMgr.GetPointPos(this.mWaypoint);
								this.mX = pos.x;
								this.mY = pos.y;
								this.mRotation = this.mCurve.mWayPointMgr.GetRotationForPoint(this.mWaypoint);
							}

							public Draw()
							{
								var item:com.popcap.flash.games.zuma2.logic.EffectItem = <any>null;
								if(this.IsDone())
								{
									return ;
								}
								var start_idx:number = flash.checkInt(<any>!<any>!this.mDrawReverse?flash.tranint(this.mItems.length - 1):0);
								var end_idx:number = flash.checkInt(<any>!<any>!this.mDrawReverse?0:flash.tranint(this.mItems.length));
								var idx:number = flash.checkInt(start_idx);
								while(<any>!<any>!this.mDrawReverse?idx >= end_idx:idx < end_idx)
								{
									item = this.mItems[idx];
									item.mSprite.alpha = this.GetComponentValue(item.mOpacity,255,this.mUpdateCount) / 255;
									if(item.mSprite.alpha != 0)
									{
										item.mSprite.scaleX = <any>!<any>!this.mDone?flash.trannumber(this.mScale):flash.trannumber(this.GetComponentValue(item.mScale,1,this.mUpdateCount));
										item.mSprite.scaleY = <any>!<any>!this.mDone?flash.trannumber(this.mScale):flash.trannumber(this.GetComponentValue(item.mScale,1,this.mUpdateCount));
										item.mSprite.rotation = -this.mRotation * Zuma2App.RAD_TO_DEG;
										item.mSprite.x = this.mX * Zuma2App.SHRINK_PERCENT;
										item.mSprite.y = this.mY * Zuma2App.SHRINK_PERCENT;
									}
									idx = flash.checkInt(idx + (<any>!<any>!this.mDrawReverse?-1:1));
								}
							}

							public Update()
							{
								var pos:egret.Point = <any>null;
								if(this.IsDone())
								{
									return ;
								}
								super.Update();
								var updates_done:boolean = this.mDone;
								if(<any>!updates_done)
								{
									return ;
								}
								this.mWaypoint = this.mWaypoint - 20;
								pos = this.mCurve.mWayPointMgr.GetPointPos(this.mWaypoint);
								this.mX = pos.x;
								this.mY = pos.y;
								this.mRotation = this.mCurve.mWayPointMgr.GetRotationForPoint(this.mWaypoint);
								this.mScale = this.mWaypoint / this.mStartWaypoint;
								if(this.mScale < 0)
								{
									this.mDone = true;
								}
							}

							public IsDone():boolean
							{
								return this.mDone && this.mWaypoint < 0;
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.logic.ReversePowerEffect","com.popcap.flash.games.zuma2.logic.PowerEffect")
