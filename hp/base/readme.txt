this package is for "base"/"bare-bones" code for an app/game, not actual library ds'es, hence the seperate package

in it lies a very basic entity system (just simple composition, not pure component design). Basically:
Entity is mainly just a container for unwritten game logic and often h2d.Object(s) (or something that extends Object). Otherwise, it might have a few properties: layer, id, kind, etc.
EntityList is a special container for Entity, providing a place for helper functions: find, findByType/Class, etc.
then, finally, in MyApp, there is an example of how both are used

it's all very HaxePunk'esque, but even more minimal, more modular. In fact:

**_everything_ here is optional**

maybe you need to use EntityList, or maybe a normal List or Array is enough, or maybe no container at all.. Maybe you need Layers, maybe you don't. Maybe you need id or kind properties, or maybe you don't. Whatever!! do what you want! Use what you want! *everything is optional.*

*warning:* there's currently one interconnectedness / dependency:
EntityList has helper functions in it that require Entity provide a remove(), and maybe an update() (even if it's empty), hence the EntitySkeleton interface ...but even without EntityList, i'd still want those functions, to be able to safely call them in the main update loop. TODO: make this optional too?

NOTE/TODO: as of now, you must remove the top 4 lines on the top of each file... that's annoying! :( But if it wasn't in it's own package, it would clog up the namespace, so... ??? create a separate repo? :/
