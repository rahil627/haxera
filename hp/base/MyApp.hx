// just an optional bare-bones ds to copy and begin a new project with
// delete these lines and you're good to go!
package hp.base; // DELETE ME!!
import hp.base.*; // DELETE ME!!

import h2d.Layers;

// just a bare-bones App/Main to copy to begin a new project with
// the data is all optional, feel free to delete!
// rename the class, constructor call, 'n filename and you're good to go!
class MyApp extends PunkApp {

	var world:Layers; // just a helper tool to put things in the right place in the scene tree
	var entities:EntityList<Entity>;
	//var players:Array<PlayerEntity>; // TODO: static vs global reference

	// called during application setup after `loadAssets` completed (from docs)
	override function init() {
		super.init();
		HP.setup(true);
		/*
		 // config screen stuff
		 // the hxml file can set some of these too, not sure which has priority tho
		 // not sure what defaultsmooth nor usescreenpixels do... just a sample from deepnight
		 HP.windowDisplayMode = hxd.DisplayMode.Windowed;
		 HP.scene.defaultSmooth = true;
		 HP.scaleMode = LetterBox(1280, 720, false, Center, Center);
		 #if js
		 HP.window.useScreenPixels = true;
		 #end
		 HP.engine.backgroundColor = 0xFF31A2F2;

		 #if sys
		 hxd.Res.initLocal(); // important! allows the app access to our game's resource files: images (sprites), audio, etc.
		 #else
		 hxd.Res.initEmbed(); // use hxd.Res.initEmbed(); for html5/js
		 #end
		*/
		 // init app stuff
		 world = new Layers(HP.scene);
		 entities = new EntityList<Entity>();
		 //players = new Array<PlayerEntity>();
		 //var monster = new Entity(); // just be sure to store the reference to entities somewhere safe!

	}
	
	public function resetWorld() {
		entities.clear();
		world = new Layers(); // TODO: lol, dunno how to dispose, the array is private, *i think* it's just a tiny array of indicies anyway.., no content
	}
	
	// called each frame right before rendering (from docs)
	// first call is done after the application is set up (so `loadAssets` and `init` are called (from docs)
	override function update(dt:Float) {
		super.update(dt);
		entities.update(dt);
		
		
	}
	
	
	// note: must be placed at the end? threw an error:
	// module main didn't define object type Main?
	static function main() {
		new MyApp();
		// can store an instance of it... but, for what? for now HP.app is the parent PunkApp class
	}
}
