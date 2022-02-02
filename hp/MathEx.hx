package ra.hp;

// TODO: maybe better not to explicitly state the package,
// and instead let the file-path decide

import hxd.Math;

// note: don't use 'import', use 'using': using ra.hp.MathEx
// this is less convenient than i thought...
// it might just be better to have a normal static class :/
// also, vim / vaxe / ctags can't generate autocomplete for it
// maybe best to limit static extensions to only when i need to add a few things
// for now, just put everything under my own helper classes
class MathEx {
	// this was taken from the Haxe docs / code book
	/** Returns a random number between a (inclusive) and b (exclusive). */
	public static function randomBetween(cl:Class<Math>, a:Int, b:Int) {
		return a + Math.floor(Math.random() * (b - a));
	}
	/*
	public inline static function random( max = 1.0  ) {
		return std.Math.random() * max;
					
	}
	*/

	}


	// maybe can just throw in all math functions here?
	// including functions found in Point?

}
