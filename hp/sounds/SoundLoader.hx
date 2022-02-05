package ra.hp.sounds;

// just loads audio and stores it in a map
// use hxd.snd.Manager.get() for all of your audio needs
class SoundLoader {
	public static var sounds:Map<String, hxd.res.Sound>; // todo: inefficient?
	public static var folderPath = "sounds/";
	public static var defaultFileExtension = "mp3";
	
	public static function init(folderPath:String = "sounds/", defaultFileExtension:String = ".mp3"){
		sounds = new Map<String, hxd.res.Sound>();
		this.folderPath = folderPath;
		this.defaultFileExtension = defaultFileExtension;
	}

	public static function load(soundFileName:String) {
		if(sounds.exists(soundFileName)
		   return;
		   
		try
		   sounds.set(soundFileName, hxd.Res.load(folderPath + soundFileName + "." + defaultFileExtension).toSound());
	    catch(e:hxd.res.NotFound)
		   break;
	}
	
	public static function load(soundFileName:String, fileExtension:String) {
		if(sounds.exists(soundFileName)
		   return;
		   
		try
		    sounds.set(soundFileName, hxd.Res.load(folderPath + soundFileName + "." + fileExtension).toSound());
		catch(e:hxd.res.NotFound)
		   break;
	}

	
}



/* from ld40
		while( true )
			try winds.push(hxd.Res.load("sfx/wind" + (i++) + ".wav").toSound()) catch( e : hxd.res.NotFound ) break;

		// preload sounds
		for( s in hxd.Res.load("sfx") )
			s.toSound().getData();
*/
