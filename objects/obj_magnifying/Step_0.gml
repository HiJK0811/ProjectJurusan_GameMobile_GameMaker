// ==========================================================
// STEP EVENT: obj_magnifying (OTOMATIS & ANTI-SANGKUT)
// ==========================================================

// 🔥 Cek apakah objek minigame sorting benar-benar sedang ada di room saat ini
var _sorting_index = asset_get_index("obj_minigame_sorting");
var _is_sorting_active = (_sorting_index != -1 && instance_exists(_sorting_index));

if (_is_sorting_active) {
    active = false;  
    visible = false; 
    
    with (obj_bekeners_parent) {
        if (!found) visible = false;
    }
    // Also hide bekener children if they exist and are not found
    var _bek_child_index = asset_get_index("obj_bekeners_cs");
    if (_bek_child_index != -1) {
        with (_bek_child_index) {
            if (!found) visible = false;
        }
    }
    exit; 
} else {
    visible = true; // Otomatis muncul normal di room eksplorasi!
}

// ... (lanjutan kode kaca pembesar seperti biasa di bawah)

// ==========================================================
// 2. KODE UTAMA KACA PEMBESAR
// ==========================================================

// Selalu mengikuti player (tracking)
if (instance_exists(asset_get_index("obj_Player"))) {
    x = obj_Player.x;
    y = obj_Player.y;
}

// Pesan sementara
if (msg_timer > 0) msg_timer--;

// Cooldown berjalan (tidak dijeda oleh dialog agar terasa natural)
if (cooldown > 0) cooldown--;

// Input toggle [F] - tetap bisa dipakai sebagai souvenir setelah egg_completed
if (keyboard_check_pressed(ord("F")) && !global.dialog_active) {
    if (variable_global_exists("egg_completed") && global.egg_completed && !active) {
        msg_text = "Semua Bekeners sudah ditemukan! Kaca pembesar jadi souvenir.";
        msg_timer = fps_ * 1.5;
    }
    if (active) {
        // Matikan manual -> masuk cooldown
        active   = false;
        cooldown = cd_max;
    } else if (cooldown > 0) {
        msg_text  = "Harap tunggu, sedang cooldown... (" + string_format(cooldown / fps_, 1, 1) + " dtk)";
        msg_timer = fps_ * 1.5;
    } else {
        active = true;
        timer  = dur_max;
    }
}

// Hitung mundur durasi aktif (dijeda saat dialog kuis terbuka biar adil)
if (active && !global.dialog_active) {
    timer--;
    if (timer <= 0) {
        active   = false;
        cooldown = cd_max;
        msg_text  = "Kaca pembesar kehabisan tenaga! Menunggu cooldown...";
        msg_timer = fps_ * 1.5;
    }
}

with (obj_bekeners_parent) {
    if (!variable_instance_exists(id, "discovered")) discovered = false;
    if (!variable_instance_exists(id, "found"))      found      = false;
    if (variable_global_exists("bekeners_collected") && bek_index < array_length(global.bekeners_collected) && global.bekeners_collected[bek_index]) {
        found = true;
    }
    if (found || (variable_global_exists("egg_started") && !global.egg_started)) {
        visible = false;
        continue;
    }
    var _is_visible = (other.active
        && (abs(x - other.x) <= other.zone_half)
        && (abs(y - other.y) <= other.zone_half));
    visible = _is_visible;
}