// just something to ensure that all entities provide ways to do certain minimal things
// like dispose of itself!
// this is optional
interface Updateable {
    //public function init():Void; // at the moment, the init code is in the constructor! TODO: init in constructor vs in an init function
    //public function update():Void; // what if it doesn't have an update?
    //public function remove():Void; // what if there's nothing to remove? (except losing it's references)
}
