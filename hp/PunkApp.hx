package ra.hp;

import hxd.App;
import h2d.Console;

// extend me!
// similar to Engine in Flash/HaxePunk (but heaps uses h3d.Engine)
// just a layer on top of the main App class
class PunkApp extends App {
	public var console:Console; // or debugConsole?

	override function init() {
		super.init(); // empty?

		// add console to the game
		var console = new h2d.Console(hxd.res.DefaultFont.get(), s2d);

		// redefine key to show console on screen
		console.shortKeyChar = "`".charCodeAt(0);
	}

	override function update(dt:Float) {
		super.update();
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
