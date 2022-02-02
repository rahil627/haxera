/*
// TODO: vs Std.isOfType
enum EntityKind {
	player;
	monster;
	etc;
}
*/
// just an optional bare-bones Entity to copy to begin a new project with
// the entire class is optional
// i'm not really sure what entity means,
// but this one will likely contain an Object, or something that extends an Object
class BaseEntity {	
	//var id:Int; // useful for searching it
	//var kind:EntityKind; // maybe useful narrowing down searches // TODO: vs Std.isOfType
	//var sprite:Object; // Object and it's extensions: Drawable, Graphics, Anim, etc.

	// override me! and call super();
	// TODO: init in constuctor vs in init()
	public function new() {
		//game = Game.inst; // just use global (TODO: multiple scenes problem?)
		//inf = Data.object.get(kind); // castle db stuff
		//this.x = x; // vs e.sprite.x, hmmm, very confusing...
		//this.y = y;
		//sprite = new h2d.Anim(getAnim(), 15);
		//Glob.world.add(sprite, hasFlag(Under) ? LayerKind.under : LayerKind.players);
		//Glob.entities.push(this);
	}

	// override me!
	public function update(dt:Float) {
		// do stuff! 
	}

	// draw and render are handled automatically

	// override me!
	public function remove() {
		//sprite.remove(); // all Objects provide this
		//Glob.entities.remove(this);
	}

	// from deepnight
	//public function is<T:Entity>(c:Class<T>) return Std.isOfType(this, c);
	//public function as<T:Entity>(c:Class<T>) : T return Std.downcast(this, c);
}
