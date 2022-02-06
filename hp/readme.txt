HeapsPunk!!!

okay okay, it won't ever live up to that name... but.. you know.. inspired by it! :)


Heaps seems to be, in my opinion, the successor of the Punk game engine: FlashPunk by Chevy Ray Johnston, and HaxePunk by MikeTuttle (--even the Haxe language itself, feels like an ancestor of ActionScript!). Heaps has nearly all of the functionality of the Punk engines, and much *much* more, including an entire 3D module. The problem for me, however, is that unlike the Punk engines, the functionality of Heaps feels hidden, hidden in places that feel... *illogical*.

Illogical to me, a mere feeble human. For a machine, it's design totally makes sense, and is indeed the correct way to design it. For example, the mouse/touch position events on the scene are in the scene ds, the mouse buttons are in the Key ds, and the mouse wheel, well, you might have to get that form the events on the Window ds. And so, like this, many objects in my mind, my feeble object-oriented mind, struggled against the structure of Heaps.

So, naturally, during my first two weeks with Heaps, i made this little library. This little library, inspired by the Punk engines, provide a bunch of static helper classes that bring together all of those hidden functionalites into objects that make more sense to me. Thus, all of the mouse-related stuff is now in the Mouse ds, and so on.

This project is far far smaller than the past Punk projects. This is not an engine: Heaps is. This is just a collection of helper ds'es, extensions, "base" / "bare-bones" code, and the singular HP class, which is an ancestor of the FP/HXP classes: a massive global ds.

I hope to add *nothing* on top of Heaps. No actual data. I personally think the engine is **perfect** the way it is, and coded *exactly* the way it is suppsoed to be. I'm merely gathering 'n providing a bunch of references (to ds'es), static functions, optional base ds'es, etc. so that my little mind doesn't have to remember where everything is.

Enjoy.
