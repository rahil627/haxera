
// have to use extension, otherwise, i'd have to pass in the graphics class
class GraphicsEx {

	// TODO: maybe not a good idea... the drawing code should be done without shortcuts
	// it's also just better to get used to using the Flash-like api, it's already simple!
	private function drawLine(cl:<Class>Graphics, x:Float, y:Float, x2:Float, y2:Float, ?width:Int, ?color:Int, ?alpha:Float) {
		//if (width || color || alpha)
		//this.lineStyle(50, r2, .8); 
		this.moveTo(x, y);
		this.lineTo(x2, y2);
	       
	}
}
