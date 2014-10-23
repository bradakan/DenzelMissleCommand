package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class RocketFactory 
	{
		public function addMissile(target:City,locationX:int,locationY:int,layer:Stage):Rockets
		{
			var newRocket	: Rockets = new Rockets(target);
			newRocket.x = locationX;
			newRocket.y = locationY;
			layer.addChild(newRocket);
			return newRocket;
		}
	}

}