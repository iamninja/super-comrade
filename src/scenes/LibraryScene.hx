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
class LibraryScene extends Scene
{
    // Declare background items
	
    // Declare pickup items
	

	//var alias = "room";

	// Entry Point

	override function init()
	{
		super.init();

		// Background
		_background = new Background("img/backgrounds/library-palm-beach.jpeg");
		this.addChild(_background);

        // Add background items

        // Add pickup items
        
	}

}
