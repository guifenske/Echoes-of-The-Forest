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

_arvoreid = 0

//balançar tela(n funcionando, muito legal)
global.shake = false

//ja tacou o machado
global.throwed_axe = false

//direção machado
global.machadodirection = 0;

global.cancelbreak = true

move_camera = function(){
	static width = camera_get_view_width(view_camera[0])
	static height = camera_get_view_height(view_camera[0])
	
	var _playerx, _playery 
		
	_playerx = (x div width) * width
	_playery = (y div height) * height - 175
	
	var _camx = lerp(camera_get_view_x(view_camera[0]), _playerx, 0.06)
	var _camy = lerp(camera_get_view_y(view_camera[0]), _playery, 0.06)

	camera_set_view_pos(view_camera[0], _camx, _camy);
}

_check_tree = function boolean(){
	 if(place_meeting(x + 5, y, obj_arvore)){
		with instance_place(x + 5, y, obj_arvore){
			if(sprite_index == spr_arvore_caindo || sprite_index == spr_arvore_toco) return false
		}
		
		_arvoreid = instance_place(x + 5, y, obj_arvore)
		return true
	}
	else if(place_meeting(x - 5, y, obj_arvore)){
		with instance_place(x - 5, y, obj_arvore){
			if(sprite_index == spr_arvore_caindo || sprite_index == spr_arvore_toco) return false
		}
		
		_arvoreid = instance_place(x - 5, y, obj_arvore)
		return true
	}	else if(place_meeting(x, y, obj_arvore)){
		with instance_place(x, y, obj_arvore){
			if(sprite_index == spr_arvore_caindo || sprite_index == spr_arvore_toco) return false
		}
		_arvoreid = instance_place(x, y, obj_arvore)
		
		return true	
	}else{
		return false
	}
}

_get_tree = function int(){
	 if(place_meeting(x + 5, y, obj_arvore)){
		with instance_place(x + 5, y, obj_arvore){
			sprite_index = spr_arvore_caindo
		}
		
		return 1
	}	else if(place_meeting(x - 5, y, obj_arvore)){
		with instance_place(x - 5, y, obj_arvore){
			sprite_index = spr_arvore_caindo
		}
		return 1
	}	else if(place_meeting(x , y, obj_arvore)){
		with instance_place(x, y, obj_arvore){
			sprite_index = spr_arvore_caindo
		}
		return 1
	}	else{
		return 0
	}
}

