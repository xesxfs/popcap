module mx {
	export module core {
		export class ByteArrayAsset extends flash.ByteArray implements mx.core.IFlexAsset {
			public static VERSION:string;

			public constructor()
			{
				super();
			}

		}
	}
}

mx.core.ByteArrayAsset.VERSION = "3.3.0.4852";
flash.extendsClass("mx.core.ByteArrayAsset","flash.ByteArray")
flash.implementsClass("mx.core.ByteArrayAsset",["mx.core.IFlexAsset"]);