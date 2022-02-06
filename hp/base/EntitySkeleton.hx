package ra.hp.base // DELETE ME!!

// the skeletal structure of entities
// just something to ensure that all entities provide certain functionalites
// so that when you do iterate through entities and call those functions, they actually exist
// example use: BaseEntity implements EntitySkeleton
interface EntitySkeleton {
    //public function init():Void; // at the moment, the init code is in the constructor! ...i like it better there...
    public function update(dt:Float):Void; // called in the main update loop
    public function remove():Void; // called in the main remove everything function
}
