package hp.input;

import hp.HP; // depends on HP!! bad coupling, but it needs scene (App.s2d/s3d)
// otherwise, you'd have to pass in the scene during init, then
// know which to use, s2d or s3d
// yeah... damn de-coupling is difficult! :/
// scene's get_MouseX/Y itself relies on Window.getInstance().mouseX
import hxd.Key;

// mouse input is all over the place in heaps
// this ds brings it all together
// note: this is a scene-level handler, not for Interactive
// TODO: this only works for 2d
class Mouse {

	// try to model after hxd.Key
	// Key has initialize and dispose, but
	// Key.initialize is hard-coded in: called in App.setup()
	// TODO: and i couldn't find any calls to Key.dispose()...???

	public static var x(get, null):Float; 
	public static var y(get, null):Float;
	public static var leftIsDown(get, null):Bool;
	public static var leftJustPressed(get, null):Bool; // "just" might be too verbose :/
	public static var leftJustReleased(get, null):Bool;
	// note: stuff like onOver/onOut are handled by Interactive, not here
	
	// properties

	// note: h2d.Scene provides mouseX/mouseY, but h3d.scene.Scene doesn't...
	// hence why this only works for 2d

	public static inline function get_x() return HP.scene.mouseX;
	public static inline function get_y() return HP.scene.mouseY;

	// for 3d, can try using either Window.mouseX/Y or perhaps from hxd.SceneEvents
	//public static var windowMouseX(default, null):Int; // can use for mouse in 3d, or from hxd.SceneEvents?
	//public static var windowMouseY(default, null):Int;

	public static inline function get_leftIsDown():Bool return Key.isDown(Key.MOUSE_LEFT);
	public static inline function get_leftJustPressed():Bool return Key.isPressed(Key.MOUSE_LEFT); // isPressed is confusing :(
	public static inline function get_leftJustReleased():Bool return Key.isReleased(Key.MOUSE_LEFT);
	
	
}


// can easily finish this class by copy-pasta'ing the rest:
// otherwise, see HaxePunk for more: https://github.com/HaxePunk/HaxePunk/blob/dev/haxepunk/input/Mouse.hx
/* from hxd.Key
	public static inline var MOUSE_LEFT = 0;
	public static inline var MOUSE_RIGHT = 1;
	public static inline var MOUSE_MIDDLE = 2;
	public static inline var MOUSE_BACK = 3;
	public static inline var MOUSE_FORWARD = 4;
	
	// Mouse wheel does not have an off signal, and should be checked only through `isPressed` method.
	// Note that there may be multiple wheel scrolls between 2 frames, and to receive more accurate
	// results, it is recommended to directly listen to wheel events which also provide OS-generated wheel delta value.
	// See `Interactive.onWheel` for per-interactive events. For scene-based see `Scene.addEventListener`
	// when event is `EWheel`. For global hook use `Window.addEventTarget` method.
	public static inline var MOUSE_WHEEL_UP = 5;
	public static inline var MOUSE_WHEEL_DOWN = 6;
*/
