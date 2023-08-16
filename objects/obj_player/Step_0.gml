
//Definir se jogador está andando para esquerda, direita ou está parado
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

#region Definir sprite caso esteja tocando o chão.

if(pulos == 2){
if(global.move == 0){
	sprite_index = spr_player
		acc = 0

}

else if(global.move > 0) sprite_index = spr_player_direita

else sprite_index = spr_player_esquerda
	
}
#endregion

//Impondo o limite a acelaração
if(acc < maxacc){
	acc += accspd
}

//Código de movimento geral
hsp = global.move * spd + acc * global.move

#region fisicas Gerais e movimento

if place_meeting(x, y + vsp, obj_bloco){
	
	while !place_meeting(x, y + sign(vsp), obj_bloco){
		y+= sign(vsp)
	}
	
	vsp = 0
	
}

y+=vsp

if place_meeting(x + hsp, y, obj_bloco){
	
	while !place_meeting(x + sign(hsp), y, obj_bloco){
		x+= sign(hsp)
	}
	
	hsp = 0

	
}


x+=hsp
#endregion

if place_meeting(x, y + 1, obj_bloco){
	pulos = 2
	
	grav = 0.8
	
	canshow = 1

}	else{
	vsp += grav
	if global.move > 0 && pulos == 1 sprite_index = spr_player_pulo_direita
	else if global.move == 0 && pulos == 1 sprite_index = spr_player_pulo
	else if global.move < 0 && pulos == 1 sprite_index = spr_player_pulo_esquerda

}

//caso o player n tenha esgotado seus pulos e pressionou espaço
if keyboard_check_pressed(vk_space) && pulos > 0{
	
	//caso só sobre 1 pulo, e o player pule
	if pulos == 1	sprite_index = spr_player_double
	
		//jump buffer, dar uma vantagem de pulo//else if((pulos == 2 && place_meeting(x, y + 1, obj_bloco)) || (pulos == 2 && place_meeting(x - 40, y + 1, obj_bloco)) || (pulos == 2 && place_meeting(x + 40, y + 1, obj_bloco))) vsp = jspd
	
	vsp = jspd
	
	pulos -= 1
		
		//debug
		if(pulos == 0) canshow = 0
		
		
	}
	
	#region atirar machado
	if (mouse_check_button_pressed(mb_left) && global.throwed_axe == false){
		 
		 if(!place_meeting(x, y - 100, obj_bloco)){ 
			  global.machadodirection = global.move
			  if (global.machadodirection == 0) global.machadodirection = 1;
			 instance_create_layer(x, y - 100, "machado", obj_axe);
			 global.throwed_axe = true
			 
		
		 }
	}
	#endregion