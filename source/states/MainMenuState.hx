package states;


import lime.math.Vector2;
import openfl.Vector;
import objects.MenuButton;
import backend.WeekData;
import objects.CheckboxThingie;
import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.7.2h'; // This is also used for Discord RPC
	public var menuIcon:FlxSprite;
	public var darkStar:FlxSprite;
	public var optionsText:Array<String> = ['CAMPAIGN', 'FREEPLAY', 'OPTIONS'];
	public static var selectedOption:Int = 0;
	var glass:FlxSprite;
	var bg:FlxSprite;
	public var iconGroup:FlxSpriteGroup;
	var coolTween:FlxTween;
	var pointArray:Array<FlxPoint> = [];
	var reducer:Float = 0.4;
	var starBounds:Array<Int> = [];
	var coolerTween:FlxTween;
	var callbackArray:Array<Array<Dynamic>> = [];
	var zoomFloat:Float = 1.1;
	var difficulties:Array<String> = ['CHAPTER 1', 'ETHER', 'FINALE'];
	var lockText:FlxText;
	var saveCheckBox:CheckboxThingie = new CheckboxThingie(10, FlxG.height - 100);
	var textGroup:FlxTypedGroup<FlxText>;
	public static var saved:Bool = false;
	var fullExit:Alphabet;
	public static var inMove = false;
	var mainMenuButtonGroup:FlxTypedGroup<MenuButton>;


	override function create()
	{
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		WeekData.reloadWeekFiles(true);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		if (FlxG.save.data.weekSpot != null) CoolUtil.weekSpot = FlxG.save.data.weekSpot;
		inMove = false;

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;
		FlxG.mouse.visible = FlxG.mouse.enabled = true;

		bg = new FlxSprite().loadGraphic(Paths.image('menustuff/SpaceBG'));
		initializeSprite(bg, zoomFloat);

		darkStar = new FlxSprite().loadGraphic(Paths.image('menustuff/MMDarkStar'));
		initializeSprite(darkStar,zoomFloat - 0.4);
		FlxTween.tween(darkStar, {angle: darkStar.angle + 360}, 30, {type: FlxTweenType.LOOPING});


		iconGroup = new FlxSpriteGroup();
		add(iconGroup);
		


		final glass = new FlxSprite(-50, 0).loadGraphic(Paths.image('menustuff/MMPrism'));
		initializeSprite(glass, zoomFloat);

		mainMenuButtonGroup = new FlxTypedGroup<MenuButton>();
		add(mainMenuButtonGroup);


		for (i in 0...optionsText.length){
			var button:MenuButton = new MenuButton(50, 150 + i * 125, new Vector2(50, 70));
			mainMenuButtonGroup.add(button);
			button.addText(optionsText[i]);
			button.alpha = 0.5;
			button.scale.x = 0.6;
			button.scale.y = 0.6; 
			button.callbackNum = i;
			button.updateHitbox();
		}

		var lastX:Float = 300;
		textGroup = new FlxTypedGroup<FlxText>();
		add(textGroup);
		for (i in 0...difficulties.length)
			{
				var text = new FlxText(lastX, 10, 0, difficulties[i], 40);
				text.color = (StoryMenuState.weekCompleted[WeekData.weeksList[i]] != null || WeekData.weeksLoaded[WeekData.weeksList[i]].startUnlocked) ? FlxColor.WHITE : FlxColor.GRAY;
				if (i == 0) text.color = 0xFF30D5C8;
				lastX = text.x + text.width + 64;
				textGroup.add(text);
			}
		for (i in 0...3)
		{
			var icon:FlxSprite = new FlxSprite((FlxG.width - 300) + (i * 400), FlxG.height - 300).loadGraphic(Paths.image('menustuff/MMIcon' + (i + 1)));	
			icon.setGraphicSize(Std.int(icon.width * 0.67));
			icon.updateHitbox();
			icon.ID = i; 
			icon.antialiasing = true;
			i==2 ? icon.offset.set(100, 140) : icon.offset.add(20, 0);//always one
			pointArray.push(icon.getPosition());
			iconGroup.add(icon);
		}

			fullExit = new Alphabet(FlxG.width - 65, 5, "X", true);
			add(fullExit);
	
			add(saveCheckBox);
			saved = saveCheckBox.daValue;
			final saveTxt = new Alphabet(saveCheckBox.x + 120, saveCheckBox.y + 20, "LOAD SAVE", true);
			saveTxt.scaleX = saveTxt.scaleY = 0.75;
			add(saveTxt);
			lockText  = new FlxText('LOCKED', 64);
			lockText.screenCenter();
			lockText.visible = false;
			lockText.color = FlxColor.RED;
			add(lockText);

		#if ACHIEVEMENTS_ALLOWED
		// Unlocks "Freaky on a Friday Night" achievement if it's a Friday and between 18:00 PM and 23:59 PM
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
			Achievements.unlock('friday_night_play');

		#if MODS_ALLOWED
		Achievements.reloadList();
		#end
		#end

		super.create();

	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		bg.setPosition(FlxG.mouse.getScreenPosition().x/400 - 6, FlxG.mouse.getScreenPosition().y/400 );
		darkStar.setPosition(FlxG.mouse.getScreenPosition().x/50 - 20, FlxG.mouse.getScreenPosition().y/50 - 20);
		if (FlxG.mouse.overlaps(saveCheckBox) && FlxG.mouse.justPressed)
		{
			saveCheckBox.daValue = !saveCheckBox.daValue;
			saved = saveCheckBox.daValue;
		}
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if (FreeplayState.vocals != null)
				FreeplayState.vocals.volume += 0.5 * elapsed;
		}


		if (FlxG.mouse.justPressed)
			{
				if (FlxG.mouse.overlaps(textGroup))
				{
					if (coolTween == null || coolTween.finished){
					textGroup.forEach(function(text:FlxText){
						var checkWeek = (StoryMenuState.weekCompleted[WeekData.weeksList[difficulties.indexOf(text.text)]] != null || WeekData.weeksLoaded[WeekData.weeksList[difficulties.indexOf(text.text)]].startUnlocked);
						text.color = (checkWeek ? FlxColor.WHITE : FlxColor.GRAY); 
							if (FlxG.mouse.overlaps(text)) {
									if (!checkWeek){
										textGroup.members[selectedOption].color = 0xFF30D5C8;
										FlxFlicker.flicker(lockText, 0.2, 0.02, false);
										FlxG.sound.play(Paths.sound('Metronome_Tick', 'shared'));
									}
									else
									{
									selectedOption = difficulties.indexOf(text.text); 
									changeMode(text);
									}
								}
							});
					}
				}
			}
			 if (FlxG.mouse.overlaps(fullExit)){
				if (fullExit.color != FlxColor.RED){
				FlxG.sound.play(Paths.sound('Metronome_Tick', 'shared'), 0.6);
				fullExit.color = FlxColor.RED;
				}
				if (FlxG.mouse.justPressed)
				Sys.exit(1);
			}
			else{
				if (fullExit.color == FlxColor.RED){
				fullExit.color = FlxColor.WHITE;
				}
			}

		super.update(elapsed);
	}

	function changeMode(text:FlxText)
		{
			text.color = 0xFF30D5C8;
			iconGroup.forEach(function(spr:FlxSprite){
				var stuff = (selectedOption - spr.ID);
				coolTween = FlxTween.tween(spr, {x: pointArray[FlxMath.absInt(stuff)].x}, 0.2);
			});
		}

	function initializeSprite(spr:FlxSprite, size:Float = 0):Void
		{
			add(spr);
			spr.antialiasing = ClientPrefs.data.antialiasing;
			spr.setGraphicSize(Std.int(spr.width * size));
			spr.updateHitbox(); 
		}
}
