package inventory;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.display.Sprite;
import helpers.Tracker;
import inventory.InventoryBox;
import hud.Hud;
import openfl.events.MouseEvent;

class Inventory extends Sprite
{
    public var tracker:Tracker;
    public var lemons:InventoryBox;
    public var hud:Hud;

	public function new(_tracker:Tracker, _hud:Hud)
    {
        super();

        hud = _hud;
        tracker = _tracker;
        reloadInventory(tracker);
    }

    public function reloadInventory(_tracker:Tracker):Void
    {
        var numberOfItems = tracker.itemsInInventory();
        if (_tracker.lemonsPicked() == 1)
        {
            lemons = new InventoryBox(800 - (60*numberOfItems) - (5*numberOfItems), 10, "img/items_inv/lemons.png", "My lemons.");
            var lemonsInventoryDialog = showInventoryDialog.bind(_, lemons.dialog);
            lemons.addEventListener(MouseEvent.CLICK, lemonsInventoryDialog);
            addChild(lemons);
        }
        else
        {
            removeChild(lemons);
        }
    }

    // public function reloadInventory(_tracker:Tracker):Void
    // {
    //     removeChild(inventory);
    //     inventory = new Inventory(_tracker);
    //     addChild(inventory);
    // }

    public function showInventoryDialog(e:Dynamic, dialog:String)
    {
        hud.hideDialogBox();
        hud.showDialogBox(dialog);
    }
}
