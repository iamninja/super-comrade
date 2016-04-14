package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import buttons.StartButton;
import SceneManager;

/**
 * ...
 * @author
 */
class Main extends Sprite
{
	private var startButton:buttons.StartButton;
	public static var currentScene:Main;
	public var newSceneManager:SceneManager;
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

		startButton = new buttons.StartButton();
		startButton.addEventListener(MouseEvent.CLICK, startClicked);
		this.addChild(startButton);

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
		currentScene = new Main();
		Lib.current.addChild(currentScene);
	}

	private function startGame()
	{
		trace("Start!!");
	}

	public function startClicked(e:Dynamic) {
		trace('Start button clicked.');
		Lib.current.removeChild(currentScene);

		newSceneManager = new SceneManager();
		Lib.current.addChild(newSceneManager);
	}

}
