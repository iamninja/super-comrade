package scenes;

import backgrounds.Background;
import helpers.Tracker;
import hud.Hud;
import inventory.Inventory;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import scenary.BackgroundItem;
import scenary.PickupItem;
import scenes.Scene;

/**
 * ...
 * @author
 */
class RoomScene extends Scene
{
    // Declare background items
	public var bed:BackgroundItem;
    public var drawers:BackgroundItem;
    public var window:BackgroundItem;
    public var books:BackgroundItem;
    // Declare pickup items
	public var lemons:PickupItem;
    public var lemonade:PickupItem;

	//var alias = "room";
	var inited:Bool;

	// Entry Point

	function resize(e)
	{
		if (!inited) init();
		// else (resize or orientation change)
	}

	function init()
	{
		if (inited) return;
		inited = true;

		// Background
		_background = new Background("img/backgrounds/roomComradeD.jpg");
		this.addChild(_background);

        // Add background items
		// Bed in background
		var bedPoints = [
						[0, 600],
						[0, 543],
						[78, 420],
						[78, 356],
						[240, 358],
						[234, 420],
						[227, 600],
						[0, 600]
					];
		bed = new BackgroundItem(bedPoints, hud, "Bed", "That's the bed.");
		this.addChild(bed);

        // Drawers in background
        var drawersPoints = [
                        [251, 503],
                        [251, 348],
                        [429, 348],
                        [448, 370],
                        [448, 503],
                        [251, 503]
                    ];
        drawers = new BackgroundItem(drawersPoints, hud, "Drawers", "Nothing in here.");
        this.addChild(drawers);

        // Window in background
        var windowPoints = [
                        [0, 171],
                        [0, 41],
                        [60, 75],
                        [60, 170],
                        [0, 171]
                    ];
        window = new BackgroundItem(windowPoints, hud, "Window", "Can't see anything. This window is too high.");
        this.addChild(window);

        // Books in background
        var booksPoints = [
                        [473, 491],
                        [473, 158],
                        [697, 158],
                        [697, 200],
                        [630, 200],
                        [569, 500],
                        [483, 500],
                        [473, 491]
                    ];
        books = new BackgroundItem(booksPoints, hud, "Books", "My famous book collection.");
        this.addChild(books);

        // Add pickup items
        // Check if lemons have picked
        if (tracker.itemPicked("lemons") == 0)
        {
            trace("lemons not picked");
            lemons = new PickupItem(375, 320, "img/items/lemons.png", "lemons");
            var pickupLemons = pickupItem.bind(_, lemons, "These lemos must be good for my health. Better keep them with me.");
            lemons.addEventListener(MouseEvent.CLICK, pickupLemons);
            addChild(lemons);
        }

        // Check if lemonade has picked
        if (tracker.itemPicked("lemonade") == 0)
        {
            trace("lemonade not picked");
            lemonade = new PickupItem(290, 357, "img/items/lemonade.png", "lemonade");
            var pickupLemonade = pickupItem.bind(_, lemonade, "Looks refreshing! Better pick it up.");
            lemonade.addEventListener(MouseEvent.CLICK, pickupLemonade);
            addChild(lemonade);
        }
	}

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

	function added(e)
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);

		init();
	}

	//public static function main()
	//{
	//	// static entry point
	//	Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
	//	Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
	//	Lib.current.addChild(new RoomScene(_hud, tracker));
	//}

	private function startGame()
	{
		trace("Start!!");
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
