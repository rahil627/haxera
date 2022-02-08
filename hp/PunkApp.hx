package hp;

import hxd.App;
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
		
		#if debug
		console = new h2d.Console(hxd.res.DefaultFont.get(), HP.scene); // TODO: font is tiny :(
		console.shortKeyChar = "`".charCodeAt(0);
		console.show(); // TODO: temp, because inputs dont work
		#end
		
		// init global ds
		// warning: maybe initiazlies sound manager on this first call
		HP.init(this, this.s2d, hxd.Window.getInstance(), hxd.snd.Manager.get(), console);
		
		#if debug
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


