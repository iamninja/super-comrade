package scenary;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author 
 */
class PickupItem extends Sprite
{

	private var _showTitle:Bool;
	private var messageField:TextField;
	public function new(x:Int, y:Int, pathToImage:String) 
	{
		super();
		var bitmapData = Assets.getBitmapData (pathToImage);
		var itemBitmap = new Bitmap(bitmapData);
		itemBitmap.x = x;
		itemBitmap.y = y;
		addChild(itemBitmap);
		trace("lemons added");
		
		this.buttonMode = true;
	}
	
	
	
}