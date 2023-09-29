/// @description Insert description here
// You can write your code in this editor

if !global._pause{
	global._pause = true
	instance_create_layer((x div 1280) * 1280 + 500, 700, "menu_pause", obj_button1)
	instance_create_layer((x div 1280) * 1280 + 500, 800, "menu_pause", obj_button2)
	instance_create_layer((x div 1280) * 1280 + 500, 900, "menu_pause", obj_button3)
}	else{
	global._pause = false
	instance_destroy(obj_button1)
	instance_destroy(obj_button2)
	instance_destroy(obj_button3)
}