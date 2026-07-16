permanent = false // false to destroy instance
trigger_scene_info = -1

// Cutscene ID

// Give this trigger a unique ID. 
// TIP: Change this string in the Room Editor's "Creation Code" for each new trigger!
cutscene_id = "first_cutscene"; 

//// Check if this cutscene has already been played
//if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
//	instance_destroy(); // Destroy immediately before the player even sees it
//	exit;
//}

// NEW: Prerequisite System (to check cutscene prerequisite)
required_global = ""; // Leave blank if there is no requirement