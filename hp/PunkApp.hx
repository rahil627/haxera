package ra.hp;

import hxd.App;
import h2d.Console;

// extend me!
// similar to Engine in Flash/HaxePunk (but heaps uses h3d.Engine)
// just a layer on top of the main App class
class PunkApp extends App {

	var inputHandler:h2d.Interactive;

	override function init() {
		super.init(); // empty

		// set global vars
		HP.scene = this.s2d;

		// init global stuff
		HP.console = new h2d.Console(hxd.res.DefaultFont.get(), HP.scene);
		HP.console.shortKeyChar = "`".charCodeAt(0);

		// TODO: testing trace	
		trace("pressed something, logged by trace");
		
		// setup input
		// TODO: is this needed??
		//Key.initialize();
		
		// TODO: move to HP
		inputHandler = new h2d.Interactive(HP.scene.width, HP.scene.height, HP.scene); // ?collider = HP.scene.getBounds()
		
		// TODO: debugging input
		hxd.Window.getInstance().addEventTarget(onEvent);

		// TODO: what about this??
		hxd.Window.getInstance().propagateKeyEvents = true;
	}

	override function update(dt:Float) {
		super.update(dt); // empty
		
		// update global vars
		HP.dt = dt;

		// TODO: testing timer vars
		if (hxd.Timer.dt != dt)
			HP.console.log("the time vars are actually different!");		
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