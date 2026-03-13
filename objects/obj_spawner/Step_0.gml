spawn_timer--;

if (spawn_timer <= 0)
{
    for (var i = array_length(enemies_list) - 1; i >= 0; i--)
	{
        if (!instance_exists(enemies_list[i]))
		{
            array_delete(enemies_list, i, 1);
        }
    }

    if (array_length(enemies_list) < max_enemies)
	{
        var new_enemy = spawn_enemy(x, y, spawn_range_x, spawn_range_y, enemy_to_spawn);
        if (new_enemy != noone)
		{
            array_push(enemies_list, new_enemy);
        }
    }
    
    spawn_timer = spawn_rate;
}