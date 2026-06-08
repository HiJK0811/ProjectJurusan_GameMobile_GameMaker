paused = false;
layer_name = "PauseLayer";

update_pause = function() {
	// Pause Game
	if (paused) {
		instance_deactivate_object(all)
		instance_activate_object(obj_pause);
		//instance_deactivate_all(true);
		layer_set_visible(layer_name, true);
	} 
	// Unpause Game
	else {
		instance_activate_object(all);
		// instance_activate_object(obj_Camera);
		// instance_activate_all();
		layer_set_visible(layer_name, false);
	}
	
}

update_pause();
