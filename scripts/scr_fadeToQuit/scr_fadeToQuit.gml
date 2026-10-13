function fadeToQuit(){
	// Arguments
	var fade_room = argument[0];
	var fade_dur = argument[1];
	var fade_color = argument[2];
	
	// Lock controls
    global.transitioning = true;
	
	// Create
	var fade_inst = instance_create_depth(0, 0, 0, obj_fade_quit);
	
	// Set Properties
	with (fade_inst) {
		targetRoom = fade_room;
		duration = fade_dur;
		color = fade_color;
	}
}