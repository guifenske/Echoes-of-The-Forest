#region movimento machado

hsp = spd * _cached_direction
vsp = _gravity

if !_cair{
	if place_meeting(x + hsp, y, obj_terra){
	
	while !place_meeting(x + sign(hsp), y, obj_terra)	x+= sign(hsp)
	
	alarm[0] = 700
	_cair = true
	
	hsp = 0
	vsp = 0

}

if place_meeting(x + hsp, y, obj_grama){
	
	while !place_meeting(x + sign(hsp), y, obj_grama)		x+= sign(hsp)

	alarm[0] = 700
	_cair = true

	hsp = 0
	vsp = 0
	
}


x+=hsp

if place_meeting(x, y + vsp, obj_grama){
	
	while !place_meeting(x, y + sign(vsp), obj_grama)	y+= sign(vsp)
	
	if(image_xscale == -1)	image_angle = 270
	else	image_angle = 90
	
	y-=2
	
	vsp = 0
	hsp = 0
	
}

if place_meeting(x, y + vsp, obj_terra){
	
	while !place_meeting(x, y + sign(vsp), obj_terra)	y+= sign(vsp)
	
	if(image_xscale == -1)	image_angle = 270
	else	image_angle = 90
	
	y-=2
	
	vsp = 0
	hsp = 0
	
}

y+= vsp
}	else{
	if foialarm && _checouY == false{
	_gravity = 6
	if place_meeting(x, y + vsp, obj_grama){
	
	while !place_meeting(x, y + sign(vsp), obj_grama)	y+= sign(vsp)
	
	if(image_xscale == -1)	image_angle = 270
	else	image_angle = 90
	
	x+= 3 * _cached_direction
	y-=2
	
	_checouY = true
	
	vsp = 0
	hsp = 0
	
}

if place_meeting(x, y + vsp, obj_terra){
	
	while !place_meeting(x, y + sign(vsp), obj_terra)	y+= sign(vsp)
	
	if(image_xscale == 1)	image_angle = 270
	else	image_angle = 90
	
	x+= 3 * _cached_direction
	y-=2
	
	vsp = 0
	hsp = 0
	
	_checouY = true
	
}

y+= vsp
	}
}


#endregion