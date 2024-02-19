package states.stages;
class GaryHome extends BaseStage
{
    override public function create()
    {   final bg = new BGSprite('garyhouse', 0, 0, 1, 1);
            
        bg.scale.x = bg.scale.y = 1.5;
        bg.updateHitbox();
        add(bg);
        super.create();

    }
}