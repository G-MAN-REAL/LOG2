package objects;

import options.OptionsState;
import states.FreeplayState;
import backend.Song;
import substates.SelectionSubstate;
import states.MainMenuState;
import objects.Alphabet.AlphaCharacter;
import flixel.tweens.FlxTween;
import lime.math.Vector2;
import flixel.FlxG;
import flixel.math.FlxRect;
import flixel.FlxSprite;
import backend.Paths;
import backend.WeekData;

class MenuButton extends FlxSprite
{
    public var fakeHitbox:FlxRect;
    public var callbackNum:Int = 0;
    public var posts:Vector2;
    public function new(x:Float, y:Float, posts:Vector2)
    {
        super(x, y);
        loadGraphic(Paths.image('menustuff/MainMenuButton'), false, 701, 394, true);
        fakeHitbox = new FlxRect(x, y + 25, width, height - 75);
        antialiasing = true;
        this.posts = posts;
    }
    var selected:Bool = false;
    public function addText(string:String)
    {
        for (j in 0...string.length){
			if (string.charAt(j) != ' '){
			var letter:AlphaCharacter = new AlphaCharacter();
			letter.setupAlphaCharacter(0, 0, string.charAt(j), true);
			stamp(letter, 150 + j * 50, Std.int(height / 2) - 35);
			}} 
    }
    override function update(elapsed:Float)
    {
        fakeHitbox = new FlxRect(x, y + 25, width, height - 75);

        if (fakeHitbox.containsPoint(FlxG.mouse.getPosition())) //HOLYYY SHIT THIS SUCKS -- is actually awesome
            {
                if (!selected){
                    selected = true;
                    FlxG.sound.play(Paths.sound('scrollMenu'));
                }
                if (x < posts.y) x += 2.5; 
                
                if (alpha < 1) alpha += 0.1;

                if (FlxG.mouse.justPressed)
                {
                    getCallBack(callbackNum);
                }
            }
            else if (!fakeHitbox.containsPoint(FlxG.mouse.getPosition()))
            {
                selected = false;
                if (x > posts.x) x -= 2.5;
                if (alpha > 0.6) alpha -= 0.1;
            }
        super.update(elapsed);
    }
    public function getCallBack(int:Int)
    {
            if (!MainMenuState.inMove){
            MainMenuState.inMove = true; 
            switch (int){
                case 0: 
                    WeekData.reloadWeekFiles(true);
                    var num:Int = MainMenuState.selectedOption > WeekData.weeksList.length - 1 ? 0 : MainMenuState.selectedOption;
                    WeekData.setDirectoryFromWeek(WeekData.weeksLoaded.get(WeekData.weeksList[num]));
                    var songArray:Array<String> = [];
                    var leWeek:Array<Dynamic> = WeekData.weeksLoaded.get(WeekData.weeksList[num]).songs;
                    var stPt:Null<Int> = CoolUtil.weekSpot[num];
                    if (stPt == null || stPt == -1 || !MainMenuState.saved) stPt = 0;
                    for (i in stPt...leWeek.length) {
                        songArray.push(leWeek[i][0]);
                    }
                    PlayState.storyWeek = num;
                    PlayState.campaignScore = 0;
                    PlayState.campaignMisses = 0;   
        
                    // Nevermind that's stupid lmao
                    PlayState.storyPlaylist = songArray;
                    PlayState.isStoryMode = true;
                    // if (PlayState.storyWeek == 0)
                    // state.openSubState(new DifficultySelectSubstate(PlayerSettings.player1.controls, this));
                    // else{
                        PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + '-hard', PlayState.storyPlaylist[0].toLowerCase());                 
                        PlayState.storyDifficulty = 1;
                        FlxG.state.openSubState(new SelectionSubstate());
                        // FlxTween.tween(FlxG.camera, {alpha: 0}, 1, {onComplete: function(tween:FlxTween)
                        //     {
                        //         LoadingState.loadAndSwitchState(new BufferState(), true);
                        //         FreeplayState.destroyFreeplayVocals();
                        //     }});
                    // }
                case 1: 
            			FlxG.switchState(new FreeplayState());
                case 2:
                        FlxG.switchState(new OptionsState()); 
            }
        }
    }

}

