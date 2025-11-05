tile_col = layer_tilemap_get_id("tl_level");
col = [tile_col, obj_colisor];
chao = false;
image_xscale = .8;
image_yscale = .8;


switch (item) {
	case "coracao"    : sprite_index = spr_item_heart     ; break;
	case "carne"      : sprite_index = spr_item_meat      ; break;
	case "axe"        : sprite_index = spr_item_axe       ; break;
	case "holywater"  : sprite_index = spr_item_holywater ; break;
	case "knife"      : sprite_index = spr_item_knife     ; break;
	case "boomerang"  : sprite_index = spr_item_boomerang ; break;
}

//Criando o metodo apra cada sitaucao
heart = function() {
    //TODO Código para adicionar um valor de coracao
    show_message("coracao")
} 

meat = function() {
    //TODO Código para adicionar um valor de coracao
    show_message("carne")
}

axe = function() {
    global.subweapon = SUBWEAPON.AXE;
}

knife = function() {
    global.subweapon = SUBWEAPON.KNIFE;
}

boomerang = function() {
    global.subweapon = SUBWEAPON.BOOMERANG;
}

holywater = function() {
    global.subweapon = SUBWEAPON.HOLYWATER;
}
