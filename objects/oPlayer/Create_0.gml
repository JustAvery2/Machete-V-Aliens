hp = 100;
max_hp = 100;
invincible = false;
invincible_timer = 0;
invincible_length = 60; 

hurt = false;
hurt_timer = 0;
hurt_duration = 15; 

knockback = false

dead = false;


vsp = 0;
hsp = 0;

curr_sprite = sprite_index;
jumping = false;
ground = true;
sprinting = false;
climbing = false;

slash_inst = noone;
attacking = false;

trapped = false;
escape_presses = 0;
escape_needed = 10;
trap_plant = noone;
trap_cooldown = 0;

image_xscale = image_scale;
image_yscale = image_scale;

enemy_touch_timer = 0;
enemy_touch_needed = room_speed / 4; 
touching_enemy = false;
