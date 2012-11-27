package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class PlayState extends FlxState
	{		
		[Embed(source='../assets/tilemap.png')] public static const MapTile:Class;

		public var tile1:FlxExtendedSprite;
		public var tile2:FlxSprite;
		protected var backGrid:Grid;
		protected var player:Player;
		protected var positionText:FlxText;
		protected var hud:HUD;
		protected var gridCam:FlxCamera;
		protected var tileType:uint = 0;
		protected var mouseTile:FlxSprite;
		protected var tileGrid:Grid;

		
		override public function create():void
		{
			var backLevel:Array = new Array(
				1,2,1,2,1,2,1,2,1,2,
				3,4,3,4,3,4,3,4,3,4,
				1,2,1,2,1,2,1,2,1,2,
				3,4,3,4,3,4,3,4,3,4,
				1,2,1,2,1,2,1,2,1,2,
				3,4,3,4,3,4,3,4,3,4,
				1,2,1,2,1,2,1,2,1,2,
				3,4,3,4,3,4,3,4,3,4,
				1,2,1,2,1,2,1,2,1,2,
				3,4,3,4,3,4,3,4,3,4);
			var level:Array = new Array(
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0,
				0,0,0,0,0,0,0,0,0,0);

			FlxG.mouse.show();
			FlxG.bgColor = 0xff000000;
//			gridCam = new FlxCamera(100, 100, 640, 640, 1)
			backGrid = new Grid(backLevel);
			tileGrid = new Grid(level);
			var cameraList:Array = new Array(gridCam);
//			grid.cameras = cameraList;
//			FlxG.addCamera(gridCam);
			player = new Player();		
			hud = new HUD();
			mouseTile = new FlxSprite();
			mouseTile.loadGraphic(MapTile, true, true, 64, 64, false);
			add(hud);
			add(backGrid);
			add(tileGrid);
			add(mouseTile);
		}
		
		override public function update():void
		{
			var point:FlxPoint = FlxG.mouse.getWorldPosition();
			if (FlxG.mouse.justReleased())
			{
				handleClick(point);
			}
			mouseTile.x = point.x;
			mouseTile.y = point.y;
			backGrid.update();
			player.update();
			super.update();
		}
		
		public function handleClick(point:FlxPoint):void
		{
			var handledTile:uint = hud.handleClick(point);
//			trace(tileType);
			if (handledTile >= 7)
			{
				mouseTile.frame = handledTile;
				tileType = handledTile

			}
			tileGrid.changeTile(point, tileType);
		}
	}
}