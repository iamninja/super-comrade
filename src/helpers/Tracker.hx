package helpers;

/**
 * ...
 * @author
 */
class Tracker
{
	public static var tracker;
    public static var picked;
    public var inInventory:Map<String, Int>;

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

	public function itemPicked(item:String, _picked:Int = 0):Int
	{
		//if (tracker.lemonsPicked != 0) trace("picked") else trace("not picked");
		if (_picked == 0)
		{
			return picked[item];
		}
		else
		{
			picked[item] = 1;
            inInventory[item] = 1;
			return picked[item];
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
