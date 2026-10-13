// ========================= STEP EVENT (OBJ_JOURNAL) =========================

// 🔥 SAFETY CHECK & VARIABEL PENGAMAN
if (!variable_global_exists("journal_open"))    global.journal_open = false;
if (!variable_global_exists("journal_unlocked"))  global.journal_unlocked = true;
if (!variable_global_exists("dialog_active"))     global.dialog_active = false;
if (!variable_global_exists("cutscene_active"))   global.cutscene_active = false;
if (!variable_global_exists("game_paused"))       global.game_paused = false;

var is_restricted_room = false;
if (room == room_input_data || room == room_minigame_sorting) {
    is_restricted_room = true;
    if (global.journal_open) {
        global.journal_open = false;
        global.dialog_active = false;
    }
}

var cutscene_locked = global.cutscene_active;

if (msg_timer > 0) msg_timer--;

// 1. BUKA / TUTUP DENGAN TOMBOL [J] ATAU [ESC]
if (global.journal_open) {
    if (keyboard_check_pressed(ord("J")) || keyboard_check_pressed(vk_escape)) {
        global.journal_open  = false;
        global.dialog_active = false;   
    }
} 
else {
    if (keyboard_check_pressed(ord("J"))) {
        if (!is_restricted_room && !global.dialog_active && !cutscene_locked && global.journal_unlocked) { 
            global.journal_open  = true;
            global.dialog_active = true;    
            scroll = 0;
        }
    }
}

// 🔥 KUNCI UTAMA: Set variabel global pembeku pergerakan player
if (global.journal_open) {
    global.game_paused = true; // Tandai game sedang dipause oleh jurnal
} else {
    // Jangan ubah jika sedang dialog/cutscene lain, tapi jika karena jurnal, lepaskan:
    if (global.game_paused) global.game_paused = false;
}

// Jika jurnal tertutup, hentikan proses step di sini
if (!global.journal_open) exit;

// ================= KONTROL DALAM JURNAL =================

// Ganti tab (Kiri / Kanan atau Q / E)
if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("E"))) {
    tab = 1 - tab;
    scroll = 0;
}

// Scroll Tampilan (Atas / Bawah)
if (keyboard_check(vk_down)) scroll += 6;
if (keyboard_check(vk_up))    scroll = max(0, scroll - 6);

// Simpan / Muat Cepat
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