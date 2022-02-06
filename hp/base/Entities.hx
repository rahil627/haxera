package hp.base.entities; // DELETE ME
import hp.base.Entity; // DELETE ME

import haxe.ds.list;

// a specialized generic container for Entity
// designed to be an extendable replacement for haxe.ds.List or Array
//@:generic TODO: don't i need this?
class Entities<T:Entity> { // in HaxePunk, it extends Entity??
	
	// maybe can use inheritance (extends List) or create a new generic (entities:ListEx<Entity>) somehow..?
	// see https://haxe.org/manual/type-system-generic.html
	
	// use HaxePunk's EntityList as a base?
	// https://github.com/HaxePunk/HaxePunk/blob/987b915486b9ea9ce23180cc17345ad805d87021/haxepunk/EntityList.hx
	// it's interesting... entity has type, layer, camera, and can be added to the scene, much like Object
	// in my case, however, all of that stuff is in handled by Object, except the type (i use "kind")
	// so this ds will be much simpler
	
	// todo: slowly implement List as you need it
	// https://api.haxe.org/haxe/ds/List.html

	//@:allow(elke.entity.Entity3D, elke.entity.Entity2D)
	//static var _NEXT_ID = 0;
	
	
	
	// i think this is the only important data structure choice to make
	// given that you're constantly adding 'n removing stuff, such as projectiles, then
	// List is not only the best option, but the simplest too!
	// array / vector and map are generally for optimization purposes only
	// array is O(1) access complexity vs O(log(n)) access complexity
	// ..but really tho, it'd be limited to things you're constantly accessing,
	// and if you're already constantly accessing them.., well,
	// you'd probably already have stored pointers/references to those things anyway (i.e. players)!, soooo...:
	// (on the other hand, i've seen Arrays used in Haxe everywhere, soooooo ???)
	
	var entities:List<Entity:T>;
	//var entities:Array<Entity:T>; // choose your ds impl;
	
	// the core shared functions of haxe.ds.List and Array
	
	public var count(get, never):Int; function get_count() return entities.length;
	
	public function new() {
		entities = new List();
	}

	// adds an entity to the beginning of the list
	public function add(entity:T) { // i personally prefer "add"/"remove" to keep it simple, and match the rest of the framework
		entities.push(entity);
	}
	public function push(entity:T) { // alt
		entities.push(entity);	
	}
	
	// removes one entity from the beginning of the list
	public function removeFirst():Null<T> { // "remove" can be ambiguous
		return entities.pop();
	}
	public function pop():Null<T> { // alt
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
	public function remove(entity:T)Bool {
		return entities.remove(entity);
	}
	
	public function toString():String {
		return entities.toString();
	}
	
	
	
	
	
	// other native array/list ds functions
	
	// List functions (not comprehensive)
	public var first(get, never); public function getFirst():Null<T> return entities.first();
	public var last(get, never); public function getLast():Null<T> return entities.last();	
	
	//filter(f:T ‑> Bool):List<T>
	//map<X>(f:T ‑> X):List<X>

	// call a function on all Entities in an EntityList.
	// @author from HaxePunk.EntityList
	public function apply(f:(T->Void)):Void {
		for (entity in entities) f(entity);
	}

	// call a function on all Entities in an EntityList, and return it's value
	// @author from HaxePunk.EntityList	
	public function map<R>(f:(T->R)):List<R> {
		return [for (entity in entities) f(entity)];
	}
	
	
	
	
	
	
	// extensions begin here
	public function dispose() {
		this.removeAll();
		this = null;
	}
	
	public function removeAll() {  // or reset
		//entities.clear(); // TODO: woudn't this work?... nah, contained Object(s) would become janky references
		for (e in entities) {
			entity.remove(); // remove Object, etc.
		}
		
		entities.clear();
	}
	
	public function clear() { // alt
		this.removeAll()
	}
		
	//public function remove() { // alt, TODO: this is just too ambiguous
	//	this.removeAll();
	//}
	
	public function update(dt:Float) {
		for (e in entities)
			entity.update(dt);
	}
	
	/*
	public function search(entity:T)T {
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
	
	
	
}
