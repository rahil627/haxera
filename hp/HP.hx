package hp;

import hxd.App;
import h2d.Scene;
import hxd.Window;
import hxd.Window.DisplayMode;
import h2d.Console;
import h2d.Interactive;
import hxd.Scene.ScaleMode;
import hxd.snd.Manager;

// static global helper class
// abstracts commonly used data 'n functions from mainly App, Scene, Window
// by storing references to everything
// try to keep only references of stuff, no actual objects (except simple types)
class HP {
	// TODO: learn how references work in Haxe, and how to create an actual copy
	// TODO: inline everything?
	// use FP in FlashPunk and HXP in HaxePunk as models
	
	// TODO: singleton? or not?
	// https://gameprogrammingpatterns.com/singleton.html
	// another option is to hide it all in the base app class (PunkApp)
	// either as static or public (in case of singleton)
	// then MyApp.window or MyApp.instance.window (i think static vars are just inherited...)
	// but that would still clog MyApp with a ton of method functions...
	// ... and it just makes sense to keep it seperate from App
	
	public static init(app:App, scene:Scene, window:Window, soundManager:Manager, ?console:Console) {
		// init ds
		HP.app = app;
		HP.scene = scene; // just feels better using a proper reference rather than a getter
		HP.window = window;
		
		HP.engine = app.engine;
		HP.soundManager = soundManager;
		
		#if debug
		HP.console = console;
		#end
		
		
	}

	// generally don't touch these, over time abstract them here, then make them private
	public static var window:Window(default, never);
	// overrides setter 'scene = new Scene(...)' to call app.setScene()
	public static var scene:Scene(default, set);
	public static var app:App(default, never);
	
	// from other places
	public static var soundManager:Manager(default, never);
	
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
	public static var engine(get, never):Engine; // don't know what this is yet... has backgroundColor tho
	//public static var sevents(get, never):hxd.SceneEvents; // don't know what this is yet...
	//public static var state(get, null):MainLoopState; // unimpl
	//public static var isPaused:Bool; // unimpl



	// note: the default access modifier is private, and the getters/setters should be private
	// note: setters must return something, see trivia section in docs:
	// ref: https://haxe.org/manual/class-field-property-rules.html

	// HP.window, HP.scene, HP.app all have "real/physical" reference vars set in PunkApp
	static function set_scene(s:hxd.SceneEvents.InteractiveScene, disposePrevious:Bool = true) app.setScene(s, disposePrevious);
	//static function get_scene() return app.s3d; // TODO: ?? has both at the same time? 3d unimpl

	// other properties
	//static function get_soundManager() return hxd.snd.Manager.get();

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
