permanent = false; // debug: true
trigger_scene_info = [
	[cutscene_move_camera, 521, 261],
	[cutscene_move_character, obj_NPC_Lylia, 495, 264],
	[cutscene_move_character, obj_Player, 475, 264],
	[cutscene_rotate_character, obj_NPC_Lylia, 0],
	[cutscene_show_dialogue, "Lylia_sorting_intro"],
	[cutscene_move_camera, obj_Player]
]

cutscene_id = "Lylia_sorting_intro_scene";

// Hanoi Minigame Beaten (2/3 or all)
required_global = "hanoi_completed"