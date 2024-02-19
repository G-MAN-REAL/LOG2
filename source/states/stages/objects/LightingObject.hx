package states.stages.objects;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.display.FlxShaderMaskCamera;
import flixel.math.FlxRect;
import flixel.system.FlxAssets.FlxShader;
import flixel.util.FlxBitmapDataUtil;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import lime.math.Rectangle;
import openfl.geom.Matrix;
import openfl.geom.Point;

class LightingObject extends FlxSprite
{
	public var lightShader = new LightEffect();

	public var drawRect:Rectangle;

	public var radius(default, set):Float = 1;

	public var bind:FlxSprite;

	public var offsetX:Float = 0;
	public var offsetY:Float = 0;


	public function new(drawRect:Rectangle, camera:FlxCamera)
	{
		super();
		this.x = drawRect.x;
		this.y = drawRect.y;
		this.drawRect = drawRect;
		makeGraphic(Std.int(drawRect.width), Std.int(drawRect.height), FlxColor.TRANSPARENT);
		lightShader.radius.value = [1];
		lightShader.angle.value = [0];
		shader = lightShader;
	}

	private function set_radius(value:Float):Float
	{
		radius = value;
		lightShader.radius.value = [value];
		return value;
	}

	override public function update(elapsed:Float)
	{
		if (bind != null)
			{
				x = bind.x + bind.offset.x + bind.frame.offset.x + drawRect.x + offsetX;
				y = bind.y + bind.offset.x + bind.frame.offset.y + drawRect.y + offsetY;
			}
		super.update(elapsed);
	}
}

class LightEffect extends FlxShader
{
	@:glFragmentSource('
	#pragma header
	uniform vec3 color;
	uniform float intensity;
	uniform float radius;
	uniform float angle;
	#define PI 3.14159

	void main()
	{
		vec4 sample = vec4(1.0);
		float dist = distance(openfl_TextureCoordv, vec2(0.5));
		sample.rgba -= dist + 0.5;
		float _intensity = 256/intensity;
		sample.r *= color.r / _intensity;
		sample.g *= color.g / _intensity;
		sample.b *= color.b / _intensity;
		float nAngle = angle * 3.14159 / 360.0;
		if (radius < dist || (nAngle != 0.0 && cos(nAngle) > (openfl_TextureCoordv.y - 0.5)/dist))
			sample.rgba = 0.0;
			
		gl_FragColor = sample;
	}')
	public function new()
	{
		super();
	}
}
