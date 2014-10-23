package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class TowerScript extends Sprite
	{	
		private var TowerTurret: Tower = new Tower;
		private var xdif:Number = 0;
		private var ydif:Number = 0;
		
		public function TowerScript() 
		{
			addChild(TowerTurret);
		}
		
		
		public function FollowMouse(e:MouseEvent):void
		{
			xdif = mouseX - TowerTurret.x;	//The distance between xdif and the mouse
			ydif = mouseY - TowerTurret.y;	//The distance between ydif and the mouse
			TowerTurret.rotation = Math.atan2(ydif, xdif) / (Math.PI / 180);
		}
		
		
		
		public function towerRotation():Number
		{
			return TowerTurret.rotation;
		}
		
	}

}