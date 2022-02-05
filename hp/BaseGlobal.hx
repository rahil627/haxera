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
	//public static var entities:Array<Entity>; // vector seems like a pain to maintain
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
