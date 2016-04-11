package;

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
	
	public function new() 
	{
		super();
		
		roomScene = new RoomScene();
		addChild(roomScene);
	}
	
}