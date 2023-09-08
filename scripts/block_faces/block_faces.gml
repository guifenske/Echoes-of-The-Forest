// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function block_faces(argument0, argument1){
	_vsp = argument0
	_id_bloco = argument1
	
	if _id_bloco == noone exit
	
	if sign(_vsp) == -1{
		with _id_bloco{
			for(i = -2; i < 34; i++){
				if(collision_point(x + i,y + 33, obj_throwed_axe, false, false)){
					global._cair = true
					return 1
				}
			}
			exit
		}
	}
		
	return 0
}