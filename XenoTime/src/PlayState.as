package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source='../assets/tile1.png')] protected var ImgTile:Class;

		protected var grid:Grid;
		protected var player:Player;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffeeeeee;
			add(new FlxText((FlxG.height/2), (FlxG.width/2), 300, "Welcome to XenoTime..."));
			grid = new Grid();
			player = new Player();
			var data:Array = new Array(1,1);
			grid.loadMap(FlxTilemap.arrayToCSV(data,1), ImgTile, 30, 30, FlxTilemap.AUTO);
			add(grid);
//			var tile:FlxSprite = new FlxSprite(100, 100, ImgTile);
//			add(tile);
			
		}
		
		override public function update():void
		{
			grid.update();
			player.update();
		}
	}
}