if (image_index > 1.5) {
	aplica_dano();
}


//Me destruir quando finalizou a animacao
if (finalizou_animacao()) {
	instance_destroy();
}