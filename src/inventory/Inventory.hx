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
import inventory.ActiveItem;

class Inventory extends Sprite
{
    // Declare inventory items
    public var lemons:InventoryBox;
    public var lemonade:InventoryBox;

    public var activeItem:ActiveItem;
    public var activeItemName:String;
    public var tracker:Tracker;
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
        var numberOfItems = _tracker.itemsInInventory();
        this.activeItemName = "";
        this.removeChildren();
        this.activeItem = null;
        if (_tracker.inInventory["lemons"] == 1)
        {
            lemons = new InventoryBox(800 - (60*numberOfItems) - (5*numberOfItems), 10, hud, "img/items_inv/lemons.png", "My lemons.", "Lemons", "lemons");
            var lemonsInventoryDialog = itemInInventoryClicked.bind(_, lemons.dialog);
            lemons.addEventListener(MouseEvent.CLICK, lemonsInventoryDialog);
            addChild(lemons);

            numberOfItems--;
        }

        if (_tracker.inInventory["lemonade"] == 1)
        {
            lemonade = new InventoryBox(800 - (60*numberOfItems) - (5*numberOfItems), 10, hud,  "img/items_inv/lemonade.png", "My delicious lemonade.", "Lemonade", "lemonade");
            var lemonadeInventoryDialog = itemInInventoryClicked.bind(_, lemonade.dialog);
            lemonade.addEventListener(MouseEvent.CLICK, lemonadeInventoryDialog);
            addChild(lemonade);

            numberOfItems--;
        }
    }

    // public function reloadInventory(_tracker:Tracker):Void
    // {
    //     removeChild(inventory);
    //     inventory = new Inventory(_tracker);
    //     addChild(inventory);
    // }

    public function itemInInventoryClicked(e:Dynamic, dialog:String)
    {
        hud.hideDialogBox();
        hud.showDialogBox(dialog + " (" + e.currentTarget.xi + ", " + e.currentTarget.yi + ")");
        this.activeItemName = e.currentTarget.itemName;
        if (this.activeItem == null)
        {
            // trace("add active");
            // removeChild(activeItem);
            this.activeItem = new ActiveItem(e.currentTarget.xi, e.currentTarget.yi, e.currentTarget.itemName);
            addChild(this.activeItem);
        }
        else if (!(this.activeItemName == this.activeItem.itemName))
        {
            // trace("add active2");
            removeChild(this.activeItem);
            this.activeItem = new ActiveItem(e.currentTarget.xi, e.currentTarget.yi, e.currentTarget.itemName);
            addChild(this.activeItem);
        }

    }
    
    public function clearActiveItem()
    {
        removeChild(this.activeItem);
        this.activeItem = null;
        this.activeItemName = null;
    }
}
