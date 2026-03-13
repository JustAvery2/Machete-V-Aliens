function spawn_enemy(x_pos, y_pos, range_x, range_y, enemy_obj)
{
    if (object_exists(enemy_obj))
	{
        var final_x = x_pos + random_range(-range_x, range_x);
        var final_y = y_pos + random_range(-range_y, range_y);
		var instance = instance_create_layer(final_x, final_y, "Instances", enemy_obj);
        
        with (instance)
		{
            image_xscale = 0; 
            image_yscale = 0; 
        }
        return instance;
    }
    return noone;
}