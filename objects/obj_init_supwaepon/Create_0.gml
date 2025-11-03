img_ind = 0;

//Definindo a sprite com base na varaivel global
switch (global.subweapon) {
	case SUBWEAPON.AXE       : sprite_index = spr_axe_init; break;
	case SUBWEAPON.KNIFE     : sprite_index = spr_knife_init; break;
    case SUBWEAPON.BOOMERANG : sprite_index = spr_boomerang_init; break;    
}

//Criando os comportamentos
axe = function() {
    instance_destroy();
    var _x = x + (image_xscale * 20);
    var _axe = instance_create_depth(_x, y, depth, obj_subweapon);
    _axe.image_xscale = image_xscale;
    _axe.gravity = 0.1;
    _axe.vspeed = -4;
}  

knife = function() {
    instance_destroy();
    var _x = x + image_xscale * 20;
    var _knife = instance_create_depth(_x, y, depth, obj_subweapon, {image_xscale: image_xscale});
}

boomerang = function() {
    instance_destroy();
    var _x = x + image_xscale * 20;
    var _boomerang = instance_create_depth(_x, y, depth, obj_subweapon, {image_xscale: image_xscale});
} 
