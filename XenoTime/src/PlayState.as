package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		protected var grid:Grid;
		protected var player:Player;
		
		override public function create():void
		{
			add(new FlxText((FlxG.height/2), (FlxG.width/2), 300, "Welcome to XenoTime..."));
			grid = new Grid();
			player = new Player();
			
		}
		
		override public function update():void
		{
			grid.update();
			player.update();
		}
	}
}