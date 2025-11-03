if (finalizou_animacao()) {
	switch (global.subweapon) {
    	case SUBWEAPON.AXE       : axe(); break;
    	case SUBWEAPON.KNIFE     : knife(); break;
    	case SUBWEAPON.BOOMERANG : boomerang(); break;
    }
}