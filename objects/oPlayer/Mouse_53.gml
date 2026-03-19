if (!attacking && !charging)
{
    attacking = true;
	audio_play_sound(sfx_slash, 1, false)

    if (jumping)
    {
        sprite_index = spr_player_jumpattack;
    }
    else
    {
        sprite_index = spr_player_attack;
    }

    image_index = 0;
}