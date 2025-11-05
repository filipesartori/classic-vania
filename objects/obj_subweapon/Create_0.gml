alarm[0] = game_get_speed(gamespeed_fps) * 6;

//Variaveis para o boomerang
dist_max  = 150;
dist_vmax = 60;
subi      = false;
voltei    = false;
terminei  = false;

subweapon = global.subweapon;

switch (subweapon) {
	case SUBWEAPON.AXE       : sprite_index = spr_axe; break;
	case SUBWEAPON.KNIFE     : sprite_index = spr_knife; break;
	case SUBWEAPON.BOOMERANG : sprite_index = spr_boomerang; break;
	case SUBWEAPON.HOLYWATER : sprite_index = spr_holywater; break;
}

axe = function() {
    hspeed = 2 * image_xscale;
}

knife = function() {
    hspeed = 3 * image_xscale;
} 

boomerang = function() {
    //Pegando a distancia viajada
    var _vdist = abs(y - ystart);
    var _dist  = abs(x - xstart);
    
    //Só faco isso se nao estou subindo ou voltando
    if(!subi && !voltei) hspeed = 2 * image_xscale;
    
    //Se eu passei a distancia maxima eu comeco a ir pra cima
    if (_dist > dist_max) {
    	subi = true;
    }
    
    if (subi && !voltei) {
    	vspeed = -2;
        hspeed = image_xscale * 1;
    }
    
    //Se eu subir o suficiente eu volto para onde eu parti
    if (_vdist > dist_vmax) {
    	voltei = true;
    }
    
    if (voltei && !terminei) {
        //Achando a direcao que devo ir
    	var _dir = point_direction(x, y, xstart, ystart);
        
        //Pegadno a diferenca da direcao que eu qeuro ir para q estou indo
        var _ang_dif = angle_difference(_dir, direction);
        
        //Garantindo que a difereça é de no maximo 5 pixels
        var _ang = clamp(_ang_dif, -5, 5)
        
        if(abs(_ang) < 3) terminei = true;
        
        speed = 2;
        direction += _ang;
    }
    
    
} 

holywater = function() {
    //Checando chao
    var _col = [obj_colisor, layer_tilemap_get_id("tl_level")]
    var _chao = place_meeting(x, y+1, _col);
    hspeed = 2 * image_xscale;
    vspeed = 1;
    
    if (_chao) {
    	instance_destroy();
        var _filho = instance_create_depth(x, y, depth, obj_holyfire);
        _filho.image_xscale = image_xscale;
    }
} 