permanent = false; // debug: true
trigger_scene_info = [
	[cutscene_move_camera, 248, 164],
	[cutscene_move_character, obj_NPC_Adhila, 238, 156],
	[cutscene_move_character, obj_Player, 238, 173],
	[cutscene_rotate_character, obj_NPC_Adhila, 270],
	[cutscene_rotate_character, obj_Player, 90],
	[cutscene_show_dialogue, "Adhila_intro"],
	[cutscene_move_character, obj_NPC_Adhila, 388, 167],
	[cutscene_move_camera, obj_Player]
]

cutscene_id = "adhila_intro_scene";

// Prerequisite (Logic Gate Minigame Beaten)
// NEW: Tell the trigger it needs the minigame to be beaten!
// Note: Do NOT type "global." here, just type the name of the variable itself.
required_global = "logic_gate_completed";