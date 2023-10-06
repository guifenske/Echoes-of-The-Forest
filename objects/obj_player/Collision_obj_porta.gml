/// @description Insert description here
// You can write your code in this editor
if(_can_enter_again){
	_bater = 1

	instance_destroy(obj_porta)
	
	global._entering_house = true

with obj_house{
	with instance_create_layer(x, y, "arvores_front", obj_house){
		image_xscale = 1.4
		image_yscale = 1.4
		image_speed = -1
		sprite_index = spr_casa_porta_abrir
		alarm[0] = 5
	}
	
	instance_destroy(id)
}
}