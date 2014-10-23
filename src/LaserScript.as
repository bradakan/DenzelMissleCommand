package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class LaserScript extends Sprite
	{	
		public static const DESTROY:String = "destroy";
		
		private var laserTurret: Laser = new Laser;
		private var laserSpeed: int = 10;
		private var velocity: Vector3D;
		public var destinationX:int;
		public var destinationY:int;
		
		//distance from spawn
		public var maxDistance:Number = 800;
		private var currentDistance:Number = 0; 
		
		public function LaserScript() 
		{
			addChild(laserTurret);
		}
		
		public function setDestination(x:int, y:int):void
		{
			destinationX = x;
			destinationY = y;
			calculateRotation();
			calculateVelocity();
		}
		
		public function Update():void
		{
			this.x += velocity.x;
			this.y += velocity.y;
			
			//check for total distance
			currentDistance += velocity.length;
			if (currentDistance > maxDistance )
			{
				destroy();
			}
		}
		
		private function calculateRotation():void
		{
			var rad:Number = Math.atan2(this.y - destinationY, this.x - destinationX);
			this.rotation = rad * (180 / Math.PI) + 90;
		}
		
		private function calculateVelocity():void
		{
			//how far the object is from its destination.
			velocity = new Vector3D(destinationX - this.x, destinationY - this.y);
			velocity.normalize();
			velocity.scaleBy(laserSpeed);
			
		}
		
		private function destroy():void
		{
			dispatchEvent(new Event(LaserScript.DESTROY));
			//trace("destroy");
		}
	}

}