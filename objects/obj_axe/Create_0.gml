/// @description Insert description here
// You can write your code in this editor
vsp = 0

_rotation = 0

_gravity = 6

_cair = false

if (global.machadodirection == 1) sprite_index = spr_axe_direita

if(place_meeting(x, y, obj_terra)){
	global.throwed_axe = false
	instance_destroy()
}
