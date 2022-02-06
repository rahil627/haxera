package ra.hp.base // DELETE ME!!

// just something to ensure(/insure?) that all entities provide ways to do certain minimal things
// like dispose of itself!
// the skeletal structure of entities
// this is completely optional
// example use: BaseEntity implements EntitySkeleton
interface EntitySkeleton {
    //public function init():Void; // at the moment, the init code is in the constructor! ...i like it better there...
    public function update(dt:Float):Void; // called in the main update loop
    public function remove():Void; // what if there's nothing to remove, except itself?
}
