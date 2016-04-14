package scenes;

import backgrounds.Background;
import helpers.Tracker;
import hud.Hud;
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
	public var lemons:PickupItem;
	public var _isActive:Bool;
	public static var hud:Hud;
	public var tracker:Tracker;
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
		bed = new BackgroundItem(bedPoints, true);
		var bedDialog = showItemDialog.bind(_, "That's the bed");
		var bedName = showItemName.bind(_, "Bed");
		bed.addEventListener(MouseEvent.MOUSE_OVER, bedName);
		bed.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
		bed.addEventListener(MouseEvent.CLICK, bedDialog);
		this.addChild(bed);

		if (tracker.lemonsPicked() == 0)
		{
			trace("lemons not picked");
			lemons = new PickupItem(375, 320, "img/items/lemons.png");
			var pickupLemons = pickupItem.bind(_, lemons);
			lemons.addEventListener(MouseEvent.CLICK, pickupLemons);
			addChild(lemons);
		}

	}

	public function new(_hud:Hud, _tracker:Tracker)
	{
		tracker = _tracker;
		hud = _hud;
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

	private function pickupItem(e:Dynamic, item:Sprite)
	{
		trace(e.currentTarget);
		tracker.lemonsPicked(1);
		removeChild(e.currentTarget);
		trace(tracker.lemonsPicked);
        hud.reloadInventory(tracker);
	}

}
