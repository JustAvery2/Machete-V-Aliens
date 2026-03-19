if(obj_gate.open){
	if(room == Room3){
		if(!(instance_exists(oFinalText))){
			instance_create_layer(0,0, "InstancesAbove", oFinalText)
		}
	}
	else{
		room_goto_next();
	}
}