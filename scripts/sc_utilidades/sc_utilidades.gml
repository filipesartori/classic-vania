
enum SUBWEAPON
{
    AXE,
    BOOMERANG,
    HOLYWATER,
    KNIFE
}

global.subweapon = SUBWEAPON.HOLYWATER;

//Funcao para aplicar o dano
function aplica_dano(_dano = 1, _player = true) {
    //Pegando todo mundo em uma lista
    var _lista = ds_list_create();
    var _col = instance_place_list(x, y, obj_entidade, _lista, 1);
    
    //checando se minha lista nao esta vazia
    if (ds_list_size(_lista) > 0) {
    	//Iterando pela minah lista
        var _qtd = ds_list_size(_lista);
        for (var i = 0; i < _qtd; i++) {
        	var _outro = _lista[|i];
            
            //checando se foi o player q criou o dano
            if (_player) { //Dou dano em todo mundo menos no player
            	if (_outro.object_index == obj_player) {
                	continue;
                }
            }else { //Só dou dano no player
            	if (_outro.object_index != obj_player) {
                	continue;
                }
            }
            
            //Dando dano apenas que nao esta na lista livre, ou seja quem ainda n recebu dano
            var _contem = array_contains(lista_livre, _outro)
            if (!_contem) {
            	//Se a lista NAO contem o outro, eu aplico o dano nele e adiciono ele a lista
                _outro.recebe_dano(_dano);
                array_push(lista_livre, _outro);
            }
        }
    }
    
    //Destruindo a lista
    ds_list_destroy(_lista);
}


function finalizou_animacao() {
    //Checando se img_ind é maior do que minha imagem index
    if (img_ind > image_index) {
    	//ele terminou a animacao
        img_ind = 0;
        return true;
    }else {
    	img_ind = image_index
        return false;
    }
}