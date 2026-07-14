permanent = false; // debug: true
trigger_scene_info = [
	[cutscene_move_camera, 248, 164],
	[cutscene_move_character, obj_NPC_Adhila, 232, 164],
	[cutscene_move_character, obj_Player, 248+16, 164],
	[cutscene_rotate_character, obj_NPC_Adhila, 0],
	[cutscene_rotate_character, obj_Player, 180],
	[cutscene_show_dialogue, "Adhila_intro"],
	[cutscene_move_character, obj_NPC_Adhila, 248, 310],
	[cutscene_move_camera, obj_Player]
]

cutscene_id = "adhila_intro_scene";