package;

import helpers.Tracker;
import hud.Hud;
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
	public static var tracker:Tracker;

	public function new()
	{
		super();

		tracker = new Tracker();

		hud = new Hud(tracker);
		roomScene = new RoomScene(hud, tracker);
		addChild(roomScene);
		addChild(hud);
	}

}
