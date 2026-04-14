if (keyboard_check(vk_escape)) {
	exit_timer ++;	
	if (exit_timer >= exit_time_required) {
		game_end();	
	}	
} else {
	exit_timer = 0;
}