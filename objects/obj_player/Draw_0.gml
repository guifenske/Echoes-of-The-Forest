/// @description Insert description here
// You can write your code in this editor

draw_self()
if(_f_pressed){
draw_set_color(c_orange)
draw_text(x, y - 200, string(median(fps_real)))
}