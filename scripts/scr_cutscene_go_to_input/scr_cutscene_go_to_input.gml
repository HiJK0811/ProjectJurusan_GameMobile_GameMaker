function cutscene_go_to_input(_target_room) {
    // 🔥 Sembunyikan player agar tidak ikut terbawa ke room paspor
    if (instance_exists(obj_Player)) {
        obj_Player.visible = false;
    }
    
    global.previous_room = room;
    scene_index++; // Agar cutscene tidak stuck
    room_goto(_target_room);
}