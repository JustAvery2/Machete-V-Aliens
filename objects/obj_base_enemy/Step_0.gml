if (hit_cooldown > 0)
{
    hit_cooldown--;
}

if (turn_cooldown > 0)
{
    turn_cooldown--;
}

if (jump_cooldown > 0)
{
    jump_cooldown--;
}

if (state == "alive")
{
    if (sprite_index == hurt_sprite)
    {
        if (image_index >= image_number - 1)
        {
            sprite_index = idle_sprite;
        }
    }

    vspeed += grav;

    // horizontal movement
    if (place_meeting(x + hspeed, y, obj_jump_invis) && place_meeting(x, y + 1, oIsland) && jump_cooldown <= 0)
    {
        vspeed = -10;
        jump_cooldown = 15;
    }
    else if (place_meeting(x + hspeed, y, obj_invis) || place_meeting(x + hspeed, y, obj_wall))
    {
        if (turn_cooldown <= 0)
        {
            hspeed = -hspeed;
            turn_cooldown = turn;
        }
    }
    else
    {
        if (knockback)
        {
            test_x = x + knock_dir * 6;
            if (!(place_meeting(test_x, y, obj_invis) || place_meeting(test_x, y, obj_wall) || place_meeting(test_x, y, oIsland)))
            {
                x += knock_dir * 6;
            }
        }
        else
        {
            x += (hspeed / 2);
        }
    }

    // vertical movement
    if (place_meeting(x, y + vspeed, oIsland))
    {
        while (!place_meeting(x, y + sign(vspeed), oIsland))
        {
            y += sign(vspeed);
        }
        vspeed = 0;
    }
    else
    {
        y += vspeed;
    }

    if (current_growth < 1)
    {
        current_growth = lerp(current_growth, 1, 0.1);
    }

    var dir = -sign(hspeed);
    if (dir == 0) dir = 1;

    image_xscale = -dir * target_scale * current_growth;
    image_yscale = target_scale * current_growth;
}
else if (state == "dead")
{
    hspeed = 0;
    vspeed = 0;

    if (image_index >= image_number - 1)
    {
        instance_destroy();
    }
}