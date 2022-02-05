package ra.hp.base // delete this line!

/*
// still useful in case you need to search for something but
// the same class is used to make several different kinds of entities
enum EntityKind {
	player;
	monster;
	cuteMonster;
	etc;
}
*/
// just an optional bare-bones entity class to copy to begin a new project with
// i'm not really sure what entity means,
// but this one will likely contain an Object, or something that extends an Object,
// which itself will be added to the Scene (or first to Layers, then Scene)
class BaseEntity /*implements EntitySkeleton*/ {	
	//var id:Int; // maybe useful for finding it later..?, can be used as a map key, TODO: storing temp int vs reference?
	//var kind:EntityKind; // maybe useful narrowing down searches; one big container vs keeping multiple containers
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
		//BaseGlobal.entities.push(this); // 1 complexity
	}

	// override me! and remember to call super.update(dt)
	// optional: can separate into preUpdate, update, postUpdate, but only if necessary
	public function update(dt:Float) {
		// do stuff! 
	}

	// draw and render are handled automatically

	// override me! and remember to call super.remove()
	public function remove() {
		//sprite.remove(); // all Objects provide this
		//BaseGlobal.entities.remove(this); // n complexity
		//this = null; // TODO: lol, not sure about doing this from within the class...
	}

	// i found these two from deepnight's libs
	// TODO: i don't understand the <T:BaseEntity> part... it's not a parameter...

	//Tells if a value v is of the type t. Returns false if v or t are null.
	//If t is a class or interface with @:generic meta, the result is false.
	public function is<T:BaseEntity>(c:Class<T>) return Std.isOfType(this, c); // like entity kind, useful to narrow down searches
	
	//Checks if object value is an instance of class or interface c.
	//Compiles only if the type specified by c can be assigned to the type of value.
	//This method checks if a downcast is possible. That is, if the runtime type of value is assignable to the type specified by c, value is returned. Otherwise null is returned.
	//This method is not guaranteed to work with core types such as String, Array and Date.
	//If value is null, the result is null. If c is null, the result is unspecified.
	public function as<T:BaseEntity>(c:Class<T>) : T return Std.downcast(this, c); // ?? not sure when to use, but seems handy!
}
