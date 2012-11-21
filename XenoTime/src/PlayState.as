package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{		
		[Embed(source='../assets/tilemap.png')] protected var MapTile:Class;
		protected var tile1:FlxSprite;
		protected var tile2:FlxSprite;
		protected var grid:Grid;
		protected var player:Player;
		protected var positionText:FlxText;
		protected var hud:HUD;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.bgColor = 0xff000000;
			add(new FlxText((FlxG.height/2), (FlxG.width/2), 300, "Welcome to XenoTime..."));
			grid = new Grid();
			player = new Player();		
			hud = new HUD();
			tile1 = new FlxSprite(300, 300);
			tile1.loadGraphic(MapTile, true, false, 64, 64, false);
			
			tile2 = new FlxSprite(400, 300);
			tile2.loadGraphic(MapTile, true, false, 64, 64, false);
			tile2.frame = 1;
			add(tile1);
			add(tile2);
			add(grid);
			add(hud);

			
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justReleased())
			{
				var point:FlxPoint = FlxG.mouse.getWorldPosition();
				grid.changeTile(point);
			}
			grid.update();
			player.update();
			super.update();
		}
	}
}