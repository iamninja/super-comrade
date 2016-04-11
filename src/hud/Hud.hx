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
	public var itemNameBox:ItemName;
	
	public function new() 
	{
		super();
		
	}
	
	public function showDialogBox(dialogText:String, portraitPath:String = "img/portraits/herop.png")
	{
		trace(dialogText);
		dialogBox = new DialogBox(dialogText, portraitPath);
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
	
	public function showItemNameBox(itemName:String)
	{
		itemNameBox = new ItemName(itemName);
		addChild(itemNameBox);
	}
	
	public function hideItemNameBox()
	{
		if (itemNameBox != null) removeChild(itemNameBox);
	}
}