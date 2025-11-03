
enum SUBWEAPON
{
    AXE,
    BOOMERANG,
    HOLYWATER,
    KNIFE
}

global.subweapon = SUBWEAPON.HOLYWATER;

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