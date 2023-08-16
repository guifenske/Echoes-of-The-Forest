#region movimento machado
hsp = spd * global.machadodirection;

if place_meeting(x + hsp, y, obj_bloco){
	
	while !place_meeting(x + sign(hsp), y, obj_bloco){
		x+= sign(hsp)
	}
	

	
	hsp = 0
	vsp = 0

	
}

x+=hsp

if place_meeting(x + vsp, y, obj_bloco){
	
	while !place_meeting(x + sign(vsp), y, obj_bloco){
		x+= sign(vsp)
	}
	
	vsp = 0
	hsp = 0

	
}


y+=vsp
#endregion