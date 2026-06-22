ssif (keyboard_check_pressed(vk_escape)) {
	paused = !paused;
	update_pause();
}

// Only navigate if the game is actually paused
if (paused) {
    
    // Check if we are on the main pause screen or the tutorial screen
    var _in_tutorial = layer_get_visible("TutorialLayer");

    if (!_in_tutorial) {
        // --- KEYBOARD NAVIGATION (Buttons 1 through 4) ---
        var _up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
        var _down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

        if (_up) {
            menu_index--;
            if (menu_index < 1) menu_index = 4; // Wrap to bottom
        }
        
        if (_down) {
            menu_index++;
            if (menu_index > 4) menu_index = 1; // Wrap to top
        }
    } else {
        // If the tutorial layer is open, lock focus to the Back button (ID 5)
        menu_index = 5; 
    }

    // --- MOUSE MOVEMENT TRACKING ---
    if (mouse_x != last_mouse_x || mouse_y != last_mouse_y) {
        mouse_moved = true;
    } else {
        mouse_moved = false;
    }
    
    last_mouse_x = mouse_x;
    last_mouse_y = mouse_y;
}