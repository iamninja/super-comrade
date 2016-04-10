package backgrounds;

import openfl.display.Sprite;
import openfl.Assets;

/**
 * ...
 * @author 
 */
class Background extends Sprite
{
	
	public function new(pathToImage:String) 
	{
		super();
		
		var bitmapData = Assets.getBitmapData (pathToImage);
		this.graphics.beginBitmapFill(bitmapData);
		this.graphics.drawRect(0, 0, 800, 600);
		this.graphics.endFill();
		
	}
	
}