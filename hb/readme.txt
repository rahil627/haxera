this is the package for
**HeapsBase**,
a collection of "base"/"bare-bones" code for an app/game made with Heaps (not an actual library to be included/imported)

in it lies a very basic entity system (just simple composition, not pure component design). Basically:
Entity is mainly just a container for unwritten game logic and often h2d.Object(s) (or something that extends Object). Otherwise, it might have a few properties: layer, id, kind, etc.
EntityList is a special container for Entity, providing a place for helper functions: find, findByType/Class, etc.
then, finally, in MyApp, there is an example of how both are used

it's all very HaxePunk'esque, but even more minimal, more modular. In fact, **_everything_ here is optional**.

maybe you need to use EntityList, or maybe a normal List or Array is enough, or maybe no container at all.. Maybe you need Layers, maybe you don't. Maybe you need id or kind properties, or maybe you don't. Whatever!! do what you want! Use what you want! *everything is optional.*

*warning:* there's currently one interconnectedness / dependency: the main update loop requires Entity to provide a dispose(), and an update() (even if it's empty), hence the EntitySkeleton interface

HOW TO USE:
Tas of now, you must remove the top 4 lines on the top of each file... that's annoying! :( But if it wasn't in it's own package, it would clog up the namespace, use "sed (-i) 1,4d filename" to do it. be careful: the -i flag causes the deletion (TODO: so... ??? create a separate repo? find some way to tell the compiler from the folder to ignore this source folder)

there are two versions of the main app class: PunkApp, which relies on HeapsPunk, and MyApp, which has no such dependencies (TODO: remove dependency to HP)
