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

    if (array_length(enemies_list) < max_enemies && spawned_total < total_to_spawn)
    {
        var enemy_choice = enemy_to_spawn;

		if (object_exists(enemy_to_spawn_2))
		{
			if (irandom(1) == 1)
			{
				enemy_choice = enemy_to_spawn_2;
			}
		}
		var new_enemy = spawn_enemy(x, y, spawn_range_x, spawn_range_y, enemy_choice);

        if (new_enemy != noone)
        {
            array_push(enemies_list, new_enemy);
            spawned_total++;
        }
    }

    spawn_timer = spawn_rate;
}

if (!wave_complete)
{
    if (spawned_total >= total_to_spawn && array_length(enemies_list) == 0)
    {
        wave_complete = true;
        instance_destroy();
    }
}