package;

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
	
	public function new() 
	{
		super();
		
		hud = new Hud();
		roomScene = new RoomScene(hud);
		addChild(roomScene);
		addChild(hud);
	}
	
}