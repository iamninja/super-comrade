package;

import backgrounds.Background;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import scenary.BackgroundItem;
/**
 * ...
 * @author
 */
class RoomScene extends Sprite implements Scene
{
	private var background:Background;
	private var bed:scenary.BackgroundItem;
	public var _isActive:Bool;
	var inited:Bool;
	
	// Entry Point
	
	function resize(e)
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init()
	{
		if (inited) return;
		inited = true;
		
		background = new Background("img/backgrounds/roomComradeD.jpg");
		this.addChild(background);
		var bedPoints = [
						[0, 600],
						[0, 543],
						[78, 420],
						[78, 356],
						[240, 358],
						[234, 420],
						[227, 600],
						[0, 600]
					];
		bed = new BackgroundItem(bedPoints, true);
		this.addChild(bed);
		
	}

	public function new()
	{
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
	
	public static function main()
	{
		// static entry point
		Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new RoomScene());
	}
	
	private function startGame()
	{
		trace("Start!!");
	}

}
