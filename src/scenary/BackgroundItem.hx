package scenary;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import hud.Hud;

/**
 * ...
 * @author
 */
class BackgroundItem extends Sprite
{

	private var _showTitle:Bool;
	private var messageField:TextField;
    public var hud:Hud;

	public function new(
        points:Array<Dynamic>,
        _hud:Hud,
        itemNameString:String,
        itemDialogString:String,
        ?debug:Bool = false)
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
        
        
        hud = _hud;
        var itemDialog = showItemDialog.bind(_, itemDialogString);
        var itemName = showItemName.bind(_, itemNameString);
        this.addEventListener(MouseEvent.MOUSE_OVER, itemName);
        this.addEventListener(MouseEvent.MOUSE_OUT, hideItemName);
        this.addEventListener(MouseEvent.CLICK, itemDialog);
	}
    
    public function showItemDialog(e:Dynamic, dialogText:String)
	{
		hud.hideDialogBox();
		hud.showDialogBox(dialogText);
	}

	public function showItemName(e:Dynamic, itemNameText:String)
	{
		hud.hideItemNameBox();
		hud.showItemNameBox(itemNameText);
	}
    
    public function hideItemName(e:Dynamic)
	{
		hud.hideItemNameBox();
	}
}
