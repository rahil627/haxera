import h2d.Graphics;
import h2d.Object;

// barebones code to use as a base
class BareObject extends Graphics {

	public override function new(parent:Object, x:Float = 100, y:Float = 100, r:Float = 0) {
		super(parent); // for Drawable and Graphics parent is needed, not optional!
		this.x = x;
		this.y = y;
		this.rotation = r;
		
		// init

	}

	// note: optional; not an override
	public function update() {

	}
}
