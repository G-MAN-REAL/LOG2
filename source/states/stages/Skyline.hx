package states.stages;

class Skyline extends BaseStage 
{
    override public function create()
{	    final skyline:BGSprite = new BGSprite('enraged/skylinebg', -500, -400, 1, 1);
        add(skyline);
        super.create();
    }
}