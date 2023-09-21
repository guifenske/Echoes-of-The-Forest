/// @description Insert description here
// You can write your code in this editor
if(room != Room3){
if (global._cair){
	if(!global._pause){
	vsp = _gravity
	_rotation += 3 * global.machadodirection
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, _rotation, c_white, 1)
	if place_meeting(x, y + vsp, obj_grama){
	
	while !place_meeting(x, y + sign(vsp), obj_grama)	y+= sign(vsp)
	
	if(sprite_index == spr_axe_direita)	image_angle = 90
	else	image_angle = 270
	
	x+= 3 * global.machadodirection
	
	if(sprite_index == spr_axe)	y-=7
	else y-=8
	
	global._cair = false
	
	vsp = 0
	
}

if place_meeting(x, y + vsp, obj_terra){
	
	while !place_meeting(x, y + sign(vsp), obj_terra)	y+= sign(vsp)
	
	if(sprite_index == spr_axe_direita)	image_angle = 90
	else	image_angle = 270
	
	x+= 3 * global.machadodirection
	
	if(sprite_index == spr_axe)	y-=7
	else y-=8
	
	vsp = 0
	
	global._cair = false
	
}

y+= vsp
}
}else{
	draw_self()
}
}else{
	draw_self()
}
