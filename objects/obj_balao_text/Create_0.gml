/// @description Insert description here
// You can write your code in this editor
_index_t = 1

//menor o valor, mais rápido a escrita do texto
_delay_time = 4

if(room = Room3){
_tick = 0

_text_f = ""
	
global._can_click_axe = false
		
_text =  "Você acorda como um lenhador, como na rotina, pegue seu machado e vá trabalhar!"
}	else{
	image_xscale = 1.5
	if(!global._final_scene)	_text = "Você pode cortar árvores(você é um lenhador), clique com o botão esquerdo do mouse para quebrar a árvore!"
	else _text = "Sinto dificuldades para respirar..."
	
	_text2 = "O que foi que eu fiz?"
	_final_msg = false
	_text_f = ""
	_tick = 0
	_delay_time = 3
}