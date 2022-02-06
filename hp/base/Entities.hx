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

	function add(e:Entity) {
		entities.push(e);
	}

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
	
	
	
	
	
	// helpers to avoid refactoring code
	public function push(e:Entity) {
		entities.add(e);
	}
	
	
}
