package ra.hp.audio;
//package terryheaps;

//Very lightweight for Ludum Dare
class SimpleAudio {
	public static var sounds:Map<String, hxd.res.Sound>;
	public static var folderPath;
	public static var defaultFileExtension;
	
	public static function init(folderPath:String = "sounds/", defaultFileExtension:String = ".mp3"){
		sounds = new Map<String, hxd.res.Sound>();
		this.folderPath = folderPath;
		this.defaultFileExtension = defaultFileExtension;
	}

	public static function load(soundFileName:String) {
		if(sounds.exists(soundFileName)
		   return;
		sounds.set(soundFileName, hxd.Res.load("filepath/" + soundFileName).toSound());
	}
	
	public static function load(soundFileName:String, fileExtension:String) {
		if(sounds.exists(soundFileName)
		   return;
		sounds.set(soundFileName, hxd.Res.load("filepath/" + soundFileName + defaultFileExtension).toSound());
	}


	public static function play(soundfile:String){
		var soundresource:hxd.res.Sound;

		if(sounds.exists(soundfile)){
			soundresource = sounds.get(soundfile);
		}else{
			soundresource = hxd.Res.load("sounds/" + soundfile + ".mp3").toSound();
			sounds.set(soundfile, soundresource);
		}

		soundresource.play();
	}

	
}



/* from ld40
		while( true )
			try winds.push(hxd.Res.load("sfx/wind" + (i++) + ".wav").toSound()) catch( e : hxd.res.NotFound ) break;

		// preload sounds
		for( s in hxd.Res.load("sfx") )
			s.toSound().getData();
*/
