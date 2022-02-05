package ra.hp.base // DELETE ME!!
//package hxd.Layers;

// just a bare-bones App/Main to copy to begin a new project with
// the data is all optional, feel free to delete!
// rename the class 'n filename and you're good to go!
class MyApp extends PunkApp {

	//public var entities:List<Entity>; // TODO: static vs global reference
	//public var world:Layer; // TODO: not really world, is it? Just some helper class

	// called during application setup after `loadAssets` completed (from docs)
	override function init() {
		super.init();
		/*
		 // config screen stuff
		 // not sure what defaultsmooth nor usescreenpixels do... just a sample from deepnight
		 HP.windowDisplayMode = hxd.DisplayMode.Windowed; // should use scene.ScaleMode?
		 HP.scene.defaultSmooth = true;
		 HP.scaleMode = LetterBox(1280, 720, false, Center, Center);
		 #if js
		 HP.window.useScreenPixels = true;
		 #end
		 HP.engine.backgroundColor = 0xFF31A2F2;

		 // init app stuff
		 //entities = new haxe.ds.List<Int>();
	 	 //world = new Layers();
		 var player = new Entity(); // just be sure to store the reference to entities somewhere safe!
		 */
	}
	
	// not really dispose, as in garbage collect, just clear/reset the ds...
	//public function resetWorld() {
		//entities.clear();
		//world = new Layers(); // TODO: lol, dunno how to dispose, *i think* it's just a tiny array of indicies anyway.., no content
	//}
	
	// called each frame right before rendering (from docs)
	// first call is done after the application is set up (so `loadAssets` and `init` are called (from docs)
	override function update(dt:Float) {
		super.update();
	}
	
	
	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new MyApp();
		// maybe can store an instance of it... but, for what?
	}
}
