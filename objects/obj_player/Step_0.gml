if global.cancelbreak == true && _counter == 0 && _bater == 0{
	
global.move = -keyboard_check(ord("A")) + keyboard_check(ord("D"))

if(global.move == 0) global.move = -keyboard_check(vk_left) + keyboard_check(vk_right)

	
//Se tiver correndo, aumentar a velocidade, e tremer a tela
if(keyboard_check(vk_shift)){
	spd = 6
	global.shake = true
}	else{
	spd = 4.5
	global.shake = false
}

//Impondo o limite a acelaração
if(acc < maxacc)	acc += accspd

//Código de movimento geral
hsp = global.move * spd + acc * global.move

#region fisicas Gerais e movimento
if place_meeting(x, y + vsp, obj_grama){
	
	while !place_meeting(x, y + sign(vsp), obj_grama){
		y+= sign(vsp)
	}
	
	vsp = 0
	
}

if place_meeting(x, y + vsp, obj_terra){
	
	while !place_meeting(x, y + sign(vsp), obj_terra){
		y+= sign(vsp)
	}
	
	vsp = 0
	
}

y+=vsp

if place_meeting(x + hsp, y, obj_terra){
	
	while !place_meeting(x + sign(hsp), y, obj_terra){
		x+= sign(hsp)
	}
	
	hsp = 0

	
}

if place_meeting(x + hsp, y, obj_grama){
	
	while !place_meeting(x + sign(hsp), y, obj_grama){
		x+= sign(hsp)
	}
	
	hsp = 0

	
}

x+=hsp
#endregion

#region Definir sprite caso esteja tocando o chão.

if(pulos == 2){
if(global.move == 0){
	acc = 0
	if(global.throwed_axe == false)	sprite_index = spr_player_idle_machado
	else	sprite_index = spr_player_idle
	

}

else if(global.move > 0){ 
	
	if(global.throwed_axe == false)	sprite_index = spr_player_direita_machado
	else sprite_index = spr_player_direita
	}

else{
	if(global.throwed_axe == false)	sprite_index = spr_player_esquerda_machado
	else sprite_index = spr_player_esquerda
}
	
}
#endregion

if place_meeting(x, y + 1, obj_grama) || place_meeting(x, y + 1, obj_terra){
	pulos = 2
	
	grav = 0.8

}	else{
	vsp += grav
	
	if(global.throwed_axe == false){
		if global.move > 0 && pulos == 1 sprite_index = spr_player_pulo_direita_machado
		else if global.move == 0 && pulos == 1 sprite_index = spr_player_pulo_machado
		else if global.move < 0 && pulos == 1 sprite_index = spr_player_pulo_esquerda_machado

	}	else{
		if global.move > 0 && pulos == 1 sprite_index = spr_player_pulo_direita
		else if global.move == 0 && pulos == 1 sprite_index = spr_player_pulo
		else if global.move < 0 && pulos == 1 sprite_index = spr_player_pulo_esquerda

	}

}

//caso o player n tenha esgotado seus pulos e pressionou espaço
if keyboard_check_pressed(vk_space) && pulos > 0{
	
	//caso só sobre 1 pulo, e o player pule
	if (pulos == 1){	
		if(global.throwed_axe == false) sprite_index = spr_player_double_machado
		else sprite_index = spr_player_double
	}
	
	vsp = jspd
	
	pulos -= 1
		
}

if(pulos == 0 && global.throwed_axe == false)	sprite_index = spr_player_double_machado

if(mouse_check_button(mb_right) && global.throwed_axe == false){
	
	_counter++
	
	if(x > mouse_x) image_xscale = -1.5
		
	sprite_index = spr_player_thrown_axe_start
}

if(mouse_check_button_pressed(mb_left) && global.throwed_axe == false){
	if(global.cancelbreak == true && pulos == 2){
		if(_check_tree()){
			sprite_index = spr_player_cortar
			if(x > _arvoreid.x) image_xscale = -1.5
			
			alarm[0] = 350
			global.cancelbreak = false
		}	else{
			_bater = 1
			sprite_index = spr_player_bater_machado
			if(x > mouse_x) image_xscale = -1.5
		}
	}
}

}	else{
	
	vsp += grav
		
		
	if place_meeting(x, y + vsp, obj_grama){
	
		while !place_meeting(x, y + sign(vsp), obj_grama){
			y+= sign(vsp)
		}
	
		vsp = 0
	
	}

	if place_meeting(x, y + vsp, obj_terra){
	
		while !place_meeting(x, y + sign(vsp), obj_terra){
			y+= sign(vsp)
		}
	
		vsp = 0
	
	}

	y+=vsp
	
	if _counter == 0{
		if(_bater == 1){
			//mecanica de dano/glint sla
		}	else{
		if(mouse_check_button_pressed(mb_left)){
			instance_create_layer(_arvoreid.x, _arvoreid.y, "arvores_front", obj_arvore)
			instance_destroy(_arvoreid)
			image_xscale = 1.5
			global.cancelbreak = true
		}
		}
	}	else{		
		if(x > mouse_x) image_xscale = -1.5
		else image_xscale = 1.5
		
		
		
		if(mouse_check_button_released(mb_right) && global.throwed_axe == false){
			sprite_index = spr_player_thrown_axe
			global.machado_target_x = mouse_x
			global.machado_target_y = mouse_y
	
			global.player_x = x
			global.player_y = y - 15
			global.throwed_axe = true
			
			global.machadodirection = sign(image_xscale)
			
			if(!place_meeting(x + 94 * global.machadodirection,y,obj_terra) && !place_meeting(x + 94 * global.machadodirection,y,obj_grama)){
				instance_create_layer(x + 94 * global.machadodirection,y,"machado", obj_throwed_axe)
			}	else global.throwed_axe = false
		}
	}
}

move_camera()
