touching_enemy = true;

if (!invincible && !dead && !attacking)
{
    enemy_touch_timer++;

    if (enemy_touch_timer >= enemy_touch_needed)
    {
        hp -= 10;
		audio_play_sound(sfx_player_hurt, 1, false);

        if (hp <= 0)
        {
            hp = 0;
            dead = true;

            attacking = false;
            hurt = false;
            invincible = false;
            climbing = false;
            trapped = false;

            hsp = 0;
            vsp = 0;

            sprite_index = spr_player_death;
            image_index = 0;
            image_speed = 1;
			audio_play_sound(sfx_player_death, 1, false);
            exit;
        }

        invincible = true;
        invincible_timer = invincible_length;

        hurt = true;
        hurt_timer = hurt_duration;
        image_index = 0;

        enemy_touch_timer = 0;
    }
}