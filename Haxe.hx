package ra; // is this not implied by the path name?

// HaxeHelper.hx?
// i mean... there's only a haxe package, not a class, soooo...
// re-usable code for the haxe programming language
// including the use of the standard library that comes with it
// there should be no other dependencies
class Haxe {
	// public static var

	// TODO: what about inline function?
	public static function randomHex():Int {
		return Math.round(Math.random() * 0xFFFFFF);
	} 
}
