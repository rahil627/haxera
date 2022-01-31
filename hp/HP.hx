package ra.hp;

import h2d.Scene;
import hxd.Window;
import h2d.Console;
import h2d.Interactive;


// helper class similar to FP in FlashPunk and HXP in HaxePunk
// TODO: maybe rename to just P
class HP {
	// TODO: hopefully just a reference, like ActionScript..?
	public static var scene:Scene; // = App.s2d
	public static var window:Window;
	public static var console:Console;
	public static var screenInputHandler:Interactive;

	// TODO: dt passed into update vs Timer.dt?
	public static var dt(get, default):Float;

	static function get_dt() {
		return hxd.Timer.dt;
	}

	// static function helperFunction() {
	// do something
	// }
}
