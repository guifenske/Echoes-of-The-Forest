#region movimento machado
hsp = spd * global.machadodirection;

if place_meeting(x + hsp, y, obj_terra){
	
	while !place_meeting(x + sign(hsp), y, obj_terra){
		x+= sign(hsp)
	}
	

	
	hsp = 0
	vsp = 0

	
}


x+=hsp

if place_meeting(x, y + vsp, obj_grama){
	
	while !place_meeting(x, y + sign(vsp), obj_grama){
		x+= sign(vsp)
	}
	
	vsp = 0
	hsp = 0

	
}


y+=vsp
#endregion