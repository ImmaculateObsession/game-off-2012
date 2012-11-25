package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class PlayState extends FlxState
	{		
		[Embed(source='../assets/tilemap.png')] protected var MapTile:Class;
		[Embed(source='../assets/tile1.png')] protected var PlantTile:Class;
		[Embed(source='../assets/tile2.png')] protected var CityTile:Class;

		public var tile1:FlxExtendedSprite;
		public var tile2:FlxSprite;
		protected var grid:Grid;
		protected var player:Player;
		protected var positionText:FlxText;
		protected var hud:HUD;
		protected var gridCam:FlxCamera;
		protected var tileType:uint = 0;

		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.bgColor = 0xff000000;
//			gridCam = new FlxCamera(100, 100, 640, 640, 1)
			grid = new Grid();
			var cameraList:Array = new Array(gridCam);
//			grid.cameras = cameraList;
//			FlxG.addCamera(gridCam);
			player = new Player();		
			hud = new HUD();
			tile1 = new FlxExtendedSprite(700, 500);
			tile1.loadGraphic(PlantTile, true, false, 64, 64, false);
			
			tile2 = new FlxSprite(700, 600);
			tile2.loadGraphic(CityTile, true, false, 64, 64, false);
			tile2.frame = 1;
			add(tile1);
			add(tile2);
			add(grid);

			
		}
		
		override public function update():void
		{
			if (FlxG.mouse.justReleased())
			{
				var point:FlxPoint = FlxG.mouse.getWorldPosition();
				handleClick(point);
			}
			grid.update();
			player.update();
			super.update();
		}
		
		public function handleClick(point:FlxPoint):void
		{
			if (tile1.overlapsPoint(point))
			{
				FlxG.mouse.load(PlantTile);
				tileType = 4;
			}
			else if (tile2.overlapsPoint(point))
			{
				FlxG.mouse.load(CityTile);
				tileType = 5;
			}
			else
			{
				grid.changeTile(point, tileType);
				FlxG.mouse.load();
				tileType = 0;
			}
		}
	}
}