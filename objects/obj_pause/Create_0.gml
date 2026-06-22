paused = false;
layer_name = "PauseLayer";

update_pause = function() {
	// Pause Game
	if (paused) {
		instance_deactivate_object(obj_Player);
		//instance_activate_object(obj_pause);
		//instance_activate_object(obj_Camera);
		//instance_deactivate_all(true);
		layer_set_visible(layer_name, true);
	} 
	// Unpause Game
	else {
		instance_activate_object(all);
		// instance_activate_object(obj_Camera);
		// instance_activate_all();
		layer_set_visible(layer_name, false);
		layer_set_visible("TutorialLayer", false);
        
        // --- NEW: Reset menu index when unpausing ---
        menu_index = 1; 
	}
	
}

update_pause();

// Force the pause manager to draw extremely close to the camera
// so it covers game instances, but keep the UI layers even lower than this!
depth = -9000;

layer_set_visible("TutorialLayer", false);

menu_index = 1; // Start with the "Resume" button highlighted
last_mouse_x = mouse_x;
last_mouse_y = mouse_y;
mouse_moved = false;