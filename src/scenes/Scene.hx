package scenes;

import backgrounds.Background;
import hud.Hud;
import helpers.Tracker;
import inventory.Inventory;
import openfl.display.Sprite;

/**
 * @author
 */
class Scene extends Sprite
{
    public var alias:String;
    public var hud:Hud;
    public var tracker:Tracker;
    public var inventory:Inventory;

	private var _background:Background;
	public var isActive:Bool;

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
}
