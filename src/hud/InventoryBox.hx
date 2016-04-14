package hud;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.display.Sprite;

class InventoryBox extends Sprite
{
	public function new(_x:Int, _y:Int, pathToImage:String)
    {
        super();

        // Design the item box
        this.graphics.beginFill(0x342929, 0.8);
        this.graphics.drawRect(_x, _y, 60, 60);
        this.graphics.endFill();

        // Add the image
        var itemImageData = Assets.getBitmapData(pathToImage);
        var itemImageBitmap = new Bitmap(itemImageData);
        itemImageBitmap.x = _x;
        itemImageBitmap.y = _y;
        addChild(itemImageBitmap);
    }
}
