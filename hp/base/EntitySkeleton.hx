package hp.base // DELETE ME!!

// the skeletal structure of entities
// just something to ensure that all entities provide certain functionalites
// so that when you do iterate through entities and you can call those functions without error
// those functions can be empty, so no worries
// example use: BaseEntity implements EntitySkeleton
interface EntitySkeleton {
    //public function init():Void; // in case you need to separate constructor from init
    //public function add():Void; // in case you need to init something, but not add it to the scene yet
    public function update(dt:Float):Void; // called in EntityList's update(), used in the main update loop
    public function remove():Void; // called in EntityList's remove(), used in the main remove everything function
    //public function dispose():Void // in case you need to remove something the scene, but not dispose it yet
}
