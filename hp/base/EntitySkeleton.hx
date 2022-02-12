// just an optional bare-bones ds to copy and begin a new project with
// delete these lines and you're good to go!
package hp.base; // DELETE ME!!
import hp.base.*; // DELETE ME!!

// the skeletal structure of entities
// just something to ensure that all entities provide certain functionalites
// so that when you do iterate through entities, you can call those functions without error
// those functions can be empty, so no worries about cases when you don't need them
// example use: Entity implements EntitySkeleton
interface EntitySkeleton {
    //public function init():Void; // in case you need to separate constructor from init
    public function dispose():Void; // used in the main remove everything function, also called in EntityList's dispose()
    //public function add():Void; // in case you need to init something, but not add it to the scene yet
    public function update(dt:Float):Void; // used in the main update loop, also called in EntityList's update()
    //public function remove():Void // in case you need to remove something from the scene, but not dispose it yet
}
