if (menu_aktif) {
    if (keyboard_check_pressed(vk_up)) index_pilih = max(0, index_pilih - 1);
    if (keyboard_check_pressed(vk_down)) index_pilih = min(2, index_pilih + 1);
    
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        var _jumlah = 3 + index_pilih; // 0=3, 1=4, 2=5
        
        // Perintah Claw untuk memulai game dengan jumlah box tersebut
        with(obj_clawf) {
            jumlah_box_target = _jumlah;
            event_user(0); // Panggil alarm/fungsi setup box
        }
        
        menu_aktif = false;
    }
}