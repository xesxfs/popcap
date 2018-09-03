module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class ZumaBar extends TimerBar {
							public mZumaCurrent:number = 0;
							public mZumaGoal:number = 0;

							public constructor(app:Zuma2App)
							{
								super(app);
								mApp = app;
							}

							public Init()
							{
								mInited = true;
								mTimerBarEmptyBitmap = new flash.Bitmap(mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_TIMERBAR_EMPTY),flash.PixelSnapping.NEVER,true);
								mTimerBarFillBitmap = new flash.Bitmap(mApp.imageManager.getBitmapData(Zuma2Images.IMAGE_UI_TIMERBAR_FULL),flash.PixelSnapping.NEVER,true);
								mTimerBarSprite = new egret.Sprite();
								mTimerBarMask = new egret.Sprite();
								mTimerBarMask.graphics.beginFill(16777215);
								mTimerBarMask.graphics.drawRect(0,0,225,21);
								mTimerBarFillBitmap.mask = mTimerBarMask;
								mTimerBarSprite.addChild(mTimerBarEmptyBitmap);
								mTimerBarSprite.addChild(mTimerBarFillBitmap);
								mTimerBarSprite.addChild(mTimerBarMask);
								mTimerBarSprite.x = 163;
								mTimerBarSprite.y = 3;
								mApp.mLayers[3].mBalls.addChild(mTimerBarSprite);
							}

							public Draw()
							{
								var barPct:number = this.mZumaCurrent / this.mZumaGoal;
								var maskWidth:number = barPct * BAR_WIDTH;
								mTimerBarMask.width = maskWidth;
								mTimerBarFillBitmap.mask = mTimerBarMask;
							}

							public Update()
							{
								if(<any>!mInited)
								{
									this.Init();
								}
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.logic.ZumaBar","TimerBar")
