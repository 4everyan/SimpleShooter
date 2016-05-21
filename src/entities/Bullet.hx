package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Yan Filippovsky
 */
class Bullet extends Entity
{
	private static var _sharedGraphic:Image;
	
	public function new(x:Float, y:Float)
    {
        super(x, y);

		if (_sharedGraphic == null) {
			_sharedGraphic = Image.createRect(16, 4);
		}
        graphic = _sharedGraphic;
        setHitbox(16, 4);
        type = "bullet";
    }

    public override function moveCollideX(e:Entity)
    {
        scene.remove(e);
        scene.remove(this);
        return true;
    }

    public override function update()
    {
		if (x > HXP.width) {
			scene.remove(this);
			return;
		}
        moveBy(20, 0, "enemy");
        super.update();
    }
}