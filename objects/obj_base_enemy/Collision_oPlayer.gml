if (state == "alive" && hit_cooldown <= 0){
knockback = true
	alarm[1] = 40
	knock_dir = sign(x - other.x);
}