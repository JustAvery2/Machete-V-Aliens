if(room == title){
	room_goto_next()
}
else if(room == end1 or room == end2 or room == gameover){
	game_restart()
}
else{ /// debugging
	obj_gate.alarm[0] = 5; // this should occur when all enemies are dead
	// opens gate
}

