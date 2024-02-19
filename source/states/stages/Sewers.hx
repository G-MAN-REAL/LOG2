package states.stages;

import states.stages.objects.*;

class Sewers extends BaseStage
{
    override public function create()
    {
        final backgroundSprite = new BGSprite('sewers' + (['void-of-malice', 'apex-ravager'].contains(songName) ? 'Alt' : ''), -350, 480, .99, .99);
        backgroundSprite.setGraphicSize(Std.int(backgroundSprite.width * 1.2));
        backgroundSprite.updateHitbox();
        add(backgroundSprite);

        backgroundSprite.setColorTransform(0.75, 0.75, 0.75, 1, 0, 0, 0, 0);
        
        if (!ClientPrefs.data.lowQuality){
            final lightObj = new LightingObject(new lime.math.Rectangle(300, 600, 400, 600), FlxG.camera);
            add(lightObj);
            lightObj.lightShader.color.value = [150, 150, 125];
            lightObj.lightShader.intensity.value = [1];
    
            final lightObj2 = new LightingObject(new lime.math.Rectangle(1600, 600, 400, 600), FlxG.camera);
            add(lightObj2);
            lightObj2.lightShader.color.value = [150, 150, 125];
            lightObj2.lightShader.intensity.value = [1];
    
            final lightObj3 = new LightingObject(new lime.math.Rectangle(1500, 1200, 450, 300), FlxG.camera);
            add(lightObj3);
            lightObj3.lightShader.color.value = [150, 150, 200];
            lightObj3.lightShader.intensity.value = [1];
    
            }
        super.create();
    }
}