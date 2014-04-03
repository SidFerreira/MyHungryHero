/**
 * Created by sidferreira on 31/03/14.
 */
package {
import flash.display.Sprite;

import screens.InGame;

import starling.core.Starling;

[SWF(frameRate="60", height="600", width="800", backgroundColor="0xFCE18A")]
public class MyHungryHero extends Sprite {

    private var myStarling:Starling;

    public function MyHungryHero() {
        myStarling = new Starling(Game, stage);
        myStarling.antiAliasing = 1;
        myStarling.start();
    }
}
}
