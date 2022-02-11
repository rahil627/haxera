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
// try to keep only references of stuff, no actual objects (except maybe simple types / constants)
class HP {
	// TODO: learn how references work in Haxe, and how to create an actual copy
	// TODO: inline everything?  need to learn when not to use inline; super important for graphics drawing/rendering
	// use FP in FlashPunk and HXP in HaxePunk as models
	
	// TODO: singleton? or not?
	// https://gameprogrammingpatterns.com/singleton.html
	// another option is to hide it all in the base app class (PunkApp)
	// either as static or public (in case of singleton)
	// then MyApp.window or MyApp.instance.window (i think static vars are just inherited...)
	// but that would still clog MyApp with a ton of method functions...
	// ... and it just makes sense to keep it seperate from App
	
	public static init(app:App, scene2d:Scene, scene3d:Scene, window:Window, soundManager:Manager, ?console:Console) {
		// init ds
		// global references to singletons..? lol. this can't be good...
		HP.app = app;
		HP.scene = scene2d; // just feels better using a proper reference rather than a getter
		HP.scene3d = scene3d; // TODO: can you have both at the same time, or just choose one?
		HP.window = window;
		
		HP.engine = app.engine;
		HP.soundManager = soundManager;
		
		#if debug
		HP.console = console;
		#end
		
		
	}

	// generally don't touch these, abstract them here
	// should be private, but kept public for advanced use
	// currently these next few are set by reference, hence default get
	public static inline var window:Window(default, never); // todo: lol, can you inline a property, not the function?
	// overrides setter 'scene = new Scene(...)' to call app.setScene()
	public static inline var scene:Scene(default, set); // TODO: not might be an inline problem
	public static inline var app:App(default, never);
	
	// from other places
	public static inline var soundManager:Manager(default, never);
	
	// PunkApp
	// todo: if dt is indeed stored by value, that would be problem as i only update it once per frame
	public static inline var dt:Float(get, never); // TODO: are basic types not stored by reference?
	#if debug
	public static inline var console:Console;
	public static inline var screenInputHandler:Interactive; // TODO temp
	#end
		
	// abstract Window
	public static inline var windowTitle(default, set):String; // try to keep class name in var name for now, for learning purposes
	public static inline var windowDisplayMode(default, set):DisplayMode;
	//public static inline var windowWidth(get, default):Float; // unimpl; no need, yet
	//public static inline var windowHeight(get, default):Float; // unimpl

	// abstract Scene
	// the scene inherits a lot of shit that you probably don't want to touch..
	public static inline var sceneScaleMode(get, set):ScaleMode; // use this to actually set the screen size
	public static inline var sceneWidth(get, never):Float;
	public static inline var sceneHeight(get, never):Float;
	public static inline var width(get, never):Float; // shortcut, def inline
	public static inline var height(get, never):Float;


	// abstract App
	public static inline var engine(get, never):Engine; // currently using a reference; don't know what this is yet... has backgroundColor tho
	//public static inline var sevents(get, never):hxd.SceneEvents; // don't know what this is yet...
	//public static inline var state(get, null):MainLoopState; // unimpl
	//public static inline var isPaused:Bool; // unimpl



	// note: the default access modifier is private, and the getters/setters should be private
	// note: setters must return something, see trivia section in docs:
	// ref: https://haxe.org/manual/class-field-property-rules.html

	// HP.window, HP.scene, HP.app all have "real/physical" reference vars set in PunkApp
	static function set_scene(s:hxd.SceneEvents.InteractiveScene, disposePrevious:Bool = true) app.setScene(s, disposePrevious);

	// other properties
	//static inline function get_soundManager() return hxd.snd.Manager.get();

	// PunkApp properties
	//static inline function get_dt() return hxd.Timer.dt;  // TODO: dt passed into update vs hxd.Timer.dt? (currently using passed in as reference)
	
	// Window properties
	//static inline function get_window() return hxd.Window.getInstance(); // currently using a reference
	static inline function set_windowTitle(s:String):String return HP.window.title;
	static inline function set_windowDisplayMode(dm:DisplayMode):DisplayMode return HP.window.displayMode = dm;
	//HP.window.setFullScreen is deprecated, but can make my own..
	//static inline function get_engine() return app.engine; // currently using a reference
	//static inline function get_sevents() return app.sevents; // unimpl

	// Scene properties
	static inline function get_sceneScaleMode() return sceneScaleMode;
	static inline function set_sceneScaleMode(sm:ScaleMode):ScaleMode return scene.scaleMode = sm;
	static inline function get_sceneWidth() return scene.width;
	static inline function get_sceneHeight() return scene.height;
	static inline function get_width() return scene.width;
	static inline function get_height() return scene.height;
	
	// App properties
	
	
}