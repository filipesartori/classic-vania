#region Criacao dos estados

//criando o primeiro estado do player
estado_idle  = new estado();
estado_kneel = new estado();
estado_walk  = new estado();
estado_jump  = new estado(); 
estado_stair = new estado();

#endregion

#region Variaveis

//varaivel de controle da escala
xscale = image_xscale;

//Index da imagem
img_ind = 0

//Array de colisores
lay_col = layer_tilemap_get_id("tl_level");
lay_stair = layer_tilemap_get_id("tl_escada");


colisor = [obj_colisor, lay_col];

//Inputs
up        = noone;
down      = noone;
left      = noone;
right     = noone;
jump      = noone;
attack    = noone;
subweapon = noone;

//Movimentacao
velh        = 0;
velv        = 0;
max_velh    = 1;
max_velv    = 5;
grav        = .2;
chao        = false;
escada_ang  = 0;

//varaivel de Controle do ataque
atacando    = false;
meu_chicote = noone;
chicote_x   = 0;
chicote_y   = 0;


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

//Movimento vertical
movimento_vertical = function() {
    if (!chao) {
        if (velv < max_velv) {
        	velv += grav;
        }else {
        	velv = max_velv;
        }
    	
    }else {
    	velv = 0;
    }    
} 

//Ajustando a direcao que o player olha
ajusta_xscale = function() {
    if (velh != 0) {
        xscale = sign(velh);    	
    }    
} 

//Checando as escadas
entrando_escadas = function() {
    //Colisao com a escadda
    var _escada = collision_rectangle(x - (xscale * 4), y - 4, x + (xscale * 10), y + 4, lay_stair, 0, 1);
    
    if (_escada) {
    	show_debug_message("posso entrar")
    }else {
        show_debug_message("Nao posso entrar")
    	return false;
    }
    
    //Checando a direcao que a escada esta
    var _ang = 0;
    for (var i = 45; i < 360; i += 90) {
        var _x  = x + lengthdir_x(60, i);
        var _y  = y + lengthdir_y(60, i);
        
    	var _col = collision_circle(_x, _y, 2, lay_stair, 0, 1);
        
        if (_col) {
        	show_debug_message(i);
            _ang = i;
        }
    }
    
    if (_ang == 0) {
    	return false;
    }
    
    escada_ang = _ang;
    
    //Vou checar se ele quer subri ou descer
    if (up && _ang < 140) {
        //Estou subindo
    	return true;
    }
    if (down && _ang > 140) {
        //Estou descendo
        //vou aumentar o angulo das escadas em 180
        escada_ang += 180;
    	return true;
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

atualiza_pos_chicote = function() {
    //Se eu estou atacando e tenho um chicote, eu atualizo a posicao dele
    if (instance_exists(meu_chicote)) {
        //Atualizando minha posicao
        chicote_x = x - (9 * xscale);
        chicote_y = y - sprite_yoffset + sprite_get_bbox_top(sprite_index) + 8;
        meu_chicote.x = chicote_x;
        meu_chicote.y = chicote_y;
    }
}

//Metodo de ataque
cria_ataque = function() {
    //Só ataco se nao estou atacando ainda
    if (!atacando) {
        //Checar se a pessoa apertou o botao de ataque
        if (attack) {
            atacando = true;
            image_index = 0;
            
            //Crio o meu chicote
            chicote_x = x - (9 * xscale);
            chicote_y = y - sprite_yoffset + sprite_get_bbox_top(sprite_index) + 8;
            meu_chicote = instance_create_depth(chicote_x, chicote_y, depth + 1, obj_chicote);
            meu_chicote.image_xscale = xscale;    	
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
            
            //Estado Jump
            case estado_jump: sprite_index = velv < 0 ? spr_player_stairs_attack_up : spr_player_stairs_attack_down; break;
        }
        
        //Checando se animacao acabou
        if (finalizou_animacao()) {
        	//Paro de atacar
            atacando = false;
            
            //Definindo a sprite dele
            switch (estado_atual) {
            	case estado_idle: sprite_index  = spr_player_idle; break;
                case estado_kneel: sprite_index = spr_player_kneel; break;
                case estado_walk: sprite_index  = spr_player_walk; break; 
                case estado_jump: sprite_index  = spr_player_jump; break;
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
    
    //Indo para o estado de walk
    if (right xor left and !atacando) {
    	troca_estado(estado_walk);
    }
    
    if (!atacando) {
    	if(entrando_escadas()) {
            troca_estado(estado_stair);
        }
    }
    
    //Indo para o estado de jump
    if (jump) {
    	troca_estado(estado_jump);
        velv = -max_velv;
    }
    
    if (!chao) {
    	troca_estado(estado_jump);
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
    
    //Atacando
    cria_ataque();
    //Se eu estou atacando eu cancelo a velocidade 
    if (atacando) {
    	velh = 0;
    }
    
    //Fazendo ele para de andar
    if (velh == 0) {
    	troca_estado(estado_idle);
    }
    
    //Entrando nas escadas
    if (!atacando) {
    	if(entrando_escadas()) {
            troca_estado(estado_stair);
        }
    }
    
    //Pulando
    if (jump) {
    	troca_estado(estado_jump);
        velv = -max_velv;
    }
    
    if (!chao) {
    	troca_estado(estado_jump);
        velh = 0;
    }
}  

estado_walk.finaliza = function() {
        
} 

#endregion

#region Estado Jump

estado_jump.inicia = function() {
    sprite_index = spr_player_jump;
} 

estado_jump.roda = function() {
    
    //Ajustando meu image_index
    if (!atacando) {
    	image_index = velv < 0 ? 0 : 1;
    }
    
    //Fazendo meu movimento vertical
    movimento_vertical();
    
    //Atacando em quanto pula
    cria_ataque();
    
    //entrando nas escadas
    if(entrando_escadas()) {
        troca_estado(estado_stair);
    }
    
    //Saindo do pulo
    if (chao) {
        troca_estado(estado_idle);	
    }
    
} 

estado_jump.finaliza = function() {
    velh = 0;
    image_speed = 1;
} 

#endregion

#region Estado Stair

estado_stair.inicia = function() {
    //Parei de colidir com tudo
    colisor = [];
    
    //falando que eu fico atras da escada
    depth = 301;
    
    if(!atacando) sprite_index = up ? spr_player_climb_up : spr_player_climb_down;
} 

estado_stair.roda = function() {
    
    var _velh = lengthdir_x(1, escada_ang);
    var _velv = lengthdir_y(1, escada_ang);
    velh = 0;
    velv = 0;
    image_speed = 0;
    
    if (up) {
        image_speed = 1;
        velh = _velh;
        velv = _velv;
        sprite_index = spr_player_climb_up;
    }
    
    if (down) {
        image_speed = 1;
    	velh = -_velh;
        velv = -_velv;
        sprite_index = spr_player_climb_down;
    }
    
    if (keyboard_check_pressed(vk_backspace)) {
    	troca_estado(estado_idle);
    }
}

estado_stair.finaliza = function() {
    //volto a colidir
    colisor = [obj_colisor, lay_col];
    depth = 200;
}

#endregion

#endregion




//Dedfinindo o estado inicial dele
inicia_estado(estado_idle);