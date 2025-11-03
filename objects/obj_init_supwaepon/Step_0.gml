if (finalizou_animacao()) {
	instance_destroy();
    var _x = x + (image_xscale * 20);
    var _axe = instance_create_depth(_x, y, depth, obj_subweapon);
    _axe.image_xscale = image_xscale;
    _axe.hspeed *= image_xscale;
}