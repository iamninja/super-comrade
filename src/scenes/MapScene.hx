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

class MapScene extends Scene
{
    //alias = "map";
    var inited:Bool;

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
        _background = new Background("img/backgrounds/map001D.jpg");
        this.addChild(_background);
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
}
