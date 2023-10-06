/// @description Insert description here
// You can write your code in this editor

if !global._pause{
	global._pause = true
	instance_create_layer((x div 1280) * 1280 + 500, 740, "menu_pause", obj_button1)
	instance_create_layer((x div 1280) * 1280 + 500, 840, "menu_pause", obj_button2)
	instance_create_layer((x div 1280) * 1280 + 500, 940, "menu_pause", obj_button3)
	instance_create_layer((x div 1280) * 1280 + 650, 1080, "menu_pause", obj_title)
}	else{
	global._pause = false
	layer_destroy_instances("menu_pause")
}