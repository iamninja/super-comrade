package helpers;

/**
 * ...
 * @author 
 */
class Tracker
{
	public static var tracker;

	public function new() 
	{
		tracker = {
			lemonsPicked : 0,
		};
	}
	
	public function lemonsPicked(picked:Int = 0):Int
	{
		//if (tracker.lemonsPicked != 0) trace("picked") else trace("not picked");
		if (picked == 0)
		{
			return tracker.lemonsPicked;	
		}
		else
		{
			tracker.lemonsPicked = 1;
			return tracker.lemonsPicked;
		}
		
	}
	
}