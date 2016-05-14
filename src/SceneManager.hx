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
import openfl.ui.Mouse;

/**
 * ...
 * @author
 */
class SceneManager extends Sprite
{
    public var exitRoomToMap:Exit;
    public var exitMapToRoom:Exit;

    public var roomExits:Array<Exit>;
    public var mapExits:Array<Exit>;

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
        // Define and create all exits
        var pointsRoomToMap = [
            [720, 80],
            [800, 80],
            [800, 440],
            [720, 440],
            [720, 80]
        ];
        exitRoomToMap = new Exit("room", "map", pointsRoomToMap, "right", [733, 262], "To Map");
        roomExits = [exitRoomToMap];
        var pointsMapToRoom = [
            [210, 133],
            [276, 214],
            [276, 173],
            [378, 138],
            [403, 163],
            [397, 203],
            [433, 217],
            [284, 266]
        ];
        exitMapToRoom = new Exit("map", "room", pointsMapToRoom, "down", [336, 135], "To Home");
        mapExits = [exitMapToRoom];


		addChild(roomScene);
		addChild(hud);
        addChild(inventory);
        currentScene = roomScene;
        addExits(roomExits);
	}

    public function loadScene(newSceneAlias:String)
    {
        hud.hideDialogBox();
        hud.hideItemNameBox();
        inventory = currentScene.getInventory();
        removeChildren();
        currentScene = sceneFromAlias(newSceneAlias, hud, inventory, tracker);
        addChild(currentScene);
        addChild(hud);
        if (newSceneAlias != "map") addChild(inventory);
        addExits(exitsFromAlias(newSceneAlias));
    }

    public function addExits(exits:Array<Exit>)
    {
        for (exit in exits)
        {
            addChild(exit);
            exit.addEventListener(MouseEvent.CLICK, clickOnExit);
            exit.addEventListener(MouseEvent.MOUSE_OVER, mouseOnExit);
            exit.addEventListener(MouseEvent.MOUSE_OUT, mouseOutOfExit);

        }
    }

    public function clickOnExit(e:Dynamic)
    {
        trace("clickOnExit");
        trace(e.currentTarget);
        trace(e.currentTarget.getHome());
        trace(e.currentTarget.getTarget());
        this.inventory.clearActiveItem();
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
    private function exitsFromAlias(alias:String):Array<Exit>
    {
        switch (alias) {
            case "room" : return roomExits;
            case "map"  : return mapExits;
            default     : return null;
        }
    }

    private function mouseOnExit(e:Dynamic)
    {
        trace("mouse over exit");
        // trace(e.currentTarget.exitName);
        hud.hideItemNameBox();
        hud.showItemNameBox(e.currentTarget.exitName);
    }

    private function mouseOutOfExit(e:Dynamic)
    {
        trace("mouse out of exit");
        hud.hideItemNameBox();
    }
   
}
