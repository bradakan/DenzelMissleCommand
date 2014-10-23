package  
{	
	import flash.display.Stage;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class carFactory 
	{
		public function addCar(locationX:int,locationY:int,layer:Stage):Cars
		{
			var newCar	: Cars = new Cars;
			newCar.x = locationX;
			newCar.y = locationY;
			layer.addChild(newCar);
			return newCar;
		}
		
	}

}