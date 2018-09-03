module de {
	export module polygonal {
		export module ds {
			export interface Iterator {
				start();
				data:any;
				next():any;
				hasNext():boolean;
			}
		}
	}
}

