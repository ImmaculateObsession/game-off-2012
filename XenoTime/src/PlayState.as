package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		public function PlayState()
		{
			add(new FlxText((FlxG.height/2), (FlxG.width/2), 300, "Welcome to XenoTime..."));
		}
	}
}