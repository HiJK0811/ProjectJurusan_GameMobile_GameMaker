if (keyboard_check_pressed(vk_end)) {
	
	if (!instance_exists(obj_fade)) {
        global.quitting = true;
        fadeToRoom(room, exit_time_required, c_black);
    }
	
	exit_timer ++;	
	if (exit_timer >= exit_time_required) {
		game_end();	
	}	
	
} else {
	exit_timer = 0;
}