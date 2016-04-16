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
class RoomScene extends Sprite implements Scene
{
	private var background:Background;
	public var bed:BackgroundItem;
    public var drawers:BackgroundItem;
    public var window:BackgroundItem;
    public var books:BackgroundItem;
	public var lemons:PickupItem;
	public var _isActive:Bool;
	public static var hud:Hud;
	public var tracker:Tracker;
    public var inventory:Inventory;
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
		background = new Background("img/backgrounds/roomComradeD.jpg");
		this.addChild(background);

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
		bed = new BackgroundItem(bedPoints, false);
		var bedDialog = showItemDialog.bind(_, "That's the bed.");
		var bedName = showItemName.bind(_, "Bed");
		bed.addEventListener(MouseEvent.MOUSE_OVER, bedName);
		bed.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
		bed.addEventListener(MouseEvent.CLICK, bedDialog);
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
        drawers = new BackgroundItem(drawersPoints, false);
        var drawersDialog = showItemDialog.bind(_, "Nothing in here.");
        var drawersName = showItemName.bind(_, "Drawers");
        drawers.addEventListener(MouseEvent.MOUSE_OVER, drawersName);
        drawers.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
        drawers.addEventListener(MouseEvent.CLICK, drawersDialog);
        this.addChild(drawers);

        // Window in background
        var windowPoints = [
                        [0, 171],
                        [0, 41],
                        [60, 75],
                        [60, 170],
                        [0, 171]
                    ];
        window = new BackgroundItem(windowPoints, false);
        var windowDialog = showItemDialog.bind(_, "Can't see anything. This window is too high.");
        var windowName = showItemName.bind(_, "Window");
        window.addEventListener(MouseEvent.MOUSE_OVER, windowName);
        window.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
        window.addEventListener(MouseEvent.CLICK, windowDialog);
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
        books = new BackgroundItem(booksPoints, false);
        var booksDialog = showItemDialog.bind(_, "My famous book collection.");
        var booksName = showItemName.bind(_, "Books");
        books.addEventListener(MouseEvent.MOUSE_OVER, booksName);
        books.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
        books.addEventListener(MouseEvent.CLICK, booksDialog);
        this.addChild(books);

        if (tracker.lemonsPicked() == 0)
        {
            trace("lemons not picked");
            lemons = new PickupItem(375, 320, "img/items/lemons.png");
            var pickupLemons = pickupItem.bind(_, lemons, "These lemos must be good for my health. Better keep them with me.");
            lemons.addEventListener(MouseEvent.CLICK, pickupLemons);
            addChild(lemons);
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
		trace(e.currentTarget);
		tracker.lemonsPicked(1);
		removeChild(e.currentTarget);
		trace(tracker.lemonsPicked);
        showItemDialog(e, itemDialog);
        inventory.reloadInventory(tracker);
	}

    private function showInventoryDialog(e:Dynamic)
    {
        trace(Type.getClassName(Type.getClass(e.currentTarget)));
    }

}
