module de {
	export module polygonal {
		export module ds {
			export module sort {
				export function dLinkedMergeSort (node:de.polygonal.ds.DListNode,descending:boolean = false):de.polygonal.ds.DListNode
				{
					var p:de.polygonal.ds.DListNode = <any>null;
					var q:de.polygonal.ds.DListNode = <any>null;
					var e:de.polygonal.ds.DListNode = <any>null;
					var tail:de.polygonal.ds.DListNode = <any>null;
					var nmerges:number = flash.checkInt(0);
					var psize:number = flash.checkInt(0);
					var qsize:number = flash.checkInt(0);
					var i:number = flash.checkInt(0);
					if(<any>!node)
					{
						return null;
					}
					var h:de.polygonal.ds.DListNode = node;
					var insize:any = 1;
					if(descending)
					{
						while(true)
						{
							p = h;
							h = tail = null;
							nmerges = 0;
							while(p)
							{
								nmerges++;
								i = 0;
								psize = 0;
								q = p;
								while(i < insize)
								{
									psize++;
									q = q.next;
									if(q)
									{
										i++;
										continue;
									}
									break;
								}
								qsize = insize;
								while(psize > 0 || qsize > 0 && q)
								{
									if(psize == 0)
									{
										e = q;
										q = q.next;
										qsize--;
									}
									else if(qsize == 0 || <any>!q)
									{
										e = p;
										p = p.next;
										psize--;
									}
									else if(p.data - q.data >= 0)
									{
										e = p;
										p = p.next;
										psize--;
									}
									else
									{
										e = q;
										q = q.next;
										qsize--;
									}
									if(tail)
									{
										tail.next = e;
									}
									else
									{
										h = e;
									}
									e.prev = tail;
									tail = e;
								}
								p = q;
							}
							tail.next = null;
							if(nmerges <= 1)
							{
								break;
							}
							insize = insize << 1;
						}
						return h;
					}
					while(true)
					{
						p = h;
						h = tail = null;
						nmerges = 0;
						while(p)
						{
							nmerges++;
							i = 0;
							psize = 0;
							q = p;
							while(i < insize)
							{
								psize++;
								q = q.next;
								if(q)
								{
									i++;
									continue;
								}
								break;
							}
							qsize = insize;
							while(psize > 0 || qsize > 0 && q)
							{
								if(psize == 0)
								{
									e = q;
									q = q.next;
									qsize--;
								}
								else if(qsize == 0 || <any>!q)
								{
									e = p;
									p = p.next;
									psize--;
								}
								else if(p.data - q.data <= 0)
								{
									e = p;
									p = p.next;
									psize--;
								}
								else
								{
									e = q;
									q = q.next;
									qsize--;
								}
								if(tail)
								{
									tail.next = e;
								}
								else
								{
									h = e;
								}
								e.prev = tail;
								tail = e;
							}
							p = q;
						}
						tail.next = null;
						if(nmerges <= 1)
						{
							break;
						}
						insize = insize << 1;
					}
					return h;
				}
			}
		}
	}
}

