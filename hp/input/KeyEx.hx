package ra.hp; // note: not ra.hp.input

import hxd.Key;

// just a stupid extension to avoid being confused by isPressed
class KeyEx {

  // TODO: no clue how inline actually works
    public static inline function isDown(cl:Class<Key>, code:Int ) return Key.keyPressed[code] > 0; // duplicate error?
    public static inline function justPressed(cl:Class<Key>, code:Int ) return Key.keyPressed[code] == Key.getFrame() - 1;
    public static inline function justReleased(cl:Class<Key>, code:Int ) return Key.keyPressed[code] == -Key.getFrame() + 1;
  
  
}
