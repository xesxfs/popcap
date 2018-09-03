module de {
	export module polygonal {
		export module ds {
			export interface Collection {
				size:number;
				isEmpty():boolean;
				getIterator():de.polygonal.ds.Iterator;
				clear();
				toArray():Array<any>;
				contains(param1:any):boolean;
			}
		}
	}
}

