/// @description Insert description here
// You can write your code in this editor


//to-do quando acabar a animação de quebra, adiciona mais 1 ao estágio de quebra da arvore

if(sprite_index == spr_player_thrown_axe_start) sprite_index = spr_player_thrown_axe_idle
if(sprite_index == spr_player_thrown_axe){
	image_xscale = 1.5
	_counter = 0
}
if(sprite_index == spr_player_bater_machado){
	image_xscale = 1.5
	_bater = 0
}