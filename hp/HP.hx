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
	public static var screenInputHandler:Interactive; // TODO temp

	// abstract Window
	public static var windowTitle(default, set):String; // try to keep class name in var name
	public static var windowDisplayMode(default, set):DisplayMode;
	//public static var windowWidth(get, default):Float; // TODO: unimpl
	//public static var windowHeight(get, default):Float; // TODO: unimpl

	// abstract Scene
	// the scene inherits a lot of shit that you probably don't want to touch..
	public static var sceneWidth(get, default):Float; // maybe also HP.width/height
	public static var sceneHeight(get, default):Float;
	//public static var scene(get, set):Float; // TODO: unimpl, use Scene.setScene


	// abstract App 
	public static var dt(get, default):Float; // TODO: probably a bad idea
	//public static var state(get, null):MainLoopState; // TODO: unimpl
	//public static var isPaused:Bool; //TODO: unimpl





	// App properties


	// Window properties
	
	// frooyanrishratum ld47
	// TODO: what is inline? And what is difference between this and storing a reference?
	// at the moment, i just created an extra reference var, but maybe better to not have any actual vars
	// and just use getter/setter
	//static inline function get_window() return hxd.Window.getInstance();
	//static inline function get_engine() return app.engine;
	//static inline function get_s2d() return app.s2d;
	//static inline function get_s3d() return app.s3d;
	//static inline function get_sevents() return app.sevents;

	
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
	static function get_dt() return hxd.Timer.dt;
	static function get_sceneWidth() return scene.width;
	static function get_sceneHeight() return scene.height;
	
}
