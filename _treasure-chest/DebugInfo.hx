//https://raw.githubusercontent.com/thejustinwalsh/LD41/master/src/DebugInfo.hx
class DebugInfo extends h2d.Sprite
{
    var sampleRate:Int;
    var fpsText:h2d.Text;
    var drawCallText:h2d.Text;

    public function new(sampleRate:Int, parent:Null<h2d.Sprite>)
    {
        super(parent);
        this.sampleRate = sampleRate;

        var font = hxd.Res.fonts.tinyunicode12.toFont();
        fpsText = new h2d.Text(font, this);
        drawCallText = new h2d.Text(font, this);
        drawCallText.y = 14;

        haxe.Timer.delay(update, 0);
    }

    private function update()
    {
        var engine = h3d.Engine.getCurrent();
        var fps:Float = engine.fps;
        
        var start = h3d.Vector.fromColor(0xFF0000, 1.0);
        var end = h3d.Vector.fromColor(0x00FF00, 1.0);

        // FPS
        var fpsColor = new h3d.Vector(1.0, 1.0, 1.0, 1.0);
        fpsColor.lerp(start, end, Math.min(60.0, fps)/60);
        fpsText.textColor = fpsColor.toColor();
        fpsText.text = "FPS: " + Math.round(fps);

        // Draw Calls
        drawCallText.text = "Draw Calls: " + engine.drawCalls;

        // Always on top
        parent.addChildAt(this, parent.numChildren + 1);
        
        haxe.Timer.delay(update, sampleRate);
    }
}
