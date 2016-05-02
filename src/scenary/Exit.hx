package scenary;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import scenes.Scene;

class Exit extends Sprite
{
    public var homeAlias:String;
    public var targetAlias:String;

	public function new(_homeAlias:String, _targetAlias:String, points:Array<Dynamic>, debug:Bool = false)
    {
        super();

        homeAlias = _homeAlias;
        targetAlias = _targetAlias;

        var alpha:Float;

        if (debug) alpha = 1.0 else alpha = 0.0;

        this.graphics.beginFill(0xFF8099, alpha);
        this.graphics.moveTo(points[0][0], points[0][1]);
        points = points.splice(1, points.length + 1);
        for (point in points) {
            this.graphics.lineTo(point[0], point[1]);
        }
        this.graphics.endFill();

        this.buttonMode = true;

    
    }

    public function getHome():String
    {
        return homeAlias;
    }

    public function getTarget():String
    {
        return targetAlias;
    }
}
