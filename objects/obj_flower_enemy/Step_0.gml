
event_inherited()

if(merge){
	solid = false
	move_towards_point(merge_x, merge_y, 2)
	
	if(point_distance(x, y, merge_x, merge_y) < 2){
		sprite_index = spr_merge_enemy_merge
		hspeed = 0
	}
	
}
