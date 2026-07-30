// ========================= STEP EVENT =========================
// Selalu mengikuti player (tracking)
if (instance_exists(obj_player)) {
    x = obj_player.x;
    y = obj_player.y;
}

// Pesan sementara
if (msg_timer > 0) msg_timer--;

// Cooldown berjalan (tidak dijeda oleh dialog agar terasa natural)
if (cooldown > 0) cooldown--;

// Input toggle [F]
if (keyboard_check_pressed(ord("F")) && !global.dialog_active && !global.egg_completed) {
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
    // Pengaman: kalau Create parent tidak terwarisi, lengkapi di sini
    if (!variable_instance_exists(id, "discovered")) discovered = false;
    if (!variable_instance_exists(id, "found"))      found      = false;

    if (!found) {
        if (other.active
        && (abs(x - other.x) <= other.zone_half)
        && (abs(y - other.y) <= other.zone_half)) {
            discovered = true;
        }
        visible = discovered;
    }
}