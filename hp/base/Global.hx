package ra.hp.base // DELETE ME!!

// just an optional bare-bones global class to copy to begin a new project with
// rename it to something short, or create a short alias in import.hx
// store references to commonly-used data structures here
// the scope of this is local to this specific game
// TODO: singleton vs static
class Global {
	// only keep references to these here
	
	// i think this is the only important data structure to choose
	// given that you're constantly adding 'n removing stuff, such as projectiles, then
	// List is not only the best option, but the simplest too!
	// array / vector and map are generally for optimization purposes only
	// array is O(1) access complexity vs O(log(n)) access complexity
	// ..but really tho, it'd be limited to things you're constantly accessing,
	// and if you're already constantly accessing them.., well,
	// you'd probably already have stored pointers/references to those things anyway (i.e. players)!, soooo...:
	public static var entities:List<Entity>;
	
	// for example, in special cases can use stuff like this:
	//public static var players:Array<Player>
	//public static var players:Vector<Player>; // if the max amount of players never change, otherwise:
	//public static var entitiesBackpack:Map<Int, TargetEntities>; // to search for commonly-searched stuff by id (key)	

	// this is the second-most import ds, and thankfully it's already implemented
	public static var world:Layers;

	// constants
	//public static inline final laserWidth = 50;

}

// careful: not to be confused with Layers with an 's'
enum Layer {
	background;
	players;
	projectiles;
	effects;
	ui;
}
