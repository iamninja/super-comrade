package hud;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.display.Sprite;
import helpers.Tracker;
import hud.InventoryBox;

class Inventory extends Sprite
{
    public var tracker:Tracker;
    public var lemons:InventoryBox;

	public function new(_tracker:Tracker)
    {
        super();

        tracker = _tracker;
        loadInventory(tracker);
    }

    public function loadInventory(_tracker:Tracker):Void
    {
        if (_tracker.lemonsPicked() == 1)
        {
            lemons = new InventoryBox(800 - 60 - 5, 10, "img/items_inv/lemons.png");
            addChild(lemons);
        }
    }
}
