/// @description Insert description here
// You can write your code in this editor

draw_self()

if(room == Room3){

_tick++
if(_tick % _delay_time == 0){

	
_text_f += string_char_at(_text, _index_t)
	
	
_index_t+=1

draw_set_font(fnt_texto)
draw_set_color(c_black)
draw_text(300, 120, _text_f)
}	

else{
	draw_set_font(fnt_texto)
	draw_set_color(c_black)
	draw_text(300, 120, _text_f)
}

if(string_length(_text) == string_length(_text_f)){
	global._can_click_axe = true
}
}	else{
	
	if(!global._final_scene){
	
	_tick++
	if(_tick % _delay_time == 0){
		_text_f += string_char_at(_text, _index_t)
		_index_t+=1

		draw_set_font(fnt_texto)
		draw_set_color(c_black)
		draw_text(200, 640, _text_f)
	}	else{
		draw_set_font(fnt_texto)
		draw_set_color(c_black)
		draw_text(200, 640, _text_f)
	}
	}	else{
		_tick++
		
		if(_text == _text_f){
			alarm[0] = 100
			_text = _text2
			_index_t = 1
			_text_f = ""
		}
		
		if(_tick % _delay_time == 0){
			_text_f += string_char_at(_text, _index_t)
			_index_t+=1

			draw_set_font(fnt_texto)
			draw_set_color(c_black)
			draw_text(200, 640, _text_f)
		}	else{
			draw_set_font(fnt_texto)
			draw_set_color(c_black)
			draw_text(200, 640, _text_f)
		}
	}
}