// maybe better not to explicitly state the package,
// and instead let the file-path decide

import hxd.Math;

class MathExtensions {
	// this was taken from the Haxe docs / code book
	/** Returns a random number between a (inclusive) and b (exclusive). */
	public static function randomBetween(cl:Class<Math>, a:Int, b:Int) {
		    var diff:Int = b - a;
			    return a + Math.floor(Math.random() * diff);
				  
	}

	// can add degrees variants of math functions here

	// maybe can just throw in all math functions here?
	// including all of the functions in Point	
}
