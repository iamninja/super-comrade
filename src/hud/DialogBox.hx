package hud;

import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class DialogBox extends Sprite
{

	public function new() 
	{
		super();
		
		this.graphics.beginFill(0x342929, 0.8);
		this.graphics.drawRect(0, 450, 800, 150);
		this.graphics.endFill();
		this.buttonMode = false;
	}
	
}