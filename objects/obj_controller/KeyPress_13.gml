if(room == title){
	room_goto_next()
}
else if(room == end1 or room == end2 or room == gameover){
	game_restart()
}
else{ /// debugging
	// cheat code to automatically open the gate regardless of whether or not enemies are alive
	obj_gate.alarm[0] = 5; // this normally only occurs when all enemies are dead
}