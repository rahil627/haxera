package ra.hp;

import h2d.Console;

// helper class similar to FP in FlashPunk and HXP in HaxePunk
// TODO: maybe rename to just P
class HP {
	// TODO: hopefully just a reference, like ActionScript..?
	public static var scene:h2d.Scene; // = App.s2d
	public static var console:Console;

	// TODO: dt passed into update vs Timer.dt?
	public static var dt(get, default):Float;

	static function get_dt() {
		return hxd.Timer.dt;
	}

	// static function helperFunction() {
	// do something
	// }
}
