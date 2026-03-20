target_scale = abs(image_xscale);
image_xscale = 0;
image_yscale = 0;
current_growth = 0;
knockback = false
knock_dir = -1

hspeed = speed_amount;
vspeed = 0;
grav = 0.4;


state = "alive";

hits_taken = 0;
hits_to_die = 2;

death_sprite = spr_enemy_death;
idle_sprite = spr_base_enemy;
hurt_sprite = spr_base_enemy_dmg;

hit_cooldown = 0;
turn_cooldown = 0;
turn = 10;

jump_cooldown = 0;

sprite_index = idle_sprite;