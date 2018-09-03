module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class DeathSkull extends egret.HashObject {
							public static STARTING_SIZE:number;
							public static Draw_Both:number;
							public static MAX_SIZE:number;
							public static Draw_BG:number;
							public static MIN_MOUTH_OPEN:number;
							public static Draw_FG:number;
							public mCurAngle:number = NaN;
							public mStartX:number = NaN;
							public mStartY:number = NaN;
							public mStartingAngle:number = NaN;
							public mDestX:number = NaN;
							public mDestY:number = NaN;
							public mX:number = NaN;
							public mY:number = NaN;
							public mAngleInc:number = NaN;
							public mUpdateCount:number = 0;
							public mMouthOpenDelay:number = 0;
							public mLargeMiddleBitmap:flash.Bitmap;
							public mMoveFrames:number = 0;
							public mFrogClipHeight:number = NaN;
							public mOpeningRate:number = NaN;
							public mLastFrogAngle:number = NaN;
							public mApp:Zuma2App;
							public mLargeBottomBitmap:flash.Bitmap;
							public mDone:boolean = false;
							public mAngleOutInc:number = NaN;
							public mLargeMiddleSprite:egret.Sprite;
							public mLargeTopBitmap:flash.Bitmap;
							public mCloseDelay:number = 0;
							public mText:flash.TextField;
							public mTextAlpha:number = NaN;
							public mLargeBottomSprite:egret.Sprite;
							public mLargeTopSprite:egret.Sprite;
							public mShowText:boolean = false;
							public mOpeningMouth:boolean = false;
							public mLargeBlackBitmap:flash.Bitmap;
							public mVX:number = NaN;
							public mFrames:Array<com.popcap.flash.games.zuma2.logic.SkullFrame>;
							public mFrogTX:number = 0;
							public mFrogTY:number = 0;
							public mVY:number = NaN;
							public mBoard:com.popcap.flash.games.zuma2.widgets.GameBoardWidget;
							public mDisappearing:boolean = false;
							public mLargeBlackSprite:egret.Sprite;

							public constructor(app:Zuma2App,board:com.popcap.flash.games.zuma2.widgets.GameBoardWidget)
							{
								super();
								super();
								this.mFrames = new Array<com.popcap.flash.games.zuma2.logic.SkullFrame>();
								this.mApp = app;
								this.mBoard = board;
								this.mUpdateCount = flash.checkInt(0);
								this.mLargeBottomBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_LARGE_BOTTOM));
								this.mLargeBottomBitmap.x = -this.mLargeBottomBitmap.width / 2;
								this.mLargeBottomBitmap.y = 18;
								this.mLargeBottomBitmap["smoothing"] = true;
								this.mLargeBottomSprite = new egret.Sprite();
								this.mLargeBottomSprite.x = -500;
								this.mLargeBottomSprite.y = -500;
								this.mLargeBottomSprite.addChild(this.mLargeBottomBitmap);
								this.mLargeTopBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_LARGE_TOP));
								this.mLargeTopBitmap.x = -this.mLargeTopBitmap.width / 2;
								this.mLargeTopBitmap.y = -this.mLargeTopBitmap.height / 2;
								this.mLargeTopBitmap["smoothing"] = true;
								this.mLargeTopSprite = new egret.Sprite();
								this.mLargeTopSprite.x = -500;
								this.mLargeTopSprite.y = -500;
								this.mLargeTopSprite.addChild(this.mLargeTopBitmap);
								this.mLargeMiddleBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_LARGE_MIDDLE));
								this.mLargeMiddleBitmap.x = -this.mLargeMiddleBitmap.width / 2;
								this.mLargeMiddleBitmap.y = 100;
								this.mLargeMiddleBitmap["smoothing"] = true;
								this.mLargeMiddleSprite = new egret.Sprite();
								this.mLargeMiddleSprite.x = -500;
								this.mLargeMiddleSprite.y = -500;
								this.mLargeMiddleSprite.addChild(this.mLargeMiddleBitmap);
								this.mLargeBlackBitmap = new flash.Bitmap(this.mApp["imageManager"].getBitmapData(com.popcap.flash.games.zuma2.logic.Zuma2Images.IMAGE_DEATHSKULL_LARGE_BLACK));
								this.mLargeBlackBitmap.x = -this.mLargeBlackBitmap.width / 2;
								this.mLargeBlackBitmap.y = 0;
								this.mLargeBlackBitmap["smoothing"] = true;
								this.mLargeBlackSprite = new egret.Sprite();
								this.mLargeBlackSprite.x = -500;
								this.mLargeBlackSprite.y = -500;
								this.mLargeBlackSprite.addChild(this.mLargeBlackBitmap);
								this.mText = new flash.TextField();
								var aTimeUpTextFormat:flash.TextFormat = new flash.TextFormat();
								aTimeUpTextFormat.font = "TimeUpText";
								aTimeUpTextFormat.align = flash.TextFormatAlign.CENTER;
								aTimeUpTextFormat.color = 16777215;
								aTimeUpTextFormat.size = 55;
								var aGlow:flash.DropShadowFilter = new flash.DropShadowFilter();
								aGlow.strength = 50;
								this.mText = new flash.TextField();
								this.mText.embedFonts = true;
								this.mText.defaultTextFormat = aTimeUpTextFormat;
								this.mText.filters = [aGlow];
								this.mText.textColor = flash.checkUint(16711680);
								this.mText.width = 400;
								this.mText.height = 100;
								this.mText.x = 75;
								this.mText.y = 100;
								this.mText.alpha = 1;
								this.mText["selectable"] = false;
								this.mText.multiline = true;
								this.mText["wordWrap"] = true;
								this.mApp["mLayers"][1].mBackground.addChild(this.mLargeBlackSprite);
								this.mApp["mLayers"][1].mBackground.addChild(this.mLargeBottomSprite);
								this.mApp["mLayers"][1].mBackground.addChild(this.mLargeMiddleSprite);
								this.mApp["mLayers"][1].mBackground.addChild(this.mLargeTopSprite);
								this.mApp["mLayers"][2].mForeground.addChild(this.mText);
							}

							public AceModF(x:number,y:number):number
							{
								if(x < 0)
								{
									return y - -x % y;
								}
								return x % y;
							}

							public RotatePoint2(pAngle:number,pVector:egret.Point,pCenter:egret.Point):egret.Point
							{
								var ox:number = pVector.x - pCenter.x;
								var oy:number = pVector.y - pCenter.y;
								var x:number = pCenter.x + ox * Math.cos(pAngle) + oy * Math.sin(pAngle);
								var y:number = pCenter.y + oy * Math.cos(pAngle) - ox * Math.sin(pAngle);
								return new egret.Point(x,y);
							}

							public GetCanonicalAngleRad(theRad:number):number
							{
								if(theRad >= 0 && theRad < 2 * Zuma2App.MY_PI)
								{
									return theRad;
								}
								return this.AceModF(theRad,2 * Zuma2App.MY_PI);
							}

							public Delete()
							{
								if(this.mLargeBlackSprite.parent != null)
								{
									this.mLargeBlackSprite.parent.removeChild(this.mLargeBlackSprite);
								}
								if(this.mLargeTopSprite.parent != null)
								{
									this.mLargeTopSprite.parent.removeChild(this.mLargeTopSprite);
								}
								if(this.mLargeBottomSprite.parent != null)
								{
									this.mLargeBottomSprite.parent.removeChild(this.mLargeBottomSprite);
								}
								if(this.mLargeMiddleSprite.parent != null)
								{
									this.mLargeMiddleSprite.parent.removeChild(this.mLargeMiddleSprite);
								}
							}

							public Init(start_angle:number,sx:number,sy:number,dx:number,dy:number)
							{
								this.mFrogTX = flash.checkInt(this.mFrogTY = flash.checkInt(-1));
								this.mLastFrogAngle = 0;
								this.mMouthOpenDelay = flash.checkInt(1);
								this.mOpeningRate = 0.016;
								this.mCurAngle = this.mStartingAngle = start_angle;
								this.mX = this.mStartX = sx * Zuma2App.SHRINK_PERCENT + 5;
								this.mY = this.mStartY = sy * Zuma2App.SHRINK_PERCENT;
								this.mDestX = dx * Zuma2App.SHRINK_PERCENT;
								this.mDestY = dy * Zuma2App.SHRINK_PERCENT - 250 * Zuma2App.SHRINK_PERCENT;
								this.mOpeningMouth = false;
								this.mCloseDelay = flash.checkInt(0);
								this.mTextAlpha = 255;
								this.mDone = false;
								this.mShowText = false;
								this.mFrogClipHeight = 0;
								this.mMoveFrames = flash.checkInt(50);
								this.mVX = (this.mDestX - this.mX) / this.mMoveFrames;
								this.mVY = (this.mDestY - this.mY) / this.mMoveFrames;
								this.mDisappearing = false;
								var a:number = this.GetCanonicalAngleRad(this.mCurAngle);
								if(Zuma2App.MY_PI * 2 - a < a)
								{
									this.mAngleInc = (Zuma2App.MY_PI * 2 - a) / this.mMoveFrames;
									this.mAngleOutInc = a / this.mMoveFrames;
								}
								else
								{
									this.mAngleInc = -a / this.mMoveFrames;
									this.mAngleOutInc = -(Zuma2App.MY_PI * 2 - a) / this.mMoveFrames;
								}
							}

							public RotatePoint(pAngle:number,aPoint:egret.Point,cx:number,cy:number)
							{
								var p:egret.Point = this.RotatePoint2(pAngle,new egret.Point(aPoint.x,aPoint.y),new egret.Point(cx,cy));
								aPoint.x = p.x;
								aPoint.y = p.y;
							}

							public DrawFrogItem(s:com.popcap.flash.games.zuma2.logic.SkullFrame,frog_draw_mode:number)
							{
								frog_draw_mode = flash.checkInt(frog_draw_mode);
								var idx:number = flash.checkInt(0);
								var max_idx:number = flash.checkInt(0);
								var t:egret.Matrix = <any>null;
								var src:egret.Rectangle = <any>null;
								var xoff:number = <any>NaN;
								var yoff:number = <any>NaN;
								var h:number = <any>NaN;
								var aPoint:egret.Point = <any>null;
								var max_h:number = <any>NaN;
								var range:number = <any>NaN;
								var pct:number = <any>NaN;
								var xoffs:Array<any> = new Array(0,0,0,0);
								var yoffs:Array<any> = new Array(0,0,0,0);
								var bitmapYoffs:number = <any>25;
								var imgs:Array<egret.Sprite> = new Array<egret.Sprite>();
								imgs.push(this.mLargeBottomSprite,this.mLargeBlackSprite,this.mLargeMiddleSprite,this.mLargeTopSprite);
								if(0)
									{}
								for(idx = flash.checkInt(0),max_idx = flash.checkInt(4); idx < max_idx; )
								{
									t = new egret.Matrix();
									t.scale(s.mSize,s.mSize);
									t.rotate(s.mAngle);
									src = new egret.Rectangle(imgs[idx].x,imgs[idx].y,imgs[idx].width,imgs[idx].height);
									xoff = xoffs[idx] * Zuma2App.SHRINK_PERCENT;
									yoff = yoffs[idx] * Zuma2App.SHRINK_PERCENT;
									h = 0;
									if(idx == 2 && (<any>!s.mIsFinalFrame || s.mAlpha < 254))
									{
										max_h = 0;
										range = 1 - com.popcap.flash.games.zuma2.logic.DeathSkull.MIN_MOUTH_OPEN;
										pct = 1 - (s.mPctOpen - com.popcap.flash.games.zuma2.logic.DeathSkull.MIN_MOUTH_OPEN) / range;
										h = max_h * pct;
										src.y = h;
										src.height = src.height - h;
										yoff = yoff + h;
										bitmapYoffs = bitmapYoffs + h;
									}
									xoff = xoff * s.mSize;
									yoff = yoff * s.mSize;
									if(idx == 1 || idx == 2)
									{
										yoff = yoff * s.mPctOpen;
										bitmapYoffs = bitmapYoffs * s.mPctOpen;
									}
									aPoint = new egret.Point(xoff,yoff);
									this.RotatePoint(s.mAngle,aPoint,0,0);
									t.translate(aPoint.x + s.mX,aPoint.y + s.mY);
									imgs[idx]["transform"].matrix = t;
									imgs[idx].alpha = s.mAlpha / 255;
									if(idx == 1 && s.mAlpha < 254)
									{
										imgs[idx].alpha = 0;
									}
									if(idx == 2)
									{
										if(bitmapYoffs < 2.26)
										{
											bitmapYoffs = -25;
										}
										this.mLargeMiddleBitmap.y = bitmapYoffs;
									}
									idx++;
								}
							}

							public DrawAboveFrog()
							{
								var final_idx:number = flash.checkInt(0);
								var i:number = flash.checkInt(0);
								if(<any>!this.mOpeningMouth && this.mMouthOpenDelay <= 0)
								{
									final_idx = flash.checkInt(-1);
									for(i = flash.checkInt(0); i < this.mFrames.length; i++)
									{
										if(this.mFrames[i].mIsFinalFrame)
										{
											final_idx = flash.checkInt(i);
											break;
										}
									}
									if(final_idx != -1)
									{
										this.DrawFrogItem(this.mFrames[final_idx],com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_FG);
									}
								}
								if(this.mShowText && this.mTextAlpha > 0)
								{
									this.mText.alpha = this.mTextAlpha / 255;
								}
							}

							public Update()
							{
								var s:com.popcap.flash.games.zuma2.logic.SkullFrame = <any>null;
								var l:number = flash.checkInt(0);
								var min_open:number = <any>NaN;
								if(this.mDone)
								{
									return ;
								}
								if(this.mCloseDelay > 0)
								{
									this.mCloseDelay--;
								}
								else if(++this.mUpdateCount == this.mMoveFrames && this.mDisappearing && <any>!this.mShowText)
								{
									if(this.mBoard["GauntletMode"]())
									{
										this.mDone = true;
										return ;
									}
									this.mShowText = true;
									this.mTextAlpha = 500;
									l = flash.checkInt(this.mBoard["GetNumLives"]() - 1);
									if(l <= 0)
									{
										this.mText.text = "GAME OVER!";
									}
									else if(l > 1)
									{
										this.mText.text = l + " Lives Left";
									}
									else if(l == 1)
									{
										this.mText.text = "1 Life Left";
									}
									else
									{
										this.mShowText = false;
										this.mDone = true;
										return ;
									}
								}
								if(this.mBoard["GetNumLives"]() == 0 && this.mTextAlpha <= 0)
								{
									this.mDone = true;
								}
								if(this.mShowText && this.mTextAlpha > 0)
								{
									this.mTextAlpha = this.mTextAlpha - 3.2;
									if(this.mTextAlpha < 0)
									{
										this.mTextAlpha = 0;
										this.mDone = true;
									}
								}
								if(this.mCloseDelay <= 0)
								{
									this.mCurAngle = this.mCurAngle + this.mAngleInc;
								}
								var pct:number = this.mUpdateCount / this.mMoveFrames;
								if(this.mUpdateCount < this.mMoveFrames && this.mCloseDelay <= 0)
								{
									this.mX = this.mX + this.mVX;
									this.mY = this.mY + this.mVY;
								}
								if(this.mUpdateCount % 2 == 0 && this.mUpdateCount < this.mMoveFrames && this.mCloseDelay <= 0)
								{
									this.mFrames.push(new com.popcap.flash.games.zuma2.logic.SkullFrame());
									s = this.mFrames[this.mFrames.length - 1];
									s.mAngle = this.mCurAngle;
									if(<any>!this.mDisappearing)
									{
										s.mPctOpen = com.popcap.flash.games.zuma2.logic.DeathSkull.MIN_MOUTH_OPEN;
										s.mSize = com.popcap.flash.games.zuma2.logic.DeathSkull.STARTING_SIZE + (com.popcap.flash.games.zuma2.logic.DeathSkull.MAX_SIZE - com.popcap.flash.games.zuma2.logic.DeathSkull.STARTING_SIZE) * pct;
									}
									else
									{
										s.mPctOpen = com.popcap.flash.games.zuma2.logic.DeathSkull.MIN_MOUTH_OPEN;
										s.mSize = com.popcap.flash.games.zuma2.logic.DeathSkull.MAX_SIZE - (com.popcap.flash.games.zuma2.logic.DeathSkull.MAX_SIZE - com.popcap.flash.games.zuma2.logic.DeathSkull.STARTING_SIZE) * pct;
									}
									s.mAlpha = 128;
									s.mX = this.mX;
									s.mY = this.mY;
								}
								if(this.mUpdateCount >= this.mMoveFrames && (this.mFrames.length == 0 || <any>!this.mFrames[this.mFrames.length - 1].mIsFinalFrame) && <any>!this.mDisappearing)
								{
									this.mFrames.push(new com.popcap.flash.games.zuma2.logic.SkullFrame());
									s = this.mFrames[this.mFrames.length - 1];
									s.mIsFinalFrame = true;
									s.mPctOpen = com.popcap.flash.games.zuma2.logic.DeathSkull.MIN_MOUTH_OPEN;
									s.mAngle = this.mCurAngle = 0;
									this.mAngleInc = 0;
									s.mSize = com.popcap.flash.games.zuma2.logic.DeathSkull.MAX_SIZE;
									s.mAlpha = 255;
									s.mX = this.mX;
									s.mY = this.mY;
								}
								for(var i:number = flash.checkInt(0);i < this.mFrames.length; i++)
								{
									s = this.mFrames[i];
									if((<any>!s.mIsFinalFrame || this.mDisappearing) && this.mCloseDelay <= 0)
									{
										s.mAlpha = s.mAlpha - 10;
										if(s.mAlpha <= 0)
										{
											this.mFrames.splice(i,1);
											i--;
										}
									}
									else if(this.mMouthOpenDelay > 0 && --this.mMouthOpenDelay == 0)
									{
										this.mOpeningMouth = true;
									}
									else if(this.mOpeningMouth)
									{
										this.mOpeningRate = this.mOpeningRate - 0.00007;
										s.mPctOpen = s.mPctOpen + this.mOpeningRate;
										if(s.mPctOpen >= 1)
										{
											s.mPctOpen = 1;
											this.mOpeningMouth = false;
											this.mApp["soundManager"].playSound(Zuma2Sounds.SOUND_DEATHSKULL_CHOMP);
										}
									}
									else if(this.mMouthOpenDelay <= 0 && <any>!this.mOpeningMouth)
									{
										this.mApp["mLayers"][3].mBackground.addChild(this.mLargeBlackSprite);
										this.mApp["mLayers"][3].mBackground.addChild(this.mLargeMiddleSprite);
										this.mApp["mLayers"][3].mBackground.addChild(this.mLargeTopSprite);
										min_open = com.popcap.flash.games.zuma2.logic.DeathSkull.MIN_MOUTH_OPEN - 0.01;
										if(s.mPctOpen > min_open)
										{
											s.mPctOpen = s.mPctOpen - 0.12;
										}
										if(s.mPctOpen < 0.65)
										{
											this.mApp["mLayers"][3].mBackground.addChild(this.mLargeBottomSprite);
										}
										if(s.mPctOpen < min_open)
										{
											s.mPctOpen = min_open;
											this.mDestX = this.mStartX;
											this.mDestY = this.mStartY;
											this.mVX = (this.mDestX - this.mX) / this.mMoveFrames;
											this.mVY = (this.mDestY - this.mY) / this.mMoveFrames;
											this.mUpdateCount = flash.checkInt(0);
											this.mCloseDelay = flash.checkInt(25);
											this.mAngleInc = this.mAngleOutInc;
											this.mDisappearing = true;
											this.mBoard["mFrog"].SetPos(-50,-50);
											this.mBoard["mFrog"].update();
										}
										else
										{
											this.mFrogClipHeight = this.mFrogClipHeight - 40;
										}
									}
								}
							}

							public DrawBelowFrog()
							{
								var s:com.popcap.flash.games.zuma2.logic.SkullFrame = <any>null;
								var dm:number = flash.checkInt(0);
								var final_idx:number = flash.checkInt(-1);
								var i:number = flash.checkInt(<any>!<any>!this.mDisappearing?flash.tranint(this.mFrames.length - 1):0);
								if(this.mDisappearing)
								{
									while(i >= 0)
									{
										s = this.mFrames[i];
										if(s.mIsFinalFrame)
										{
											final_idx = flash.checkInt(i);
										}
										else
										{
											this.DrawFrogItem(s,com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_Both);
										}
										i--;
									}
								}
								else if(<any>!this.mDisappearing)
								{
									while(i < this.mFrames.length)
									{
										s = this.mFrames[i];
										if(s.mIsFinalFrame)
										{
											final_idx = flash.checkInt(i);
										}
										else
										{
											this.DrawFrogItem(s,com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_Both);
										}
										i++;
									}
								}
								if(final_idx != -1)
								{
									s = this.mFrames[final_idx];
									dm = flash.checkInt(<any>!this.mOpeningMouth && this.mMouthOpenDelay <= 0?flash.tranint(com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_BG):flash.tranint(com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_Both));
									this.DrawFrogItem(s,dm);
								}
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.games.zuma2.logic.DeathSkull.STARTING_SIZE = 0.31;
com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_Both = 2;
com.popcap.flash.games.zuma2.logic.DeathSkull.MAX_SIZE = 2.2;
com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_BG = 0;
com.popcap.flash.games.zuma2.logic.DeathSkull.MIN_MOUTH_OPEN = 0.3;
com.popcap.flash.games.zuma2.logic.DeathSkull.Draw_FG = 1;
