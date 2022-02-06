package hp.base // DELETE ME!!

import haxe.ds.List;
import h2d.Layers;
	
// just an optional bare-bones global class to copy to begin a new project with
// rename it to something short, or create a short alias such as 'GG' in import.hx
// store references to commonly-used data structures here
// the scope of this is local to this specific app
// TODO: singleton vs static
class GameGlobal {
	
	// only keep references to stuff here // TODO: huh? my brain hurts
 	public static var world:Layers;
	
	public static var entities:EntityList<Entity>;
	//public static var players:Array<Player>;	
	//public static var players:Vector<Player>; // or this, if the max amount of players never change
	//public static var entitiesBackpack:Map<Int, TargetEntities>; // to search commonly-searched stuff by id (key)	


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
