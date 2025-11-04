vida_max = 1;
vida_atual = 1;

lista_livre = [];

//Meu metodo para receber dano
recebe_dano = function(_dano = 1) {
    vida_atual -= _dano
    vida_atual = clamp(vida_atual, 0, vida_max);
    
    //Se eu to sem vida eu me destruo
    if (vida_atual <= 0) {
    	instance_destroy();
    }
} 