package scenary;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.events.MouseEvent;
import hud.Hud;

/**
 * ...
 * @author
 */
class PickupItem extends Sprite
{

	private var _showTitle:Bool;
	private var messageField:TextField;
    public var itemName:String;
    public var itemNameToShow:String;
    public var hud:Hud;

	public function new(
        x:Int, y:Int,
        hud:Hud, 
        pathToImage:String, 
        _itemName:String,
        itemNameToShow:String)
	{
		super();
        itemName = _itemName;
        this.itemNameToShow = itemNameToShow;
        this.hud = hud;
		var bitmapData = Assets.getBitmapData (pathToImage);
		var itemBitmap = new Bitmap(bitmapData);
		itemBitmap.x = x;
		itemBitmap.y = y;
		addChild(itemBitmap);

		this.buttonMode = true;
        
        var itemName = showItemName.bind(_, this.itemNameToShow);
        this.addEventListener(MouseEvent.MOUSE_OVER, itemName);
        this.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
	}

    public function showItemName(e:Dynamic, itemNameText:String)
	{
		hud.hideItemNameBox();
		hud.showItemNameBox(itemNameText);
	}
    
    public function hideItemName(e:Dynamic)
	{
		hud.hideItemNameBox();
	}
}
