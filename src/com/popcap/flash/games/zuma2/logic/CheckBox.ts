module com {
	export module popcap {
		export module flash {
			export module games {
				export module zuma2 {
					export module logic {
						export class CheckBox extends egret.Sprite {
							public mCheckedImage:flash.Bitmap;
							public mApp:Zuma2App;
							public mUncheckedOverImage:flash.Bitmap;
							public mOver:boolean = false;
							public mUncheckedImage:flash.Bitmap;
							public mCheckedOverImage:flash.Bitmap;
							public mBoard:com.popcap.flash.games.zuma2.logic.Board;
							public mChecked:boolean = false;

							public constructor(app:Zuma2App,checkedImage:flash.Bitmap,checkedOverImage:flash.Bitmap,uncheckedImage:flash.Bitmap,uncheckedOverImage:flash.Bitmap,checked:boolean)
							{
								supe								var _self__:any = this;
r();
								this.mApp = app;
								this.mChecked = checked;
								this.mCheckedImage = checkedImage;
								this.mCheckedImage.visible = false;
								this.mCheckedOverImage = checkedOverImage;
								this.mCheckedOverImage.visible = false;
								this.mUncheckedImage = uncheckedImage;
								this.mUncheckedImage.visible = false;
								this.mUncheckedOverImage = uncheckedOverImage;
								this.mUncheckedOverImage.visible = false;
								if(this.mChecked)
								{
									this.mCheckedImage.visible = true;
								}
								else
								{
									this.mUncheckedImage.visible = true;
								}
								_self__.addChild(this.mCheckedImage);
								_self__.addChild(this.mCheckedOverImage);
								_self__.addChild(this.mUncheckedImage);
								_self__.addChild(this.mUncheckedOverImage);
								this.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.handleClick,this),null);
								this.addEventListener(flash.MouseEvent.ROLL_OVER,flash.bind(this.handleOver,this),null);
								this.addEventListener(flash.MouseEvent.ROLL_OUT,flash.bind(this.handleOut,this),null);
								this["buttonMode"] = true;
								this["useHandCursor"] = true;
							}

							public handleClick(e:flash.MouseEvent)
							{
								if(this.mChecked)
								{
									this.SetChecked(false);
								}
								else
								{
									this.SetChecked(true);
								}
							}

							public SetChecked(checked:boolean)
							{
								this.mChecked = checked;
								if(this.mChecked)
								{
									if(this.mOver)
									{
										this.mCheckedOverImage.visible = true;
									}
									else
									{
										this.mCheckedImage.visible = true;
									}
									this.mUncheckedImage.visible = false;
									this.mUncheckedOverImage.visible = false;
								}
								else
								{
									if(this.mOver)
									{
										this.mUncheckedOverImage.visible = true;
									}
									else
									{
										this.mUncheckedImage.visible = true;
									}
									this.mCheckedImage.visible = false;
									this.mCheckedOverImage.visible = false;
								}
							}

							public handleOut(e:flash.MouseEvent)
							{
								this.mOver = false;
								this.mCheckedOverImage.visible = false;
								this.mUncheckedOverImage.visible = false;
								if(this.mChecked)
								{
									this.mCheckedImage.visible = true;
								}
								else
								{
									this.mUncheckedImage.visible = true;
								}
							}

							public handleOver(e:flash.MouseEvent)
							{
								this.mOver = true;
								this.mUncheckedImage.visible = false;
								this.mCheckedImage.visible = false;
								if(this.mChecked)
								{
									this.mCheckedOverImage.visible = true;
								}
								else
								{
									this.mUncheckedOverImage.visible = true;
								}
							}

						}
					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.games.zuma2.logic.CheckBox","egret.Sprite")
