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
accspd = 0.15

//aceleração máxima
maxacc = 4

//id da arvore que irá quebrar OBS: pode ser nulo
_arvoreid = noone

//counter para contar os "ticks" até arremessar o machado
_counter = 0

//bater
_bater = 0

_f_pressed = false

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

move_camera = function(){
	static width = camera_get_view_width(view_camera[0])
	static height = camera_get_view_height(view_camera[0])
	
	var _playerx, _playery 
		
	_playerx = (x div width) * width
	_playery = (y div height) * height - 200
	
	_vx = camera_get_view_x(view_camera[0])
	_vy = camera_get_view_y(view_camera[0])
	
	
	//desativado por enquanto, arrumar uma solução para não desativar o bloco
	//que o machado irá atingir
	//instance_activate_region(_vx - 96, _vy, width + 150, height, true)
	//instance_deactivate_region(_vx - 96, _vy, width + 150, height, false, false)
	//instance_activate_layer("machado")
		
	var _camx = lerp(camera_get_view_x(view_camera[0]), _playerx, 0.06)
	var _camy = lerp(camera_get_view_y(view_camera[0]), _playery, 0.06)

	camera_set_view_pos(view_camera[0], _camx, _camy);
}

_check_tree = function boolean(){
	
	if(instance_nearest(x,y,obj_arvore) == noone) return false
	
	if(point_distance(x,y,instance_nearest(x,y,obj_arvore).x, instance_nearest(x,y,obj_arvore).y) > 40) return false
	
	_arvoreid = instance_nearest(x,y,obj_arvore)
	
	with _arvoreid	if(sprite_index == spr_arvore_caindo || sprite_index == spr_arvore_toco) return false
		
	_xx = instance_nearest(x,y,obj_arvore).x
	_yy = instance_nearest(x,y,obj_arvore).y
		
	instance_destroy(_arvoreid)
		
	_arvoreid = instance_create_layer(_xx, _yy, "tree_fall", obj_arvore)
	return true
}

_get_tree = function int(){
	 if(_arvoreid != noone){
		instance_create_layer(_arvoreid.x, _arvoreid.y, "tree_fall", obj_arvore_caindo)
		layer_sprite_create("arvores_front", _arvoreid.x, _arvoreid.y, spr_arvore_toco)
		instance_destroy(_arvoreid)
		return 1
	}
}

