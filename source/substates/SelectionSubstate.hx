package substates;

import states.MainMenuState;
import states.FreeplayState;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

class SelectionSubstate extends FlxSubState
{
    var diffTextGroup:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();
    var controls:Controls;
    var thing:FlxTween;
    var headerText:FlxText;
    public function new()
    {
        this.controls = Controls.instance;
        super();
    }
    override public function create()
    {
        FlxG.sound.music.fadeOut(0.2, 0.2);
        var blackScreen:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
        blackScreen.alpha = 0;
        add(blackScreen);
        FlxTween.tween(blackScreen, {alpha: 0.5}, 0.4);
        var headerText:FlxText = new FlxText(0, 100, "START GAME?", 64);
        headerText.color = FlxColor.RED;
        headerText.screenCenter(X);
        add(headerText);
        add(diffTextGroup);
        var opts = ['YES', 'NO'];
		var lastX:Float = 275;
		for (i in 0...opts.length)
		{
			var text = new FlxText(lastX, FlxG.height / 2, 0, opts[i], 84);
            if (i == 0) text.color = 0xFF30D5C8;
            text.alpha = 0;
            FlxTween.tween(text, {alpha: 1}, 0.4);
            text.ID = i;
			lastX = text.x + text.width + 400;
			diffTextGroup.add(text);
		}
    super.create();
    }
    override public function update(elapsed:Float)
    {
        if (controls.BACK && thing == null)
        {
            goBack();
        }
        if (FlxG.mouse.overlaps(diffTextGroup) && FlxG.mouse.justPressed)
        {
            diffTextGroup.forEach(function(text:FlxText){
            if (FlxG.mouse.overlaps(text)){
            text.color = 0xFF30D5C8;
            if (text.text == 'YES'){
            thing = FlxTween.tween(FlxG.camera, {alpha: 0}, 1, {onComplete: function(tween:FlxTween)
            {
                LoadingState.loadAndSwitchState(new PlayState(), true);
                FreeplayState.destroyFreeplayVocals();
            }});
            }
            else 
                goBack();
        }        
        else text.color = FlxColor.WHITE;
        });
    }

        super.update(elapsed);
    }
    function goBack()
    {
        FlxG.sound.music.fadeIn(0.2, 0.2, 0.4);
        MainMenuState.inMove = false;
        close();
    }
}