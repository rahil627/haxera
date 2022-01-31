import h2d.Graphics;
import h2d.Object;

// barebones code to use as a base
class BareObject extends Graphics {

	public override function new(parent:Object, x:Float = 100, y:Float = 100, rotation:Float = 0, color:Int = 0xFFFFFF) {
		super(parent);

	}

	public function update() {

	}
}
