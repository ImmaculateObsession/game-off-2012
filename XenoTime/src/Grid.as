package
{
	import org.flixel.*;
	
	public class Grid extends FlxTilemap
	{
		[Embed(source='../assets/tilemap.png')] protected var MapTile:Class;
		public var TILEHEIGHT:uint = 64;
		public var TILEWIDTH:uint = 64;
		
		public function Grid()
		{
			var data:Array = new Array(
				0,1,0,1,0,1,0,1,0,1,
				2,3,2,3,2,3,2,3,2,3,
				0,1,0,1,0,1,0,1,0,1,
				2,3,2,3,2,3,2,3,2,3,
				0,1,0,1,0,1,0,1,0,1,
				2,3,2,3,2,3,2,3,2,3,
				0,1,0,1,0,1,0,1,0,1,
				2,3,2,3,2,3,2,3,2,3,
				0,1,0,1,0,1,0,1,0,1,
				2,3,2,3,2,3,2,3,2,3);
			this.loadMap(FlxTilemap.arrayToCSV(data, 10), MapTile, TILEWIDTH, TILEHEIGHT, FlxTilemap.OFF, 0, 0);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function getGridHeight():uint
		{
			return this.heightInTiles * this.TILEHEIGHT;
		}
		
		public function getGridWidth():uint
		{
			return this.widthInTiles * this.TILEWIDTH;
		}
		
		public function changeTile(point:FlxPoint, tileType:uint):void
		{
			if (tileType == 0)
			{
				return;
			}
			if (point.x <= this.getGridWidth() && point.y <= this.getGridHeight())
			{
				var newX:uint = point.x;
				var newY:uint = point.y;
				var tileX:uint = Math.floor(newX/64);
				var tileY:uint = Math.floor(newY/64);
				if (this.getTile(tileX, tileY) == 0)
				{
					this.setTile(tileX, tileY, tileType, true);
				} else {
					this.setTile(tileX, tileY, tileType, true);
				}
			}
			return;
		}
	}
}