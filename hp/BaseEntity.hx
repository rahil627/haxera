/*
enum EntityKind {
	player;
	monster;
	etc;
}
*/
// just a bare-bones Entity to copy to begin a new project with
// all of the content is optional
// i'm not really sure what entity means,
// but this one will likely contain an Object, or anything that extends an Object
class BaseEntity {	

	//var kind:EntityKind; // maybe useful for searching
	//var sprite:Object; // Object and it's extensions: Drawable, Graphics, Anim, etc.

	// override me! and call super();
	// TODO: init in constuctor vs in init()
	public function new() {
		//game = Game.inst; // just use global (TODO: multiple scenes problem?)
		//inf = Data.object.get(kind); // castle db stuff
		//this.x = x;
		//this.y = y;
		//sprite = new h2d.Anim(getAnim(), 15);
		//Glob.world.add(spr, hasFlag(Under) ? Game.LAYER_ENT_UNDER : Game.LAYER_ENT);
		//Glob.entities.push(this);
	}

	// override me!
	public function update(dt:Float) { // TODO: pass in dt vs global dt
		// do stuff! 
	}

	// draw and render are handled automatically

	// override me!
	public function remove() {
		//sprite.remove(); // all Objects provide this_
		//Glob.entities.remove(this);
	}
}
