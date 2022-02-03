// note: don't use 'import', use 'using': using ra.hp.GraphicsEx
// if static extensions are no fun, just pass in Graphics into a normal static function
class GraphicsEx {

	// TODO: this is pretty wasteful, the drawing code should be done without shortcuts
	// it's also just better to get used to using the Flash-like api, it's already stupid simple!!!
	// TODO: can it be a normal function, not static?
	public function drawLine(g:<Class>Graphics, x:Float, y:Float, x2:Float, y2:Float, ?width:Int, ?color:Int, ?alpha:Float) {
		if (width || color || alpha) // TODO: i have no clue if this really works..
			this.lineStyle(width, color, alpha);
		// if (g.x != x || g.y != y)
			this.moveTo(x, y);
		this.lineTo(x2, y2);
	       
	}
}
