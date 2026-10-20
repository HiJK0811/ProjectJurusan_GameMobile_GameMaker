// =========================================
// STEP EVENT: obj_holograficboard_f
// =========================================

// 🔥 Pengaman wajib agar variabel global.archive_open tidak error jika belum ada
if (!variable_global_exists("archive_open")) {
    global.archive_open = false;
}

// 1. Cek apakah ada cutscene atau kotak dialog aktif
if (instance_exists(obj_cutscene) || instance_exists(obj_dialogBox) || (variable_global_exists("dialog_active") && global.dialog_active)) {
    exit;
}

// 2. Cari instance player secara akurat di room
var _player = noone;
if (instance_exists(obj_Player)) {
    _player = instance_find(obj_Player, 0);
} else if (instance_exists(obj_player)) {
    _player = instance_find(obj_player, 0);
}

if (_player != noone) {
    // Menggunakan distance_to_object agar akurat dari tepi objek (aman meskipun origin di top-left)
    var _dist = distance_to_object(_player);
    
    // Jika pemain berada dalam radius dekat papan arsip (misal <= 45 piksel dari tepi)
    if (_dist <= 45) {
        
        // Tekan Spasi, Enter, atau E untuk membuka arsip
        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            if (!instance_exists(obj_archive) && !global.archive_open) {
                global.archive_open = true;
                instance_create_depth(0, 0, -15000, obj_archive);
                show_debug_message("ARSIP BERHASIL DIBUKA!");
            }
        }
    }
}