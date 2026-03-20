spawn_timer = 0;
spawn_rate = 30;

max_enemies = 3;
total_to_spawn = 10;
spawned_total = 0;

spawn_range_x = 200;
spawn_range_y = 100;

enemy_to_spawn = obj_base_enemy;
enemy_to_spawn_2 = obj_base_enemy;

enemies_list = [];
wave_complete = false;


// optional gate spawn position
gate_x = x;
gate_y = y;

// room-specific settings
switch (room)
{
    case Tutorial:
        max_enemies = 1;
        total_to_spawn = 3;
        spawn_rate = 45;
        spawn_range_x = 120;
        spawn_range_y = 60;
        gate_x = 1792;
        gate_y = 64;
    break;

    case Level_1:
        max_enemies = 2;
        total_to_spawn = 12;
        spawn_rate = 250;
        spawn_range_x = 180;
        spawn_range_y = 60;
        gate_x = 96;
        gate_y = 96;
    break;

    case Room2:
        max_enemies = 4;
		enemy_to_spawn = obj_flower_enemy;
		enemy_to_spawn_2 = obj_base_enemy;
        total_to_spawn = 20;
        spawn_rate = 75;
        spawn_range_x = 220;
        spawn_range_y = 60;
        gate_x = 1408;
        gate_y = 352;
    break;
	
	case Room3:
        max_enemies = 1;
		enemy_to_spawn = obj_flower_enemy
        total_to_spawn = 11;
        spawn_rate = 25;
        spawn_range_x = 220;
        spawn_range_y = 60;
        gate_x = 1408;
        gate_y = 352;
    break;
}