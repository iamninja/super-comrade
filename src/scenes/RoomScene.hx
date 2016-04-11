package scenes;

import backgrounds.Background;
import hud.Hud;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import scenary.BackgroundItem;
import scenes.Scene;
/**
 * ...
 * @author
 */
class RoomScene extends Sprite implements Scene
{
	private var background:Background;
	public var bed:BackgroundItem;
	public var _isActive:Bool;
	public static var _hud:Hud;
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
		
		// Background
		background = new Background("img/backgrounds/roomComradeD.jpg");
		this.addChild(background);
		
		// Bed in background
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
		var bedDialog = showItemDialog.bind(_, "That's the bed");
		var bedName = showItemName.bind(_, "Bed");
		bed.addEventListener(MouseEvent.MOUSE_OVER, bedName);
		bed.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
		bed.addEventListener(MouseEvent.CLICK, bedDialog);
		this.addChild(bed);
		
	}

	public function new(hud:Hud)
	{
		_hud = hud;
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
		Lib.current.addChild(new RoomScene(_hud));
	}
	
	private function startGame()
	{
		trace("Start!!");
	}
	
	private function showItemDialog(e:Dynamic, dialogText:String)
	{
		_hud.hideDialogBox();
		_hud.showDialogBox(dialogText);
	}
	
	private function showItemName(e:Dynamic, itemNameText:String)
	{
		_hud.hideItemNameBox();
		_hud.showItemNameBox(itemNameText);
	}
	
	private function hideItemName(e:Dynamic)
	{
		_hud.hideItemNameBox();
	}

}
