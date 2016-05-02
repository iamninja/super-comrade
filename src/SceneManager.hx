package;

import helpers.Tracker;
import hud.Hud;
import inventory.Inventory;
import openfl.display.Sprite;
import openfl.Lib;
import scenes.*;
import scenes.Scene;
import scenary.Exit;
import openfl.events.MouseEvent;


/**
 * ...
 * @author
 */
class SceneManager extends Sprite
{
    public var exitRoomToMap:Exit;

    public var roomExits:Array<Exit>;

	public var roomScene:RoomScene;
    public var mapScene:MapScene;

    public var currentScene:Scene;
	public var hud:Hud;
    public var inventory:Inventory;
	public static var tracker:Tracker;

	public function new()
	{
		super();

		tracker = new Tracker();
		hud = new Hud();
        inventory = new Inventory(tracker, hud);

		roomScene = new RoomScene(hud, inventory, tracker);

        var pointsRoomToMap = [
            [720, 80],
            [800, 80],
            [800, 600],
            [720, 600],
            [720, 80]
        ];
        exitRoomToMap = new Exit("room", "map", pointsRoomToMap);
        roomExits = [exitRoomToMap];

		addChild(roomScene);
		addChild(hud);
        addChild(inventory);
        currentScene = roomScene;
        addExits(roomExits);
	}

    public function loadScene(newSceneAlias:String)
    {
        inventory = currentScene.getInventory();
        removeChildren();
        currentScene = sceneFromAlias(newSceneAlias, hud, inventory, tracker);
        addChild(currentScene);
        addChild(hud);
        addChild(inventory);

    }

    public function addExits(exits:Array<Exit>)
    {
        for (exit in exits)
        {
            addChild(exit);
            exit.addEventListener(MouseEvent.CLICK, clickOnExit);

        }
    }

    public function clickOnExit(e:Dynamic)
    {
        trace("clickOnExit");
        trace(e.currentTarget);
        trace(e.currentTarget.getHome());
        trace(e.currentTarget.getTarget());
        loadScene(e.currentTarget.getTarget());
    }

    private function sceneFromAlias(alias:String, hudToPass:Hud, inventoryToPass:Inventory, trackerToPass:Tracker):Scene
    {
        switch (alias) {
            case "room" : return new RoomScene(hudToPass, inventoryToPass, trackerToPass);
            case "map"  : return new MapScene(hudToPass, inventoryToPass, trackerToPass);
            default     : return null;
        }
    }
}
