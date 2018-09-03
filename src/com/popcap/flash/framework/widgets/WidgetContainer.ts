module com {
	export module popcap {
		export module flash {
			export module framework {
				export module widgets {
					export class WidgetContainer extends com.popcap.flash.framework.widgets.BaseWidget implements com.popcap.flash.framework.widgets.Widget {
						private mOverWidget:com.popcap.flash.framework.widgets.Widget;
						public mChildren:Array<com.popcap.flash.framework.widgets.Widget>;
						public mParent:com.popcap.flash.framework.widgets.WidgetContainer;

						public constructor()
						{
							super();
							this.mChildren = new Array<com.popcap.flash.framework.widgets.Widget>();
						}

						public onKeyUp(keyCode:number)
						{
							keyCode = flash.checkInt(keyCode);
						}

						public draw(canvas:com.popcap.flash.framework.Canvas)
						{
							var child:com.popcap.flash.framework.widgets.Widget = <any>null;
							var numChildren:number = flash.checkInt(this.mChildren.length);
							for(var i:number = flash.checkInt(0);i < numChildren; i++)
							{
								child = this.mChildren[i];
								if(child.isVisible)
								{
									canvas.getMatrix().translate(child.x,child.y);
									child.draw(canvas);
									canvas.getMatrix().translate(-child.x,-child.y);
								}
							}
						}

						public onMouseMove(x:number,y:number)
						{
							var widget:com.popcap.flash.framework.widgets.Widget = this.getChildAt(x,y);
							if(widget != this.mOverWidget)
							{
								if(this.mOverWidget != null)
								{
									this.mOverWidget.onMouseOut(x - this.mOverWidget.x,y - this.mOverWidget.y);
								}
								this.mOverWidget = widget;
								if(this.mOverWidget != null)
								{
									this.mOverWidget.onMouseOver(x - this.mOverWidget.x,y - this.mOverWidget.y);
								}
							}
							if(this.mOverWidget != null)
							{
								this.mOverWidget.onMouseMove(x - this.mOverWidget.x,y - this.mOverWidget.y);
							}
						}

						public update()
						{
							var child:com.popcap.flash.framework.widgets.Widget = <any>null;
							var numChildren:number = flash.checkInt(this.mChildren.length);
							for(var i:number = flash.checkInt(0);i < numChildren; i++)
							{
								child = this.mChildren[i];
								child.update();
							}
						}

						public onMouseDown(x:number,y:number)
						{
							if(this.mOverWidget != null)
							{
								this.mOverWidget.onMouseDown(x - this.mOverWidget.x,y - this.mOverWidget.y);
							}
						}

						public onMouseUp(x:number,y:number)
						{
							if(this.mOverWidget != null)
							{
								this.mOverWidget.onMouseUp(x - this.mOverWidget.x,y - this.mOverWidget.y);
							}
						}

						public onKeyDown(keyCode:number)
						{
							keyCode = flash.checkInt(keyCode);
						}

						public contains(x:number,y:number):boolean
						{
							var child:com.popcap.flash.framework.widgets.Widget = <any>null;
							var numChildren:number = flash.checkInt(this.mChildren.length);
							for(var i:number = flash.checkInt(0);i < numChildren; i++)
							{
								child = this.mChildren[i];
								if(<any>!(<any>!child.isEnabled || <any>!child.isVisible))
								{
									if(child.contains(x - child.x,y - child.y))
									{
										return true;
									}
								}
							}
							return false;
						}

						public onMouseOut(x:number,y:number)
						{
							if(this.mOverWidget != null)
							{
								this.mOverWidget.onMouseOut(x - this.mOverWidget.x,y - this.mOverWidget.y);
							}
							this.mOverWidget = null;
						}

						public set isEnabled(value:boolean)
						{
							var child:com.popcap.flash.framework.widgets.Widget = <any>null;
							egret.superSetter(com.popcap.flash.framework.widgets.WidgetContainer,this,"isEnabled",value);
							var numChildren:number = flash.checkInt(this.mChildren.length);
							for(var i:number = flash.checkInt(0);i < numChildren; i++)
							{
								child = this.mChildren[i];
								child.isEnabled = value;
							}
						}

						public get isEnabled():boolean{
			return egret.superGetter(com.popcap.flash.framework.widgets.WidgetContainer,this, "isEnabled");
		}
	
 						public removeChild(node:com.popcap.flash.framework.widgets.Widget)
						{
							var index:number = flash.checkInt(this.mChildren.indexOf(node));
							if(index >= 0)
							{
								this.mChildren.splice(index,1);
							}
						}

						public getChildAt(x:number,y:number):com.popcap.flash.framework.widgets.Widget
						{
							var child:com.popcap.flash.framework.widgets.Widget = <any>null;
							var numChildren:number = flash.checkInt(this.mChildren.length);
							for(var i:number = flash.checkInt(numChildren - 1);i >= 0; i--)
							{
								child = this.mChildren[i];
								if(<any>!(<any>!child.isEnabled || <any>!child.isVisible))
								{
									if(child.contains(x - child.x,y - child.y))
									{
										return child;
									}
								}
							}
							return null;
						}

						public onMouseOver(x:number,y:number)
						{
						}

						public addChild(node:com.popcap.flash.framework.widgets.Widget)
						{
							var index:number = flash.checkInt(this.mChildren.indexOf(node));
							if(index >= 0)
							{
								this.mChildren.splice(index,1);
							}
							this.mChildren.push(node);
						}

					}
				}
			}
		}
	}
}

flash.extendsClass("com.popcap.flash.framework.widgets.WidgetContainer","com.popcap.flash.framework.widgets.BaseWidget")
flash.implementsClass("com.popcap.flash.framework.widgets.WidgetContainer",["com.popcap.flash.framework.widgets.Widget"]);