﻿package {	import flash.display.MovieClip;	import flash.events.Event;	import flash.ui.Keyboard;	public class Player extends Entity	{		var speed:Number;		public function Player(x, y)		{			super(x, y);			speed = 10;				addEventListener(Event.ENTER_FRAME, move);		}			function move(e:Event)			{												if (Key.isDown(Keyboard.RIGHT))				{					this.x = this.x + speed;														}																if (Key.isDown(Keyboard.LEFT))				{					this.x = this.x - speed;									}				if (this.x < 0)				{ this.x = 0;				}							}		}	}