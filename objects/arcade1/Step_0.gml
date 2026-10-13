// ========================= STEP EVENT =========================

if (!variable_instance_exists(id, "interact_range")) {
    interact_range = 55;
}

// 1. Pengaman dialog aktif
if (instance_exists(obj_cutscene) || instance_exists(obj_dialogBox) || (variable_global_exists("dialog_active") && global.dialog_active)) {
    exit;
}

// 2. Cari player
var _player = noone;
if (instance_exists(obj_Player)) {
    _player = instance_find(obj_Player, 0);
} else if (instance_exists(obj_player)) {
    _player = instance_find(obj_player, 0);
}

// 3. Cek jarak dan interaksi
if (_player != noone) {
    var _dist = distance_to_object(_player);
    
    if (_dist <= interact_range) {
        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            if (script_exists(dialog_show)) {
                
                // 🔥 Perbaikan pengecekan variabel instance arcade_text
                var _pages;
                if (variable_instance_exists(id, "arcade_text")) {
                    _pages = arcade_text;
                } else {
                    _pages = [
                        "Mesin Arcade retro ini sepertinya menarik banget",
                        "Layarnya menampilkan tulisan 'Insert Coin to Play'.",
                        "aku coba masukin coin deh.....",
                        "ahh.....aku gak ada coin sayang sekali :( lain kali saja deh"
                    ];
                }
                
                var _options = [
                    ["Tutup", "close"]
                ];
                
                dialog_show("Mesin Arcade", _pages, _options);
            }
        }
    }
}