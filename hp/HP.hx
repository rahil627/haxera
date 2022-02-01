package ra.hp;

import hxd.App;
import h2d.Scene;
import hxd.Window;
import hxd.Window.DisplayMode;
import h2d.Console;
import h2d.Interactive;


// helper class similar to FP in FlashPunk and HXP in HaxePunk
// abstracts the useful functions from App, Scene, Window
// try to keep just references, no actual objects
class HP {
	// TODO: learn how references work, and how to create a copy
	public static var window:Window;  // generally don't touch this, abstract it here
	public static var scene:Scene; // generally don't touch this, abstract it here
	public static var app:App; // generally don't touch this, abstract it here
	
	public static var console:Console; // TODO: if debug


	// THIS SECTION IS OPTIONAL
	public static var screenInputHandler:Interactive; // TODO temp

	// TODO: these are rather optional, constraining the game/app
	//public static var world:Layer; // TODO: scene or this?
	public static var entities:Array<Entity>;
	// END OF OPTIONAL SECTION


	// abstract Window
	public static var windowTitle(default, set):String; // try to keep class name in var name
	public static var windowDisplayMode(default, set):DisplayMode;
	
	// App is abstracted by PunkApp
	// but can further abstract it here...
	public static var dt(get, default):Float; // TODO: probably a bad idea

	// abstract Scene
	// the scene inherits a lot of shit that you probably don't want to touch..
	public static var sceneWidth(get, default):Int;
	public static var sceneHeight(get, default):Int;








	// App properties


	// Window properties
	
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
