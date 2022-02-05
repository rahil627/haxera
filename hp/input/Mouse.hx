package ra.hp; // note: not ra.hp.input

import package ra.hp.HP; // depends on HP!!
import hxd.Key;

// a stupid class for stupid people like me
class Mouse {
	public static var x(get, null):Float; 
	public static var y(get, null):Float;	
	
	
	
	
	
	
	
	
	
	// properties
	public static function get_x() return HP.scene.mouseX;
	public static function get_y() return HP.scene.mouseY;

	public static function leftheld():Bool {
		if (Key.isDown(Key.MOUSE_LEFT)) {
			return true;
		}
		return false;
	}

	public static function leftclick():Bool {
		if (Key.isPressed(Key.MOUSE_LEFT)) {
			return true;
		}
		return false;
	}

	public static function leftreleased():Bool {
		if (Key.isReleased(Key.MOUSE_LEFT)) {
			return true;
		}
		return false;
	}
}
