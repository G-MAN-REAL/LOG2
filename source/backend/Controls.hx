package backend;

import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.gamepad.mappings.FlxGamepadMapping;
import flixel.input.keyboard.FlxKey;

class Controls
{
	//Keeping same use cases on stuff for it to be easier to understand/use
	//I'd have removed it but this makes it a lot less annoying to use in my opinion

	//You do NOT have to create these variables/getters for adding new keys,
	//but you will instead have to use:
	//   controls.justPressed("ui_up")   instead of   controls.UI_UP

	//Dumb but easily usable code, or Smart but complicated? Your choice.
	//Also idk how to use macros they're weird as fuck lol

	// Pressed buttons (directions)
	public var UI_UP_P(get, never):Bool;
	public var UI_DOWN_P(get, never):Bool;
	public var UI_LEFT_P(get, never):Bool;
	public var UI_RIGHT_P(get, never):Bool;
	public var NOTE_UP_P(get, never):Bool;
	public var NOTE_DOWN_P(get, never):Bool;
	public var NOTE_LEFT_P(get, never):Bool;
	public var NOTE_RIGHT_P(get, never):Bool;
	public var SIXKEY_1_P(get, never):Bool;
	public var SIXKEY_2_P(get, never):Bool;
	public var SIXKEY_3_P(get, never):Bool;
	public var SIXKEY_4_P(get, never):Bool;
	public var SIXKEY_5_P(get, never):Bool;
	public var SIXKEY_6_P(get, never):Bool;
	public var EIGHTKEY_1_P(get, never):Bool;
	public var EIGHTKEY_2_P(get, never):Bool;
	public var EIGHTKEY_3_P(get, never):Bool;
	public var EIGHTKEY_4_P(get, never):Bool;
	public var EIGHTKEY_5_P(get, never):Bool;
	public var EIGHTKEY_6_P(get, never):Bool;
	public var EIGHTKEY_7_P(get, never):Bool;
	public var EIGHTKEY_8_P(get, never):Bool;
	public var SPACE_KEY_P(get ,never):Bool;

	private function get_UI_UP_P() return justPressed('ui_up');
	private function get_UI_DOWN_P() return justPressed('ui_down');
	private function get_UI_LEFT_P() return justPressed('ui_left');
	private function get_UI_RIGHT_P() return justPressed('ui_right');
	private function get_NOTE_UP_P() return justPressed('note_up');
	private function get_NOTE_DOWN_P() return justPressed('note_down');
	private function get_NOTE_LEFT_P() return justPressed('note_left');
	private function get_NOTE_RIGHT_P() return justPressed('note_right');
	private function get_SIXKEY_1_P() return justPressed('6Key_1');
	private function get_SIXKEY_2_P() return justPressed('6Key_2');
	private function get_SIXKEY_3_P() return justPressed('6Key_3');
	private function get_SIXKEY_4_P() return justPressed('6Key_4');
	private function get_SIXKEY_5_P() return justPressed('6Key_5');
	private function get_SIXKEY_6_P() return justPressed('6Key_6');
	private function get_EIGHTKEY_1_P() return justPressed('8Key_1');
	private function get_EIGHTKEY_2_P() return justPressed('8Key_2');
	private function get_EIGHTKEY_3_P() return justPressed('8Key_3');
	private function get_EIGHTKEY_4_P() return justPressed('8Key_4');
	private function get_EIGHTKEY_5_P() return justPressed('8Key_5');
	private function get_EIGHTKEY_6_P() return justPressed('8Key_6');
	private function get_EIGHTKEY_7_P() return justPressed('8Key_7');
	private function get_EIGHTKEY_8_P() return justPressed('8Key_8');
	private function get_SPACE_KEY_P() return justPressed('space_key');

	// Held buttons (directions)
	public var UI_UP(get, never):Bool;
	public var UI_DOWN(get, never):Bool;
	public var UI_LEFT(get, never):Bool;
	public var UI_RIGHT(get, never):Bool;
	public var NOTE_UP(get, never):Bool;
	public var NOTE_DOWN(get, never):Bool;
	public var NOTE_LEFT(get, never):Bool;
	public var NOTE_RIGHT(get, never):Bool;
	public var SIXKEY_1(get, never):Bool;
	public var SIXKEY_2(get, never):Bool;
	public var SIXKEY_3(get, never):Bool;
	public var SIXKEY_4(get, never):Bool;
	public var SIXKEY_5(get, never):Bool;
	public var SIXKEY_6(get, never):Bool;
	public var EIGHTKEY_1(get, never):Bool;
	public var EIGHTKEY_2(get, never):Bool;
	public var EIGHTKEY_3(get, never):Bool;
	public var EIGHTKEY_4(get, never):Bool;
	public var EIGHTKEY_5(get, never):Bool;
	public var EIGHTKEY_6(get, never):Bool;
	public var EIGHTKEY_7(get, never):Bool;
	public var EIGHTKEY_8(get, never):Bool;
	public var SPACE_KEY(get ,never):Bool;
	private function get_UI_UP() return pressed('ui_up');
	private function get_UI_DOWN() return pressed('ui_down');
	private function get_UI_LEFT() return pressed('ui_left');
	private function get_UI_RIGHT() return pressed('ui_right');
	private function get_NOTE_UP() return pressed('note_up');
	private function get_NOTE_DOWN() return pressed('note_down');
	private function get_NOTE_LEFT() return pressed('note_left');
	private function get_NOTE_RIGHT() return pressed('note_right');
	private function get_SIXKEY_1() return pressed('6Key_1');
	private function get_SIXKEY_2() return pressed('6Key_2');
	private function get_SIXKEY_3() return pressed('6Key_3');
	private function get_SIXKEY_4() return pressed('6Key_4');
	private function get_SIXKEY_5() return pressed('6Key_5');
	private function get_SIXKEY_6() return pressed('6Key_6');
	private function get_EIGHTKEY_1() return pressed('8Key_1');
	private function get_EIGHTKEY_2() return pressed('8Key_2');
	private function get_EIGHTKEY_3() return pressed('8Key_3');
	private function get_EIGHTKEY_4() return pressed('8Key_4');
	private function get_EIGHTKEY_5() return pressed('8Key_5');
	private function get_EIGHTKEY_6() return pressed('8Key_6');
	private function get_EIGHTKEY_7() return pressed('8Key_7');
	private function get_EIGHTKEY_8() return pressed('8Key_8');
	private function get_SPACE_KEY() return pressed('space_key');

