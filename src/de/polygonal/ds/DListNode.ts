module de {
	export module polygonal {
		export module ds {
			export class DListNode extends egret.HashObject implements de.polygonal.ds.LinkedListNode {
				public prev:de.polygonal.ds.DListNode;
				public next:de.polygonal.ds.DListNode;
				public data:any;

				public constructor(obj:any)
				{
					super();
					super();
					this.next = this.prev = null;
					this.data = obj;
				}

				public unlink()
				{
					if(this.prev)
					{
						this.prev.next = this.next;
					}
					if(this.next)
					{
						this.next.prev = this.prev;
					}
					this.next = this.prev = null;
				}

				public insertAfter(node:de.polygonal.ds.DListNode)
				{
					node.next = this.next;
					node.prev = this;
					if(this.next)
					{
						this.next.prev = node;
					}
					this.next = node;
				}

				public insertBefore(node:de.polygonal.ds.DListNode)
				{
					node.next = this;
					node.prev = this.prev;
					if(this.prev)
					{
						this.prev.next = node;
					}
					this.prev = node;
				}

				public toString():string
				{
					return "[DListNode, data=" + this.data + "]";
				}

			}
		}
	}
}

flash.implementsClass("de.polygonal.ds.DListNode",["de.polygonal.ds.LinkedListNode"]);