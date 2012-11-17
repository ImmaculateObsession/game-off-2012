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
			var data:Array = new Array(1,0,1,0);
			grid.loadMap(FlxTilemap.arrayToCSV(data,40), FlxTilemap.ImgAuto, 64, 64, FlxTilemap.AUTO);
			
		}
		
		override public function update():void
		{
			grid.update();
			player.update();
		}
	}
}