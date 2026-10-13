permanent = false; // debug: true
trigger_scene_info = [
	[cutscene_move_camera, 721, 269],
	[cutscene_move_character, obj_NPC_Lylia, 722, 274],
	[cutscene_move_character, obj_Player, 722, 240],
	[cutscene_rotate_character, obj_NPC_Lylia, 90],
	[cutscene_rotate_character, obj_Player, 270],
	[cutscene_show_dialogue, "Lylia_post_logic"],
	[cutscene_move_camera, obj_Player]
]

cutscene_id = "Lylia_post_logic_scene";

// Prerequisite (Logic Gate Minigame Beaten)
// NEW: Tell the trigger it needs the minigame to be beaten!
// Note: Do NOT type "global." here, just type the name of the variable itself.
required_global = "logic_gate_completed";