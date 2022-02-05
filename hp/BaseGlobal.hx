// just an optional bare-bones global class to copy to begin a new project with
// rename it to something short, or create a short alias in import.hx
// store references to commonly-used data structures here
// the scope of this is local to this specific game
// TODO: singleton vs static
class BaseGlobals {
	// might have a problem disposing these...
	// nahhh, it's alright... just provide a function to clear them all
	// i mean, they're static, can't really delete them anyway... whether they're here or in Main/BaseApp..
	// only keep references to these here
	
	// this is the only important data structure to choose
	// vector seems like a pain to maintain (you must know the index to use v.set(), soooo... array vs list
	// array prolly can be optimized, but i'd rather choose list and never worry about it until the time comes :)
	//public static var entities:List<Entity>;
	//public static var world:Layer;
	//public static var map1:Map<Int, Entity>; // ?? a map for searching by ID? log(n) complexity for access?
	//public static var canvas:h2d.Graphics;  // a top-level thing to draw to

	// constants
	//public static inline final laserWidth = 50;

}

/*
// can be confused with Layers (with an 's')
enum Layer {
	background;
	players;
	projectiles;
}
*/
