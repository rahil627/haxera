// just an optional bare-bones global class to copy to begin a new project with
// rename it to Glob or GG or whatever
// store commonly-used global objects 'n vars
// the scope is local to this game
// more general useful stuff go to ra.Heaps 'n ra.Haxe 'n ra.hp.HP (HeapsPunk)
// glawble glawble glawb glob
class BaseGlob {
	// might have a problem disposing these...
	// nahhh, it's alright... just provide a function to clear them all
	// i mean, they're static, can't really delete them... whether they're here or in Main/BaseApp..
	//public static var entities:Array<Entity>; // TODO: vs Vector? / just pre-allocate the max expected memory? lol, idk!!
	//public static var world:Layer;
	//public static var map1:Map<Int, Entity>; // ?? a map for searching by ID?
	//public static var canvas:h2d.Graphics;  // a top-level thing to draw to

	// constants
	//public static final laserWidth = 50;

}

/*
// enums are my fav!
enum LayerKind {
	background;
	players;
	projectiles;
}
*/
