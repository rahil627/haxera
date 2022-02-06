package ra.hp.base.entities; // DELETE ME

import ra.hp.base.Entity // DELETE ME

// a specialized container for Entity
// designed to be an extendable replacement for haxe.ds.List or Array
class Entities {
	
	//@:allow(elke.entity.Entity3D, elke.entity.Entity2D)
	//static var _NEXT_ID = 0;
	
	var entities:List<Entity>; // or Array
	
	public function new() {
		entities = [];
	}

	// adds to the beginning of the list
	function add(e:Entity) { // "add" is a personal preference
		entities.push(e);
	}
	
	function push(e:Entity) {
		entities.push(e);	
	}
	
	// removes one element from the beginning of the list
	function remove() {
		entities.pop();
	}

	// note: use this to try to keep more permanent stuff at the end
	function addToEnd(e:Entity) {
		entities.add(e);
	}
	
	//function removeFromEnd(e:Entity) {
		// not sure how to remove the last element...
		// maybe it's a single-linked-list impl?, not double?
		// strangely last() is provided, which returns the last element,
		// but then you'd have to still use remove() and go through the entire list to remove it
	//}

	function remove(e:Entity) {
		entities.remove(e);
	}
	
	
	// extensions begin here
	
	public function dispose() {
		for (e in entities)
			e.remove();
		entities.clear();
	}

	public function update(dt:Float) {
		for (e in entities)
			e.update(dt);
	}
	
	public function find(e:Entity)Entity {
		for (i in entities) {
			//if (i.kind != e.kind)
				//return null; // todo: or false?
			
			//if (i.type != e.type) //!std.isOfType(i, e)
				//return null;			
		}
			
	}
	
	
	
	
	
	
}
