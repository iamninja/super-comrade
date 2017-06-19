package scenes;

import backgrounds.Background;
import hud.Hud;
import helpers.Tracker;
import inventory.Inventory;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * @author
 */
class Scene extends Sprite
{
    public var alias:String;
    public var hud:Hud;
    public var tracker:Tracker;
    public var inventory:Inventory;

	public var isActive:Bool;
    private var inited:Bool;
    private var _background:Background;

    public function new(_hud:Hud, _inventory:Inventory, _tracker:Tracker)
	{
		tracker = _tracker;
		hud = _hud;
        inventory = _inventory;
		super();
		addEventListener(Event.ADDED_TO_STAGE, added);

		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
	}

    function resize(e)
	{
		if (!inited) init();
		// else (resize or orientation change)
	}

    function added(e)
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);

		init();
	}

    function init()
    {
        if (inited) return;
		inited = true;
    }

    public function getTracker():Tracker
    {
        return tracker;
    }

    public function getInventory():Inventory
    {
        return inventory;
    }

    public function getAlias():String
    {
        return alias;
    }

    private function showItemDialog(e:Dynamic, dialogText:String)
	{
		hud.hideDialogBox();
		hud.showDialogBox(dialogText);
	}

	private function showItemName(e:Dynamic, itemNameText:String)
	{
		hud.hideItemNameBox();
		hud.showItemNameBox(itemNameText);
	}

	private function hideItemName(e:Dynamic)
	{
		hud.hideItemNameBox();
	}

    private function pickupItem(e:Dynamic, item:Sprite, itemDialog:String)
	{
		trace(e.currentTarget.itemName);
		tracker.itemPicked(e.currentTarget.itemName, 1);
		removeChild(e.currentTarget);
        showItemDialog(e, itemDialog);
        inventory.reloadInventory(tracker);
	}

    private function showInventoryDialog(e:Dynamic)
    {
        trace(Type.getClassName(Type.getClass(e.currentTarget)));
    }
}
