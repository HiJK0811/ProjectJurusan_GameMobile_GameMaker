// Enter State
if (state == 0) {
	timer++;
	
// Change Room
if (timer >= duration) {

	if (global.quitting) {
		game_end();
		
	} else {
        room_goto(targetRoom);

        // Only move player for room transitions
        if (variable_global_exists("next_x")) {
            with (obj_Player) {
                x = global.next_x;
                y = global.next_y;
            }
			
			with (obj_Camera) {
                x = global.next_x;
                y = global.next_y;
            }
        }
    }

	state = 1;
	}
}


// Exit State
else if (state == 1) {
	timer--;
	
	// Destroy
	if (timer <= 0) {
		global.transitioning = false; // unlock controls
		instance_destroy();
	}
}

// Set Alpha
alpha = timer / duration;