inst = instance_create_depth(x,y-100,-10, obj_big_enemy)
inst.alarm[0] = 1
instance_destroy(merge_target)
instance_destroy();