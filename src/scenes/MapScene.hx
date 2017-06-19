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

    override function init()
    {
        super.init();

        // Background
        _background = new Background("img/backgrounds/map001D.jpg");
        this.addChild(_background);
    }

}
