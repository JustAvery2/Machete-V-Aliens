hsp = 0
vsp += gravity_amount

if (keyboard_check(ord("D")))
{
	hsp = speed_amount
	if(image_xscale <= 0 ){
			image_xscale = -image_xscale;
		}
	if(not jumping){
		sprite_index = spr_player_walk;
		curr_sprite = sprite_index;
	}
	
}

if (keyboard_check(ord("A")))
{
	hsp = -speed_amount
	if(image_xscale >= 0){
			image_xscale = -image_xscale;
		}
	if(not jumping){
		sprite_index = spr_player_walk;
		curr_sprite = sprite_index;
	}
}

if (keyboard_check_pressed(vk_space) and (place_meeting(x, y + 1, oIsland) or place_meeting(x, y + 1, oWall)))
{
	vsp = -20
	sprite_index = spr_player_jump;
	jumping = true;
}


if (!place_meeting(x + hsp, y, oWall) and !place_meeting(x + hsp, y, oIsland))
{	
	x += hsp
}
else
{
	while (!place_meeting(x + sign(hsp), y, oWall) and !place_meeting(x + sign(hsp), y, oIsland))
	{
		x += sign(hsp)	
	}
	hsp = 0
}


if (!place_meeting(x, y + vsp, oWall) and !place_meeting(x, y + vsp, oIsland))
{
	y += vsp
}
else
{
	while (!place_meeting(x, y + sign(vsp), oWall) and !place_meeting(x, y + sign(vsp), oIsland))
	{
		y += sign(vsp)
	}
	vsp = 0
	jumping = false;
	sprite_index = curr_sprite;
}


// def could be changed/optimized, will have to when adding attack, but okay for now
if( not (keyboard_check(ord("D")) or keyboard_check(ord("A")) or jumping)){
	sprite_index = spr_player_idle;
}

//Cheat Code

if (keyboard_check(ord("P")))
{
	x = 500
	y = 500
}



