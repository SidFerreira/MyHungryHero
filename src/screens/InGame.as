/**
 * Created by sidferreira on 01/04/14.
 */
package screens {
    import flash.utils.getTimer;

    import objects.GameBackground;
    import objects.Hero;

    import starling.display.Button;

    import starling.display.Sprite;
    import starling.events.Event;

    public class InGame extends Sprite{
        private var startButton:Button;
        private var hero:Hero;
        private var bg:GameBackground;

        private var timePrevious:Number;
        private var timeCurrent:Number;
        private var elapsed:Number;

        private var gameState:String;
        private var playerSpeed:Number;
		private var hitObstacle:Number = 0;
		private const MIN_SPEED:Number = 650;

        public function InGame() {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            drawGame();
        }

        private function drawGame():void {
            bg = new GameBackground();
            bg.speed = 0;
            addChild(bg);

            hero = new Hero();
            hero.x = Math.ceil(stage.stageWidth / 2);
            hero.y = Math.ceil(stage.stageHeight / 2);
            addChild(hero);

            startButton = new Button(Assets.getAtlas().getTexture("startButton"));
            startButton.x = (stage.stageWidth * 0.5) - (startButton.width * 0.5);
            startButton.y = (stage.stageHeight * 0.5) - (startButton.height * 0.5);
            addChild(startButton);
        }

        public function disposeTemporarily():void {
            visible = false;
        }

        public function initialize():void {
            visible = true;
            hero.x = -stage.stageWidth;
            hero.y = stage.stageHeight * 0.5;
			playerSpeed = 0;
			hitObstacle = 0;
            gameState = "idle";
			bg.speed = 0;
            addEventListener(Event.ENTER_FRAME, checkElapsed);
            startButton.addEventListener(Event.TRIGGERED, onStartButtonClick);
        }

        private function onStartButtonClick(event:Event):void {
            startButton.visible = false;
            startButton.removeEventListener(Event.TRIGGERED, onStartButtonClick);
            launchHero();
        }

        private function launchHero():void {
            addEventListener(Event.ENTER_FRAME, onGameTick);
        }

        private function onGameTick(event:Event):void {
            switch (gameState) {
                case "idle":
						//Take Off
						if(hero.x < (stage.stageWidth * 0.25)) {
							hero.x += (((stage.stageWidth * 0.25) + 10) - hero.x) * 0.05;
							hero.y = stage.stageHeight * 0.5;
							playerSpeed += (MIN_SPEED - playerSpeed) * 0.5;
							bg.speed = playerSpeed * elapsed;
						}
                    break;
                case "flying":
						playerSpeed -= (playerSpeed - MIN_SPEED) * 0.01;
						bg.speed = playerSpeed * elapsed;
                    break;
                case "over":
                    break;
            }
        }

        private function checkElapsed(event:Event):void {
            timePrevious = timeCurrent;
            timeCurrent = getTimer();
            elapsed = (timeCurrent - timePrevious) * 0.001
        }
    }
}
