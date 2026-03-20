if (state == "alive" && hit_cooldown <= 0)
{
    hits_taken += 1;
    hit_cooldown = 40;
	knockback = true
	alarm[1] = 40
	knock_dir = sign(x - other.x);


    if (hits_taken >= hits_to_die)
    {
        state = "dead";
        sprite_index = death_sprite;
        image_index = 0;
        image_speed = 1;

        hspeed = 0;
        vspeed = 0;

        image_xscale = target_scale;
        image_yscale = target_scale;
		audio_play_sound(sfx_enemy_death, 1, false);
    }
    else
    {
        sprite_index = hurt_sprite;
        image_index = 0;
        image_speed = 1;
		audio_play_sound(damage_sound, 1, false);
    }

    with (other)
    {
        instance_destroy();
    }
}