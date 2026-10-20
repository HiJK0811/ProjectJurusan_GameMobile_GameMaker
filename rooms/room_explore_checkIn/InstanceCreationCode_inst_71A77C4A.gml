trigger_scene_info = [
    [cutscene_move_camera, 530, 319],
    [cutscene_move_character, obj_Player, 525, 338],
    [cutscene_rotate_character, obj_Player, 90],
    [cutscene_show_dialogue, "Adhoc - intro"],
    [cutscene_move_character, obj_Player, 528, 265],
    [cutscene_move_camera, obj_Player],
    
    // Panggil fungsi kustom yang sudah dibuat
    [cutscene_go_to_input, room_input_data]
];