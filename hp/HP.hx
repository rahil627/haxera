package ra.hp;

import hxd.App;
import h2d.Scene;
import hxd.Window;
import hxd.Window.DisplayMode;
import h2d.Console;
import h2d.Interactive;
import hxd.Scene.ScaleMode;

// helper class similar to FP in FlashPunk and HXP in HaxePunk
// abstracts the commonly used data 'n functions from App, Scene, Window
// try to keep just references of stuff, no actual objects
class HP {
	// TODO: learn how references work in Haxe, and how to create an actual copy
	// TODO: inline everything?

	// generally don't touch these, abstract them here
	public static var window:Window(default, never);
	// overrides setter 'scene = new Scene(...)' to call app.setScene()
	public static var scene:Scene(default, set);
	public static var app:App(default, never);
	
	// PunkApp
	public static var dt:Float(get, never); // TODO: are basic types not stored by reference?
	#if debug
	public static var console:Console;
	public static var screenInputHandler:Interactive; // TODO temp
	#end
		
	// abstract Window
	public static var windowTitle(default, set):String; // try to keep class name in var name for now, for learning purposes
	public static var windowDisplayMode(default, set):DisplayMode;
	//public static var windowWidth(get, default):Float; // unimpl; no need, yet
	//public static var windowHeight(get, default):Float; // unimpl

	// abstract Scene
	// the scene inherits a lot of shit that you probably don't want to touch..
	public static var sceneScaleMode(get, set):ScaleMode; // use this to actually set the screen size
	public static var sceneWidth(get, never):Float;
	public static var sceneHeight(get, never):Float;
	public static var width(get, never):Float; // shortcut
	public static var height(get, never):Float;


	// abstract App
	//public static var engine(get, never):Engine; // don't know what this is yet...
	//public static var sevents(get, never):hxd.SceneEvents; // don't know what this is yet...
	//public static var state(get, null):MainLoopState; // unimpl
	//public static var isPaused:Bool; // unimpl



	// note: the default access modifier is private, and the getters/setters should be private
	// note: setters must return something, see trivia section in docs:
	// ref: https://haxe.org/manual/class-field-property-rules.html

	// HP.window, HP.scene, HP.app all have "real/physical" reference vars set in PunkApp
	static function set_scene(s:hxd.SceneEvents.InteractiveScene, disposePrevious:Bool = true) app.setScene(s, disposePrevious);
	//static function get_scene() return app.s3d; // TODO: ?? has both at the same time? 3d unimpl

	// PunkApp properties
	//static function get_dt() return hxd.Timer.dt;  // TODO: dt passed into update vs hxd.Timer.dt? (currently using passed in as reference)
	
	// Window properties
	//static function get_window() return hxd.Window.getInstance(); // magically generates a pointer var...??
	static function set_windowTitle(s:String):String return HP.window.title;
	static function set_windowDisplayMode(dm:DisplayMode):DisplayMode return HP.window.displayMode = dm;
	//HP.window.setFullScreen is deprecated, but can make my own..
	//static function get_engine() return app.engine;
	//static function get_sevents() return app.sevents;

	// Scene properties
	static function get_sceneScaleMode() return sceneScaleMode;
	static function set_sceneScaleMode(sm:ScaleMode):ScaleMode return scene.scaleMode = sm;
	static function get_sceneWidth() return scene.width;
	static function get_sceneHeight() return scene.height;
	static function get_width() return scene.width; // TODO: test window.width vs scene.width
	static function get_height() return scene.height;
	
	// App properties
	
	
}
