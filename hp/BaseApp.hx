// just a bare-bones App/Main to copy to begin a new project with
// the vars are all optional, feel free to delete!
// rename the class 'n filename and you're good to go!
class BaseApp extends PunkApp {

	//public static var entities:Array<Entity>;
	//public static var world:Layer; // TODO: not really world, is it? Just some helper class

	// from docs: called during application setup after `loadAssets` completed
	override function init() {
		super.init();
		/* // not sure what defaultsmooth nor usescreenpixels do... just a sample
		 HP.scene.defaultSmooth = true;
		 HP.scene.scaleMode = LetterBox(1280, 720, false, Center, Center);
		 #if js
		 Window.getInstance().useScreenPixels = true;
		 #end
		 */
	}

	// from docs: called each frame right before rendering
	// from docs: first call is done after the application is set up (so `loadAssets` and `init` are called)
	override function update(dt:Float) {

	}
	
	// not really dispose, as in garbage collect, just clear/reset the ds...
	//public function resetWorld() {
		//entities = [];
		//world = new Layer(); // TODO: lol, dunno how to dispose, *i think* it's just a tiny array of indicies anyway.., no content
	//}
	
	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new BaseApp();
		// maybe can store an instance of it... but, for what?
	}
}
