package buttons;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author
 */
class StartButton extends Sprite
{
	private var messageField:TextField;

	public function new()
	{
		super();
		var width = 180;
		var height = 60;
		this.graphics.beginFill(0xFF8000);
		this.graphics.drawRect(400-(180/2), 400, width, height);
		this.graphics.endFill();
		this.buttonMode = true;

		var messageFormat:TextFormat = new TextFormat("_sans", 28, 0x000000, true);
		messageFormat.align = TextFormatAlign.CENTER;
		messageField = new TextField();
		addChild(messageField);
		messageField.width = width;
		messageField.y = 400 + (height / 2) - 16;
		messageField.x = 400 - (width / 2);
		messageField.defaultTextFormat = messageFormat;
		messageField.selectable = false;
		messageField.text = "Start";
	}
}
