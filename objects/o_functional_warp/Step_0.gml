if place_meeting(x, y, obj_player) && !instance_exists(obj_fade) {
	// Fade
	fadeToRoom(target_room, 15, c_black);
	
	global.next_x = target_x;
	global.next_y = target_y;
	
}
