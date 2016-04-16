package helpers;

/**
 * ...
 * @author
 */
class Tracker
{
	public static var tracker;
    public static var picked;
    public static var inInventory;

	public function new()
	{
		picked = [
            "lemons" => 0,
            "lemonade" => 0,
        ];

        inInventory = [
            "lemons" => 0,
            "lemonade" => 0,
        ];
	}

	public function lemonsPicked(_picked:Int = 0):Int
	{
		//if (tracker.lemonsPicked != 0) trace("picked") else trace("not picked");
		if (_picked == 0)
		{
			return picked["lemons"];
		}
		else
		{
			picked["lemons"] = 1;
            inInventory["lemons"] = 1;
			return picked["lemons"];
		}

	}

    public function itemsInInventory():Int
    {
        var numberOfItems = 0;
        for (item in inInventory)
        {
            if (item == 1) numberOfItems++;
        }
        return numberOfItems;
    }

}
