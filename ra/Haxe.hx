package ra; 

import hxd.Math;
import haxe.Int64;

// a helper/utility ds for the haxe programming language (including std lib)
// more for my own personal use / not useful to others
// note to self: there should no dependencies beyond the haxe package
class Haxe { // todo: HaxeHelper.hx? HH import alias

	public static inline function randomInt(max:Int = Int64.high):Int { // TODO: couldn't find 32-bit max, will crash on 32-bit systems!!!
		return std.int(Math.random(max));
	}	
	
	public static inline function randomHex():Int {
		return randomInt(0xFFFFFF);
	}
	
	
}
