package
{
	import org.flixel.*;
	
	public class Grid extends FlxTilemap
	{
		[Embed(source='../assets/green_apt2.png')] protected var MapTile:Class;
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
	}
}