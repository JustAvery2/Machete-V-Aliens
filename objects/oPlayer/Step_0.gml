if (dead) {
    hsp = 0;
    vsp = 0;

    if (sprite_index != spr_player_death) {
        sprite_index = spr_player_death;
        image_index = 0;
        image_speed = 1;
    }

    if (image_index >= image_number - 1) {
		audio_stop_sound(sfx_music_main);
        room_goto(gameover)
		//show_message("You Died");
        //room_restart();
    }

    exit;
}

if (trap_cooldown > 0) {
	trap_cooldown -= 1;
}

var hazard = instance_place(x, y, obj_hazard);

if (!trapped && trap_cooldown <= 0 && hazard != noone && hazard.state == "idle" && hazard.cooldown <= 0)
{
	trapped = true;
	escape_presses = 0;
	trap_plant = hazard;

	trap_plant.state = "grab";

	x = trap_plant.x;
	y = trap_plant.y - 16;
}

if (trapped)
{
	hsp = 0;
	vsp = 0;

	if (trap_plant != noone && instance_exists(trap_plant))
	{
		x = trap_plant.x;
		y = trap_plant.y - 16;
	}

	if (keyboard_check_pressed(ord("E")))
	{
		escape_presses += 1;
		audio_play_sound(sfx_hazard, 2, false);
	}

	if (escape_presses >= escape_needed)
	{
		trapped = false;
		escape_presses = 0;
		trap_cooldown = 15;

		if (trap_plant != noone && instance_exists(trap_plant))
		{
			var throw_dir = sign(x - trap_plant.x);

			if (throw_dir == 0)
			{
				if (image_xscale >= 0) throw_dir = 1;
				else throw_dir = -1;
			}

			trap_plant.state = "idle";
			trap_plant.cooldown = 120;

			var max_push = 64;
			while (place_meeting(x, y, obj_hazard) && max_push > 0)
			{
				x += throw_dir;
				y -= 1;
				max_push -= 1;
			}

			x += throw_dir * 8;
			y -= 6;

			hsp = throw_dir * 6;
			vsp = -8;
		}

		trap_plant = noone;
	}

	exit;
}


// VINE CHECK
if (place_meeting(x, y, obj_vine) || place_meeting(x, y, obj_vine_short)) {
	
	if (keyboard_check(ord("W")) || keyboard_check(ord("S"))) {
		vspeed = 0;
		climbing = true;
	}
}
else {
	climbing = false;
	if (!attacking) {
		sprite_index = spr_player_idle;
	}
}


