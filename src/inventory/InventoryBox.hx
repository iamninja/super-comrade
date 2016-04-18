package inventory;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.display.Sprite;
import openfl.events.MouseEvent;


class InventoryBox extends Sprite
{
    public var dialog:String;
    public var active:Bool;
    public var xi:Float;
    public var yi:Float;
    public var itemName:String;

	public function new(_x:Int, _y:Int, pathToImage:String, _dialog:String, _itemName:String)
    {
        super();

        xi = _x;
        yi = _y;
        dialog = _dialog;
        active = false;
        itemName = _itemName;

        // Design the item box
        this.graphics.beginFill(0x342929, 0.8);
        this.graphics.drawRect(xi, yi, 60, 60);
        this.graphics.endFill();

        this.buttonMode = true;

        // Add the image
        var itemImageData = Assets.getBitmapData(pathToImage);
        var itemImageBitmap = new Bitmap(itemImageData);
        itemImageBitmap.x = _x;
        itemImageBitmap.y = _y;
        addChild(itemImageBitmap);

    }

    public function xcoord():Float
    {
        return this.x;
    }
}
