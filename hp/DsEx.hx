    // @author MikeTuttle/HaxePunk
    // temporary copy/pasta HXP's helper functions
    // some can be moved to ArrayEx/ListEx or dsTools or something
    // the tween part will needs it's own file
public static class DsEx {
    /**
	 * Optimized version of Lambda.indexOf for Array on dynamic platforms (Lambda.indexOf is less performant on those targets).
	 *
	 * @param	arr		The array to look into.
	 * @param	param	The value to look for.
	 * @return	Returns the index of the first element [v] within Array [arr].
	 * This function uses operator [==] to check for equality.
	 * If [v] does not exist in [arr], the result is -1.
	 **/
	public static inline function indexOf<T>(arr:Array<T>, v:T):Int
	{
		#if (haxe_ver >= 3.1)
		return arr.indexOf(v);
		#elseif js
		return untyped arr.indexOf(v);
		#else
		return std.Lambda.indexOf(arr, v);
		#end
	}

	/**
	 * Returns the next item after current in the list of options.
	 * @param	current		The currently selected item (must be one of the options).
	 * @param	options		An array of all the items to cycle through.
	 * @param	loop		If true, will jump to the first item after the last item is reached.
	 * @return	The next item in the list.
	 */
	public static inline function next<T>(current:T, options:Array<T>, loop:Bool = true):T
	{
		if (loop)
			return options[(indexOf(options, current) + 1) % options.length];
		else
			return options[Std.int(Math.min(indexOf(options, current) + 1, options.length - 1))];
	}

	/**
	 * Returns the item previous to the current in the list of options.
	 * @param	current		The currently selected item (must be one of the options).
	 * @param	options		An array of all the items to cycle through.
	 * @param	loop		If true, will jump to the last item after the first is reached.
	 * @return	The previous item in the list.
	 */
	public static inline function prev<T>(current:T, options:Array<T>, loop:Bool = true):T
	{
		if (loop)
			return options[((indexOf(options, current) - 1) + options.length) % options.length];
		else
			return options[Std.int(Math.max(indexOf(options, current) - 1, 0))];
	}

	/**
	 * Swaps the current item between a and b. Useful for quick state/string/value swapping.
	 * @param	current		The currently selected item.
	 * @param	a			Item a.
	 * @param	b			Item b.
	 * @return	Returns a if current is b, and b if current is a.
	 */
	public static inline function swap<T>(current:T, a:T, b:T):T
	{
		return current == a ? b : a;
	}

	/**
	 * Binary insertion sort
	 * @param list     A list to insert into
	 * @param key      The key to insert
	 * @param compare  A comparison function to determine sort order
	 */
	public static function insertSortedKey<T>(list:Array<T>, key:T, compare:T->T->Int):Void
	{
		var result:Int = 0,
			mid:Int = 0,
			min:Int = 0,
			max:Int = list.length - 1;
		while (max >= min)
		{
			mid = min + Std.int((max - min) / 2);
			result = compare(list[mid], key);
			if (result > 0) max = mid - 1;
			else if (result < 0) min = mid + 1;
			else return;
		}

		list.insert(result > 0 ? mid : mid + 1, key);
	}

	/**
	 * Sets a time flag.
	 * @return	Time elapsed (in milliseconds) since the last time flag was set.
	 */
	public static inline function timeFlag():Float
	{
		var t:Float = Timer.stamp(),
			e:Float = t - _time;
		_time = t;
		return e;
	}

	/**
	 * Tweens numeric public properties of an Object. Shorthand for creating a MultiVarTween tween, starting it and adding it to a Tweener.
	 * @param	object		The object containing the properties to tween.
	 * @param	values		An object containing key/value pairs of properties and target values.
	 * @param	duration	Duration of the tween.
	 * @param	options		An object containing key/value pairs of the following optional parameters:
	 * 						type		Tween type.
	 * 						complete	Optional completion callback function.
	 * 						ease		Optional easer function.
	 * 						tweener		The Tweener to add this Tween to.
	 * @return	The added MultiVarTween object.
	 *
	 * Example: HXP.tween(object, { x: 500, y: 350 }, 2.0, { ease: Float -> Float, complete: onComplete } );
	 */
	public static function tween(object:Dynamic, values:Dynamic, duration:Float, options:Dynamic = null):MultiVarTween
	{
		if (options != null && Reflect.hasField(options, "delay"))
		{
			var delay:Float = options.delay;
			Reflect.deleteField( options, "delay" );
			HXP.alarm(delay, function () HXP.tween(object, values, duration, options));
			return null;
		}

		var type:TweenType = TweenType.OneShot,
			complete:Void -> Void = null,
			ease:Float -> Float = null,
			tweener:Tweener = HXP.tweener;
		if (Std.is(object, Tweener)) tweener = cast(object, Tweener);
		if (options != null)
		{
			if (Reflect.hasField(options, "type")) type = options.type;
			if (Reflect.hasField(options, "complete")) complete = options.complete;
			if (Reflect.hasField(options, "ease")) ease = options.ease;
			if (Reflect.hasField(options, "tweener")) tweener = options.tweener;
		}
		var tween:MultiVarTween = new MultiVarTween(type);
		if (complete != null) tween.onComplete.bind(complete);
		tween.tween(object, values, duration, ease);
		tweener.addTween(tween, true);
		return tween;
	}

	/**
	 * Schedules a callback for the future. Shorthand for creating an Alarm tween, starting it and adding it to a Tweener.
	 * @param	delay		The duration to wait before calling the callback.
	 * @param	complete	The function to be called when complete.
	 * @param	type		Tween type.
	 * @param	tweener		The Tweener object to add this Alarm to. Defaults to HXP.tweener.
	 * @return	The added Alarm object.
	 *
	 * Example: HXP.alarm(5.0, callbackFunction, TweenType.Looping); // Calls callbackFunction every 5 seconds
	 */
	public static function alarm(delay:Float, complete:Void -> Void, ?type:TweenType, ?tweener:Tweener):Alarm
	{
		if (type == null) type = TweenType.OneShot;
		if (tweener == null) tweener = HXP.tweener;

		var alarm:Alarm = new Alarm(delay, complete, type);
		tweener.addTween(alarm, true);
		return alarm;
	}

	/**
	 * Gets an array of frame indices.
	 * @param	from	Starting frame.
	 * @param	to		Ending frame.
	 * @param	skip	Skip amount every frame (eg. use 1 for every 2nd frame).
	 *
	 * @return	The array.
	 */
	public static function frames(from:Int, to:Int, skip:Int = 0):Array<Int>
	{
		var a:Array<Int> = new Array<Int>();
		skip++;
		if (from < to)
		{
			while (from <= to)
			{
				a.push(from);
				from += skip;
			}
		}
		else
		{
			while (from >= to)
			{
				a.push(from);
				from -= skip;
			}
		}
		return a;
	}

	/**
	 * Shuffles the elements in the array.
	 * @param	a		The Object to shuffle (an Array or Vector).
	 */
	public static function shuffle<T>(a:Array<T>)
	{
		var i:Int = a.length, j:Int, t:T;
		while (--i > 0)
		{
			t = a[i];
			a[i] = a[j = Random.randInt(i + 1)];
			a[j] = t;
		}
	}
	
	
}
