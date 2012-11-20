package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source='../assets/green_apt2.png')] protected var ImgTile:Class;

		protected var grid:Grid;
		protected var player:Player;
		protected var positionText:FlxText;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.bgColor = 0xff000000;
			add(new FlxText((FlxG.height/2), (FlxG.width/2), 300, "Welcome to XenoTime..."));
			grid = new Grid();
			player = new Player();
			var data:Array = new Array(0, 0, 0, 0);
			grid.loadMap(FlxTilemap.arrayToCSV(data, 2), ImgTile, 63, 63, FlxTilemap.OFF, 0, 0);
			add(grid);

			
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justReleased())
			{
				var point:FlxPoint = FlxG.mouse.getWorldPosition();
				trace(Math.floor(point.x/64), Math.floor(point.y/64));
				if (point.x < 128 && point.y < 128)
				{
					grid.setTile(Math.floor(point.x/64), Math.floor(point.y/64), 1, true)
				}
			}
			grid.update();
			player.update();
			super.update();
		}
	}
}