
if (keyboard_check_pressed(vk_escape)) {
	room_restart();
}

checa_chao();
controles();
roda_estado();
ajusta_xscale();


//Movimentacao horizontal
move_and_collide(velh, 0, colisor, 4);

//Movimentacao vertical
move_and_collide(0, velv, colisor, 24);

atualiza_pos_chicote();