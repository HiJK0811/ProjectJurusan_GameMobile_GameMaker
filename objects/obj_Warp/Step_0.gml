if place_meeting(x, y, obj_Player){
	scr_roomGoToFade(target_room);
	obj_Player.x = target_x;
	obj_Player.y = target_y;
	obj_Camera.x = target_x;
	obj_Camera.y = target_y;
}