checa_chao();
controles();
roda_estado();
ajusta_xscale();

//Movimentacao horizontal
move_and_collide(velh, 0, colisor, 4);

//Movimentacao vertical
move_and_collide(0, velv, colisor, 12);