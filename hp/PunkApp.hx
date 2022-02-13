package hp;

import hxd.App;
import h2d.Console;

/*
// the HaxePunk states, only needed for special cases
// unimpl
enum MainLoopState {
	preUpdate;
	postUpdate;
	preRender;
	postRender;
}
*/
// extend me!
// similar to Engine in Flash/HaxePunk (but heaps uses h3d.Engine, soooo)
// just a layer on top of the main App class
// must extend App because init() and update() are called internally by App
// it was designed to be extended
class PunkApp extends App {

	// generally don't want any data in this class
	// just use HP to keep references to everything
	
	#if debug
	public var console:Console;
	public var screenInputHandler:h2d.Interactive; // TODO: temp input solution
	#end
	
	// override me and remember to call super.init()
	override function init() {
		super.init(); // empty
		
		#if debug
		var font = hxd.res.DefaultFont.get();
		font.resizeTo(font.size*2);
		console = new h2d.Console(font, HP.scene); // might eventually need it's own PunkConsole class
		console.shortKeyChar = "`".charCodeAt(0);
		console.show(); // TODO: temp, because inputs dont work
		
		redirectTracesToConsole(console);
		#end
		
		// init global ds
		HP.init(this, console);
		
		// set some stuff
		HP.windowTitle = "heaps <3 p u n k"; // i've seen this set in the hxml build file
		HP.engine.backgroundColor = 0xE0C9A6;
	
		
		
		#if debug
		// TODO: temporary global input handler solution until i actually fix keys
		HP.screenInputHandler = new h2d.Interactive(HP.scene.width, HP.scene.height, HP.scene); // ?collider = HP.scene.getBounds()
		//touchHandler.onOver = function(_) b.alpha = 0.5;
		//touchHandler.onOut = function(_) b.alpha = 1.0;

		// TODO: debugging input
		HP.window.addEventTarget(onEvent);
		// TODO: try HP.scene.AddEventListener()

		// just trying shit :/
		//Key.initialize(); // called in App.setup()
		HP.window.propagateKeyEvents = true; // used internally
		#end
	}
	
	override function dispose() {
		super.dispose(); // very important! gets rid of s2d, s3d, engine
		//HP.dispose() // set all references to null?
		//console = null //? didn't see a dispose function
	}
	
	#if debug
	// TODO: testing input
	function onEvent(event : hxd.Event) {
		HP.console.log("global input event: " + event.toString());
				
	}
	#end
		
	// override me and remember to call super.update(dt)
	// without this, the dt non-reference value will never get updated!!!
	override function update(dt:Float) {
		super.update(dt); // empty
		
		// update global vars
		HP.dt = dt;
		
		#if debug
		drawHitboxes2d();
		#end
	}

	// optional override
	override function onResize() {
		// placeholder
	}
	
	#if debug
	// draws the rectangular Bounds of each Object in the 2d Scene tree
	function drawHitboxes2d(insideColor:Int = 0xFF0000, insideAlpha:Float = .5, outlineColor:Int = 0x00FF00, outlineAlpha:Float = .9) {
		//var children:Array<h2d.Object> = this.s2d.children;  // private var?? wtf. i give up on learning this shit, just use Godot!
		var ai/*:hxd.impl.ArrayIterator<h2d.Object>*/ = this.s2d.getLayer(-1);
		var b:h2d.col.Bounds;
		var g = new h2d.Graphics(this.s2d);
		var i:Int = 0;
		while (ai.hasNext()) {
		//for( i in 0...children.length ) {
			//children[i].getBounds(); // i think this includes the bounds of all of it's children, so... only get top layer?
			// or find another function that returns only that Object's bounds and recurse through the entire scene tree
		// TODO: wtf to do with an ArrayIterator, if you cannot access the children array?	
			g.beginFill(insideColor, insideAlpha);
			g.lineStyle(1, outlineColor, outlineAlpha);
			//g.drawRect(b.x, b.y, b.width, b.height); // TODO: temp
			g.endFill();
			ai.next;
			i++;
		}
		//g.dispose(); // is this needed?
		// i'm guesing when it's added to the scene via new Object(parent) constructor,
		// it's stored in the scene tree container and stays until removed (by Object.remove/removeChild/removeParent)
	}
	#end
		
	#if debug
	// @author deepnight, dn.Lib
	/*public static*/ function redirectTracesToConsole(c:h2d.Console) {
		haxe.Log.trace = function(m, ?pos) {
			if ( pos != null && pos.customParams == null )
				pos.customParams = ["debug"];

			c.log(pos.fileName + "(" + pos.lineNumber + ") : " + Std.string(m));
		}
	}
	#end


}


