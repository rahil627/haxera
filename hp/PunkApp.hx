package ra;

import hxd.App;
import h2d.Console;
/*
// the HaxePunk states, only needed for special cases
// unimpl
enum MainLoopState {
	preUpdate;
	postUpdate;
	preRender;
	postRender;
}
*/
// extend me!
// similar to Engine in Flash/HaxePunk (but heaps uses h3d.Engine, soooo)
// just a layer on top of the main App class
// must extend App because init() and update() are called internally by App
// it was designed to be extended
class PunkApp extends App {

	// generally don't want any data in this class
	// just use HP to keep references to everything

	#if debug
	public static var console:Console;
	var screenInputHandler:h2d.Interactive; // TODO: temp input solution
	#end
	
	// override me and remember to call super.init()
	override function init() {
		super.init(); // empty

		// set global vars
		HP.app = this;
		HP.scene = this.s2d; // just feels better setting it here, rather than putting it in a get-property
		HP.window = hxd.Window.getInstance();
		
		HP.engine = HP.app.engine;
	
		// init global stuff
		HP.window.title = "heaps <3 p u n k"; // i've seen this set in the hxml build file

		#if debug
		HP.console = new h2d.Console(hxd.res.DefaultFont.get(), HP.scene); // TODO: font is tiny :(
		HP.console.shortKeyChar = "`".charCodeAt(0);
		HP.console.show(); // TODO: temp, because inputs dont work
		
		// setup input	
		// TODO: temporary global input handler solution until i actually fix keys
		HP.screenInputHandler = new h2d.Interactive(HP.scene.width, HP.scene.height, HP.scene); // ?collider = HP.scene.getBounds()
		//touchHandler.onOver = function(_) b.alpha = 0.5;
		//touchHandler.onOut = function(_) b.alpha = 1.0;

		// TODO: debugging input
		HP.window.addEventTarget(onEvent);
		// TODO: try HP.scene.AddEventListener()

		// just trying shit :/
		//Key.initialize(); // called in App.setup()
		HP.window.propagateKeyEvents = true; // used internally
		#end
	}
	
	#if debug
	// TODO: testing input
	function onEvent(event : hxd.Event) {
		HP.console.log("global input event: " + event.toString());
				
	}
	#end
		
	// override me and remember to call super.update(dt)
	override function update(dt:Float) {
		super.update(dt); // empty
		
		// update global vars
		HP.dt = dt;

		// TODO: testing timer vars
		if (hxd.Timer.dt != dt)
			HP.console.log("the time vars are actually different!");		
	}

	// optional override
	override function onResize() {
		// placeholder
	}


}


