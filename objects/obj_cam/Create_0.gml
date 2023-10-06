/// @description Insert description here
// You can write your code in this editor
res_width = 1280
res_heigth = 720

res_scale = 3

global.view_res_width = res_width / res_scale
global.view_res_heigth = res_heigth / res_scale

window_set_size(global.view_res_width * res_scale, global.view_res_heigth * res_scale)
surface_resize(application_surface, global.view_res_width * res_scale, global.view_res_heigth * res_scale)

display_set_gui_size(global.view_res_width, global.view_res_heigth)