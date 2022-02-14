this folder is just a treasure chest to quickly grab shit from as i need them
think of it as a useful junk bin that you go to when you need to make something :)

TODO: learn how licenses work


NOTE: Heaps has nearly everything, just have to search for it, just use github to search the repo

need:
gamepad input
  - hxd.Pad
  - simple one from tefvel
  - complex one from deepnight
  
touch input
  - including multi-touch


want:
entity container ds
  - **EntityList from HaxePunk**
    - uses array and features "object pooling"!!

simpler input management (mouse, touch, key: all together?)
  - Mouse from terryheaps
    - **use this as a base**
    
sound helper
  - simple one from terryheaps
    - **use this as a base, also see ld40**
  - complex one already exists in Heaps (snd.Manager)
  
geometry / 2d math
  - **hxd.h2d.col**
    - Heaps already provides most of the geometry classes; note: Bounds = rectangle
  - classes
    - Vector2d
      - HaxePunk
      - or use Heaps.Vector (4d) as a base  
      
2d collision system (without physics)
  - differ by snowkit
    - https://github.com/snowkit/differ
    - kinda old... but, probably quality stuff!
  - this way, there would be no reason to write my own collision functions, just register various collision shapes, and *viola!*
    - TODO: compare writing my own collision with hxd.h2d.col cs using this

**vector graphics drawing functions**
  - ?
  
a good debug mode / console:
  - see HaxeFlixel
  - also HaxePunk has a good simpler one
  - try setting up HIDE
    - this way, you don't need to code anything, *and* you get a whole gui!

color
  - check what heaps has
  - deepnight has a good one
  - there are many others out there too
      
tweens
  - **does heaps even have any?? :o**
    - i don't think so..
  - Actuate (a tweening lib)
  - haxepunk/tweens, especially motion tweens vs a complete tweening library such as Actuate
    - openFL also has a tween class
  
  





resources:
haxepunk
  - https://github.com/HaxePunk/HaxePunk
jefvel's gamebase
  - https://github.com/jefvel/game-base
terryheaps
  - https://github.com/TerryCavanagh/terryheaps  
deepnight's gamebase
  - https://github.com/deepnight/gameBase
deepnightlib
  - https://github.com/deepnight/deepnightLibs

nicholas cannasse's game jam games
  - https://github.com/ncannasse/
  - these 4 are on the 'full game samples' page of heaps
    - https://github.com/ncannasse/ld40
    - https://github.com/ncannasse/ld37
    - https://github.com/ncannasse/ld32
    - https://github.com/ncannasse/ld28
  
yanrishatum's game jam games
  - https://github.com/Yanrishatum/cherry-jam


openfl
  - https://github.com/openfl/openfl/tree/develop/src/openfl/geom
armory3D
  - https://github.com/armory3d/iron/blob/master/Sources/iron/object/Object.hx
haxeflixel



