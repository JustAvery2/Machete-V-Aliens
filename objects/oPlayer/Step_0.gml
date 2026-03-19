if (place_meeting(x, y, obj_vine) || place_meeting(x, y, obj_vine_short)) {
	if (keyboard_check(ord("W")) || keyboard_check(ord("S"))) {
		climbing = true
		vspeed = 0
		sprite_index = spr_player_climb
	}
}
else {
	climbing = false
	sprite_index = spr_player_idle
}

if (climbing) {
	var vladder = 0
	if (keyboard_check(ord("W"))) {
		vladder = -climb_speed
	}
	if (keyboard_check(ord("S"))) {
		vladder = climb_speed
	}
	
	var hladder = 0
	if (keyboard_check(ord("A"))) {
		hladder = -climb_speed + 3
	}
	if (keyboard_check(ord("D"))) {
		hladder = climb_speed - 3
	}
	
	while (vladder != 0) {
		if (place_meeting(x, y + sign(vladder), oIsland)) {
			break
		}
		y += sign(vladder)
		vladder -= sign(vladder)
	}
	while (hladder != 0) {
		if (place_meeting(x + sign(hladder), y, oIsland)) {
			break
		}
		x += sign(hladder)
		hladder -= sign(hladder)
	}
	
	var island = instance_place(x, y + 1, oIsland);
	if (island != noone && keyboard_check(ord("W")) && bbox_bottom <= island.bbox_top + 1) {
		climbing = false;	
	}
}


else {
	if (place_meeting(x, y + 1, obj_vine) || place_meeting(x, y + 1, obj_vine_short)) {
		vsp = 0;
	}
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

	if (not charging){ // add damage condition here?
		if (keyboard_check(ord("D")))
		{
			if (sprinting){
				hsp = sprint_amount
			}
			else{
				hsp = speed_amount
			}
			if (attacking) {
				hsp *= 0.4;
			}

			image_xscale = 0.80;

			if(not jumping && !attacking) {
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
			if (attacking) {
				hsp *= 0.4;
			}

			image_xscale = -0.80;

			if(not jumping && !attacking){
				if (sprinting){
					sprite_index = spr_player_sprint;
				}
				else{
					sprite_index = spr_player_walk;
				}
				curr_sprite = sprite_index;
			}
		}

		if (keyboard_check_pressed(vk_space) and ground && !attacking)
		{
			vsp = -20
			sprite_index = spr_player_jump;
			jumping = true;
			audio_play_sound(sfx_player_jump, 1, false)
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

		if(!attacking && !(keyboard_check(ord("D")) or keyboard_check(ord("A")) or jumping)){
			sprite_index = spr_player_idle;
			curr_sprite = sprite_index;
		}
	}
}
if (attacking) {
	if (slash_inst != noone && !instance_exists(slash_inst)) {
		slash_inst = noone;
	}
		
	if(floor(image_index) >= 1 && slash_inst == noone) {
		show_debug_message("creating slash");
			
		if(image_xscale > 0) {
			slash_inst = instance_create_depth(x + 50, y - 20, -100, oSlash);
			show_debug_message("created slash: " + string(instance_exists(slash_inst)));
		}
		else{
			slash_inst = instance_create_depth(x - 50, y - 20, -100, oSlash);
			slash_inst.image_xscale = -slash_inst.image_xscale;
		}
	}
		
	if(image_index >= image_number - 1) {
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
