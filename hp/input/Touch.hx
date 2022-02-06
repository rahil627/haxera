package ra.hp.input;

import ra.hp.HP; // depends on HP!!
import hxd.Key;

// touch input in heaps feel as if it was done secondary to mouse
// this ds brings makes a home for it :)
// note: this is a scene-level handler, not for Interactive
class Touch {
	// currently just copy-pasta from Mouse, because mouseX, mouseY and Key.MOUSE_LEFT are also used for touch input, but
	// beyond that, however, they are very different: multi-touch, no other mouse buttons nor wheel
	
	// TODO: global vs scene?
	// TODO: multi-touch
	// 3 levels: global, scene, interactive?
	
	// TODO: inline?	
	public static var x(get, null):Float; 
	public static var y(get, null):Float;
	public static var isTouching(get, null):Bool;
	public static var justTouched(get, null):Bool; // "just" might be too verbose :/
	public static var justStoppedTouching(get, null):Bool; // just let go'd?
	// note: stuff like onOver/onOut are handled by Interactive, not here
	
	// properties
	public static function get_x() return HP.scene.mouseX; // note: scene-based event, not global
	public static function get_y() return HP.scene.mouseY;
	public static function get_isTouching():Bool return Key.isDown(Key.MOUSE_LEFT);
	public static function get_justTouched():Bool return Key.isPressed(Key.MOUSE_LEFT); // isPressed is confusing :(
	public static function get_justStoppedTouching():Bool return Key.isReleased(Key.MOUSE_LEFT);
	
	
}
