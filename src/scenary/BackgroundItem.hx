package scenary;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author 
 */
class BackgroundItem extends Sprite
{

	private var _showTitle:Bool;
	private var messageField:TextField;
	public function new(points:Array<Dynamic>, debug:Bool = false) 
	{
		super();
		var alpha:Float;
		
		if (debug) alpha = 1.0 else alpha = 0.0;
		
		this.graphics.beginFill(0xFF8000, alpha);
		this.graphics.moveTo(points[0][0], points[0][1]);
		points = points.splice(1, points.length + 1);
		for (point in points) {
			this.graphics.lineTo(point[0], point[1]);
		}
		this.graphics.endFill();
		
		this.buttonMode = true;
	}
	
	
	
}