package ra.hp.input;

import package ra.hp.HP; // depends on HP!!
import hxd.Key;

// it feels like touch input was hacked in by heaps, inferior to mouse
// this ds brings makes a home for it
class Touch {
	// currently just copy-pasta from Mouse, because mouseX, mouseY and Key.MOUSE_LEFT are also used for touch input, but
	// beyond that, however, they are very different: multi-touch, no other mouse buttons nor wheel
	
	// TODO: inline?	
	public static var x(get, null):Float; 
	public static var y(get, null):Float;
	public static var isTouching(get, null):Bool;
	public static var justTouched(get, null):Bool; // "just" might be too verbose :/
	public static var justReleased(get, null):Bool;
	// note: stuff like onOver/onOut are handled by Interactive, not here
	
	// properties
	public static function get_x() return HP.scene.mouseX; // strange location!
	public static function get_y() return HP.scene.mouseY;
	public static function get_isTouching():Bool return Key.isDown(Key.MOUSE_LEFT);
	public static function get_justTouched():Bool return Key.isPressed(Key.MOUSE_LEFT); // isPressed is confusing :(
	public static function get_justReleased():Bool return Key.isReleased(Key.MOUSE_LEFT);
	
	
}
