// just a bare-bones App/Main to copy to begin a new project with
// the vars are all optional, feel free to delete!
// rename the class 'n filename and you're good to go!
class BaseApp extends PunkApp {

	//public static var entities:Array<Entity>;
	//public static var world:Layer;

	override function init() {
		super.init();
	}

	override function update(dt:Float) {

	}
	
	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new BaseApp();
		// what else goes here?
	}
}
