
enum SUBWEAPON
{
    AXE,
    BOOMERANG,
    HOLYWATER,
    KNIFE
}

global.subweapon = SUBWEAPON.HOLYWATER;

//Funcao para aplicar o dano
function aplica_dano(_dano = 1) {
    var _outro = instance_place(x, y, obj_entidade);
    
    if (_outro) {
    	_outro.recebe_dano();
    }
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