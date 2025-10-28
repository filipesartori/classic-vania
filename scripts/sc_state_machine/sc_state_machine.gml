//Iniciando a maquina de estado
function estado() constructor {
    //Método que vai rodar ao iniciar um estado
    static inicia = function() {}; 
    
    //Método onde a lógica do estado vai rodar
    static roda   = function() {};
    
    //Método que finaliza o estado
    static finaliza   = function() {}; 
}

//preciso de funcoes que me ajudem a trabalhar com a maquina de estados


//funcao para inciar o estado inicial
function inicia_estado(_estado){
    //criar uma variavel pra saber qual estado atual
    estado_atual = _estado;
    estado_atual.inicia();
}

//funcao para torcar de estado
function troca_estado(_estado){
    //Finalizando o estado atual
    estado_atual.finaliza();
    
    //Mudando o estado atual
    estado_atual = _estado
    
    //Inicializando o estado novo
    estado_atual.inicia();
}

//Preciso rodar a lógica do estado
function roda_estado() {
    estado_atual.roda();
}