package
{	
	import org.flixel.*;
	
	public class Grid extends FlxTilemap
	{
		protected var _actualTiles:Array;
		public var TILEHEIGHT:uint = 64;
		public var TILEWIDTH:uint = 64;
		
		public function Grid(data:Array):void
		{
			this.loadMap(FlxTilemap.arrayToCSV(data, 10), PlayState.MapTile, TILEWIDTH, TILEHEIGHT, FlxTilemap.OFF, 0, 0);
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
				if (this.getTile(tileX, tileY) != tileType)
				{
					this.setTile(tileX, tileY, tileType, true);
					trace(this, this.getTile(tileX, tileY));
				}
			}
			return;
		}
		
	}
}