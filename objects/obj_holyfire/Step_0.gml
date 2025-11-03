if (finalizou_animacao()) {
	instance_destroy();
}

chao = place_meeting(x, y+1, colisor)

//Se a animacao avancou o suficiente eu crio meu filho
if (image_index > 1.6 && filho == noone && qtd > 0 && chao) {
    var _x = x + image_xscale * 4;
	filho = instance_create_depth(_x, y, depth, obj_holyfire);
    filho.qtd = qtd - 1;
    filho.image_xscale = image_xscale;
}

if (!chao) {
	vspeed += 0.1;
}else {
	vspeed = 0;
}