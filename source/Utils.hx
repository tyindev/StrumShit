package;

import flixel.math.FlxPoint;

class Utils
{
    // MAIN SWAGGER SHITS!
    static public var soundExt:String = ".mp3";

    public function create():Void
	{
		#if (!web)
		soundExt = '.ogg';
		#end
    }
}