//criando o primeiro estado do player
estado_idle  = new estado();
estado_kneel = new estado();
estado_walk  = new estado();



#region Estados

#region Estado Idle
//Criando o inicia do estado idle
estado_idle.inicia = function() {
    sprite_index = spr_player_idle;
}

estado_idle.roda = function() {
    //TODO lógica do estado idle    
    show_debug_message("Estou idle")
} 

//Finalizando o estado idle
estado_idle.finaliza = function() {
    show_message("Nao estou mais idle");
} 

#endregion

#region Estado Kneel
estado_kneel.inicia = function() {
    show_message("Ajoelhei e vou rezar");    
}  

estado_kneel.roda = function() {
    //TODO lógica do estado idle   
    show_debug_message("estou ajoelhado"); 
} 

estado_kneel.finaliza = function() {
    show_message("Acabei de rezar");    
} 

#endregion




#endregion




//Dedfinindo o estado inicial dele
inicia_estado(estado_idle);