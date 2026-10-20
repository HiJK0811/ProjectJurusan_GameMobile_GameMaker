/// =====================================================================
/// obj_adhila
/// Sprite : spr_adhila_idle
/// NPC alumni BINUS jurusan Computer Science - Software Engineering
/// yang sedang melakukan kegiatan promosi. Interaksi: dekati + tekan [E].
/// =====================================================================

// ========================= CREATE EVENT =========================
sprite_index   = spr_adhila_idle;
interact_range = 48;   // jarak interaksi (pixel)

// ========================= STEP EVENT =========================
if (global.dialog_active) exit;
if (!instance_exists(obj_player)) exit;

var _near = (point_distance(x, y, obj_player.x, obj_player.y) <= interact_range);

if (_near && keyboard_check_pressed(ord("E"))) {
    // Quote acak dari data bank sebelum masuk ke pilihan obrolan
    var _q     = global.adhila_quotes[irandom(array_length(global.adhila_quotes) - 1)];
    var _intro = [
        "\"" + _q + "\"",
        "Eh, halo! Maaf, aku suka bergumam sendiri, hehe. Aku Adhila, alumni BINUS jurusan Computer Science - Software Engineering.",
        "Aku lagi bantu kegiatan promosi kampus di sini. Ada yang mau kamu obrolin?"
    ];
    dialog_show("Adhila", _intro, scr_adhila_menu());
}

// ========================= DRAW EVENT =========================
draw_self();

// Petunjuk interaksi melayang di atas kepala
if (!global.dialog_active && instance_exists(obj_player)
&&  point_distance(x, y, obj_player.x, obj_player.y) <= interact_range) {
    var _bob = sin(current_time / 250) * 2;
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_black);
    draw_text(x + 1, y - sprite_height - 7 + _bob, "[E] Ngobrol");
    draw_set_color(c_white);
    draw_text(x, y - sprite_height - 8 + _bob, "[E] Ngobrol");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
