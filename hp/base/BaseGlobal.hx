package ra.hp.base // DELETE ME!!

// just an optional bare-bones global class to copy to begin a new project with
// rename it to something short, or create a short alias in import.hx
// store references to commonly-used data structures here
// the scope of this is local to this specific game
// TODO: singleton vs static
class BaseGlobal {
	// only keep references to these here
	
	// i think this is the only important data structure to choose
	// give that you're constantly adding ' removing stuff, such as projectiles, then
	// List is not only the best option, but the simplest too!
	// array / vector and map are generally for optimization purposes only
	// array is O(1) access complexity vs O(log(n)) access complexity
	// ..but really tho, it'd be limited to things you're constantly accessing,
	// and if you're already constantly accessing them.., well,
	// you'd probably already have stored pointers/references to those things anyway (i.e. players)!, soooo...:
	//public static var entities:List<BaseEntity>;
	
	// for example, in special cases can use stuff like this:
	//public static var players:Vector<Player>; // if the max amount of players never change, otherwise:
	//public static var players:Array<Player>
	//public static var entitiesBackpack:Map<Int, TargetEntities>; // to search for commonly-searched stuff by id (key)	

	//public static var world:Layer;
	//public static var canvas:h2d.Graphics;  // a top-level thing to draw to

	// constants
	//public static inline final laserWidth = 50;

}

/*
// careful: not to be confused with Layers with an 's'
enum Layer {
	background;
	players;
	projectiles;
}
*/
