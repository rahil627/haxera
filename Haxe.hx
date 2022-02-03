package ra; // is this not implied by the path name?

// HaxeHelper.hx? HH import alias
// i mean... there's only a haxe package, not a class, soooo...
// re-usable code for the haxe programming language
// including the use of the standard library that comes with it
// there should be no other dependencies
class Haxe {
	public static inline function randomInt():Int {
		return Math.round(Math.random());
	}
	
	public static inline function randomHex():Int {
		return Haxe.randomInt() * 0xFFFFFF; //
	}
	
	
}
