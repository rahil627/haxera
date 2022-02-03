/*
// TODO: vs Std.isOfType
enum EntityKind {
	player;
	monster;
	etc;
}
*/
// just an optional bare-bones entity class to copy to begin a new project with
// i'm not really sure what entity means,
// but this one will likely contain an Object, or something that extends an Object,
// which itself will be added to the Scene (or first to Layers, then Scene)
class BaseEntity {	
	//var id:Int; // useful for finding it later
	//var kind:EntityKind; // maybe useful narrowing down searches // TODO: vs Std.isOfType (infers class?)
	//var sprite:Object; // Object and it's extensions: Drawable, Graphics, Anim, etc.

	// override me! and remember to call super()
	// TODO: init in constuctor vs in init()
	public function new() {
		//game = Game.inst; // just use global (TODO: multiple scenes problem?)
		//inf = Data.object.get(kind); // castle db stuff
		//this.x = x; // just a wrapper for e.sprite.x?
		//this.y = y;
		//sprite = new h2d.Anim(getAnim(), 15);
		//BaseGlobal.world.add(sprite, hasFlag(Under) ? LayerKind.under : LayerKind.players);
		//BaseGlobal.entities.push(this);
	}

	// override me! and remember to call super.update(dt)
	// can separate into preUpdate, update, postUpdate, but only if necessary
	public function update(dt:Float) {
		// do stuff! 
	}

	// draw and render are handled automatically

	// override me! and remember to call super.remove()
	public function remove() {
		//sprite.remove(); // all Objects provide this
		//BaseGlobal.entities.remove(this);
		//this = null; // TODO: lol, not sure about this...
	}

	// from deepnight
	//public function is<T:Entity>(c:Class<T>) return Std.isOfType(this, c);
	//public function as<T:Entity>(c:Class<T>) : T return Std.downcast(this, c); // ?? huh, for using base functions of an inherited class?
}
