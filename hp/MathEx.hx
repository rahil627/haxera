package hp; // TODO: still not sure if this should be in hp or my own personal libs..

// TODO: maybe better not to explicitly state the package,
// and instead let the file-path decide

import hxd.Math;

// note: don't use 'import', use 'using': using ra.hp.MathEx
// somes IDEs cannot generate tags / autocomplete for static extensions
// it might just be more convenient to throw it in a normal global static class :/
class MathEx { // std.Math < hxd.Math < ra.hp.MathEx
	
	// this was taken from the Haxe docs / code book
	// returns a random number between a (inclusive) and b (exclusive)
	public static function randomBetween(cl:Class<Math>, a:Int, b:Int) { // wtf? no return type?
		return a + Math.floor(Math.random() * (b - a));
	}

	public static inline function randomInt(cl:Class<Math>, max = Int64.high):Int { // TODO: 32bit max?
		return std.int(Math.random(max));
	}
	
	public static inline function randomHex(cl:Class<Math>):Int {
		return Haxe.randomInt(0xFFFFFF);
	}


	// can just throw all math functions here

	// what about geometry ds, like Point, Rectangle (Bounds?), etc.?
	// maybe better to not use extra ds'es, and keep it simple with just Int/Float
	// ...but surely, eventually, people use vector math even for simple 2d movement?..


	// collision functions already exists in Object, i don't think there's a need for--
	// the FP/HXP helper functions Entity.collidesWith(Entity).
	// it would just be an extra layer of abstraction of Object.intersectsWith (or whatever it is)
	// e.s.collidesWith(e.s) vs e.collidesWith(e)
}
