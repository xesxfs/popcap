module com {
	export module popcap {
		export module flash {
			export module framework {
				export module input {
					export module keyboard {
						export class KeyCode extends egret.HashObject {
							public static LEFT:number;
							public static RIGHT_BRACE:number;
							public static FORESLASH:number;
							public static mInstance:com.popcap.flash.framework.input.keyboard.KeyCode;
							public static ACCENT_GRAVE:number;
							public static NUMPAD_DECIMAL:number;
							public static A:number;
							public static B:number;
							public static C:number;
							public static D:number;
							public static E:number;
							public static F:number;
							public static G:number;
							public static H:number;
							public static I:number;
							public static J:number;
							public static PAGE_UP:number;
							public static L:number;
							public static M:number;
							public static N:number;
							public static O:number;
							public static P:number;
							public static Q:number;
							public static PAGE_DOWN:number;
							public static S:number;
							public static T:number;
							public static U:number;
							public static V:number;
							public static W:number;
							public static X:number;
							public static R:number;
							public static Z:number;
							public static BACKSPACE:number;
							public static Y:number;
							public static SHIFT:number;
							public static K:number;
							public static MINUS:number;
							public static LEFT_BRACKET:number;
							public static ESCAPE:number;
							public static LESS_THAN:number;
							public static NUMPAD_ADD:number;
							public static UP:number;
							public static DOWN:number;
							public static F1:number;
							public static F2:number;
							public static F3:number;
							public static F4:number;
							public static F5:number;
							public static F6:number;
							public static F7:number;
							public static F8:number;
							public static F9:number;
							public static ENTER:number;
							public static INSERT:number;
							public static UNDERSCORE:number;
							public static END:number;
							public static SEMICOLON:number;
							public static COMMA:number;
							public static BACKSLASH:number;
							public static NUMPAD_MULTIPLY:number;
							public static HOME:number;
							public static F11:number;
							public static F12:number;
							public static F13:number;
							public static F14:number;
							public static SPACE:number;
							public static F15:number;
							public static GREATER_THAN:number;
							public static CONTROL:number;
							public static TILDE:number;
							public static RIGHT_BRACKET:number;
							public static NUMPAD_ENTER:number;
							public static COLON:number;
							public static TAB:number;
							public static QUESTION_MARK:number;
							public static NUM_0:number;
							public static NUM_1:number;
							public static NUM_2:number;
							public static NUM_3:number;
							public static NUM_4:number;
							public static NUM_5:number;
							public static NUM_6:number;
							public static NUM_7:number;
							public static NUM_8:number;
							public static NUM_9:number;
							public static PLUS:number;
							public static SINGLE_QUOTE:number;
							public static DELETE:number;
							public static PIPE:number;
							public static NUMPAD_DIVIDE:number;
							public static NUMPAD_1:number;
							public static NUMPAD_2:number;
							public static NUMPAD_3:number;
							public static NUMPAD_4:number;
							public static NUMPAD_5:number;
							public static NUMPAD_6:number;
							public static NUMPAD_7:number;
							public static NUMPAD_8:number;
							public static NUMPAD_9:number;
							public static PERIOD:number;
							public static CAPS_LOCK:number;
							public static NUMPAD_SUBTRACT:number;
							public static NUMPAD_0:number;
							public static EQUALS:number;
							public static LEFT_BRACE:number;
							public static RIGHT:number;
							private mCodeMap:flash.Dictionary;

							public constructor()
							{
								super();
								super();
								this.mCodeMap = new flash.Dictionary();
								this.mCodeMap.setItem("LEFT",com.popcap.flash.framework.input.keyboard.KeyCode.LEFT);
								this.mCodeMap.setItem("RIGHT",com.popcap.flash.framework.input.keyboard.KeyCode.RIGHT);
								this.mCodeMap.setItem("SHIFT",com.popcap.flash.framework.input.keyboard.KeyCode.SHIFT);
								this.mCodeMap.setItem("CONTROL",com.popcap.flash.framework.input.keyboard.KeyCode.CONTROL);
								this.mCodeMap.setItem("TAB",com.popcap.flash.framework.input.keyboard.KeyCode.TAB);
								this.mCodeMap.setItem("CAPS_LOCK",com.popcap.flash.framework.input.keyboard.KeyCode.CAPS_LOCK);
								this.mCodeMap.setItem("ENTER",com.popcap.flash.framework.input.keyboard.KeyCode.ENTER);
								this.mCodeMap.setItem("ESCAPE",com.popcap.flash.framework.input.keyboard.KeyCode.ESCAPE);
								this.mCodeMap.setItem("END",com.popcap.flash.framework.input.keyboard.KeyCode.END);
								this.mCodeMap.setItem("HOME",com.popcap.flash.framework.input.keyboard.KeyCode.HOME);
								this.mCodeMap.setItem("INSERT",com.popcap.flash.framework.input.keyboard.KeyCode.INSERT);
								this.mCodeMap.setItem("PAGE_UP",com.popcap.flash.framework.input.keyboard.KeyCode.PAGE_UP);
								this.mCodeMap.setItem("PAGE_DOWN",com.popcap.flash.framework.input.keyboard.KeyCode.PAGE_DOWN);
								this.mCodeMap.setItem("DELETE",com.popcap.flash.framework.input.keyboard.KeyCode.DELETE);
								this.mCodeMap.setItem("BACKSPACE",com.popcap.flash.framework.input.keyboard.KeyCode.BACKSPACE);
								this.mCodeMap.setItem("SPACE",com.popcap.flash.framework.input.keyboard.KeyCode.SPACE);
								this.mCodeMap.setItem("F1",com.popcap.flash.framework.input.keyboard.KeyCode.F1);
								this.mCodeMap.setItem("F2",com.popcap.flash.framework.input.keyboard.KeyCode.F2);
								this.mCodeMap.setItem("F3",com.popcap.flash.framework.input.keyboard.KeyCode.F3);
								this.mCodeMap.setItem("F4",com.popcap.flash.framework.input.keyboard.KeyCode.F4);
								this.mCodeMap.setItem("F5",com.popcap.flash.framework.input.keyboard.KeyCode.F5);
								this.mCodeMap.setItem("F6",com.popcap.flash.framework.input.keyboard.KeyCode.F6);
								this.mCodeMap.setItem("F7",com.popcap.flash.framework.input.keyboard.KeyCode.F7);
								this.mCodeMap.setItem("F8",com.popcap.flash.framework.input.keyboard.KeyCode.F8);
								this.mCodeMap.setItem("F9",com.popcap.flash.framework.input.keyboard.KeyCode.F9);
								this.mCodeMap.setItem("F11",com.popcap.flash.framework.input.keyboard.KeyCode.F11);
								this.mCodeMap.setItem("F12",com.popcap.flash.framework.input.keyboard.KeyCode.F12);
								this.mCodeMap.setItem("F13",com.popcap.flash.framework.input.keyboard.KeyCode.F13);
								this.mCodeMap.setItem("F14",com.popcap.flash.framework.input.keyboard.KeyCode.F14);
								this.mCodeMap.setItem("F15",com.popcap.flash.framework.input.keyboard.KeyCode.F15);
								this.mCodeMap.setItem("NUMPAD_0",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_0);
								this.mCodeMap.setItem("NUMPAD_1",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_1);
								this.mCodeMap.setItem("NUMPAD_2",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_2);
								this.mCodeMap.setItem("NUMPAD_3",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_3);
								this.mCodeMap.setItem("NUMPAD_4",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_4);
								this.mCodeMap.setItem("NUMPAD_5",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_5);
								this.mCodeMap.setItem("NUMPAD_6",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_6);
								this.mCodeMap.setItem("NUMPAD_7",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_7);
								this.mCodeMap.setItem("NUMPAD_8",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_8);
								this.mCodeMap.setItem("NUMPAD_9",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_9);
								this.mCodeMap.setItem("NUMPAD_MULTIPLY",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_MULTIPLY);
								this.mCodeMap.setItem("NUMPAD_ADD",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_ADD);
								this.mCodeMap.setItem("NUMPAD_ENTER",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_ENTER);
								this.mCodeMap.setItem("NUMPAD_SUBTRACT",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_SUBTRACT);
								this.mCodeMap.setItem("NUMPAD_DECIMAL",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_DECIMAL);
								this.mCodeMap.setItem("NUMPAD_DIVIDE",com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_DIVIDE);
								this.mCodeMap.setItem("NUM_0",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_0);
								this.mCodeMap.setItem("NUM_1",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_1);
								this.mCodeMap.setItem("NUM_2",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_2);
								this.mCodeMap.setItem("NUM_3",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_3);
								this.mCodeMap.setItem("NUM_4",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_4);
								this.mCodeMap.setItem("NUM_5",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_5);
								this.mCodeMap.setItem("NUM_6",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_6);
								this.mCodeMap.setItem("NUM_7",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_7);
								this.mCodeMap.setItem("NUM_8",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_8);
								this.mCodeMap.setItem("NUM_9",com.popcap.flash.framework.input.keyboard.KeyCode.NUM_9);
								this.mCodeMap.setItem("A",com.popcap.flash.framework.input.keyboard.KeyCode.A);
								this.mCodeMap.setItem("B",com.popcap.flash.framework.input.keyboard.KeyCode.B);
								this.mCodeMap.setItem("C",com.popcap.flash.framework.input.keyboard.KeyCode.C);
								this.mCodeMap.setItem("D",com.popcap.flash.framework.input.keyboard.KeyCode.D);
								this.mCodeMap.setItem("E",com.popcap.flash.framework.input.keyboard.KeyCode.E);
								this.mCodeMap.setItem("F",com.popcap.flash.framework.input.keyboard.KeyCode.F);
								this.mCodeMap.setItem("G",com.popcap.flash.framework.input.keyboard.KeyCode.G);
								this.mCodeMap.setItem("H",com.popcap.flash.framework.input.keyboard.KeyCode.H);
								this.mCodeMap.setItem("I",com.popcap.flash.framework.input.keyboard.KeyCode.I);
								this.mCodeMap.setItem("J",com.popcap.flash.framework.input.keyboard.KeyCode.J);
								this.mCodeMap.setItem("K",com.popcap.flash.framework.input.keyboard.KeyCode.K);
								this.mCodeMap.setItem("L",com.popcap.flash.framework.input.keyboard.KeyCode.L);
								this.mCodeMap.setItem("M",com.popcap.flash.framework.input.keyboard.KeyCode.M);
								this.mCodeMap.setItem("N",com.popcap.flash.framework.input.keyboard.KeyCode.N);
								this.mCodeMap.setItem("O",com.popcap.flash.framework.input.keyboard.KeyCode.O);
								this.mCodeMap.setItem("P",com.popcap.flash.framework.input.keyboard.KeyCode.P);
								this.mCodeMap.setItem("Q",com.popcap.flash.framework.input.keyboard.KeyCode.Q);
								this.mCodeMap.setItem("R",com.popcap.flash.framework.input.keyboard.KeyCode.R);
								this.mCodeMap.setItem("S",com.popcap.flash.framework.input.keyboard.KeyCode.S);
								this.mCodeMap.setItem("T",com.popcap.flash.framework.input.keyboard.KeyCode.T);
								this.mCodeMap.setItem("U",com.popcap.flash.framework.input.keyboard.KeyCode.U);
								this.mCodeMap.setItem("V",com.popcap.flash.framework.input.keyboard.KeyCode.V);
								this.mCodeMap.setItem("W",com.popcap.flash.framework.input.keyboard.KeyCode.W);
								this.mCodeMap.setItem("X",com.popcap.flash.framework.input.keyboard.KeyCode.X);
								this.mCodeMap.setItem("Y",com.popcap.flash.framework.input.keyboard.KeyCode.Y);
								this.mCodeMap.setItem("Z",com.popcap.flash.framework.input.keyboard.KeyCode.Z);
								this.mCodeMap.setItem("SEMICOLON",com.popcap.flash.framework.input.keyboard.KeyCode.SEMICOLON);
								this.mCodeMap.setItem("COLON",com.popcap.flash.framework.input.keyboard.KeyCode.COLON);
								this.mCodeMap.setItem("EQUALS",com.popcap.flash.framework.input.keyboard.KeyCode.EQUALS);
								this.mCodeMap.setItem("PLUS",com.popcap.flash.framework.input.keyboard.KeyCode.PLUS);
								this.mCodeMap.setItem("MINUS",com.popcap.flash.framework.input.keyboard.KeyCode.MINUS);
								this.mCodeMap.setItem("UNDERSCORE",com.popcap.flash.framework.input.keyboard.KeyCode.UNDERSCORE);
								this.mCodeMap.setItem("FORESLASH",com.popcap.flash.framework.input.keyboard.KeyCode.FORESLASH);
								this.mCodeMap.setItem("QUESTION_MARK",com.popcap.flash.framework.input.keyboard.KeyCode.QUESTION_MARK);
								this.mCodeMap.setItem("ACCENT_GRAVE",com.popcap.flash.framework.input.keyboard.KeyCode.ACCENT_GRAVE);
								this.mCodeMap.setItem("TILDE",com.popcap.flash.framework.input.keyboard.KeyCode.TILDE);
								this.mCodeMap.setItem("LEFT_BRACKET",com.popcap.flash.framework.input.keyboard.KeyCode.LEFT_BRACKET);
								this.mCodeMap.setItem("LEFT_BRACE",com.popcap.flash.framework.input.keyboard.KeyCode.LEFT_BRACE);
								this.mCodeMap.setItem("BACKSLASH",com.popcap.flash.framework.input.keyboard.KeyCode.BACKSLASH);
								this.mCodeMap.setItem("PIPE",com.popcap.flash.framework.input.keyboard.KeyCode.PIPE);
								this.mCodeMap.setItem("RIGHT_BRACKET",com.popcap.flash.framework.input.keyboard.KeyCode.RIGHT_BRACKET);
								this.mCodeMap.setItem("RIGHT_BRACE",com.popcap.flash.framework.input.keyboard.KeyCode.RIGHT_BRACE);
								this.mCodeMap.setItem("SINGLE_QUOTE",com.popcap.flash.framework.input.keyboard.KeyCode.SINGLE_QUOTE);
								this.mCodeMap.setItem("COMMA",com.popcap.flash.framework.input.keyboard.KeyCode.COMMA);
								this.mCodeMap.setItem("LESS_THAN",com.popcap.flash.framework.input.keyboard.KeyCode.LESS_THAN);
								this.mCodeMap.setItem("PERIOD",com.popcap.flash.framework.input.keyboard.KeyCode.PERIOD);
								this.mCodeMap.setItem("GREATER_THAN",com.popcap.flash.framework.input.keyboard.KeyCode.GREATER_THAN);
							}

							public static GetCodeFromString(str:string):number
							{
								var id:string = str.toUpperCase();
								var code:number = flash.checkInt(com.popcap.flash.framework.input.keyboard.KeyCode.GetInstance().mCodeMap.getItem(id));
								return code;
							}

							private static GetInstance():com.popcap.flash.framework.input.keyboard.KeyCode
							{
								if(com.popcap.flash.framework.input.keyboard.KeyCode.mInstance == null)
								{
									com.popcap.flash.framework.input.keyboard.KeyCode.mInstance = new com.popcap.flash.framework.input.keyboard.KeyCode();
								}
								return com.popcap.flash.framework.input.keyboard.KeyCode.mInstance;
							}

						}
					}
				}
			}
		}
	}
}

