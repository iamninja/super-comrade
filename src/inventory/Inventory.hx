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
    // Declare inventory items
    public var lemons:InventoryBox;
    public var lemonade:InventoryBox;

    public var itemsShown:Array<InventoryBox>;
    public var tracker:Tracker;
    public var hud:Hud;

	public function new(_tracker:Tracker, _hud:Hud)
    {
        super();

        itemsShown = new Array<InventoryBox>();
        hud = _hud;
        tracker = _tracker;
        reloadInventory(tracker);
    }

    public function reloadInventory(_tracker:Tracker):Void
    {
        var numberOfItems = tracker.itemsInInventory();
        for (item in itemsShown)
        {
            removeChild(item);
        }
        itemsShown = [];
        if (_tracker.itemPicked("lemons") == 1)
        {
            lemons = new InventoryBox(800 - (60*numberOfItems) - (5*numberOfItems), 10, "img/items_inv/lemons.png", "My lemons.");
            var lemonsInventoryDialog = showInventoryDialog.bind(_, lemons.dialog);
            lemons.addEventListener(MouseEvent.CLICK, lemonsInventoryDialog);
            addChild(lemons);

            numberOfItems--;
            itemsShown.push(lemons);
        }

        if (_tracker.itemPicked("lemonade") == 1)
        {
            lemonade = new InventoryBox(800 - (60*numberOfItems) - (5*numberOfItems), 10, "img/items_inv/lemonade.png", "My delicious lemonade.");
            var lemonadeInventoryDialog = showInventoryDialog.bind(_, lemonade.dialog);
            lemonade.addEventListener(MouseEvent.CLICK, lemonadeInventoryDialog);
            addChild(lemonade);

            numberOfItems--;
            itemsShown.push(lemonade);
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
