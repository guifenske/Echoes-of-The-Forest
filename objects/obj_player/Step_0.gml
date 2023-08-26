global.move = -keyboard_check(ord("A")) + keyboard_check(ord("D"))

if(global.move == 0) global.move = -keyboard_check(vk_left) + keyboard_check(vk_right)


//Se tiver correndo, aumentar a velocidade, e tremer a tela
if(keyboard_check(vk_shift)){
	spd = 8
	global.shake = true
}	else{
	spd = 6
	global.shake = false
}

//Impondo o limite a acelaração
if(acc < maxacc){
	acc += accspd
}

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
	if(global.throwed_axe == false)	sprite_index = spr_player_machado
	else	sprite_index = spr_player
	

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
	
	canshow = 1

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
		
		//debug
		if(pulos == 0) canshow = 0
		
}

if(mouse_check_button_pressed(mb_right) && global.throwed_axe == false){
	 if(!place_meeting(x, y - 100, obj_terra) || !place_meeting(x, y - 100, obj_grama)){ 
		 global.machadodirection = global.move
		 if (global.machadodirection == 0) global.machadodirection = 1;
		 instance_create_layer(x, y - 100, "machado", obj_axe);
		 global.throwed_axe = true 	
	 }
}

if(mouse_check_button(mb_left) && global.throwed_axe == false){
	
}