com.popcap.flash.framework.input.keyboard.KeyCode.LEFT = flash.Keyboard.LEFT;
com.popcap.flash.framework.input.keyboard.KeyCode.RIGHT_BRACE = 221;
com.popcap.flash.framework.input.keyboard.KeyCode.FORESLASH = 191;
com.popcap.flash.framework.input.keyboard.KeyCode.ACCENT_GRAVE = 192;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_DECIMAL = flash.Keyboard.NUMPAD_DECIMAL;
com.popcap.flash.framework.input.keyboard.KeyCode.A = 65;
com.popcap.flash.framework.input.keyboard.KeyCode.B = 66;
com.popcap.flash.framework.input.keyboard.KeyCode.C = 67;
com.popcap.flash.framework.input.keyboard.KeyCode.D = 68;
com.popcap.flash.framework.input.keyboard.KeyCode.E = 69;
com.popcap.flash.framework.input.keyboard.KeyCode.F = 70;
com.popcap.flash.framework.input.keyboard.KeyCode.G = 71;
com.popcap.flash.framework.input.keyboard.KeyCode.H = 72;
com.popcap.flash.framework.input.keyboard.KeyCode.I = 73;
com.popcap.flash.framework.input.keyboard.KeyCode.J = 74;
com.popcap.flash.framework.input.keyboard.KeyCode.PAGE_UP = flash.Keyboard.PAGE_UP;
com.popcap.flash.framework.input.keyboard.KeyCode.L = 76;
com.popcap.flash.framework.input.keyboard.KeyCode.M = 77;
com.popcap.flash.framework.input.keyboard.KeyCode.N = 78;
com.popcap.flash.framework.input.keyboard.KeyCode.O = 79;
com.popcap.flash.framework.input.keyboard.KeyCode.P = 80;
com.popcap.flash.framework.input.keyboard.KeyCode.Q = 81;
com.popcap.flash.framework.input.keyboard.KeyCode.PAGE_DOWN = flash.Keyboard.PAGE_DOWN;
com.popcap.flash.framework.input.keyboard.KeyCode.S = 83;
com.popcap.flash.framework.input.keyboard.KeyCode.T = 84;
com.popcap.flash.framework.input.keyboard.KeyCode.U = 85;
com.popcap.flash.framework.input.keyboard.KeyCode.V = 86;
com.popcap.flash.framework.input.keyboard.KeyCode.W = 87;
com.popcap.flash.framework.input.keyboard.KeyCode.X = 88;
com.popcap.flash.framework.input.keyboard.KeyCode.R = 82;
com.popcap.flash.framework.input.keyboard.KeyCode.Z = 90;
com.popcap.flash.framework.input.keyboard.KeyCode.BACKSPACE = flash.Keyboard.BACKSPACE;
com.popcap.flash.framework.input.keyboard.KeyCode.Y = 89;
com.popcap.flash.framework.input.keyboard.KeyCode.SHIFT = flash.Keyboard.SHIFT;
com.popcap.flash.framework.input.keyboard.KeyCode.K = 75;
com.popcap.flash.framework.input.keyboard.KeyCode.MINUS = 189;
com.popcap.flash.framework.input.keyboard.KeyCode.LEFT_BRACKET = 219;
com.popcap.flash.framework.input.keyboard.KeyCode.ESCAPE = flash.Keyboard.ESCAPE;
com.popcap.flash.framework.input.keyboard.KeyCode.LESS_THAN = 188;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_ADD = flash.Keyboard.NUMPAD_ADD;
com.popcap.flash.framework.input.keyboard.KeyCode.UP = flash.Keyboard.UP;
com.popcap.flash.framework.input.keyboard.KeyCode.DOWN = flash.Keyboard.DOWN;
com.popcap.flash.framework.input.keyboard.KeyCode.F1 = flash.Keyboard.F1;
com.popcap.flash.framework.input.keyboard.KeyCode.F2 = flash.Keyboard.F2;
com.popcap.flash.framework.input.keyboard.KeyCode.F3 = flash.Keyboard.F3;
com.popcap.flash.framework.input.keyboard.KeyCode.F4 = flash.Keyboard.F4;
com.popcap.flash.framework.input.keyboard.KeyCode.F5 = flash.Keyboard.F5;
com.popcap.flash.framework.input.keyboard.KeyCode.F6 = flash.Keyboard.F6;
com.popcap.flash.framework.input.keyboard.KeyCode.F7 = flash.Keyboard.F7;
com.popcap.flash.framework.input.keyboard.KeyCode.F8 = flash.Keyboard.F8;
com.popcap.flash.framework.input.keyboard.KeyCode.F9 = flash.Keyboard.F9;
com.popcap.flash.framework.input.keyboard.KeyCode.ENTER = flash.Keyboard.ENTER;
com.popcap.flash.framework.input.keyboard.KeyCode.INSERT = flash.Keyboard.INSERT;
com.popcap.flash.framework.input.keyboard.KeyCode.UNDERSCORE = 189;
com.popcap.flash.framework.input.keyboard.KeyCode.END = flash.Keyboard.END;
com.popcap.flash.framework.input.keyboard.KeyCode.SEMICOLON = 186;
com.popcap.flash.framework.input.keyboard.KeyCode.COMMA = 188;
com.popcap.flash.framework.input.keyboard.KeyCode.BACKSLASH = 220;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_MULTIPLY = flash.Keyboard.NUMPAD_MULTIPLY;
com.popcap.flash.framework.input.keyboard.KeyCode.HOME = flash.Keyboard.HOME;
com.popcap.flash.framework.input.keyboard.KeyCode.F11 = flash.Keyboard.F11;
com.popcap.flash.framework.input.keyboard.KeyCode.F12 = flash.Keyboard.F12;
com.popcap.flash.framework.input.keyboard.KeyCode.F13 = flash.Keyboard.F13;
com.popcap.flash.framework.input.keyboard.KeyCode.F14 = flash.Keyboard.F14;
com.popcap.flash.framework.input.keyboard.KeyCode.SPACE = flash.Keyboard.SPACE;
com.popcap.flash.framework.input.keyboard.KeyCode.F15 = flash.Keyboard.F15;
com.popcap.flash.framework.input.keyboard.KeyCode.GREATER_THAN = 190;
com.popcap.flash.framework.input.keyboard.KeyCode.CONTROL = flash.Keyboard.CONTROL;
com.popcap.flash.framework.input.keyboard.KeyCode.TILDE = 192;
com.popcap.flash.framework.input.keyboard.KeyCode.RIGHT_BRACKET = 221;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_ENTER = flash.Keyboard.NUMPAD_ENTER;
com.popcap.flash.framework.input.keyboard.KeyCode.COLON = 186;
com.popcap.flash.framework.input.keyboard.KeyCode.TAB = flash.Keyboard.TAB;
com.popcap.flash.framework.input.keyboard.KeyCode.QUESTION_MARK = 191;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_0 = 48;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_1 = 49;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_2 = 50;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_3 = 51;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_4 = 52;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_5 = 53;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_6 = 54;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_7 = 55;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_8 = 56;
com.popcap.flash.framework.input.keyboard.KeyCode.NUM_9 = 57;
com.popcap.flash.framework.input.keyboard.KeyCode.PLUS = 187;
com.popcap.flash.framework.input.keyboard.KeyCode.SINGLE_QUOTE = 222;
com.popcap.flash.framework.input.keyboard.KeyCode.DELETE = flash.Keyboard.DELETE;
com.popcap.flash.framework.input.keyboard.KeyCode.PIPE = 220;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_DIVIDE = flash.Keyboard.NUMPAD_DIVIDE;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_1 = flash.Keyboard.NUMPAD_1;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_2 = flash.Keyboard.NUMPAD_2;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_3 = flash.Keyboard.NUMPAD_3;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_4 = flash.Keyboard.NUMPAD_4;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_5 = flash.Keyboard.NUMPAD_5;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_6 = flash.Keyboard.NUMPAD_6;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_7 = flash.Keyboard.NUMPAD_7;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_8 = flash.Keyboard.NUMPAD_8;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_9 = flash.Keyboard.NUMPAD_9;
com.popcap.flash.framework.input.keyboard.KeyCode.PERIOD = 190;
com.popcap.flash.framework.input.keyboard.KeyCode.CAPS_LOCK = flash.Keyboard.CAPS_LOCK;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_SUBTRACT = flash.Keyboard.NUMPAD_SUBTRACT;
com.popcap.flash.framework.input.keyboard.KeyCode.NUMPAD_0 = flash.Keyboard.NUMPAD_0;
com.popcap.flash.framework.input.keyboard.KeyCode.EQUALS = 187;
com.popcap.flash.framework.input.keyboard.KeyCode.LEFT_BRACE = 219;
com.popcap.flash.framework.input.keyboard.KeyCode.RIGHT = flash.Keyboard.RIGHT;