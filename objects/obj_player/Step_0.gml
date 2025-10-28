checa_chao();
controles();
roda_estado();
ajusta_xscale();

if (!chao) {
    if (velv < max_velv) {
    	velv += grav;
    }else {
    	velv = max_velv;
    }
	
}else {
	velv = 0;
}

//Movimentacao horizontal
move_and_collide(velh, 0, colisor, 4);

//Movimentacao vertical
move_and_collide(0, velv, colisor, 12);