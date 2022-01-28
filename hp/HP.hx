package ra.hp;

// helper class similar to FP in FlashPunk (and HXP in HaxePunk)
class HP {
	// TODO: hopefully just a reference, like ActionScript..?
	public static var scene:h2d.Scene; // = App.s2d
	public static var debugText:h2d.Text;

	// TODO: dt passed into update vs Timer.dt?
	public static var dt(get, default):Float;

	static function get_dt() {
		return hxd.Timer.dt;
	}

	// static function helperFunction() {
	// do something
	// }
}
