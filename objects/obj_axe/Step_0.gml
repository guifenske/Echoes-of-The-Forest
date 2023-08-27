#region movimento machado
hsp = spd * _cachedDirection

	if place_meeting(x + hsp, y, obj_terra){
	
	while !place_meeting(x + sign(hsp), y, obj_terra)	x+= sign(hsp)
	
	hsp = 0
	vsp = 0

}

if place_meeting(x + hsp, y, obj_grama){
	
	while !place_meeting(x + sign(hsp), y, obj_grama)		x+= sign(hsp)

	hsp = 0
	vsp = 0
	
}


x+=hsp

if place_meeting(x, y + vsp, obj_grama){
	
	while !place_meeting(x, y + sign(vsp), obj_grama)	y+= sign(vsp)
	
	if(image_xscale == -1)	image_angle = 270
	else	image_angle = 90
	
	y-=0.5
	
	vsp = 0
	hsp = 0
	
}

if place_meeting(x, y + vsp, obj_terra){
	
	while !place_meeting(x, y + sign(vsp), obj_terra)	y+= sign(vsp)
	
	if(image_xscale == -1)	image_angle = 270
	else	image_angle = 90
	
	y-=0.5
	
	vsp = 0
	hsp = 0
	
}


y+=vsp


#endregion