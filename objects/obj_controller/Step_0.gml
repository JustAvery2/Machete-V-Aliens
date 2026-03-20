if(room == Tutorial or room == Level_1 or room == Room2 or room == Room3){
	if(!(instance_exists(obj_base_enemy)) and !(instance_exists(obj_spawner))){
		if(obj_gate.alarm[0] < 0){
			obj_gate.alarm[0] = 5
		}
	}
}