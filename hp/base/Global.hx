package ra.hp.base

// just an optional bare-bones global class to copy to begin a new project with
// rename it to something short, or create a short alias in import.hx
// store references to commonly-used data structures here
// the scope of this is local to this specific game
// TODO: singleton vs static
class Global {
	// might have a problem disposing these...
	// nahhh, it's alright... just provide a function to clear them all
	// i mean, they're static, can't really delete them anyway... whether they're here or in Main/BaseApp..
	// only keep references to these here
	
	// i think this is the only important data structure to choose
	// vector seems like a pain to maintain--you must know the index to use v.set()--, soooo... array vs list vs map
	// the simplest and laziest way is to just use list and forget about it :)
	// given that you are constantly adding and removing stuff all the time, maybe it's the best too?
	// then comes arrays vs map
	// array is O(1) access complexity vs O(log(n)) access complexity
	// ..but really tho, it'd be limited to things you're constantly accessing, and if you're constantly accessing them..,
	// well, you'd probably be holding pointers/references to those things anyway (i.e. players)!, soooo...:
	//public static var entities:List<Entity>;
	
	// maybe later on, can use stuff like this:
	//public static var players:Vector(PlayerEntity) // just an example
	//public static var mcaEntities:Map<Int, Entity>; // an optional map to search stuff by id
	
	//public static var world:Layer;
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
