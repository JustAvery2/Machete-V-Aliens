hsp = 0
vsp += gravity_amount

ground = place_meeting(x, y + 1, oIsland) or place_meeting(x, y + 1, oWall)
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

		if(not attacking){
			sprite_index = curr_sprite;
		}
	}
if ( not attacking){ // add damage condition here?
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

	if (keyboard_check_pressed(vk_space) and ground)
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

	if( not (keyboard_check(ord("D")) or keyboard_check(ord("A")) or jumping)){
		sprite_index = spr_player_idle;
	}
}
else{
	if(image_index == 1){
		if(image_xscale > 0){
			instance_create_depth(x+70, y-20, -100, oSlash);
		}
		else{
			var inst = instance_create_depth(x-70, y-20, -100, oSlash);
			inst.image_xscale = -inst.image_xscale;
		}
	}
	if(image_index == 0 or image_index == 3){
		if( instance_exists(oSlash)){
			instance_destroy(oSlash);
		}
	}
}

//Cheat Code

if (keyboard_check(ord("P")))
{
	x = 500
	y = 500
}



