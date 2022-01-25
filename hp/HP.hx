// helper class similar to FP in FlashPunk and HXP in HaxePunk

class HP {
	// hopefully just a reference..?
	public static var scene: h2d.Scene;  // = App.s2d

	public static var dt(get, default) : Float;
	static function get_dt() {
    		return hxd.Timer.dt;
  	}

	//static function helperFunction() {
		// do something
	//}


}
