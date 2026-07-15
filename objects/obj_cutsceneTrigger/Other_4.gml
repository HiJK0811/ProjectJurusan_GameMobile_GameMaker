// Check if this specific cutscene has already been played.
// Because this is in Room Start, the Room Editor Creation Code has already run!
if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
	instance_destroy();
}

//show_debug_message("=== TRIGGER RELOADED ===");
//show_debug_message("1. My ID is: " + string(cutscene_id));
//show_debug_message("2. What is inside global memory right now? " + string(global.played_cutscenes));

//if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
//	show_debug_message("3. Memory found! Destroying myself.");
//	instance_destroy();
//} else {
//	show_debug_message("3. Memory is BLANK or missing this ID. I am staying alive.");
//}