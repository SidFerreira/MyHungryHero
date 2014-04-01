/**
 * Created by sidferreira on 01/04/14.
 */
package objects {
import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.events.Event;

public class Hero extends Sprite{
    private var heroArt:MovieClip;

    public function Hero() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        createHeroArt();
    }

    private function createHeroArt():void {
        heroArt = new MovieClip(Assets.getAtlas().getTextures("fly_"), 20);
        heroArt.x = Math.ceil(-heroArt.width/2);
        heroArt.y = Math.ceil(-heroArt.height/2);
        starling.core.Starling.juggler.add(heroArt);
        addChild(heroArt);
    }
}
}
