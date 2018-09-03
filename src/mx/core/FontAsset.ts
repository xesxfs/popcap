module mx {
	export module core {
		export class FontAsset extends flash.Font implements mx.core.IFlexAsset {
			public static VERSION:string;

			public constructor()
			{
				super();
			}

		}
	}
}

mx.core.FontAsset.VERSION = "3.3.0.4852";
flash.extendsClass("mx.core.FontAsset","flash.Font")
flash.implementsClass("mx.core.FontAsset",["mx.core.IFlexAsset"]);