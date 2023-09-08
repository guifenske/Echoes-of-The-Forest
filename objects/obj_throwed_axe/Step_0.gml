/// @description Insert description here
// You can write your code in this editor

if place_meeting(x + hsp, y, obj_terra){
		
	while !place_meeting(x + sign(hsp),y,obj_terra){
		x+=sign(hsp)
	}
	
	_block_instance_id = instance_place(x + sign(hsp),y,obj_terra)
	
	vsp = 0
	hsp = 0
	
	with instance_create_layer(x + 15 * global.machadodirection,y,"machado", obj_axe){
		alarm[0] = 700
	}
	
	instance_destroy()
}

if(place_meeting(x + hsp, y, obj_grama)){
	while !place_meeting(x + sign(hsp),y,obj_grama){
		x+=sign(hsp)
	}
	
	_block_instance_id = instance_place(x + sign(hsp),y,obj_grama)
	
	vsp = 0
	hsp = 0
	
	with instance_create_layer(x + 15 * global.machadodirection,y,"machado", obj_axe){
		alarm[0] = 700
	}
	instance_destroy()
}

x+=hsp

if place_meeting(x, y + vsp, obj_terra){
	while !place_meeting(x,y + sign(vsp),obj_terra){
		y+=sign(vsp)
	}
	
	_block_instance_id = instance_place(x,y+sign(vsp),obj_terra)
	
	block_faces(vsp, _block_instance_id)
	
	if sign(vsp) == 1{
		with instance_create_layer(x + 15 * global.machadodirection, y - 30, "machado", obj_axe){
		if(sprite_index == spr_axe_direita)	image_angle = 270
		else	image_angle = 90

		if(sprite_index == spr_axe)	y-=7
		else y-=8
	}
	}	else{
		instance_create_layer(x + 15 * global.machadodirection, y, "machado", obj_axe)
	}
	
	vsp = 0
	hsp = 0
	
	instance_destroy()
}

if(place_meeting(x, y + vsp, obj_grama)){
	while !place_meeting(x,y + sign(vsp),obj_grama){
		y+=sign(vsp)
	}
	
	vsp = 0
	hsp = 0
	
	with instance_create_layer(x + 15 * global.machadodirection, y - 30, "machado", obj_axe){
		if(sprite_index == spr_axe_direita)	image_angle = 270
		else	image_angle = 90

		if(sprite_index == spr_axe)	y-=7
		else y-=8
	}
	
	instance_destroy()
}

y+=vsp