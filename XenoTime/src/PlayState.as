package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source='../assets/tile1.png')] protected var ImgTile:Class;

		protected var grid:Grid;
		protected var player:Player;
		protected var positionText:FlxText;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.bgColor = 0xffeeeeee;
			add(new FlxText((FlxG.height/2), (FlxG.width/2), 300, "Welcome to XenoTime..."));
			grid = new Grid();
			player = new Player();
			var data:Array = new Array(0, 0, 0, 0);
			grid.loadMap(FlxTilemap.arrayToCSV(data, 2), ImgTile, 63, 63, FlxTilemap.OFF, 0, 0);
			add(grid);
			positionText = new FlxText(500, 500, 300, 'False');
			add(positionText);

			
		}
		
		override public function update():void
		{
			positionText.update();
			grid.update();
			player.update();
			super.update();
		}
	}
}