module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class PowerEffect extends egret.HashObject {
							public static PowerEffect_Cannon:number;
							public static WHITE:flash.ColorTransform;
							public static PowerEffect_Stop:number;
							public static PowerEffect_Laser:number;
							public static PowerEffect_Accuracy:number;
							public static PowerEffect_Reverse:number;
							public static PowerEffect_Bomb:number;
							public mType:number = 0;
							public mY:number = NaN;
							public mDone:boolean = false;
							public mColorType:number = 0;
							public mDrawReverse:boolean = false;
							public mX:number = NaN;
							public mItems:Array<com.popcap.flash.games.zuma2.logic.EffectItem>;
							public mUpdateCount:number = 0;
							public mApp:Zuma2App;

							public constructor(app:Zuma2App,x:number = 0,y:number = 0)
							{
								super();
								super();
								this.mItems = new Array<com.popcap.flash.games.zuma2.logic.EffectItem>();
								this.mApp = app;
								this.mX = x;
								this.mY = y;
								this.mType = flash.checkInt(-1);
								this.mColorType = flash.checkInt(-1);
								this.mDone = false;
								this.mDrawReverse = false;
								this.mUpdateCount = flash.checkInt(0);
							}

							public GetComponentValue(v:Array<com.popcap.flash.games.zuma2.logic.Component>,def_value:number,update_count:number):number
							{
								update_count = flash.checkInt(update_count);
								var comp:com.popcap.flash.games.zuma2.logic.Component = <any>null;
								for(var i:number = flash.checkInt(0);i < v.length; i++)
								{
									comp = v[i];
									if(update_count < comp.mStartFrame)
									{
										return comp.mValue;
									}
									if(comp.Active(update_count))
									{
										return comp.mValue;
									}
									if(i == v.length - 1)
									{
										return comp.mValue;
									}
								}
								return def_value;
							}

							public Delete()
							{
								for(var i:number = flash.checkInt(0);i < this.mItems.length; i++)
								{
									this.mItems[i].Delete();
								}
							}

							public AddDefaultEffectType(eff_type:number,color_type:number,init_rotation:number = 0)
							{
								var c1:flash.ColorTransform = <any>null;
								var c2:flash.ColorTransform = <any>null;
								var item:com.popcap.flash.games.zuma2.logic.EffectItem = <any>null;
								var time_sub:number = flash.checkInt(0);
								var img:com.popcap.flash.framework.resources.images.ImageInst = <any>null;
								var d:number = <any>NaN;
								var rot:number = <any>NaN;
								var target:number = <any>NaN;
								switch(color_type)
								{
								case Zuma2App.Blue_Ball :
									c1 = new flash.ColorTransform(150 / 255,150 / 255,150 / 255);
									c2 = new flash.ColorTransform(75 / 255,75 / 255,255 / 255);
									break;
								case Zuma2App.Yellow_Ball :
									c1 = new flash.ColorTransform(255 / 255,255 / 255,150 / 255);
									c2 = new flash.ColorTransform(255 / 255,255 / 255,0 / 255);
									break;
								case Zuma2App.Red_Ball :
									c1 = new flash.ColorTransform(250 / 255,140 / 255,0 / 255);
									c2 = new flash.ColorTransform(250 / 255,50 / 255,1 / 255);
									break;
								case Zuma2App.Green_Ball :
									c1 = new flash.ColorTransform(200 / 255,200 / 255,0 / 255);
									c2 = new flash.ColorTransform(0 / 255,185 / 255,118 / 255);
									break;
								case Zuma2App.Purple_Ball :
									c1 = new flash.ColorTransform(255 / 255,100 / 255,255 / 255);
									c2 = new flash.ColorTransform(255 / 255,50 / 255,255 / 255);
								case Zuma2App.White_Ball :
									c1 = new flash.ColorTransform(255 / 255,255 / 255,255 / 255);
									c2 = new flash.ColorTransform(200 / 255,200 / 255,200 / 255);
								}
								this.mType = flash.checkInt(eff_type);
								this.mColorType = flash.checkInt(color_type);
								if(eff_type == com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Bomb)
								{
									time_sub = flash.checkInt(83);
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_POWERPULSES),c2,3);
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,1.63,83 - time_sub,115 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,100 - time_sub,130 - time_sub));
									img = this.mApp["imageManager"].getImageInst("IMAGE_BLOOM_BLAST_" + this.GetColorName(color_type));
									item = this.AddItem(img,com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE);
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(0.2,1,83 - time_sub,105 - time_sub));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(init_rotation,init_rotation + Zuma2App.MY_PI,83 - time_sub,105 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,128,83 - time_sub,105 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(128,0,106 - time_sub,120 - time_sub));
									item = this.AddItem(img,com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE);
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(0.2,1,83 - time_sub,131 - time_sub));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(init_rotation,init_rotation - Zuma2App.MY_PI,83 - time_sub,105 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,128,83 - time_sub,105 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(128,0,106 - time_sub,145 - time_sub));
								}
								else if(eff_type == com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Accuracy)
								{
									time_sub = flash.checkInt(35);
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_GLOW),c1);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(128,255,35 - time_sub,50 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,51 - time_sub,95 - time_sub));
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_POWERPULSES),c1,0);
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(0.1,2,50 - time_sub,65 - time_sub));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(init_rotation,init_rotation + Zuma2App.MY_PI,55 - time_sub,75 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(25,255,35 - time_sub,50 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,36 - time_sub,95 - time_sub));
									item = this.AddItem(this.mApp["imageManager"].getImageInst("IMAGE_BLOOM_ACCURACY_" + this.GetColorName(color_type)),c1);
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(0.1,1.1,50 - time_sub,95 - time_sub));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1.1,1,96 - time_sub,101 - time_sub));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(init_rotation,init_rotation + Zuma2App.MY_PI / 2,55 - time_sub,95 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,35 - time_sub,49 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(25,255,50 - time_sub,75 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,115 - time_sub,135 - time_sub));
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_RING),c1);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,35 - time_sub,79 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(128,255,80 - time_sub,90 - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,91 - time_sub,135 - time_sub));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,10,80 - time_sub,135 - time_sub));
								}
								else if(eff_type == com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Reverse)
								{
									d = 8;
									time_sub = flash.checkInt(70 / d);
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_BALL_GLOW),c1);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(128,255,70 / d - time_sub,210 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,211 / d - time_sub,310 / d - time_sub));
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_POWERPULSES),c2,4);
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,2,109 / d - time_sub,385 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,70 / d - time_sub,108 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,255,109 / d - time_sub,360 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,361 / d - time_sub,485 / d - time_sub));
									item.mBitmap.rotation = -90;
									img = this.mApp["imageManager"].getImageInst("IMAGE_BLOOM_REVERSE_" + this.GetColorName(color_type));
									item = this.AddItem(img,com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,70 / d - time_sub,160 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,128,161 / d - time_sub,360 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(128,153,361 / d - time_sub,485 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(153,0,486 / d - time_sub,560 / d - time_sub));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(0.2,1,160 / d - time_sub,360 / d - time_sub));
									item = this.AddItem(img,com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,70 / d - time_sub,335 / d - time_sub));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,255,336 / d - time_sub,585 / d - time_sub));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(0.2,1,335 / d - time_sub,535 / d - time_sub));
								}
								else if(eff_type == com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Stop)
								{
									rot = init_rotation - Zuma2App.MY_PI / 2;
									if(rot > Zuma2App.MY_PI)
									{
										target = Zuma2App.MY_PI * 2;
									}
									else
									{
										target = 0;
									}
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_POWERUP_POWERPULSES),com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE,2);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,255,0,15));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,16,21));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,1,0,9));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,2,10,21));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(rot,target,0,20));
									item = this.AddItem(this.mApp["imageManager"].getImageInst("IMAGE_BLOOM_STOP_" + this.GetColorName(color_type)),com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,0,9));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(128,255,10,20));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,40,50));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(0.5,1.1,10,22));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1.1,1,23,30));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,0.5,40,50));
									item.mYOffset.push(new com.popcap.flash.games.zuma2.logic.Component(0,-10,10,20));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(rot,target,0,20));
									item = this.AddItem(this.mApp["imageManager"].getImageInst("IMAGE_BLOOM_STOP_" + this.GetColorName(color_type)),com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,0,20));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,255,21,26));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,27,37));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,1.1,20,22));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1.1,1,23,27));
									item.mYOffset.push(new com.popcap.flash.games.zuma2.logic.Component(-10,-10,20,20));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(rot,target,0,20));
									item = this.AddItem(this.mApp["imageManager"].getImageInst(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_STOP_OUTLINE),com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE);
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(0,0,0,24));
									item.mOpacity.push(new com.popcap.flash.games.zuma2.logic.Component(255,0,25,50));
									item.mScale.push(new com.popcap.flash.games.zuma2.logic.Component(1,3,25,50));
									item.mAngle.push(new com.popcap.flash.games.zuma2.logic.Component(rot,target,0,20));
								}
								else if(eff_type == com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Laser)
									{}
							}

							public Draw()
							{
								var item:com.popcap.flash.games.zuma2.logic.EffectItem = <any>null;
								if(this.mDone)
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
									item.mSprite.rotation = this.GetComponentValue(item.mAngle,0,this.mUpdateCount) * Zuma2App.RAD_TO_DEG;
									item.mSprite.scaleX = this.GetComponentValue(item.mScale,1,this.mUpdateCount);
									item.mSprite.scaleY = this.GetComponentValue(item.mScale,1,this.mUpdateCount);
									item.mSprite.x = this.GetComponentValue(item.mXOffset,0,this.mUpdateCount) + this.mX * Zuma2App.SHRINK_PERCENT;
									item.mSprite.y = this.GetComponentValue(item.mYOffset,0,this.mUpdateCount) + this.mY * Zuma2App.SHRINK_PERCENT;
									idx = flash.checkInt(idx + (<any>!<any>!this.mDrawReverse?-1:1));
								}
							}

							public UpdateComponentVec(v:Array<com.popcap.flash.games.zuma2.logic.Component>,update_count:number):boolean
							{
								update_count = flash.checkInt(update_count);
								var comp:com.popcap.flash.games.zuma2.logic.Component = <any>null;
								var passed_all:boolean = <any>true;
								for(var idx:number = flash.checkInt(0);idx < v.length; idx++)
								{
									comp = v[idx];
									if(comp.Active(update_count))
									{
										comp.Update();
										return false;
									}
									if(update_count < comp.mStartFrame)
									{
										passed_all = false;
									}
								}
								return passed_all;
							}

							public Update()
							{
								var item:com.popcap.flash.games.zuma2.logic.EffectItem = <any>null;
								var sdone:boolean = <any>false;
								var adone:boolean = <any>false;
								var odone:boolean = <any>false;
								var xdone:boolean = <any>false;
								var ydone:boolean = <any>false;
								if(this.mDone)
								{
									return ;
								}
								this.mUpdateCount++;
								var all_done:boolean = <any>true;
								for(var i:number = flash.checkInt(0);i < this.mItems.length; i++)
								{
									item = this.mItems[i];
									sdone = this.UpdateComponentVec(item.mScale,this.mUpdateCount);
									adone = this.UpdateComponentVec(item.mAngle,this.mUpdateCount);
									odone = this.UpdateComponentVec(item.mOpacity,this.mUpdateCount);
									xdone = this.UpdateComponentVec(item.mXOffset,this.mUpdateCount);
									ydone = this.UpdateComponentVec(item.mYOffset,this.mUpdateCount);
									all_done = all_done && sdone && adone && odone && xdone && ydone;
								}
								this.mDone = all_done;
							}

							public IsDone():boolean
							{
								return this.mDone;
							}

							public GetColorName(color:number):string
							{
								color = flash.checkInt(color);
								var colorString:string = <any>null;
								switch(color)
								{
								case 0 :
									colorString = "BLUE";
									break;
								case 1 :
									colorString = "YELLOW";
									break;
								case 2 :
									colorString = "RED";
									break;
								case 3 :
									colorString = "GREEN";
									break;
								case 4 :
									colorString = "PURPLE";
									break;
								case 5 :
									colorString = "WHITE";
									break;
								default :
									colorString = "BLUE";
								}
								return colorString;
							}

							public AddItem(img:com.popcap.flash.framework.resources.images.ImageInst,c:flash.ColorTransform,cel:number = 0):com.popcap.flash.games.zuma2.logic.EffectItem
							{
								this.mItems.push(new com.popcap.flash.games.zuma2.logic.EffectItem(this.mApp));
								var item:com.popcap.flash.games.zuma2.logic.EffectItem = this.mItems[this.mItems.length - 1];
								item.mImage = img;
								item.mCel = flash.checkInt(cel);
								item.mColor = c;
								item.Init(this.mX,this.mY);
								return item;
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Cannon = 4;
com.popcap.flash.games.zuma2.logic.PowerEffect.WHITE = new flash.ColorTransform(1,1,1,1,0,0,0);
com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Stop = 3;
com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Laser = 5;
com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Accuracy = 1;
com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Reverse = 2;
com.popcap.flash.games.zuma2.logic.PowerEffect.PowerEffect_Bomb = 0;
