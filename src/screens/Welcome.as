/**
 * Created by sidferreira on 31/03/14.
 */
package screens {
import com.greensock.TweenLite;

import events.NavigationEvent;

import starling.display.Button;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;

    public class Welcome extends Sprite {

        private var bg:Image;
        private var title:Image;
        private var hero:Image;


        private var playBtn:Button;
        private var aboutBtn:Button;

        public function Welcome() {
            super();
            this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddToStage);
        }

        private function onAddToStage(event:Event):void {
            drawScreen();
        }

        private function drawScreen():void {

            /**
             * Images
             */

            bg = new Image(Assets.getTexture("BgWelcome"));
            addChild(bg);

            title = new Image(Assets.getAtlas().getTexture("welcome_title"));
            title.x = 440;
            title.y = 20;
            addChild(title);

            hero = new Image(Assets.getAtlas().getTexture("welcome_hero"));
            hero.x = - hero.width;
            hero.y = 100;
            addChild(hero);

            /**
             * Buttons
             */

            playBtn = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
            playBtn.x = 500;
            playBtn.y = 260;
            addChild(playBtn);

            aboutBtn = new Button(Assets.getAtlas().getTexture("welcome_aboutButton"));
            aboutBtn.x = 410;
            aboutBtn.y = 380;
            addChild(aboutBtn);

            addEventListener(Event.TRIGGERED, onMainMenuClicked);
        }

        private function onMainMenuClicked(event:Event):void {
            var buttonClicked:Button = event.target as Button;
            if(buttonClicked == playBtn) {
                dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, true, {id: "play"}));
            } else if(buttonClicked == aboutBtn) {
                dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, true, {id: "about"}));
            }
        }

        public function initialize():void {
            this.visible = true;

            hero.x = - hero.width;
            hero.y = 100;

            TweenLite.to(hero, 2, {x: 80});
            addEventListener(Event.ENTER_FRAME, heroFloatingAnimation);
        }

        public function heroFloatingAnimation(event:Event):void {
            var currentDate:Date = new Date();
            hero.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 25);
            playBtn.y = 260 + (Math.cos(currentDate.getTime() * 0.002) * 10);
            aboutBtn.y = 380 + (Math.cos(currentDate.getTime() * 0.002) * 10);
        }

        public function disposeTemporarily():void {
            visible = false;
            if(hasEventListener(Event.ENTER_FRAME))
                removeEventListener(Event.ENTER_FRAME, heroFloatingAnimation);
        }
    }
}
