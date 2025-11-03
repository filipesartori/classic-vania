draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);

//Debug para indetificar a direcao das escadas
for (var i = 45; i < 360; i += 90) {
	var _x = x + lengthdir_x(50, i);
	var _y = y + lengthdir_y(50, i);
    
    draw_circle(_x, _y, 2, false);
}