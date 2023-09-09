// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function block_faces(argument0, argument1, argument2){
	_vsp = argument0
	_id_bloco = argument1
	
	if _id_bloco == noone exit
	if argument2 == noone exit
	
	if sign(_vsp) == -1{
		with _id_bloco{
			
		if(collision_point(x, y + 33, obj_terra, false, false) || collision_point(x, y + 33, obj_grama, false, false)){
			return 0	
		}
			
		for(i = -2; i < 34; i++){
			if(collision_point(x + i,y + 33, obj_throwed_axe, false, false)){
				global._cair = true
				return 1
			}
		}
			
		}
	}
		
	return 0
}
