package inventory;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

class ActiveItem extends Sprite
{
    public var itemName:String;

	public function new(_x:Float, _y:Float, itemName:String = null)
    {
        super();
        this.itemName = itemName;

        // Design the active item box
        this.graphics.beginFill(0x000000, 0);
        this.graphics.lineStyle(6, 0x775533, 1);
        this.graphics.drawRect(_x, _y, 60, 60);
        this.graphics.endFill();
    }
}
