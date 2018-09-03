module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class LayerSprite extends egret.Sprite {
							public mForeground:egret.Sprite;
							public mBackground:egret.Sprite;
							public mBalls:egret.Sprite;

							public constructor()
							{
								supe								var _self__:any = this;
r();
								this.mBackground = new egret.Sprite();
								_self__.addChild(this.mBackground);
								this.mBalls = new egret.Sprite();
								_self__.addChild(this.mBalls);
								this.mForeground = new egret.Sprite();
								_self__.addChild(this.mForeground);
							}

							public Clear()
							{
								var _self__:any = this;
								_self__.removeChild(this.mBackground);
								_self__.removeChild(this.mBalls);
								_self__.removeChild(this.mForeground);
								this.mBackground = new egret.Sprite();
								_self__.addChild(this.mBackground);
								this.mBalls = new egret.Sprite();
								_self__.addChild(this.mBalls);
								this.mForeground = new egret.Sprite();
								_self__.addChild(this.mForeground);
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.logic.LayerSprite","egret.Sprite")
