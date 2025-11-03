alarm[0] = game_get_speed(gamespeed_fps) * 3;

switch (global.subweapon) {
	case SUBWEAPON.AXE       : sprite_index = spr_axe; break;
	case SUBWEAPON.KNIFE     : sprite_index = spr_knife; break;
	case SUBWEAPON.BOOMERANG : sprite_index = spr_boomerang; break;
}

axe = function() {
    hspeed = 2 * image_xscale;
}

knife = function() {
    hspeed = 3 * image_xscale;
} 

boomerang = function() {
    
} 