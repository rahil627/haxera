// just an optional bare-bones ds to copy and begin a new project with
// delete these lines and you're good to go!
package hb; // DELETE ME!!
import hb.*; // DELETE ME!!
	
import h2d.Layers;
import h2d.Scene;  // or h3d.scene.Scene;

// a static global helper class, with a scope specific to this app
// store references to commonly-used data structures here
// try to store only references of stuff, no actual objects (except simple types)
class AppGlobal {
	
	// only keep references to stuff here
	//public static var app:MyPunkApp/MyApp; 
	public static var scene:Scene; // TODO: here vs HP.scene
 	//public static var world:Layers;
	public static var entities:EntityList<Entity>;
	//public static var players:Array<Player>; // TODO: make entity Array?
	//public static var players:Vector<Player>; // or this, if the max amount of players never change
	//public static var entitiesBackpack:Map<Int, TargetEntities>; // to search commonly-searched stuff by id (key)	


	// constants
	//public static inline final laserWidth = 50;

}
/*
// careful: not to be confused with Layers with an 's'
// note: because files are modules (instead of ds'es), you must use AppGlobal.Layer
// or, put it in it's own file
// note: G.Layer, where G is an alias for Global, doesn't work!
// ordered from back to front, 0 is the back, n is the front, -1 is special to put in front-most
// use AppGlobal.Layer.getIndex() as the layer index in Layers
enum Layer {
	background;
	players;
	projectiles;
	effects;
	ui;
}
*/
