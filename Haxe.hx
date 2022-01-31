package ra; // is this not implied by the path name?

// HaxeHelper.hx?
// i mean... there's only a haxe package, not a class, soooo... ok?
// re-usable code for the haxe programming language
// including the the use of the standard library that comes with it
class Haxe {
	// public static var

	// TODO: what about inline function?
	public static function randomHex():Int {
		return Math.round(Math.random() * 0xFFFFFF);
		// TODO: does haxe have (Int)float-number feature?
		// TODO: haxe.std not showing up in autocompletion...
	} 
}
