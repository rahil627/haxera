// just an optional bare-bones ds to copy and begin a new project with
// delete these lines and you're good to go!
package hp.base; // DELETE ME!!
import hp.base.*; // DELETE ME!!

import haxe.ds.List;

// a specialized generic container for Entity
// designed to be an extendable replacement for haxe.ds.List or Array
//@:generic TODO: don't i need this?
class EntityList<T:Entity> {
	
	// maybe can use inheritance (extends List) or create a new generic (entities:ListEx<Entity>) somehow..?
	// see https://haxe.org/manual/type-system-generic.html
	
	// use HaxePunk's EntityList as a model
	// https://github.com/HaxePunk/HaxePunk/blob/987b915486b9ea9ce23180cc17345ad805d87021/haxepunk/EntityList.hx
	// it's interesting... entity has type, layer, camera, and can be added to the scene, much like Object
	// in my case, however, all of that stuff is in handled by Object, except the type (i use "kind") and layer
	// so this ds will be much simpler
	// also, HaxePunk's EntityList extends Entity(!!), making it more of a parent Object
	
	// see h2d.Object, so as not to overlap functionality with that
	// avoid re-creating a whole nother scene tree! lol
	// this is just a simple one-dimensional list, not a tree!!
	
	// todo: slowly implement List as you need it
	// https://api.haxe.org/haxe/ds/List.html
	
	
	
	// i think this is the only important data structure choice to make
	// given that you're constantly adding 'n removing stuff, such as projectiles, then
	// List is not only the best option, but the simplest too!
	// array, vector, and map are generally for optimization purposes only
	// array is O(1) access complexity vs O(log(n)) access complexity
	// ..but really tho, it'd be limited to things you're constantly accessing,
	// and if you're already constantly accessing them.., well,
	// you'd probably already have stored pointers/references to those things anyway (i.e. players)!, soooo...:
	// (on the other hand, i've seen Arrays used in Haxe everywhere, soooooo ???
	//  there's very likely optimization / cross-platform magic, so might be better to use Array after all)
	
	// the main internal container
	public var entities:List<T>; // just keep it public for advanced use / native Haxe users
	//var entities:Array<T>; // choose your ds impl;
	
	// the core shared functions of haxe.ds.List and Array
	
	public var count(get, never):Int; function get_count() return entities.length;
	
	public function new() {
		entities = new List();
	}

	// adds an entity to the beginning of the list
	public function add(entity:T) { // i personally prefer "add"/"remove" to keep it simple, and match the rest of the framework
		entities.push(entity);
	}
	public function push(entity:T) { // original name
		entities.push(entity);	
	}
	
	// removes one entity from the beginning of the list
	public function removeFirst():Null<T> { // "remove" is too ambiguous
		return entities.pop();
	}
	public function pop():Null<T> { // original name
		return entities.pop();
	}
	
	// note: use this to try to keep more permanent stuff at the end
	public function addToEnd(entity:T) {
		entities.add(entity);
	}
	
	//public function removeFromEnd(entity:T) {
		// not sure how to remove the last element...
		// maybe it's a single-linked-list impl?, not double?
		// strangely last() is provided, which returns the last element,
		// but then you'd have to still use remove() and go through the entire list to remove it
	//}

	// n complexity, but surely has optimization magic in it
	public function remove(entity:T):Bool { // TODO: not sure if haxe.ds.List.remove returns a bool
		return entities.remove(entity);
	}
	
	public function toString():String {
		return entities.toString();
	}
	
	
	
	
	
	// other native array/list ds functions
	
	// List functions (not comprehensive)
	public var first(get, never):Null<T>; public function get_first():Null<T> return entities.first();
	public var last(get, never):Null<T>; public function get_last():Null<T> return entities.last();	
	
	//filter(f:T ‑> Bool):List<T>
	//map<X>(f:T ‑> X):List<X>

	// call a function on all Entities in an EntityList.
	// @author from HaxePunk.EntityList
	public function apply(f:(T->Void)):Void {
		for (entity in entities) f(entity);
	}

	// call a function on all Entities in an EntityList, and return it's value
	// @author from HaxePunk.EntityList	
	// TODO: if i change Array to List, it throws an error
	//public function map<R>(f:(T->R)):Array<R> {
	//	return [for (entity in entities) f(entity)];
	//}
	
	
	
	
	
	
	// specialized entity helper extensions
	public function dispose() {  // or removeAll, or reset
		//entities.clear(); // TODO: woudn't this work?... nah, contained Object(s) would become janky references
		for (e in entities) {
			e.remove(); // remove Object, etc.
		}
		
		entities.clear();
		//entities = null;
	}
	
	public function clear() { // original name
		this.removeAll();
	}
		
	//public function remove() { // alt, too ambiguous, i'd rather throw an error
	//	this.removeAll();
	//}
	
	public function update(dt:Float) {
		for (e in entities)
			e.update(dt);
	}
	
	/*
	public function search(entity:T)T { // aka contains
		for (i in entities) {
			//if (i.kind != e.kind)
				//return null; // todo: or false?
			
			//if (i.type != e.type) //!std.isOfType(i, e)
				//return null;			
		}
			
	}
	
	public function reverseSearch(entity:T)T {
		for (var i = i.entities.length(), i >=0, i--) {
			// do stuff
		}
	}
	*/
	
	
	
	
	
	
	/* just some ideas from Object
	// i think the second and third one are like List.filter and List.map
	// contains = search, just not recursive


	//Tells if the object is contained into this object children, recursively.
	public function contains( o : Object ) {
		while( o != null ) {
			o = o.parent;
			if( o == this ) return true;
		}
		return false;
	}

	//Find a single object in the tree by calling `f` on each and returning the first not-null value returned, or null if not found.
	public function find<T>( f : Object -> Null<T> ) : Null<T> {
		var v = f(this);
		if( v != null )
			return v;
		for( o in children ) {
			var v = o.find(f);
			if( v != null ) return v;
		}
		return null;
	}

	
	//Find several objects in the tree by calling `f` on each and returning all the not-null values returned.
	//@param arr An optional array instance to fill results with. Allocates a new array if not set.
	public function findAll<T>( f : Object -> Null<T>, ?arr : Array<T> ) : Array<T> {
		if( arr == null ) arr = [];
		var v = f(this);
		if( v != null )
			arr.push(v);
		for( o in children )
			o.findAll(f,arr);
		return arr;
	}
	*/
	
	
	
	
	
	/* just some ideas from MikeTuttle/HaxePunk...
	// whatever properties Entity has, can make a helper fucntion to set it for the entire list
	// changing the layer seems useful, although, more likely, you'd just move the layer itself
	// and even then, you'd need a setter for layer to actually do something when it's changed

	override function set_type(value:String):String // set_kind
	{
		if (value != "") for (entity in entities) entity.type = value;
		return _type = value;
	}

	override function set_layer(value:Int):Int
	{
		var originalLayer = layer;
		var value = super.set_layer(value);
		for (entity in entities)
			entity.layer = entity.layer - originalLayer + value;
		return value;
	}

	override function set_camera(value:Camera):Camera
	{
		for (entity in entities) entity.camera = value;
		return camera = value;
	}
	*/
	
}
