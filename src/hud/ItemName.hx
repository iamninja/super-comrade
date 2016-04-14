package hud;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author
 */
class ItemName extends Sprite
{
	private var textField:TextField;

	public function new(itemName:String)
	{
		super();

		// Text dialog
		var textFormat:TextFormat = new TextFormat("_sans", 20, 0x000000, true);
		textFormat.align = TextFormatAlign.LEFT;
		textField = new TextField();
		textField.width = 100;
		textField.y = 10;
		textField.x = 5;
		textField.defaultTextFormat = textFormat;
		textField.selectable = false;
		textField.text = itemName;
		addChild(textField);
	}

}
