module de {
	export module polygonal {
		export module ds {
			export class DListIterator extends egret.HashObject implements de.polygonal.ds.Iterator {
				public node:de.polygonal.ds.DListNode;
				public list:DLinkedList;

				public constructor(list:DLinkedList,node:de.polygonal.ds.DListNode = null)
				{
					super();
					super();
					this.list = list;
					this.node = node;
				}

				public remove():boolean
				{
					return this.list["remove"](this);
				}

				public back()
				{
					if(this.node)
					{
						this.node = this.node.prev;
					}
				}

				public start()
				{
					this.node = this.list["head"];
				}

				public get data():any
				{
					if(this.node)
					{
						return this.node.data;
					}
					return null;
				}

				public forth()
				{
					if(this.node)
					{
						this.node = this.node.next;
					}
				}

				public toString():string
				{
					return "{DListIterator, data=" + (<any>!<any>!this.node?this.node.data:"null") + "}";
				}

				public hasNext():boolean
				{
					return flash.Boolean(this.node);
				}

				public valid():boolean
				{
					return flash.Boolean(this.node);
				}

				public next():any
				{
					var obj:any = undefined;
					if(this.hasNext())
					{
						obj = this.node.data;
						this.node = this.node.next;
						return obj;
					}
					return null;
				}

				public set data(obj:any)
				{
					this.node.data = obj;
				}

				public end()
				{
					this.node = this.list["tail"];
				}

			}
		}
	}
}

flash.implementsClass("de.polygonal.ds.DListIterator",["de.polygonal.ds.Iterator"]);