/// @description Insert description here
// You can write your code in this editor
//reflexão do player

if(!global._final_scene){
	global._final_scene = true
	
	//mudar camera para dar um zoom no player, e dai sim os balões de fala
	
	instance_create_layer(120, 600, "arvores_front", obj_balao_text)
	
}	else{
	global._final_scene = false
}