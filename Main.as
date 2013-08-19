package 
{

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.Keyboard;


	public class Main extends MovieClip
	{

		var player:Player;
		var dragon:Dragon;
		var bg:Background;
		var bg1:Background;
		var db:DragonBar;
		var dbb:DBButton;
		var ground:Ground;
		var ground1:Ground;
		var obstacle:Obstacle;
		var enemy:Enemy;
		var maxspeed = 10;
		var speed = 0;
		var pMin = 67;
		var pMax = 217;

		public function Main()
		{
			// constructor code
			bg = new Background();
			bg1 = new Background();
			player = new Player(67,476);
			dragon = new Dragon(67,476 - 271);
			db = new DragonBar();
			dbb = new DBButton(640,700);
			ground = new Ground();
			ground1 = new Ground();
			obstacle = new Obstacle(927,476);
			enemy = new Enemy(753,280);

			addEventListener(Event.ENTER_FRAME,backgroundScroll);


			stage.addChild(bg);
			stage.addChild(bg1);
			stage.addChild(ground);
			stage.addChild(ground1);
			stage.addChild(obstacle);
			stage.addChild(enemy);
			stage.addChild(dragon);
			stage.addChild(player);
			stage.addChild(db);
			stage.addChild(dbb);

			Key.initialize(stage);
			bg1.x = bg1.width;
			ground1.x = ground1.width;

		}



		function backgroundScroll(e:Event)
		{

			if (Key.isDown(Keyboard.RIGHT) && player.x < pMax)
			{
				player.x = player.x + 2;
			}
			
			if (Key.isDown (Keyboard.LEFT) && player.x > pMin)
			{
				player.x = player.x - 2;
			}
			if (speed < maxspeed)
			{
				speed = speed + 0.01;
				enemy.x = enemy.x - speed;
			}


			if (player.hitTestObject(obstacle))
			{
				trace("test");
			}
			else
			{
				bg.x = bg.x - speed;
				bg1.x = bg1.x - speed;
				ground.x = ground.x - speed;
				ground1.x = ground1.x - speed;
				obstacle.x = obstacle.x - speed;
			}

			if (bg.x <= 0 - bg.width)
			{
				bg.x = bg1.x + bg1.width;
			}

			if (bg1.x <= 0 - bg1.width)
			{
				bg1.x = bg.x + bg.width;
			}

			if (ground.x <= 0 - ground.width)
			{
				ground.x = ground1.x + ground1.width;
			}

			if (ground1.x <= 0 - ground1.width)
			{
				ground1.x = ground.x + ground.width;
			}


			if (enemy.x <= 0 - bg.width)
			{
				enemy.x = stage.stageWidth;
			}
			if (obstacle.x <= 0 - ground.width)
			{
				obstacle.x = stage.stageWidth;
			}

		}

	}

}