module com {
	export module popcap {
		export module flash {
			export module framework {
				export module widgets {
					export class BaseWidget extends egret.HashObject implements com.popcap.flash.framework.widgets.Widget {
						private mIsEnabled:boolean = true;
						private mX:number = 0;
						private mY:number = 0;
						protected mousePos:egret.Point;
						private mIsVisible:boolean = true;

						public constructor()
						{
							super();
							super();
							this.mousePos = new egret.Point();
						}

						public onKeyUp(keyCode:number)
						{
							keyCode = flash.checkInt(keyCode);
						}

						public draw(canvas:com.popcap.flash.framework.Canvas)
						{
						}

						public onMouseMove(x:number,y:number)
						{
							this.mousePos.x = x;
							this.mousePos.y = y;
						}

						public get x():number
						{
							return this.mX;
						}

						public get y():number
						{
							return this.mY;
						}

						public update()
						{
						}

						public onMouseDown(x:number,y:number)
						{
							this.mousePos.x = x;
							this.mousePos.y = y;
						}

						public set isVisible(value:boolean)
						{
							this.mIsVisible = value;
						}

						public onKeyDown(keyCode:number)
						{
							keyCode = flash.checkInt(keyCode);
						}

						public onMouseOut(x:number,y:number)
						{
							this.mousePos.x = x;
							this.mousePos.y = y;
						}

						public onMouseUp(x:number,y:number)
						{
							this.mousePos.x = x;
							this.mousePos.y = y;
						}

						public contains(x:number,y:number):boolean
						{
							return false;
						}

						public get isVisible():boolean
						{
							return this.mIsVisible;
						}

						public set x(value:number)
						{
							this.mX = value;
						}

						public set y(value:number)
						{
							this.mY = value;
						}

						public set isEnabled(value:boolean)
						{
							this.mIsEnabled = value;
						}

						public onMouseOver(x:number,y:number)
						{
							this.mousePos.x = x;
							this.mousePos.y = y;
						}

						public get isEnabled():boolean
						{
							return this.mIsEnabled;
						}

					}
				}
			}
		}
	}
}

flash.implementsClass("com.popcap.flash.framework.widgets.BaseWidget",["com.popcap.flash.framework.widgets.Widget"]);