if (!attacking && !charging)
{
    attacking = true;

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