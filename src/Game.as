/**
 * Created by sidferreira on 31/03/14.
 */
package {
import screens.Welcome;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite {

    private var screenWelcome:Welcome;

    public function Game() {
        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddToStage);
    }

    private function onAddToStage(event:Event):void {
        screenWelcome = new Welcome();
        this.addChild(screenWelcome);
        screenWelcome.initialize();
    }
}
}
