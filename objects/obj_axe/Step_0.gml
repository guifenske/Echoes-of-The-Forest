#region movimento machado
hsp = spd * global.machadodirection

if place_meeting(x + hsp, y, obj_terra){
	
	while !place_meeting(x + sign(hsp), y, obj_terra){
		x+= sign(hsp)
	}
	
	global.machadodirection = 0
	

	
	hsp = 0
	vsp = 0

	
}

if place_meeting(x + hsp, y, obj_grama){
	
	while !place_meeting(x + sign(hsp), y, obj_grama){
		x+= sign(hsp)
	}
	

global.machadodirection = 0
	
	hsp = 0
	vsp = 0

	
}


x+=hsp

if place_meeting(x, y + vsp, obj_grama){
	
	while !place_meeting(x, y + sign(vsp), obj_grama){
		y+= sign(vsp)
	}
	
	global.machadodirection = 0
	
	vsp = 0
	hsp = 0

	
}

if place_meeting(x, y + vsp, obj_terra){
	
	while !place_meeting(x, y + sign(vsp), obj_terra){
		y+= sign(vsp)
	}
	
	global.machadodirection = 0
	
	vsp = 0
	hsp = 0

	
}


y+=vsp
#endregion