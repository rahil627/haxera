// found this in HaxePunk's MakeConvex.hx

// Convenience type with overloaded operations
// R is for Reentrant
@:forward
abstract Point(Vector2) from Vector2 to Vector2
{
	public function new(x:Float = 0., y:Float = 0.)
	{
		this = new Vector2(x, y);
	}

	@:from public static function fromStruct(v:{x:Float, y:Float}):Point
	{
		return new Point(v.x, v.y);
	}

	@:op(A + B) public function addR(b:Point):Point
	{
		return new Point(this.x + b.x, this.y + b.y);
	}

	@:op(A - B) public function subR(b:Point):Point
	{
		return addR(b.negR());
	}

	@:op(-A) public function negR():Point
	{
		return new Point(-this.x, -this.y);
	}

	@:op(A * B) public function dot(b:Point):Float
	{
		return this.x * b.x + this.y * b.y;
	}

	public function orthoR():Point
	{
		return new Point(this.y, -this.x);
	}
}
