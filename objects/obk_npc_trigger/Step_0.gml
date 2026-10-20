// 🔥 1. JIKA JURNAL SEDANG TERBUKA, ABAIKAN SEMUA INTERAKSI TRIGGER
if (variable_global_exists("journal_open") && global.journal_open) {
    exit; 
}

// 2. Cek apakah trigger NPC ini sudah pernah diselesaikan sebelumnya
if (variable_struct_exists(global.played_cutscenes, cutscene_id)) {
    instance_destroy();
    exit;
}

// 3. Tentukan jarak interaksi dengan player (misalnya dalam radius 48 piksel)
var _dist = point_distance(x, y, obj_Player.x, obj_Player.y);
var _interact_radius = 48; 

// 4. Jika player berada di dekat trigger NPC DAN menekan tombol interaksi (Spasi)
if (_dist <= _interact_radius && keyboard_check_pressed(vk_space)) {
    
    // Simpan ke memori global agar hanya bisa dilakukan sekali (jika diinginkan)
    global.played_cutscenes[$ cutscene_id] = true;
    
    // 🔥 PANGGIL FUNGSI UNIVERSAL UNTUK UPDATE QUEST
    update_quest_step_universal(quest_id, step_index); 
    
    show_debug_message("Quest step dari obk_npc_trigger berhasil diupdate!");
    
    // Hancurkan trigger setelah interaksi selesai
    instance_destroy();
}