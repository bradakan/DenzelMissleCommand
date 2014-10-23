package 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.events.TimerEvent
	
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Main extends Sprite
	{	
		public var Lasers			:	Vector.<LaserScript> = new Vector.<LaserScript>;
		private var towerScr		: 	TowerScript = new TowerScript;
		private var _theRockets		: 	Rockets;
		private var allCities		:	int = 3;
		private var cities			:	Array = []; 
		private var rockets			:	Array = [];
		private var _theCar			: 	Array = [];
		private var waveTimer		:	Timer;
		private var _rocketFactory	: RocketFactory = new RocketFactory ;
		private var _carFactory		: carFactory = new carFactory;
		private var enemyNumbers	:	int = 5 ; 
		private var _theCars		: Cars = new Cars;
		private var mySound:Sound = new Sound();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//add event listeners.
			stage.addEventListener(MouseEvent.MOUSE_MOVE, FollowMouse);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, MouseClick);
			stage.addEventListener(Event.ENTER_FRAME, Update);
			
			//adds the TowerScript
			addChild(towerScr);
			towerScr.x = 350;
			towerScr.y = 500;
			
			for (var i : int = 0; i < allCities; i++ )
			{
				spawnCity(i);
			}
			
			waveTimer = new Timer (5000, 10);
			waveTimer.addEventListener(TimerEvent.TIMER, waveUpdate);
			waveTimer.start();
			
			_theCar.push(_carFactory.addCar(400 , 400, this.stage));
			
			mySound.load(new URLRequest("bgm.mp3"));
			mySound.play();
		}
		
		private function waveUpdate(e:TimerEvent):void 
		{	
			for (var i:int = 0; i < enemyNumbers; i++) 
			{
				/*var _rocketFire : Rockets = new Rockets(cities[Math.floor(Math.random() * cities.length)]);
				_rocketFire.x = Math.random() * 600;
				_rocketFire.y = 0;
				addChild(_rocketFire);
				rockets.push(_rocketFire);*/ 
			
				rockets.push(_rocketFactory.addMissile(cities[Math.floor(Math.random() * cities.length)],Math.random() * stage.stageWidth,0,this.stage));
			
			}
			enemyNumbers++;
		}
		
		private function Update(e:Event):void 
		{

			for (var i:int = Lasers.length -1; i >= 0; i--) 
			{
				Lasers[i].Update();
				for (var k:int = rockets.length -1; k >= 0; k--) 
				{
					if (Lasers.length != 0 && rockets.length != 0 )
					{
						if (Lasers[i].hitTestObject(rockets[k])) 
						{	
							stage.removeChild(rockets[k]);
							rockets.splice(k, 1);
							
							removeChild(Lasers[i]);
							Lasers.splice(i, 1);
						}
					}
				}	
			}
			
			for (var j:int = 0; j < rockets.length; j++) 
			{
				rockets[j].update();
				//trace("hi");
			}
			for ( i = 0; i < _theCar.length; i++)
			{
				_theCar[i].update(e);
			}
		}
		
		private function FollowMouse(e:MouseEvent):void
		{
			towerScr.FollowMouse(e);
		}
		 
		private function MouseClick(e:MouseEvent):void
		{
			shootLaser(towerScr.x, towerScr.y, mouseX, mouseY);
		}
		
		private function shootLaser(x:int, y:int,targetx:int,targety:int):void
		{
			var tempLaser:LaserScript = new LaserScript;
			tempLaser.x = x;
			tempLaser.y = y;
			tempLaser.setDestination(targetx, targety);
			tempLaser.addEventListener(LaserScript.DESTROY,function (e:Event):void 
			{
				laserDestroy(tempLaser);
			})
			addChild(tempLaser);
			Lasers.push(tempLaser);
		}
		
		private function laserDestroy(laser:LaserScript):void
		{
			removeChild(laser);
			var index:int = Lasers.indexOf(laser);
			Lasers.splice(index, 1);
		}
		
		private function spawnCity(i:int):void
		{
		   var city : City = new City();
		   city.x = stage.stageWidth / 4 * i + 105; 
		   city.y = 400;
		   addChild(city);
		   cities.push(city);
		}
		
		
	}
	
}