package ra.hp.entities;
//package elke.entity;

// a specialized container for Entity
// designed to be an extendable replacement for haxe.ds.List or Array
class Entities {
	//@:allow(elke.entity.Entity3D, elke.entity.Entity2D)
	//static var _NEXT_ID = 0;
	var entities:List<Entity>; // or Array
	
	public function new() {
		entities = [];
	}

	public function dispose() {
		for (e in entities) {
			e.remove();
		}
	}

	function add(e:Entity) {
		entities.push(e);
	}

	function remove(e:Entity) {
		entities.remove(e);
	}

	public function update(dt:Float) {
		for (e in entities) {
			e.update(dt);
		}
	}
	
	
	
	
	// helpers to avoid refactoring code
	public function push(e:Entity) {
		entities.add(e);
	}
	
	
}
