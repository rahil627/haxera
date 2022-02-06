package ra.hp.base.entities; // DELETE ME
import ra.hp.base.Entity; // DELETE ME

import haxe.ds.list;

// a specialized generic container for Entity
// designed to be an extendable replacement for haxe.ds.List or Array
class Entities<T:Entity> { // in HaxePunk, it extends Entity??
	
	// maybe can use inheritance (extends List) or create a new generic (entities:ListEx<Entity>) somehow..?
	// see https://haxe.org/manual/type-system-generic.html
	
	// use HaxePunk's EntityList as a base?
	// https://github.com/HaxePunk/HaxePunk/blob/987b915486b9ea9ce23180cc17345ad805d87021/haxepunk/EntityList.hx
	
	// todo: slowly implement List as you need it
	// https://api.haxe.org/haxe/ds/List.html

	//@:allow(elke.entity.Entity3D, elke.entity.Entity2D)
	//static var _NEXT_ID = 0;
	
	public var entities:List<Entity:T>;
	//public var entities:Array<Entity:T>; // choose your ds impl
	
	// the core of haxe.ds.List and Array
	
	public var count(get, never):Int; function get_count() return entities.length;
	
	public function new() {
		entities = new List();
	}

	// adds an entity to the beginning of the list
	function add(entity:T) { // i personally prefer "add" to keep it simple
		entities.push(entity);
	}
	
	function push(entity:T) {
		entities.push(entity);	
	}
	
	// removes one entity from the beginning of the list
	function remove() {
		entities.pop();
	}

	// note: use this to try to keep more permanent stuff at the end
	function addToEnd(entity:T) {
		entities.add(entity);
	}
	
	//function removeFromEnd(entity:T) {
		// not sure how to remove the last element...
		// maybe it's a single-linked-list impl?, not double?
		// strangely last() is provided, which returns the last element,
		// but then you'd have to still use remove() and go through the entire list to remove it
	//}

	// n complexity, but surely has optimization magic in it
	function remove(entity:T) {
		entities.remove(entity);
	}
	
	
	// other native array/list ds functions
	
	// todo: List.filter?
	
	
	
	
	
	// Call a function on all Entities in an EntityList.
	// from HaxePunk.EntityList
	public function apply(f:(T->Void)):Void {
		for (entity in entities) f(entity);
	}

	// Call a function on all Entities in an EntityList, and return it's value
	// from HaxePunk.EntityList	
	public function map<R>(f:(T->R)):Array<R> {
		return [for (entity in entities) f(entity)];
	}
	
	
	
	
	
	
	// extensions begin here
	
	public function dispose() {
		for (e in entities) {
			entity.remove();
		}
		
		entities.clear();
	}

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
