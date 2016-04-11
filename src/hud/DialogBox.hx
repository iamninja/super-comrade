package hud;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class DialogBox extends Sprite
{
	private var textField:TextField;
	
	public function new(dialogText:String, portraitPath:String) 
	{
		super();
		
		// Design the box
		this.graphics.beginFill(0x342929, 0.8);
		this.graphics.drawRect(0, 450, 800, 150);
		this.graphics.endFill();
		this.buttonMode = false;
		
		// Portrait
		var portraitData = Assets.getBitmapData(portraitPath);
		var portraitBitmap = new Bitmap(portraitData);
		portraitBitmap.x = 5;
		portraitBitmap.y = 455;
		addChild(portraitBitmap);
		
		// Text
		var textFormat:TextFormat = new TextFormat("_sans", 20, 0xbbbbbb, true);
		textFormat.align = TextFormatAlign.LEFT;
		textField = new TextField();
		textField.width = 640;
		textField.y = 455;
		textField.x = 155;
		textField.defaultTextFormat = textFormat;
		textField.selectable = false;
		textField.text = dialogText;
		addChild(textField);
	}
	
}