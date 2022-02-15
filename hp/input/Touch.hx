package hp.input;

import hp.HP; // depends on HP!!
import hxd.Key;

// touch input in heaps feel as if it was done secondary to mouse
// this ds brings makes a home for it :)
// note: this is a scene-level handler, not for Interactive
// TODO: this only works for 2d
class Touch {
	// currently just copy-pasta from Mouse, because mouseX, mouseY and Key.MOUSE_LEFT are also used for touch input, but
	// beyond that, however, they are very different: multi-touch, no other mouse buttons nor wheel
	
	// TODO: global vs scene?
	// TODO: multi-touch
	// 3 levels: global, scene, interactive?
	
	// TODO: inline?	
	public static var x(get, null):Float; 
	public static var y(get, null):Float;
	public static var isTouching(get, null):Bool;
	public static var justBeganTouching(get, null):Bool; // "just" might be too verbose :/
	public static var justStoppedTouching(get, null):Bool; // just let go'd?
	// note: stuff like onOver/onOut are handled by Interactive, not here


	// note: scene.mouseX/Y and window.mouseX/Y don't work for touches!
	//public static inline function get_x() return HP.scene.mouseX; // note: scene-based event, not global
	//public static inline function get_y() return HP.scene.mouseY;
	
	
	public static inline function get_isTouching():Bool return Key.isDown(Key.MOUSE_LEFT);
	public static inline function get_justBeganTouching():Bool return Key.isPressed(Key.MOUSE_LEFT); // isPressed is confusing :(
	public static inline function get_justStoppedTouching():Bool return Key.isReleased(Key.MOUSE_LEFT);
	


	// I FOUND IT !!!!
	// it's scene.startCapture() / stopCapture()
	/*
	public function init(s:h2d.Scene) {
		s.startCapture(

	}
	*/




	// TODO: need to write a callback handler for EPush, EMove, ERelease events (hxd.SceneEvents?)



	/*
	// copy-pasta from Scene
	// for scene-level implementation
	inline function screenXToViewport(mx:Float) {
		return @:privateAccess interactiveCamera.screenXToCamera(window.mouseX, window.mouseY);
	}

	inline function screenYToViewport(my:Float) {
		return @:privateAccess interactiveCamera.screenYToCamera(window.mouseX, window.mouseY);
	}

	function get_mouseX() {
		syncPos();
		var dx = screenXToViewport(window.mouseX) - absX;
		if( matC == 0 ) return dx / matA;
		var dy = screenYToViewport(window.mouseY) - absY;
		return (dx * matD - dy * matC) / (matA * matD - matB * matC);
	}

	function get_mouseY() {
		syncPos();
		var dy = screenYToViewport(window.mouseY) - absY;
		if( matB == 0 ) return dy / matD;
		var dx = screenXToViewport(window.mouseX) - absX;
		return (dy * matA - dx * matB) / (matA * matD - matB * matC);
	}
	*/


}
