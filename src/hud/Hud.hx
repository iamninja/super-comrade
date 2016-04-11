package hud;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

/**
 * ...
 * @author 
 */
class Hud extends Sprite
{
	public var dialogBox:DialogBox;
	
	public function new() 
	{
		super();
		
	}
	
	public function showDialogBox(dialogText:String, portraitPath:String = "img/portraits/hero.jpg")
	{
		trace(dialogText);
		dialogBox = new DialogBox();
		dialogBox.addEventListener(MouseEvent.CLICK, dialogClicked);
		addChild(dialogBox);
	}
	
	public function hideDialogBox()
	{
		if (dialogBox != null) removeChild(dialogBox);
	}
	
	public function dialogClicked(e:Dynamic)
	{
		hideDialogBox();
	}
	
}