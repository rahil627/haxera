package ra; 

import hxd.Math;

// a helper/utility ds for the haxe programming language (including std lib)
// more for my own personal use / not useful to others
// note to self: there should no dependencies beyond the haxe package
class Haxe { // todo: HaxeHelper.hx? HH import alias

	public static inline function randomInt(max:Int):Int { // TODO: cannot find 32-bit max
		return Std.int(Math.random(max));
	}
	
	public static inline function randomHex():Int {
		return randomInt(0xFFFFFF);
	}
	
	
}
