package hp.base // DELETE ME!!

import haxe.ds.List;
import h2d.Layers;
	
// just an optional bare-bones global class to copy to begin a new project with
// rename it to something short, or create a short alias in import.hx
// store references to commonly-used data structures here
// the scope of this is local to this specific game
// TODO: singleton vs static
class Global {
	// only keep references to these here
	
	public static var entities:EntityList<Entity>;
	
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
