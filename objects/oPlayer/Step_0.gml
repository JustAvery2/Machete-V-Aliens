hsp = 0
vsp += gravity_amount
sprinting = keyboard_check(vk_shift);

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

if (keyboard_check(ord("E")) and not attacking)
{
	charging = true;
	charge_time += 1;
	hsp = 0;

	if(not jumping){
		sprite_index = spr_player_charge;
		curr_sprite = sprite_index;
	}
}
else if (charging)
{
	charging = false;

	if (charge_time >= charge_needed)
	{
		attacking = true;
		sprite_index = spr_player_attack;
		image_index = 0;
	}
	else
	{
		sprite_index = spr_player_idle;
		curr_sprite = sprite_index;
	}

	charge_time = 0;
}

if (not attacking and not charging){ // add damage condition here?
	if (keyboard_check(ord("D")))
	{
		if (sprinting){
			hsp = sprint_amount
		}
		else{
			hsp = speed_amount
		}

		image_xscale = 1.5;

		if(not jumping){
			if (sprinting){
				sprite_index = spr_player_sprint;
			}
			else{
				sprite_index = spr_player_walk;
			}
			curr_sprite = sprite_index;
		}
	}
	else if (keyboard_check(ord("A")))
	{
		if (sprinting){
			hsp = -sprint_amount
		}
		else{
			hsp = -speed_amount
		}

		image_xscale = -1.5;

		if(not jumping){
			if (sprinting){
				sprite_index = spr_player_sprint;
			}
			else{
				sprite_index = spr_player_walk;
			}
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
		if (!place_meeting(x + hsp, y - 1, oWall) and !place_meeting(x + hsp, y - 1, oIsland))
		{
			x += hsp
			y -= 1
		}
		else
		{
			while (!place_meeting(x + sign(hsp), y, oWall) and !place_meeting(x + sign(hsp), y, oIsland))
			{
				x += sign(hsp)	
			}
			hsp = 0
		}
	}

	if(not (keyboard_check(ord("D")) or keyboard_check(ord("A")) or jumping)){
		sprite_index = spr_player_idle;
		curr_sprite = sprite_index;
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
		if(instance_exists(oSlash)){
			instance_destroy(oSlash);
		}
	}
	if(image_index >= image_number - 1){
		attacking = false;
		sprite_index = spr_player_idle;
		curr_sprite = sprite_index;
	}
}

//Cheat Code

if (keyboard_check(ord("P")))
{
	x = 500
	y = 500
}
