// ========================= STEP EVENT =========================
if (msg_timer > 0) msg_timer--;

// Buka/tutup dengan [J]
if (keyboard_check_pressed(ord("J"))) {
    if (global.journal_open) {
        global.journal_open  = false;
        global.dialog_active = false;   // lepaskan kunci player
    } else if (!global.dialog_active) { // jangan buka saat dialog NPC terbuka
        global.journal_open  = true;
        global.dialog_active = true;    // kunci pergerakan player
        scroll = 0;
    }
}

if (!global.journal_open) exit;

// Ganti tab
if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) {
    tab = 1 - tab;
    scroll = 0;
}

// Scroll
if (keyboard_check(vk_down)) scroll += 6;
if (keyboard_check(vk_up))   scroll = max(0, scroll - 6);

// Simpan / Muat
if (keyboard_check_pressed(ord("K"))) {
    save_game();
    msg_text  = "Progres tersimpan!";
    msg_timer = game_get_speed(gamespeed_fps) * 2;
}
if (keyboard_check_pressed(ord("L"))) {
    if (load_game()) {
        msg_text = "Progres dimuat!";
    } else {
        msg_text = "Belum ada save file.";
    }
    msg_timer = game_get_speed(gamespeed_fps) * 2;
}
