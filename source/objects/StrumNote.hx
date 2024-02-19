package objects;

import flixel.graphics.frames.FlxAtlasFrames;
import backend.animation.PsychAnimationController;

import shaders.RGBPalette;
import shaders.RGBPalette.RGBShaderReference;

class StrumNote extends FlxSprite
{
	public var rgbShader:RGBShaderReference;
	public var resetAnim:Float = 0;
	private var noteData:Int = 0;
	public var direction:Float = 90;//plan on doing scroll directions soon -bb
	public var downScroll:Bool = false;//plan on doing scroll directions soon -bb
	public var sustainReduce:Bool = true;
	private var player:Int;
	private var usedSystem:Int = 4;
	private var dataInt:Int = 0;
	
	public var texture(default, set):String = null;
	private function set_texture(value:String):String {
		if(texture != value) {
			texture = value;
			reloadNote();
		}
		return value;
	}

	public var useRGBShader:Bool = true;
	public function new(x:Float, y:Float, leData:Int, player:Int) {
		animation = new PsychAnimationController(this);

		usedSystem = player == 1 ? PlayState.playerMania : PlayState.dadMania;
		dataInt = CoolUtil.keyHandler(leData, usedSystem);
		rgbShader = new RGBShaderReference(this, Note.initializeGlobalRGBShader(leData, usedSystem));
		rgbShader.enabled = false;
		if(PlayState.SONG != null && PlayState.SONG.disableNoteRGB) useRGBShader = false;
		var arr:Array<FlxColor> = ClientPrefs.data.arrowRGB[usedSystem][leData];
		if(PlayState.isPixelStage) arr = ClientPrefs.data.arrowRGBPixel[usedSystem][leData];
		
		if(leData <= arr.length)
		{
			@:bypassAccessor
			{
				rgbShader.r = arr[0];
				rgbShader.g = arr[1];
				rgbShader.b = arr[2];
			}
		}

		noteData = leData;
		this.player = player;
		this.noteData = leData;
		super(x, y);

		var skin:String = null;
		if(PlayState.SONG != null && PlayState.SONG.arrowSkin != null && PlayState.SONG.arrowSkin.length > 1) skin = PlayState.SONG.arrowSkin;
		else skin = Note.defaultNoteSkin;

		var customSkin:String = skin + Note.getNoteSkinPostfix();
		if(Paths.fileExists('images/$customSkin.png', IMAGE)) skin = customSkin;

		texture = skin; //Load texture and anims
		scrollFactor.set();
	}

	public function reloadNote()
	{
		var lastAnim:String = null;
		if(animation.curAnim != null) lastAnim = animation.curAnim.name;
		final dataInt = CoolUtil.keyHandler(noteData, usedSystem);

		if(PlayState.isPixelStage)
		{
			loadGraphic(Paths.image('pixelUI/' + texture));
			width = width / 4;
			height = height / 5;
			loadGraphic(Paths.image('pixelUI/' + texture), true, Math.floor(width), Math.floor(height));
			final fooFrames = new FlxAtlasFrames(frames.parent);
			for (frame in frames.frames)
				fooFrames.pushFrame(frame);
			fooFrames.addAtlas(Paths.getSparrowAtlas('shieldNote'));
			frames = fooFrames;
			antialiasing = false;
			final swagNumba = (dataInt == 4 ? 0.9 - usedSystem/20 : PlayState.daPixelZoom);
			setGraphicSize(Std.int(width * swagNumba));

			animation.add('green', [6]);
			animation.add('red', [7]);
			animation.add('blue', [5]);
			animation.add('purple', [4]);
			switch (dataInt)
			{
				case 0:
					animation.add('static', [0]);
					animation.add('pressed', [4, 8], 12, false);
					animation.add('confirm', [12, 16], 24, false);
				case 1:
					animation.add('static', [1]);
					animation.add('pressed', [5, 9], 12, false);
					animation.add('confirm', [13, 17], 24, false);
				case 2:
					animation.add('static', [2]);
					animation.add('pressed', [6, 10], 12, false);
					animation.add('confirm', [14, 18], 12, false);
				case 3:
					animation.add('static', [3]);
					animation.add('pressed', [7, 11], 12, false);
					animation.add('confirm', [15, 19], 24, false);
				case 4:
					updateHitbox();
					animation.addByPrefix('static', 'shield0');
					animation.addByPrefix('pressed', 'shield Pressed', 24, false);
					animation.addByPrefix('confirm', 'shield Confirm', 24, false);
			}
		}
		else
		{
			final fooFrames = Paths.getSparrowAtlas(texture);
			fooFrames.addAtlas(Paths.getSparrowAtlas('shieldNote'));
			frames = fooFrames;

			animation.addByPrefix('green', 'arrowUP');
			animation.addByPrefix('blue', 'arrowDOWN');
			animation.addByPrefix('purple', 'arrowLEFT');
			animation.addByPrefix('red', 'arrowRIGHT');

			antialiasing = ClientPrefs.data.antialiasing;
			final swagNumba:Float = 0.9 -usedSystem/20;
			scale.set(swagNumba, swagNumba);
			updateHitbox();

			switch (dataInt)
			{
				case 0:
					animation.addByPrefix('static', 'arrowLEFT');
					animation.addByPrefix('pressed', 'left press', 24, false);
					animation.addByPrefix('confirm', 'left confirm', 24, false);
				case 1:
					animation.addByPrefix('static', 'arrowDOWN');
					animation.addByPrefix('pressed', 'down press', 24, false);
					animation.addByPrefix('confirm', 'down confirm', 24, false);
				case 2:
					animation.addByPrefix('static', 'arrowUP');
					animation.addByPrefix('pressed', 'up press', 24, false);
					animation.addByPrefix('confirm', 'up confirm', 24, false);
				case 3:
					animation.addByPrefix('static', 'arrowRIGHT');
					animation.addByPrefix('pressed', 'right press', 24, false);
					animation.addByPrefix('confirm', 'right confirm', 24, false);
				case 4:
					updateHitbox();
					animation.addByPrefix('static', 'shield0');
					animation.addByPrefix('pressed', 'shield Pressed', 24, false);
					animation.addByPrefix('confirm', 'shield Confirm', 24, false);
			}
		}

		if(lastAnim != null)
		{
			playAnim(lastAnim, true);
		}
	}

	public function postAddedToGroup() {
		playAnim('static');
		x += Note.swagWidth * (4/usedSystem) * noteData * ((1.0) / (scale.x + 0.3));
		x += 50 - Note.swagWidth * scale.x * (PlayState.dadMania +PlayState.playerMania - 8)/8;
		x += ((FlxG.width / 2) * player);
		ID = noteData;
		updateHitbox();
	}

	override function update(elapsed:Float) {
		if(resetAnim > 0) {
			resetAnim -= elapsed;
			if(resetAnim <= 0) {
				playAnim('static');
				resetAnim = 0;
			}
		}
		super.update(elapsed);
	}

	public function playAnim(anim:String, ?force:Bool = false) {
		animation.play(anim, force);
		if(animation.curAnim != null)
		{
			centerOffsets();
			centerOrigin();
		}
		if(useRGBShader) rgbShader.enabled = (animation.curAnim != null && animation.curAnim.name != 'static');
	}
}
