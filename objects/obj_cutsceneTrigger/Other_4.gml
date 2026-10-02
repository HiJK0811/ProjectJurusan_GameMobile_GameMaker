// Check if this specific cutscene has already been played.
// Because this is in Room Start, the Room Editor Creation Code has already run!
//if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
//	instance_destroy();
//}

// 1. Has this cutscene already been played?
if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
	instance_destroy();
	exit; // 'exit' stops the rest of the script from running since the object is dead
}

// 2. Does this cutscene have a prerequisite to appear?
if (required_global != "") {
	
	// Check if the global variable exists and if it is currently false
	if (variable_global_exists(required_global)) {
		
		if (variable_global_get(required_global) == false) {
			// The minigame isn't beaten yet! Destroy the trigger so it doesn't appear.
			instance_destroy();
		}
		
	}
}

// DEBUG
//show_debug_message("=== TRIGGER RELOADED ===");
//show_debug_message("1. My ID is: " + string(cutscene_id));
//show_debug_message("2. What is inside global memory right now? " + string(global.played_cutscenes));

//if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
//	show_debug_message("3. Memory found! Destroying myself.");
//	instance_destroy();
//} else {
//	show_debug_message("3. Memory is BLANK or missing this ID. I am staying alive.");
//}