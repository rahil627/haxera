package ra; // is this not implied by the path name?

import haxe.Math;

// HaxeHelper.hx? HH import alias
// re-usable code for the haxe programming language (including std lib)
// more for my own personal use / not useful to others
// note to self: there should be no other dependencies
class Haxe {

	public static inline function randomHex():Int {
		return Math.randomInt(0xFFFFFF);
	}
	
	
}
