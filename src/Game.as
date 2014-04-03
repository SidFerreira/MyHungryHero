/**
 * Created by sidferreira on 31/03/14.
 */
package {
import events.NavigationEvent;

import screens.InGame;

import screens.Welcome;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite {

    private var screenWelcome:Welcome;

    private var screenInGame:InGame;

    public function Game() {
        super();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddToStage);
    }

    private function onAddToStage(event:Event):void {
        addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
        screenInGame = new InGame();
        screenInGame.disposeTemporarily();
        addChild(screenInGame);
        screenWelcome = new Welcome();
        this.addChild(screenWelcome);
        screenWelcome.initialize();
    }

    private function onChangeScreen(event:NavigationEvent):void {
        switch (event.params.id) {
            case "play":
                screenWelcome.disposeTemporarily();
                screenInGame.initialize();
                break;
        }
    }
}
}
