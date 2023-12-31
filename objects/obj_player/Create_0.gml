// Ao criar o personagem

//velocidade base
spd = 4.5

//velocidade horizontal
hsp = 0

//velocidade vertical
vsp = 0

//gravidade base
grav = 0.8

//"velocidade" do pulo base
jspd = -10

//qtd de pulos
pulos = 2

//aceleração
acc = 0

//incremento para a aceleração
accspd = 0.10

//aceleração máxima
maxacc = 4

//id da arvore que irá quebrar OBS: pode ser nulo
global._arvoreid = noone

//counter para contar os "ticks" até arremessar o machado
_counter = 0

//bater
_bater = 0

_f_pressed = false

_enter_animation = false

_can_enter_again = false

//balançar tela(n funcionando, muito legal)
global.shake = false

//ja tacou o machado
global.throwed_axe = false

//direção machado
global.machadodirection = 0;

//cancelar a quebra da árvore
global.cancelbreak = true

//mouse_x(machado)
global.machado_target_x = 0

//mouse_y(machado)
global.machado_target_y = 0

//player_x
global.player_x = 0

//player_y
global.player_y = 0

//machado cair
global._cair = false

//se o jogo está pausado ou não
global._pause = false

global._entering_house = false

global._final_scene = false
global._final_msg = false

if(room_previous(room) == Room3){
	_bater = 1
	with obj_house sprite_index = spr_casa_porta_abrir
	
	//TO-DO: checar se o player ta com o machado
	
	_enter_animation = true
	
	sprite_index = spr_player_direita_machado
}


_move_to_right_animation = function(){
	if(x <= 600) x+= 4.5
	else{
		_bater = 0
		_enter_animation = false
		_can_enter_again = true
	}
}


move_camera = function(){
	static width = camera_get_view_width(view_camera[0])
	static height = camera_get_view_height(view_camera[0])
	
	var _playerx, _playery
		
	_playerx = (x div width) * width
	_playery = (y div height) * height - 200

	
	_vx = camera_get_view_x(view_camera[0])
	_vy = camera_get_view_y(view_camera[0])
	
	
	//TO-DO: arrumar uma solução para não desativar o bloco que o machado irá atingir
	//instance_activate_region(_vx - 64, _vy, width + 128, height, true)
//	instance_deactivate_region(_vx - 64, _vy, width + 128, height, false, false)

	var _camx = lerp(camera_get_view_x(view_camera[0]), _playerx, 0.06)
	var _camy = lerp(camera_get_view_y(view_camera[0]), _playery, 0.06)

	camera_set_view_pos(view_camera[0], _camx, _camy);
}

_check_tree = function boolean(){
	if(instance_nearest(x,y,obj_arvore) == noone)	return false
	
	if(point_distance(x,y,instance_nearest(x,y,obj_arvore).x, instance_nearest(x,y,obj_arvore).y) > 50) return false
	if(point_distance(x,y,instance_nearest(x,y,obj_arvore).x, instance_nearest(x,y,obj_arvore).y) < 30) return false
	
	global._arvoreid = instance_nearest(x,y,obj_arvore)
	
	with global._arvoreid	if(sprite_index == spr_arvore_caindo || sprite_index == spr_arvore_toco) return false
		
	_xx = instance_nearest(x,y,obj_arvore).x
	_yy = instance_nearest(x,y,obj_arvore).y
		
	instance_destroy(global._arvoreid)
		
	global._arvoreid = instance_create_layer(_xx, _yy, "tree_fall", obj_arvore)
	return true
}

_get_tree = function int(){
	 if(global._arvoreid != noone){
		instance_create_layer(global._arvoreid.x, global._arvoreid.y, "tree_fall", obj_arvore_caindo)
		layer_sprite_create("arvores_front", global._arvoreid.x, global._arvoreid.y, spr_arvore_toco)
		instance_destroy(global._arvoreid)
		return 1
	}
}


_tree_tip = function boolean(){
	if(global.cancelbreak){
	if(instance_nearest(x,y,obj_arvore) == noone) return false
	
	global._arvoreid = instance_nearest(x, y, obj_arvore)
	
	if(global._arvoreid.sprite_index != spr_arvore && global._arvoreid.sprite_index != spr_arvore_glint) return false
	
	if(point_distance(x,y,instance_nearest(x,y,obj_arvore).x, instance_nearest(x,y,obj_arvore).y) > 50){
		if(global._arvoreid.sprite_index == spr_arvore_glint) global._arvoreid.sprite_index = spr_arvore
		global._arvoreid = noone
		return false
	}
	
	if(point_distance(x,y,instance_nearest(x,y,obj_arvore).x, instance_nearest(x,y,obj_arvore).y) < 30){
		if(global._arvoreid.sprite_index == spr_arvore_glint) global._arvoreid.sprite_index = spr_arvore
		global._arvoreid = noone
		return false
	}
	
	global._arvoreid.sprite_index = spr_arvore_glint
	
	if(!instance_exists(obj_balao_text)){
		instance_create_layer(120, 600, "arvores_front", obj_balao_text)
	}
		return true
	}
}
