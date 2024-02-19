package states.stages;

import psychlua.ModchartSprite;

class SewersSequel extends BaseStage
{
    override public function create()
    {
        final fooSpr1 = new BGSprite('gelk/1', 0, 0, 1, 1);

        add(fooSpr1);


        final fooSpr2 = new BGSprite('gelk/2', 0, 0, 1, 1);

        add(fooSpr2);
        
        //var shaderObj = new WaterTexture();
        // add(shaderObj);
        // fooSpr.shader = shaderObj.shader;

        final fooSpr3 = new BGSprite('gelk/3', 0, -100, 1, 1);
        add(fooSpr3);
    

        final fooSpr4 = new BGSprite('gelk/4', 0, 0, 1, 1);
        add(fooSpr4);


        final waterFall = new BGSprite('gelk/Waterfall_Animation', 1450, -180, 1, 1, ['Waterfall instance'], true);
        waterFall.animation.getByName('Waterfall instance').frameRate *= 2;
        add(waterFall);

        final fooSpr5 = new BGSprite('gelk/5', 1280, 360, 1, 1);
				
        add(fooSpr5);
        final modchartSprites:Map<String, ModchartSprite> = game.modchartSprites;
        modchartSprites.set('fooSpr0', fooSpr1);
        modchartSprites.set('fooSpr1', fooSpr2);
        modchartSprites.set('fooSpr2', fooSpr3);
        modchartSprites.set('fooSpr3', fooSpr4);
        modchartSprites.set('fooSpr4', waterFall);
        modchartSprites.set('fooSpr5', fooSpr5);
        super.create();
    }
}