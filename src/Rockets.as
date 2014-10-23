package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Rockets extends Sprite
	{	
		private var _target: MovieClip;
		private var _uv:Array = [];
		
		public function Rockets(target:City)
	
		{
			_target = target;
			var newRocket:Rocket = new Rocket;
			addChild(newRocket);
		   
			calcTarget();
		}
		
		public function update():void
		{
			this.x += _uv [0];
			this.y += _uv [1];
		}
		
		private function calcTarget():void
		{
			var offset:Array = [];
			offset.push(_target.x - this.x, _target.y - this.y);
		   
			var distance:Number;
			distance = Math.sqrt(offset[0] * offset[0] + offset[1] * offset[1]);
		   
			_uv.push(offset[0] / distance, offset[1] / distance);
   
		}
		
		
	}

}