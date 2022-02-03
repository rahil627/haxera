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


	// can just throw all math functions here

	// what about geometry ds, like Point, Rectangle (Bounds?), etc.?
	// nah, is there even a standard Point ds? TODO: look for Point, or use poly2tri.Point?
	// maybe better to not use extra ds'es, and keep it simple with Int/Float x/y/z/r
	// ...but surely, eventually, people use vector math even for simple 2d movement?..

	// collision functions already exists in Object, i don't think there's a need for--
	// the FP/HXP helper functions Entity.collidesWith(Entity).
	// it would just be an extra layer of abstraction of Object.intersectsWith (or whatever it is)
	// e.s.collidesWith(e.s) vs e.collidesWith(e)
}
