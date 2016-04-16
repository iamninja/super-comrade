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
    public var itemName:String;

	public function new(x:Int, y:Int, pathToImage:String, _itemName:String)
	{
		super();
        itemName = _itemName;
		var bitmapData = Assets.getBitmapData (pathToImage);
		var itemBitmap = new Bitmap(bitmapData);
		itemBitmap.x = x;
		itemBitmap.y = y;
		addChild(itemBitmap);

		this.buttonMode = true;
	}


}
