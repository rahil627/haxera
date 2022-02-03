package ra; // is this not implied by the path name?

// HaxeHelper.hx? HH import alias
// i mean... there's only a haxe package, not a class, soooo...
// re-usable code for the haxe programming language (including std lib)
// there should be no other dependencies
// more for my own personal use / not useful to others
class Haxe {

	// hmm, here vs MathEx
	public static inline function randomHex():Int {
		return Haxe.randomInt(0xFFFFFF);
	}
	
	
}
