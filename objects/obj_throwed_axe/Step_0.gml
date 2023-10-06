/// @description Insert description here
// You can write your code in this editor

if place_meeting(x + hsp, y, obj_terra2){
		
	while !place_meeting(x + sign(hsp),y,obj_terra2){
		x+=sign(hsp)
	}
	
	_block_instance_id = instance_place(x + sign(hsp),y,obj_terra2)
	
	if(block_faces(vsp, _block_instance_id, id) != 1){
		with instance_create_layer(x + 14 * global.machadodirection,y,"machado", obj_axe){
			alarm[0] = 700
		}
	}	else instance_create_layer(x + 14 * global.machadodirection,y,"machado", obj_axe)
	
	vsp = 0
	hsp = 0
	
	instance_destroy()
}

x+=hsp

if place_meeting(x, y + vsp, obj_terra2){
	while !place_meeting(x,y + sign(vsp),obj_terra2){
		y+=sign(vsp)
	}
	
	_block_instance_id = instance_place(x,y+sign(vsp),obj_terra2)
	
	block_faces(vsp, _block_instance_id, id)
	
	if sign(vsp) == 1{
		with instance_create_layer(x + 15 * global.machadodirection, y - 30, "machado", obj_axe){
		if(sprite_index == spr_axe_direita)	image_angle = 270
		else	image_angle = 90

		if(sprite_index == spr_axe)	y-=9
		else y-=8
	}
	}	else{
		instance_create_layer(x + 15 * global.machadodirection, y, "machado", obj_axe)
	}
	
	vsp = 0
	hsp = 0
	
	instance_destroy()
}

y+=vsp