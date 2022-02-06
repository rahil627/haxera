package hp;

// just helps load sounds (hxd.res.Sound) and stores it in a map: SoundLoader.sounds
// then you can access that map to find the sound you want to play!
// use hxd.snd.Manager.get() for all of your audio needs
// hxd.red.Sound itself also has play() and stop() on it
class SoundLoader {
	public static var sounds:Map<String, hxd.res.Sound>; // todo: is string inefficient? generate an enum instead??
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

	// requires init to use
	public static function loadFolder() {
		try
			for(s in hxd.Res.load(folderPath))
				s.toSound().getData();
		catch(e:hxd.res.NotFound)
			break;
	}
	
	public static function loadFolder(folderPath:String) {
		try	
			for(s in hxd.Res.load(folderPath))
				s.toSound().getData();
		catch(e:hxd.res.NotFound) // todo: look at other exceptions
			break;
	}
}



/* from ld40
// TODO: what's the difference between these two methods?
// without storing it in a ds, can you still select which sounds to play?
// can you see all of the resources loaded?

		while( true )
			try winds.push(hxd.Res.load("sfx/wind" + (i++) + ".wav").toSound()) catch( e : hxd.res.NotFound ) break;

		// preload sounds
		for( s in hxd.Res.load("sfx") )
			s.toSound().getData();
*/
