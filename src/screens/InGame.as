/**
 * Created by sidferreira on 01/04/14.
 */
package screens {
import objects.Hero;

import starling.display.Sprite;
import starling.events.Event;

public class InGame extends Sprite{
        private var hero:Hero;
        public function InGame() {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            drawGame();
        }

        private function drawGame():void {
            hero = new Hero();
            hero.x = Math.ceil(stage.stageWidth / 2);
            hero.y = Math.ceil(stage.stageHeight / 2);
            addChild(hero);
        }

    public function disposeTemporarily():void {
        visible = false;
    }

    public function initialize():void {
        visible = true;
    }
}
}
