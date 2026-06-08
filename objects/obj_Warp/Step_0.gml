if place_meeting(x, y, obj_Player) && !instance_exists(obj_fade_room){
	// Fade
	fadeToRoom(target_room, 15, c_black);
	// roomGoToFade(target_room);
	
	global.next_x = target_x;
	global.next_y = target_y;
	//obj_Player.x = target_x;
	//obj_Player.y = target_y;
	// obj_Camera.x = target_x;
	// obj_Camera.y = target_y;
}