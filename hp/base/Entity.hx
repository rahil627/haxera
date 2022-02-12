// just an optional bare-bones ds to copy and begin a new project with
// delete these lines and you're good to go!
package hp.base; // DELETE ME!!
import hp.base.*; // DELETE ME!!

import h2d.Object; // h3d.Object

/*
// although you can use this.is / std.isOfType, this is 
// still useful in case you need to search for something but
// the same class is used to make several different kinds of entities
enum EntityKind {
	player;
	monster;
	cuteMonster;
	etc;
}
*/

// just a place to group together some code
// likely contains an Object, or something that extends an Object,
// which itself will be added to the Scene, or first to Layers, then Scene
class Entity implements EntitySkeleton {
	// inheritance vs composition?
	// http://entity-systems.wikidot.com/ says composition > inheritance
	// with composition, you can select which features you want to glue together, which makes everything re-usable
	// with inheritance, it becomes difficult to select certain features without inheriting extra crap
	// even the transform part (Object) should be optional, so that you can have an entity for just game logic
	
	// components?
	// https://gameprogrammingpatterns.com/component.html
	// setting up entity to use a component design might be fine for an engine with a game editor
	// but doing it through code seems pretty excessive:
	// for every entity you'd have multiple individualized component classes
	// i personally like this simple composition style better
	
	// "components" that come in Heaps 2d module
	// Object = transform, scene tree container
	// Layers = Object + scene tree container helper functions to order contained Objects for drawing
	// Drawable = Object + draw/render
	// Anim = Object + draw/render + animation-related functions
	// Graphics = Object + draw/render + helper graphics drawling library
	
	// maybe can create getter/setter to work with Layers	?
	// unimpl: associating a 1:1 relationship to layer would create a limit:
	// all of the Objects within entity would be expected to have the same layer
	// imagine a sprite class in one later, and it's particle effects on another layer
	//var layer(get, set):Layer; // layer = Layer enum value = used as index in Layers
	//var positionWithinLayer(get, set):Int; // optionally used in layers for positioning within a layer
	// also can provide a few helper functions like Layer.under/over for moveToTopOfLayer/moveToBottomOfLayer
	
	//var id:Int; // maybe useful for finding it later..?, can be used as a map key, TODO: storing temp int vs reference?
	//var name:String; // although strange, i've seen HaxePunk and Armory use this for searching, secret optimization magic??
	//var kind:EntityKind; // maybe useful narrowing down searches; one big container vs keeping multiple containers
	//var class = Type.getClassName(Type.getClass(this)); // @author MikeTuttle/HaxePunk, i think it uses reflection, which might not be good for cross-platform use

	//var parent:Object;
	
	//var sprite:Anim; // Object and it's extensions: Drawable, Graphics, Anim, etc.
	//var effects:Graphics; // can have as many as you want!

	// override me! and remember to call super()
	public function new(?parent:Object) { // good programming says to pass in Scene, also enables to support multiple Scenes, such as split screen
		//inf = Data.object.get(kind); // castle db stuff
		//sprite = new h2d.Anim(getAnim(), 15);
		
		// a common transform wrapper
		//x = sprite.x;
		//y = sprite.y;
		//r = sprite.rotation;
		
		//AppGlobal.scene.addChild(sprite); // if no Layers add Object to Scene
		//AppGlobal.world.add(sprite, Layer.monster);  // add Object to Layers
		
		AppGlobal.entities.push(this); // TODO: add this base entity class vs the actual class?
	}

	// override me! and remember to call super.update(dt)
	// optional: can separate into preUpdate, update, postUpdate, but only if necessary
	public function update(dt:Float) {
		// do stuff! 
	}

	// draw and render are handled automatically

	// override me! and remember to call super.dispose()
	public function dispose() {
		// basically, whenever you call new to create something, you need to destroy it
		
		//sprite.remove(); // all Objects provide this
		//sprite = null; // not sure if necessarry, but deepnight does it
		AppGlobal.entities.remove(this);  // TODO: add this base entity class vs the actual class?
		// and off to the garbage collector it goes?
	}
	
	
	
	// i found these two from deepnight's libs
	// TODO: i don't understand the <T:Entity> part... it's not a parameter...
	// also, the parameter is generic?

	// from docs of Std.isOfType():
	// Tells if a value v (this) is of the type t. Returns false if v or t are null.
	// If t is a class or interface with @:generic meta, the result is false.
	public function is<T:Entity>(t:Class<T>):Bool return Std.isOfType(this, t); // like entity kind, useful to narrow down searches
	
	// from docs of Std.downcast():
	// Checks if object value (this) is an instance of class or interface c.
	// Compiles only if the type specified by c can be assigned to the type of value.
	// This method checks if a downcast is possible. That is, if the runtime type of value is assignable to the type specified by c, value is returned. Otherwise null is returned.
	// This method is not guaranteed to work with core types such as String, Array and Date.
	// If value is null, the result is null. If c is null, the result is unspecified.
	public function as<T:Entity>(c:Class<T>):T return Std.downcast(this, c); // ?? not sure when to use, but seems handy!
	
	
	
	
	
	// note:
	// HaxePunk's Entity is massive class containing a *ton* of helper collision functions like
	// CollidesWith(Entity, Type, Class, Point, Rect, etc.)
	// but i don't think i'll abstract collision from Object (...i'm not even sure if there is any in there!!),
	// i'd rather just stick to using core Heaps, than to create a giant framework
	// you'd have to do something like entity.spriteObject.getBounds().intersects/contains(anotherObject.getBounds())...	
	// from the sample: https://github.com/HeapsIO/heaps/blob/master/samples/CollideCheck.hx
	// it's just a matter of creating a new Colliders every frame and using some function (inside..) woww!! so simple!! :D :D
	// ...i think HaxePunk's entity class had a hitbox/collision-mask... so, maybe you can add a collider to entity, if you want..
	// but the only common function the colliders have is contain() (found in the ICollider interface)
	// so you might be able to do entity.collider.contains(entity.collider)? I dunno...
	// anyway, i'd rather not couple collision with entity, for now..
	
	
	
}
