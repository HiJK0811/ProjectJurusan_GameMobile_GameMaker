permanent = false; // debug: true
trigger_scene_info = [
	[cutscene_move_camera, 340, 231],
	[cutscene_move_character, obj_Player, 302, 276],
	[cutscene_rotate_character, obj_Player, 90],
	[cutscene_show_dialogue, "Ami_post_hanoi"],
	// [cutscene_move_character, obj_Player, 548, 200],
	// [cutscene_show_dialogue, "Ami_intro_cont"],
	// [cutscene_move_character, obj_NPC_Ami, 880, 380],
	// [cutscene_show_dialogue, "Ami_intro_last"],
	[cutscene_move_camera, obj_Player]
]

cutscene_id = "ami_post_hanoi_scene";

// Hanoi Minigame Beaten (2/3 or all)
required_global = "hanoi_completed"