// CLIMBING
if (climbing) {
	sprite_index = spr_player_climb;
	var vladder = 0;
	if (keyboard_check(ord("W"))) {
		vladder = -climb_speed;
	}
	if (keyboard_check(ord("S"))) {
		vladder = climb_speed;
	}
	
	var hladder = 0;
	if (keyboard_check(ord("A"))) {
		hladder = -climb_speed + 3;
	}
	if (keyboard_check(ord("D"))) {
		hladder = climb_speed - 3;
	}
	
	while (vladder != 0) {
		if (place_meeting(x, y + sign(vladder), oIsland)) {
			break;
		}
		y += sign(vladder);
		vladder -= sign(vladder);
	}
	
	while (hladder != 0) {
		if (place_meeting(x + sign(hladder), y, oIsland)) {
			break;
		}
		x += sign(hladder);
		hladder -= sign(hladder);
	}
	
	var island = instance_place(x, y + 1, oIsland);
	if (island != noone && keyboard_check(ord("W")) && bbox_bottom <= island.bbox_top + 1) {
		climbing = false;	
	}
}
else {
	// gravity
	if (place_meeting(x, y + 1, obj_vine) || place_meeting(x, y + 1, obj_vine_short)) {
		vsp = 0;
	}

	sprinting = keyboard_check(vk_shift);
	ground = place_meeting(x, y + 1, oIsland) || place_meeting(x, y + 1, obj_wall);

	// apply launch from trap escape before movement reset
	if (!variable_instance_exists(id, "escape_launch_done")) {
		escape_launch_done = false;
	}

	// only reset hsp normally if not attacking or moving from trap throw
	if (!attacking) {
		hsp = 0;
	}

	vsp += gravity_amount;

	if (!place_meeting(x, y + vsp, obj_wall) && !place_meeting(x, y + vsp, oIsland))
	{
		y += vsp;
	}
	else
	{
		while (!place_meeting(x, y + sign(vsp), obj_wall) && !place_meeting(x, y + sign(vsp), oIsland))
		{
			y += sign(vsp);
		}
		vsp = 0;
		jumping = false;

		if (!attacking) {
			sprite_index = curr_sprite;
		}
	}

	// LEFT CLICK ATTACK
	if (mouse_check_button_pressed(mb_left) && !attacking)
	{
		attacking = true;
		sprite_index = spr_player_attack;
		image_index = 0;
		curr_sprite = sprite_index;
	}

	// MOVEMENT
	if(knockback){
		 if(knockback){
			x += knock_dir * 6
		}
	}
	else{
	if (keyboard_check(ord("D")))
	{
		if (sprinting){
			hsp = sprint_amount;
		}
		else{
			hsp = speed_amount;
		}

		if (attacking) {
			hsp *= 0.4;
		}

		image_xscale = 0.80;

		if (!jumping && !attacking) {
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
			hsp = -sprint_amount;
		}
		else{
			hsp = -speed_amount;
		}

		if (attacking) {
			hsp *= 0.4;
		}

		image_xscale = -0.80;

		if (!jumping && !attacking){
			if (sprinting){
				sprite_index = spr_player_sprint;
			}
			else{
				sprite_index = spr_player_walk;
			}
			curr_sprite = sprite_index;
		}
	}

	// JUMP
	if (keyboard_check_pressed(vk_space) && ground)
	{
		audio_play_sound(sfx_player_jump, 1, false);
		if (attacking) {
			vsp = -20;
			jumping = true;
		}
		else {
			vsp = -20;
			sprite_index = spr_player_jump;
			jumping = true;
		}
	}
	}

	// HORIZONTAL COLLISION
	if (!place_meeting(x + hsp, y, obj_wall) && !place_meeting(x + hsp, y, oIsland))
	{	
		x += hsp;
	}
	else
	{
		if (!place_meeting(x + hsp, y - 1, obj_wall) && !place_meeting(x + hsp, y - 1, oIsland))
		{
			x += hsp;
			y -= 1;
		}
		else
		{
			while (!place_meeting(x + sign(hsp), y, obj_wall) && !place_meeting(x + sign(hsp), y, oIsland))
			{
				x += sign(hsp);	
			}
			hsp = 0;
		}
	}

	if (!climbing && !attacking && !(keyboard_check(ord("D")) || keyboard_check(ord("A")) || jumping)) {
		sprite_index = spr_player_idle;
		curr_sprite = sprite_index;
	}
}


// ATTACK LOGIC
if (attacking) {
	if (slash_inst != noone && !instance_exists(slash_inst)) {
		slash_inst = noone;
	}
		
	if (floor(image_index) >= 1 && slash_inst == noone) {
		if (image_xscale > 0) {
			slash_inst = instance_create_depth(x + 50, y - 20, -100, oSlash);
		}
		else{
			slash_inst = instance_create_depth(x - 50, y - 20, -100, oSlash);
			slash_inst.image_xscale = -slash_inst.image_xscale;
		}
	}
		
	if (image_index >= image_number - 1) {
		attacking = false;
		sprite_index = spr_player_idle;
		curr_sprite = sprite_index;
	}
}


// CHEAT CODE
if (keyboard_check(ord("P")))
{
	x = 100;
	y = 540;
}

if (invincible) {
    invincible_timer--;
    if (invincible_timer <= 0) {
        invincible = false;
    }
}

if (hurt) {
    hurt_timer--;

    if (hurt_timer <= 0) {
        hurt = false;
    }
}
if(!climbing){
	if (hurt) {
	    sprite_index = spr_player_dmg;
	} else {
	    sprite_index = curr_sprite;
	}
}
