package ra.hp.audio;
//package terryheaps;

//Very lightweight for Ludum Dare
class SimpleAudio {
	public static function init(){
		loadedsounds = new Map<String, hxd.res.Sound>();
	}

	public static function load(soundFileName:String){
		if(!loadedsounds.exists(soundFileName)){
			loadedsounds.set(soundFileName, hxd.Res.load("filepath/" + soundFileName + "extension").toSound());
		}
	}

	public static function play(soundfile:String){
		var soundresource:hxd.res.Sound;

		if(loadedsounds.exists(soundfile)){
			soundresource = loadedsounds.get(soundfile);
		}else{
			soundresource = hxd.Res.load("sounds/" + soundfile + ".mp3").toSound();
			loadedsounds.set(soundfile, soundresource);
		}

		soundresource.play();
	}

	public static var loadedsounds:Map<String, hxd.res.Sound>;
}



/* from ld40
		while( true )
			try winds.push(hxd.Res.load("sfx/wind" + (i++) + ".wav").toSound()) catch( e : hxd.res.NotFound ) break;

		// preload sounds
		for( s in hxd.Res.load("sfx") )
			s.toSound().getData();
*/
