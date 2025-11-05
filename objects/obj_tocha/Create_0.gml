// Inherit the parent event
event_inherited();

//Atualizar meu recebe dano
recebe_dano = function(_dano = 1) {
    instance_destroy();
} 

cria_drop = function() {
    var _item = instance_create_depth(x, y, depth, obj_drop, {item : item});
} 

dropa_item = function() {
    switch (item) {
    	case "livre":
            var _chance = random(100);
            if (_chance > 98) {
                item = "meat";	
            }else if (_chance > 80) {
            	item = "heart";
            }else {
            	exit;
            }    
    }
    
    cria_drop();
} 
