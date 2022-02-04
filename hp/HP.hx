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
	// TODO: learn how references work in Haxe, and how to create an actual copy
	public static var window:Window(default, never);  // generally don't touch this, abstract it here
	public static var scene:Scene(default, default); // generally don't touch this, abstract it here
	public static var app:App(default, never); // TODO: App or PunkApp?, generally don't touch this, abstract it here
	
	public static var console:Console; // TODO: if debug
	public static var screenInputHandler:Interactive; // TODO temp

	// abstract Window
	public static var windowTitle(default, set):String; // try to keep class name in var name
	public static var windowDisplayMode(default, set):DisplayMode;
	//public static var windowWidth(get, default):Float; // unimpl; no need, yet
	//public static var windowHeight(get, default):Float; // unimpl

	// abstract Scene
	// the scene inherits a lot of shit that you probably don't want to touch..
	public static var sceneWidth(get, default):Float; // maybe also HP.width/height
	public static var sceneHeight(get, default):Float;


	// abstract App
	//public static var engine(get, never):Engine; // don't know what this is yet...
	//public static var sevents(get, never):hxd.SceneEvents; // don't know what this is yet...
	public static var dt:Float; // TODO: are basic types not stored by refererence?
	//public static var state(get, null):MainLoopState; // unimpl
	//public static var isPaused:Bool; // unimpl




	// note: the default access modifier private, and the getters/setters should be private

	//App properties


	// Window properties
	// TODO: does inline even make a difference here?
	static function get_window() return hxd.Window.getInstance(); // magically generates a pointer var...?
	//static function get_engine() return app.engine;
	static function get_scene() return app.s2d;
	static function set_scene(s:hxd.SceneEvents.InteractiveScene, disposePrevious:Bool = true) app.setScene(s, disposePrevious);
	//static function get_scene() return app.s3d; // ?? has both at the same time?
	//static function get_sevents() return app.sevents;

	
	// TODO: hmmmm, having trouble with returning Void :(
	static function set_windowTitle(s:String):String {
		HP.window.title = s;
		return s;
	}
	// TODO: hmmmm, having trouble with returning Void :(
	static function set_windowDisplayMode(dm:DisplayMode):DisplayMode {
		//HP.window.setFullScreen is deprecated, but can make my own..
		HP.window.displayMode = dm;
		return dm;
	}

	// Scene properties
	//static function get_dt() return hxd.Timer.dt;  // TODO: dt passed into update vs hxd.Timer.dt?
	static function get_sceneWidth() return scene.width;
	static function get_sceneHeight() return scene.height;
	
}
