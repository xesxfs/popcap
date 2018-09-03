module de {
	export module polygonal {
		export module ds {
			export module sort {
				export function dLinkedInsertionSortCmp (node:de.polygonal.ds.DListNode,cmp:Function,descending:boolean = false):de.polygonal.ds.DListNode
				{
					var p:de.polygonal.ds.DListNode = <any>null;
					var n:de.polygonal.ds.DListNode = <any>null;
					var m:de.polygonal.ds.DListNode = <any>null;
					var i:de.polygonal.ds.DListNode = <any>null;
					var val:any = undefined;
					if(<any>!node || cmp == null)
					{
						return null;
					}
					var h:de.polygonal.ds.DListNode = node;
					if(descending)
					{
						n = h.next;
						while(n)
						{
							m = n.next;
							p = n.prev;
							if(cmp(p.data,n.data) < 0)
							{
								i = p;
								while(i.prev)
								{
									if(cmp(i.prev.data,n.data) < 0)
									{
										i = i.prev;
										continue;
									}
									break;
								}
								if(m)
								{
									p.next = m;
									m.prev = p;
								}
								else
								{
									p.next = null;
								}
								if(i == h)
								{
									n.prev = null;
									n.next = i;
									i.prev = n;
									h = n;
								}
								else
								{
									n.prev = i.prev;
									i.prev.next = n;
									n.next = i;
									i.prev = n;
								}
							}
							n = m;
						}
					}
					else
					{
						n = h.next;
						while(n)
						{
							m = n.next;
							p = n.prev;
							if(cmp(p.data,n.data) > 0)
							{
								i = p;
								while(i.prev)
								{
									if(cmp(i.prev.data,n.data) > 0)
									{
										i = i.prev;
										continue;
									}
									break;
								}
								if(m)
								{
									p.next = m;
									m.prev = p;
								}
								else
								{
									p.next = null;
								}
								if(i == h)
								{
									n.prev = null;
									n.next = i;
									i.prev = n;
									h = n;
								}
								else
								{
									n.prev = i.prev;
									i.prev.next = n;
									n.next = i;
									i.prev = n;
								}
							}
							n = m;
						}
					}
					return h;
				}
			}
		}
	}
}

