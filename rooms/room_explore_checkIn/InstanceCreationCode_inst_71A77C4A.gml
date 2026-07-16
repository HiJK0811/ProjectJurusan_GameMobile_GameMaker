permanent = false; // debug: true
trigger_scene_info = [
	[cutscene_move_camera, 530, 319],
	// [cutscene_move_character, obj_NPC_Lylia, 880, 380],
	[cutscene_move_character, obj_Player, 525, 338],
	// [cutscene_rotate_character, obj_NPC_Lylia, 0],
	[cutscene_rotate_character, obj_Player, 90],
	[cutscene_show_dialogue, "Adhoc - intro"],
	[cutscene_move_character, obj_Player, 528, 265],
	[cutscene_move_camera, obj_Player]
]

cutscene_id = "adhoc_intro_scene";