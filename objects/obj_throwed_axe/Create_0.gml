/// @description Insert description here
// You can write your code in this editor

_direction = point_direction(global.player_x, global.player_y, global.machado_target_x, global.machado_target_y)
_block_instance_id = noone


hsp = lengthdir_x(30,_direction)
vsp = lengthdir_y(30,_direction)

global._cair = false