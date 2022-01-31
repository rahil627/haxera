package ra.hp;

import hxd.App;
import h2d.Scene;
import hxd.Window;
import hxd.Window.DisplayMode;
import h2d.Console;
import h2d.Interactive;


// helper class similar to FP in FlashPunk and HXP in HaxePunk
// abstracts the useful functions from App, Scene, Window
// TODO: maybe rename to just P
class HP {
	// TODO: hopefully just a reference, like ActionScript..?
	public static var app:App; // generally don't touch this / abstract this
	public static var scene:Scene; // = App.s2d; TODO: try to abstract this here
	public static var window:Window; // generally don't touch this; for advanced use only
	public static var console:Console;
	public static var screenInputHandler:Interactive;
	public static var dt(get, default):Float;

	// abstract Window
	public static var windowTitle(default, set):String; // try to keep class name in var name
	public static var windowDisplayMode(default, set):DisplayMode;
	
	// App is abstracted by PunkApp
	// but can further abstract it here...

	// abstract Scene
	// the scene inherits a lot of shit that you probably don't want to touch..
	public static var sceneWidth(get, default):Int;
	public static var sceneHeight(get, default):Int;

	// Window properties
	
	// TODO: seperate getter/setter or not?
	// TODO: hmmmm, having trouble with returning Void :(
	static function set_windowTitle(s:String):String {
		HP.window.title = s;
		return s;
	}

	static function set_windowDisplayMode(dm:DisplayMode):DisplayMode {
		//HP.window.setFullScreen is deprecated, but can make my own..
		HP.window.displayMode = dm;
		return dm;
	}

	// Scene properties

	// TODO: dt passed into update vs Timer.dt?
	static function get_dt() {
		return hxd.Timer.dt;
	}

	static function get_sceneWidth() {
		return scene.width;
	}

	static function get_sceneHeight() {
		return scene.height;
	}

	// static function helperFunction() {
	// do something
	// }
}
