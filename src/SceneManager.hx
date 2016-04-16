package;

import helpers.Tracker;
import hud.Hud;
import inventory.Inventory;
import openfl.display.Sprite;
import openfl.Lib;
import scenes.RoomScene;

/**
 * ...
 * @author
 */
class SceneManager extends Sprite
{
	public var roomScene:RoomScene;
	public var hud:Hud;
    public var inventory:Inventory;
	public static var tracker:Tracker;

	public function new()
	{
		super();

		tracker = new Tracker();
		hud = new Hud(tracker);
        inventory = new Inventory(tracker, hud);
		roomScene = new RoomScene(hud, inventory, tracker);

		addChild(roomScene);
		addChild(hud);
        addChild(inventory);
	}

}
