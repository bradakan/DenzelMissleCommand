package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Cars extends Sprite
	{	
		private var _speed		:	int = 5;
		private var _car		: 	Car = new Car;
		
		public function Cars() 
		{
			addChild(_car); 
			
		}
		
		public function update(e:Event):void
		{
			_car.x -= _speed; 
			if (_car.x <= -500) 
			{
				_car.x = 500;
			}
			trace(_car.x);
		}
	}

}