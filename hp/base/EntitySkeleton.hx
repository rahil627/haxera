package hp.base // DELETE ME!!

// the skeletal structure of entities
// just something to ensure that all entities provide certain functionalites
// so that when you do iterate through entities and you can call those functions without error
// those functions can be empty, so no worries
// example use: BaseEntity implements EntitySkeleton
interface EntitySkeleton {
    //public function init():Void; // at the moment, the init code is in the constructor! i like it better there...
    public function update(dt:Float):Void; // called in EntityList's update(), used in the main update loop
    public function remove():Void; // called in EntityList's remove(), used in the main remove everything function
}
