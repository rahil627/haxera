package ra.hp.input;

import hxd.Key;

// just a stupid extension to avoid being confused by isPressed
class KeyEx {

  // TODO: no clue how inline actually works
    //public static inline function isDown( code : Int ) return Key.keyPressed[code] > 0;
    public static inline function justPressed( code : Int ) return Key.keyPressed[code] == getFrame() - 1;
    public static inline function justReleased( code : Int ) return Key.keyPressed[code] == -getFrame() + 1;
  
  
}
