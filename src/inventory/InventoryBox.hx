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

	public function new(_x:Int, _y:Int, pathToImage:String, _dialog:String)
    {
        super();

        dialog = _dialog;
        active = false;

        // Design the item box
        this.graphics.beginFill(0x342929, 0.8);
        this.graphics.drawRect(_x, _y, 60, 60);
        this.graphics.endFill();

        this.buttonMode = true;

        // Add the image
        var itemImageData = Assets.getBitmapData(pathToImage);
        var itemImageBitmap = new Bitmap(itemImageData);
        itemImageBitmap.x = _x;
        itemImageBitmap.y = _y;
        addChild(itemImageBitmap);

    }
}
