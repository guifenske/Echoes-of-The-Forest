/// @description Insert description here
// You can write your code in this editor
if !global._pause{
global._pause = true
instance_deactivate_all(false)
instance_create_layer((x div 1280) * 1280 + 600, 700, "menu_pause", obj_button1)
}