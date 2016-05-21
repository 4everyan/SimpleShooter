package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Yan Filippovsky
 */
class Enemy extends Entity
{
    private static var _sharedGraphic:Image;
    
    public function new(x:Float, y:Float)
    {
        super(x, y);
        
        if (_sharedGraphic == null) {
            _sharedGraphic = Image.createRect(32, 32);
        }
        graphic = _sharedGraphic;
        setHitbox(32, 32);
        type = "enemy";
    }

    public override function moveCollideX(e:Entity)
    {
        scene.remove(e);
        scene.remove(this);
        return true;
    }

    public override function update()
    {
        if (x < -width) {
            scene.remove(this);
            return;
        }
        moveBy(-5, 0, "player");
        super.update();
    }
}