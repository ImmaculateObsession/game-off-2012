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
			var data:Array = new Array(0, 0, 0, 0);
			this.loadMap(FlxTilemap.arrayToCSV(data, 2), MapTile, TILEWIDTH, TILEHEIGHT, FlxTilemap.OFF, 0, 0);
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
		
		public function changeTile(point:FlxPoint):void
		{
			if (point.x <= this.getGridWidth() && point.y <= this.getGridHeight())
			{
				var tileX:uint = Math.floor(point.x/64);
				var tileY:uint = Math.floor(point.y/64);
				if (this.getTile(tileX, tileY) == 0)
				{
					this.setTile(tileX, tileY, 1, true);
				} else {
					this.setTile(tileX, tileY, 0, true);
				}
			}
		}
	}
}