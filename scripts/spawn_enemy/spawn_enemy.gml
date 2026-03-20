function spawn_enemy(x_pos, y_pos, range_x, range_y, enemy_obj)
{
    if (!object_exists(enemy_obj)) return noone;

    repeat (30)
    {
        var final_x = x_pos + irandom_range(-range_x, range_x);
        var final_y = y_pos + irandom_range(-range_y, range_y);

        if (!place_meeting(final_x, final_y, oIsland) && !place_meeting(final_x, final_y, obj_invis))
        {
            var inst = instance_create_layer(final_x, final_y, "Instances", enemy_obj);

            with (inst)
            {
                image_xscale = 0;
                image_yscale = 0;
                current_growth = 0;

                if (x < other.x) hspeed = abs(speed_amount);
                else hspeed = -abs(speed_amount);
            }

            return inst;
        }
    }
	
	repeat (30)
    {
        var final_x = x_pos + irandom_range(-range_x, range_x);
        var final_y = y_pos + irandom_range(-range_y, range_y);

        if (!place_meeting(final_x, final_y, oIsland) && !place_meeting(final_x, final_y, obj_invis))
        {
            var inst = instance_create_layer(final_x, final_y, "Instances", enemy_obj_2);

            with (inst)
            {
                image_xscale = 0;
                image_yscale = 0;
                current_growth = 0;

                if (x < other.x) hspeed = abs(speed_amount);
                else hspeed = -abs(speed_amount);
            }

            return inst;
        }
    }

    return noone;
}