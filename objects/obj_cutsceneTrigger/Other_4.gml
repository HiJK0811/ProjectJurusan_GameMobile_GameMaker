// Check if this specific cutscene has already been played.
// Because this is in Room Start, the Room Editor Creation Code has already run!
if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
	instance_destroy();
}