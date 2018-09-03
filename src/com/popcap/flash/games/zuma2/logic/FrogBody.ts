module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class FrogBody extends egret.HashObject {
							public mType:number = 0;
							public mLegsImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mTongueImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mMouthOffset:egret.Point;
							public mNextBallX:number = 0;
							public mCel:number = 0;
							public mMouthImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mBodyOffset:egret.Point;
							public mCY:number = 0;
							public mLegsOffset:egret.Point;
							public mTongueX:number = NaN;
							public mEyesOffset:egret.Point;
							public mLazerEyeLoopImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mBodyImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mShadowImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mCX:number = 0;
							public mEyesImage:com.popcap.flash.framework.resources.images.ImageInst;
							public mAlpha:number = 0;
							public mNextBallY:number = 0;

							public constructor()
							{
								super();
								super();
								this.mCel = flash.checkInt(0);
							}

						}
					}
				}
			}
		}
	}
}

