package ra.hp;

import hxd.App;
import h2d.Console;

// extend me!
// similar to Engine in Flash/HaxePunk (but heaps uses h3d.Engine, soooo:)
// just a layer on top of the main App class
// must extend App because init() and update() are called internally by App
// it was purposefully set like that..
class PunkApp extends App {

	var screenInputHandler:h2d.Interactive;

	override function init() {
		super.init(); // empty

		// set global vars
		HP.app = this;
		HP.scene = this.s2d;
		HP.window = hxd.Window.getInstance();

		// init global stuff
		HP.window.title = "heaps <3 p u n k";
		//HP.window.displayMode = hxd.DisplayMode.Fullscreen; // should use scene.ScaleMode
		//HP.propogateKeyEvents = true;

		HP.console = new h2d.Console(hxd.res.DefaultFont.get(), HP.scene);
		HP.console.shortKeyChar = "`".charCodeAt(0);
		HP.console.show(); // TODO: temp, because inputs dont work

		// TODO: testing trace--not logged in the console!
		trace("pressed something, logged by trace");
		trace("pressed something, logged by trace");
		trace("pressed something, logged by trace");
		
		// setup input
		// TODO: is this needed??--no, called in App.setup()
		//Key.initialize();
		
		// TODO: temporary global input handler until i fix keys
		// TODO: should use HP.scene.AddEventListener()
		HP.screenInputHandler = new h2d.Interactive(HP.scene.width, HP.scene.height, HP.scene); // ?collider = HP.scene.getBounds()
		//touchHandler.onOver = function(_) b.alpha = 0.5;
		//touchHandler.onOut = function(_) b.alpha = 1.0;

		// TODO: debugging input
		HP.window.addEventTarget(onEvent);

		// TODO: what about this??
		HP.window.propagateKeyEvents = true;
	}

	override function update(dt:Float) {
		super.update(dt); // empty
		
		// update global vars
		HP.dt = dt;

		// TODO: testing timer vars
		if (hxd.Timer.dt != dt)
			HP.console.log("the time vars are actually different!");		
	}

	override function onResize() {
		// placeholder
	}

	// TODO: testing input
	function onEvent(event : hxd.Event) {
		HP.console.log("global input event: " + event.toString());
				
	}

}





/* notes on how to use  console
	from Beezle*

// or you can call console from code
console.show();
// and type some info here...
console.log("Hello from console :)", 0x00ff00);
console.log("Warning!", 0xff0000);
// you can add custom commands to your console which can take various types of arguments
// (Int, Float, String, Bool and even Enums):
// 1. command without arguments:
console.addCommand("remove_tiles", "Remove all green tiles", [], function() {
	s2d.removeChild(map);
});

console.addCommand("add_tiles", "Add all green tiles back to the scene", [], function() {
	s2d.addChildAt(map, 0);
});

// you can run registered console command from code:
console.runCommand("add_tiles");
// 2. command with 2 floating point number arguments
console.addCommand("move_logo", "Moves logo to specified position", [{name: "x", t: AFloat, opt: false}, {name: "y", t: AFloat, opt: false}],
	function(x:Float, y:Float) {
		char.x = x;
		char.y = y;
	});

// 3. command with optional bool argument
console.addCommand("show_logo", "Shows or hides logo", [{name: "visible", t: ABool, opt: true}], function(?visible:Bool = true) {
	char.visible = visible;
});
// you can call scroll through previous called commands by pressing up and down buttons
// (while cursor is focused in console)
// and you can add short alias name for your commands
console.addAlias("mv", "move_logo");
*/
