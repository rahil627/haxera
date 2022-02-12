package hp;

import hxd.App;
import h2d.Scene;
import hxd.Window;
import hxd.Window.DisplayMode;
import h2d.Console;
import h2d.Interactive;
import hxd.snd.Manager;
import h3d.Engine;

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

	// called by PunkApp init
	public static function init(app:App, ?console:Console) {
		// init ds
		// global references to singletons..? lol. this can't be good...
		HP.app = app;
		HP.scene2d = app.s2d; // just feels better using a proper reference rather than a getter
		HP.scene3d = app.s3d; // both s2d and s3d are used
		// Entity uses this to add Object to the scene.... soooo... hmmmmmm
		// when Entity calls HP.world.add(Object), would it work for both 2d and 3d?
		// no, world is Layer, and Layer is part of h2d
		// thus the base classes should keep Layers as optional and just use
		// either Object.addChild or new Object(parent) because
		// that is the api that they have in common: Object and Scene
		// maybe h2d.Layers is similar to h3d.World, but different
		HP.scene = app.s2d; // 2d is the default because i'll never get to 3d :( // TODO: lol, this is triggering the setter
		HP.is3d = false; // TODO: maybe can't have field names begin with a number?

		HP.window = Window.getInstance();
		//HP.windowWidth = HP.window.width; // unimpl until i need it
		//HP.windowHeight = HP.window.height;
		HP.windowTitle = HP.window.title;
		HP.windowDisplayMode = HP.window.displayMode;
		HP.windowIsFocused = HP.window.isFocused;
		HP.windowMouseX = HP.windowMouseX;
		HP.windowMouseY = HP.windowMouseY;

		HP.engine = app.engine;
		
		HP.soundManager = hxd.snd.Manager.get(); // also forces sound manager init on startup instead of first sound play

		#if debug
		HP.console = console;
		#end
		
		
	}

	public static function dispose() {
		// i'm a naughty programmer! :)
	}

	// CALL ME in the main app, it's up to the user to call this
	// if the user forgets to set this, it will use 2d scene by default
	public static function setup(is3d:Bool) {
		HP.is3d = is3d;
	}

	// TODO: I TOTALLY REGRET SEPERATING THE PROPERTIES FROM THEIR FUNCTIONS :( :(


	// these are the only actual data stored in this class
	public static var is3d(default, null):Bool;


	// the following are set in init and have default getter/setters
	// generally don't touch these, abstract them here
	// should be private, but kept public for advanced use
	// currently these next few are set by reference, hence default get
	
	public static var window(default, null):Window; // TODO: note: cannot inline properties, but can inline the getter/setter or this?
	// by default, this references the default 2d scene (App.s2d)
	// either call setup() or set 3d = true
	// overrides setter 'scene = new Scene(...)' to call app.setScene() // TODO: unimpl
	public static var scene(default, null):Scene; // TODO: how to inline the getter?
	public static var scene2d(default, null):Scene; 
	public static var scene3d(default, null):h3d.scene.Scene; 
	public static var app(default, null):App; // TODO: App vs PunkApp
	public static var engine(default, null):Engine; //don't know what this is yet... has backgroundColor tho

	// TODO: how to set the initial value of a property without triggering the setter?
	//static function set_scene(s:Scene):Scene { HP.app.setScene(s, true); return app.s2d; } // TODO: only works for 2d, but there might be a way to use event scene interactive, or whaterver the base class of both 2d and 3d scene are... see the App.setScene method on how Scene is downcasted
	

	// from other places
	// warning: maybe "lazy" initializes sound manager on this first call?
	public static var soundManager(default, null):Manager;
	// delta current time, normally you should use dt tho
	public static var dct(get, null):Float;
	
	//static inline function get_soundManager() return hxd.snd.Manager.get();
	static inline function get_dct() return hxd.Timer.dt; // must use getter for non-reference values


	// PunkApp
	// updated once per frame, in App's main loop
	// i think hxd.Timer.dt actually fetches the current time
	// note: be careful to not set this value
	public static var dt(default, default):Float;
	#if debug
	public static var console:Console;
	public static var screenInputHandler:Interactive; // TODO temp
	#end
		
	// note: try to keep class name in var name for now, for learning purposes
		
	// abstract Window
	// TODO: better to just hide these and just set them in the hxml file
	// they can be confused with sceneScaleMode, sceneWidth, sceneHeight
	public static var windowTitle:String;
	public static var windowDisplayMode:DisplayMode; // Window provides get and set
	public static var windowIsFocused:Bool; // Window provides get and set; useful to pause when not focused
	public static var windowMouseX(default, null):Int; // can use for mouse in 3d, or from hxd.SceneEvents?
	public static var windowMouseY(default, null):Int;
	//public static inline var windowWidth(get, null):Float; // unimpl; no need, yet
	//public static inline var windowHeight(get, null):Float; // unimpl
	
	//static inline function get_window() return hxd.Window.getInstance(); // currently using a reference
	//HP.window.setFullScreen is deprecated, but can make my own..
	static inline function get_sceneEvents() return app.sevents; 


	// abstract Scene
	// the scene inherits a lot of shit that you probably don't want to touch..
	public static var sceneScaleMode(get, set):ScaleMode; // use this to actually set the screen size
	public static var sceneWidth(get, never):Float;
	public static var sceneHeight(get, never):Float;
	public static var width(get, never):Float; // shortcut, def should be inline
	public static var height(get, never):Float;

	static inline function get_sceneScaleMode() return scene.scaleMode;
	static inline function set_sceneScaleMode(sm:ScaleMode):ScaleMode return scene.scaleMode = sm;
	static inline function get_sceneWidth() return scene.width;
	static inline function get_sceneHeight() return scene.height;
	static inline function get_width() return scene.width;
	static inline function get_height() return scene.height;


	// abstract App
	// app
	// s2d
	// s3d
	// engine
	//static inline function get_engine() return app.engine; // currently uses a reference
	public static var sceneEvents(get, null):hxd.SceneEvents;
	//public static inline var state(get, null):MainLoopState; // unimpl
	//public static inline var isPaused:Bool; // unimpl

	// App properties




	// TODO:  note: the default access modifier is private, and the getters/setters should be private
	// TODO: note: setters must return something, see trivia section in docs:
	// ref: https://haxe.org/manual/class-field-property-rules.html

	
}
