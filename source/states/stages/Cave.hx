package states.stages;

class Cave extends BaseStage
{
    var front:BGSprite;
    override public function create()
    {
        for (i in 1...4)
            {
                front = new BGSprite('layer' + i, -1000, -1000, .8 + .2 * (i - 1), .8 + .1 * (i - 1)); 
                front.setGraphicSize(Std.int(front.width * 2.4));
                front.updateHitbox();
                front.active = false;
                if (i != 3) add(front); //DUDE CODE
            }
    }
    override public function createPost()
    {
        final throne = new BGSprite('throne', -1250, 250, 1);
        throne.scale.set(1.5, 1.5);
        throne.updateHitbox();
        add(throne);
        front.setGraphicSize(Std.int(front.width * 1.5));
        front.updateHitbox();
    
        front.y += FlxG.width * 1.9;
        add(front);
    }
}