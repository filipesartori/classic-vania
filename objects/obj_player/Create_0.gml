#region Criacao dos estados

//criando o primeiro estado do player
estado_idle  = new estado();
estado_kneel = new estado();
estado_walk  = new estado();

#endregion

#region Variaveis

//varaivel de controle da escala
xscale = image_xscale;

//Index da imagem
img_ind = 0

//Array de colisores
colisor = [obj_colisor];

//Inputs
up        = noone;
down      = noone;
left      = noone;
right     = noone;
jump      = noone;
attack    = noone;
subweapon = noone;

//Movimentacao
velh     = 0;
velv     = 0;
max_velh = 1;
max_velv = 5;
grav     = .2;
chao     = false;


//varaivel de Controle do ataque
atacando = false;


#endregion


#region Metodos

//Metodo para checar se estou no chao
checa_chao = function() {
    chao = place_meeting(x, y+1, colisor);    
} 

//Movimentacao horizontal
movimento_horizontal = function() {
    velh = (right - left) * max_velh;    
} 

//Ajustando a direcao que o player olha
ajusta_xscale = function() {
    if (right xor left) {
        xscale = (right - left);    	
    }    
} 

//Metodo para pegar os inputs
controles = function() {
    up        = keyboard_check(vk_up);
    down      = keyboard_check(vk_down);
    left      = keyboard_check(vk_left);
    right     = keyboard_check(vk_right);
    jump      = keyboard_check_pressed(ord("Z"));
    attack    = keyboard_check_pressed(ord("X"));
    subweapon = keyboard_check_pressed(ord("C"));
    
}

//Metodo de ataque
cria_ataque = function() {
    //Só ataco se nao estou atacando ainda
    if (!atacando) {
        //Checar se a pessoa apertou o botao de ataque
        if (attack) {
            atacando = true;
            image_index = 0;    	
        }    	
    }else { //Já estou atacando
    	//Defina qual sprite tenho que usar
        switch (estado_atual) {
        	//Estado Idle
            case estado_idle: sprite_index = spr_player_attack; break;
            
            //Estado Kneel
            case estado_kneel: sprite_index = spr_player_kneel_attack; break;
            
            //Estado Walk
            case estado_walk: sprite_index = spr_player_attack; break;
        }
        
        //Checando se animacao acabou
        if (finalizou_animacao()) {
        	//Paro de atacar
            atacando = false;
            
            //Definindo a sprite dele
            switch (estado_atual) {
            	case estado_idle: sprite_index = spr_player_idle; break;
                case estado_kneel: sprite_index = spr_player_kneel; break;
                case estado_walk: sprite_index = spr_player_walk; break; 
            }
        }
    }   
} 

#endregion


#region Estados

#region Estado Idle
//Criando o inicia do estado idle
estado_idle.inicia = function() {
    //Se eu nao estou atacando, eu mudo de sprite
    if(!atacando) sprite_index = spr_player_idle;
}

estado_idle.roda = function() {
    //TODO lógica do estado idle 
    
    //Indo para o estado de ataque
    cria_ataque(); 
    
    //Indo para o estado de kneel
    if (down) {
    	troca_estado(estado_kneel);
    }  
    
    if (right xor left) {
    	troca_estado(estado_walk);
    }
    
    
    
} 

//Finalizando o estado idle
estado_idle.finaliza = function() {
    
    
} 

#endregion

#region Estado Kneel
estado_kneel.inicia = function() {
    //Definindo a sprite correta
    if(!atacando) sprite_index = spr_player_kneel;
}  

estado_kneel.roda = function() {
    //TODO lógica do estado kneel
    
    cria_ataque();
    
    //Voltando para o estado idle
    if (!down) {
    	troca_estado(estado_idle);
    }
    
} 

estado_kneel.finaliza = function() {
        
} 

#endregion

#region Estado Walk
estado_walk.inicia = function() {
    if(!atacando) sprite_index = spr_player_walk;
    image_index = 0;
}

estado_walk.roda = function() {
    //TODO lógica do estado walk
    movimento_horizontal();
    
    //Fazendo ele para de andar
    if (velh == 0) {
    	troca_estado(estado_idle);
    }
}  

estado_walk.finaliza = function() {
        
} 

#endregion




#endregion




//Dedfinindo o estado inicial dele
inicia_estado(estado_idle);