	// Released buttons (directions)
	public var UI_UP_R(get, never):Bool;
	public var UI_DOWN_R(get, never):Bool;
	public var UI_LEFT_R(get, never):Bool;
	public var UI_RIGHT_R(get, never):Bool;
	public var NOTE_UP_R(get, never):Bool;
	public var NOTE_DOWN_R(get, never):Bool;
	public var NOTE_LEFT_R(get, never):Bool;
	public var NOTE_RIGHT_R(get, never):Bool;
	public var SIXKEY_1_R(get, never):Bool;
	public var SIXKEY_2_R(get, never):Bool;
	public var SIXKEY_3_R(get, never):Bool;
	public var SIXKEY_4_R(get, never):Bool;
	public var SIXKEY_5_R(get, never):Bool;
	public var SIXKEY_6_R(get, never):Bool;
	public var EIGHTKEY_1_R(get, never):Bool;
	public var EIGHTKEY_2_R(get, never):Bool;
	public var EIGHTKEY_3_R(get, never):Bool;
	public var EIGHTKEY_4_R(get, never):Bool;
	public var EIGHTKEY_5_R(get, never):Bool;
	public var EIGHTKEY_6_R(get, never):Bool;
	public var EIGHTKEY_7_R(get, never):Bool;
	public var EIGHTKEY_8_R(get, never):Bool;
	public var SPACE_KEY_R(get ,never):Bool;
	private function get_UI_UP_R() return justReleased('ui_up');
	private function get_UI_DOWN_R() return justReleased('ui_down');
	private function get_UI_LEFT_R() return justReleased('ui_left');
	private function get_UI_RIGHT_R() return justReleased('ui_right');
	private function get_NOTE_UP_R() return justReleased('note_up');
	private function get_NOTE_DOWN_R() return justReleased('note_down');
	private function get_NOTE_LEFT_R() return justReleased('note_left');
	private function get_NOTE_RIGHT_R() return justReleased('note_right');
	private function get_SIXKEY_1_R() return justReleased('6Key_1');
	private function get_SIXKEY_2_R() return justReleased('6Key_2');
	private function get_SIXKEY_3_R() return justReleased('6Key_3');
	private function get_SIXKEY_4_R() return justReleased('6Key_4');
	private function get_SIXKEY_5_R() return justReleased('6Key_5');
	private function get_SIXKEY_6_R() return justReleased('6Key_6');
	private function get_EIGHTKEY_1_R() return justReleased('8Key_1');
	private function get_EIGHTKEY_2_R() return justReleased('8Key_2');
	private function get_EIGHTKEY_3_R() return justReleased('8Key_3');
	private function get_EIGHTKEY_4_R() return justReleased('8Key_4');
	private function get_EIGHTKEY_5_R() return justReleased('8Key_5');
	private function get_EIGHTKEY_6_R() return justReleased('8Key_6');
	private function get_EIGHTKEY_7_R() return justReleased('8Key_7');
	private function get_EIGHTKEY_8_R() return justReleased('8Key_8');
	private function get_SPACE_KEY_R() return justReleased('space_key');


	// Pressed buttons (others)
	public var ACCEPT(get, never):Bool;
	public var BACK(get, never):Bool;
	public var PAUSE(get, never):Bool;
	public var RESET(get, never):Bool;
	private function get_ACCEPT() return justPressed('accept');
	private function get_BACK() return justPressed('back');
	private function get_PAUSE() return justPressed('pause');
	private function get_RESET() return justPressed('reset');

	//Gamepad & Keyboard stuff
	public var keyboardBinds:Map<String, Array<FlxKey>>;
	public var gamepadBinds:Map<String, Array<FlxGamepadInputID>>;
	public function justPressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustPressed(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadJustPressed(gamepadBinds[key]) == true;
	}

	public function pressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyPressed(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadPressed(gamepadBinds[key]) == true;
	}

	public function justReleased(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustReleased(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadJustReleased(gamepadBinds[key]) == true;
	}

	public var controllerMode:Bool = false;
	private function _myGamepadJustPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustPressed(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyPressed(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadJustReleased(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustReleased(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}

	// IGNORE THESE
	public static var instance:Controls;
	public function new()
	{
		keyboardBinds = ClientPrefs.keyBinds;
		gamepadBinds = ClientPrefs.gamepadBinds;
	}
}