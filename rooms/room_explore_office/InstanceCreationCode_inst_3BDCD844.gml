permanent = true
trigger_scene_info = [
	[cutscene_move_camera, 248, 200],
	[cutscene_move_character, obj_NPC_Adhila, 232, 200],
	[cutscene_move_character, obj_Player, 248+16, 200],
	[cutscene_rotate_character, obj_NPC_Adhila, 0],
	[cutscene_rotate_character, obj_Player, 180],
	[cutscene_show_dialogue, "Adhila"],
	[cutscene_move_character, obj_Player, 248, 232],
	[cutscene_move_camera, obj_Player]
]