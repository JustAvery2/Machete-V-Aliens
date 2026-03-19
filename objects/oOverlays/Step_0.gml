if(up){
	y -= sp
}
else{
	y += sp
}

if(y == y_top){
	up = false;
}

if(y == y_bottom){
	up = true;
}