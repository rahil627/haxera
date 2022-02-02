// just an optional bare-bones global class to copy to begin a new project with
// rename it to Glob or GG or whatever
// store commonly-used global objects 'n vars
// the scope is local to this game
// more general useful stuff go to ra.Heaps 'n ra.Haxe 'n ra.hp.HP (HeapsPunk)
// glawble glawble glawb glob
class BaseGlob {
	// TODO: might have a problem disposing these...
	// nahhh, it's alright... maybe can just provide a function to clear them all
	// i mean, they're static, can't really delete them... can you?
	// what's the difference between putting it in Main vs here?
	//public static var entities:Array<Entity>; // TODO: vs Vector? / pre-allocate memory? lol
	//public static var world:Layer;
	//public static var map1:Map<Int, Entity>; // ?? a map for searching by ID?
	//public static var canvas:h2d.Graphics;

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
