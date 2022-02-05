package ra.hp; // note: not ra.hp.input

import package ra.hp.HP; // depends on HP!!
import hxd.Key;

// a stupid class for stupid people like me :(
class Mouse { // or/and Touch? TODO: is this the same for touch input?
	public static var x(get, null):Float; 
	public static var y(get, null):Float;
	public static var leftIsDown(get, null):Bool;
	public static var leftClicked(get, null):Bool;
	public static var leftReleased(get, null):Bool;
	
	// properties
	public static function get_x() return HP.scene.mouseX;
	public static function get_y() return HP.scene.mouseY;
	public static function get_leftIsDown():Bool return Key.isDown(Key.MOUSE_LEFT);
	public static function get_leftClicked():Bool return Key.isPressed(Key.MOUSE_LEFT); // isPressed is confusing :(
	public static function get_leftReleased():Bool return Key.isReleased(Key.MOUSE_LEFT);
	
	
}
