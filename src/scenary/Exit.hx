package scenary;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.events.MouseEvent;
import motion.Actuate;
import motion.easing.Quad;
import scenes.Scene;

class Exit extends Sprite
{
    public var homeAlias:String;
    public var targetAlias:String;
    public var arrowItemBitmap:Bitmap;
    public var mouseIsOver:Bool;
    public var animationOffsetX:Int;
    public var animationOffsetY:Int;
    public var arrowStartPosition:Array<Float>;
    public var exitName:String;
    
	public function new(
        _homeAlias:String, 
        _targetAlias:String, 
        points:Array<Dynamic>,
        arrowType:String = "right",
        arrowPosition:Array<Float>,
        _exitName:String,
        debug:Bool = false)
    {
        super();
        
        homeAlias = _homeAlias;
        targetAlias = _targetAlias;
        exitName = _exitName;
        arrowStartPosition = arrowPosition;

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
        
        var arrowBitmapData = Assets.getBitmapData("img/cursors/arro1.png");
        arrowItemBitmap = new Bitmap(arrowBitmapData);
        arrowItemBitmap.x = arrowPosition[0];
        arrowItemBitmap.y = arrowPosition[1];
        if (arrowType == "right")
        { 
            arrowItemBitmap.rotation = 0;
            animationOffsetX = 5;
            animationOffsetY = 0;
        }
        if (arrowType == "down")
        { 
            arrowItemBitmap.rotation = 90;
            animationOffsetX = 0;
            animationOffsetY = 5;
        }
        if (arrowType == "left")
        { 
            arrowItemBitmap.rotation = 180;
            animationOffsetX = -5;
            animationOffsetY = 0;
        }
        if (arrowType == "up")
        { 
            arrowItemBitmap.rotation = 270;
            animationOffsetX = 0;
            animationOffsetY = -5;
        }
        addChild(arrowItemBitmap);
        
        this.addEventListener(MouseEvent.MOUSE_OVER, tweenArrow);
        this.addEventListener(MouseEvent.MOUSE_OUT, stopTweenArrow);
    
    }

    public function getHome():String
    {
        return homeAlias;
    }

    public function getTarget():String
    {
        return targetAlias;
    }
    
    public function tweenArrow(e:Dynamic)
    {
        if (!mouseIsOver)
        {
            mouseIsOver = true;
            Actuate.tween(arrowItemBitmap, 0.5,  {x: arrowItemBitmap.x + animationOffsetX, y: arrowItemBitmap.y + animationOffsetY}).ease(Quad.easeOut).reverse().repeat();
        }
    }
    
    public function stopTweenArrow(e:Dynamic)
    {
        mouseIsOver = false;
        Actuate.stop(arrowItemBitmap);
        arrowItemBitmap.x = arrowStartPosition[0];
        arrowItemBitmap.y = arrowStartPosition[1]; 
    }
}
