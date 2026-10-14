// ========================= DRAW GUI EVENT =========================

// --- 1. Safety Checks (Pengaman) ---
if (!variable_global_exists("quests") || !is_array(global.quests)) global.quests = [];
if (!variable_global_exists("bekeners_total")) global.bekeners_total = 7;
if (!variable_global_exists("bekeners_found")) global.bekeners_found = 0;
if (!variable_global_exists("bekeners_collected") || array_length(global.bekeners_collected) < global.bekeners_total) {
    global.bekeners_collected = array_create(global.bekeners_total, false);
}

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

// --- Ikon kecil pengingat journal (pojok kiri bawah) ---
if (!global.journal_open) {
    draw_set_alpha(0.72);
    draw_set_color(col_wood);
    draw_roundrect(16, _gh - 52, 120, _gh - 16, false);
    draw_set_alpha(1);
    draw_set_color(col_coffee);
    draw_roundrect(16, _gh - 52, 120, _gh - 16, true);
    draw_set_color(col_cream);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(68, _gh - 34, "[J] Journal");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    exit;
}

// ================= BUKU JOURNAL TERBUKA =================
var _bw = min(640, _gw - 60);
var _bh = min(460, _gh - 60);
var _bx = (_gw - _bw) / 2;
var _by = (_gh - _bh) / 2;

// Latar redup
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

// Sampul + halaman
draw_set_color(col_wood);
draw_roundrect(_bx - 8, _by - 8, _bx + _bw + 8, _by + _bh + 8, false);
draw_set_color(col_cream);
draw_roundrect(_bx, _by, _bx + _bw, _by + _bh, false);
draw_set_color(col_coffee);
draw_roundrect(_bx, _by, _bx + _bw, _by + _bh, true);

// --- Tab header ---
var _t0 = "   Quest   ";
var _t1 = "   Koleksi Bekeners   ";
var _tx = _bx + 16;
for (var t = 0; t < 2; t++) {
    var _label = (t == 0) ? _t0 : _t1;
    var _tw = string_width(_label) + 16;
    draw_set_color((tab == t) ? col_coffee : col_wood2);
    draw_roundrect(_tx, _by - 26, _tx + _tw, _by + 6, false);
    draw_set_color((tab == t) ? col_wood : col_cream);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_tx + _tw / 2, _by - 10, _label);
    _tx += _tw + 8;
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// ================= AREA ISI DENGAN SCISSOR =================
var _content_x = _bx + 20;
var _content_y = _by + 20;
var _content_w = _bw - 40;
var _content_h = _bh - 60; 

// Aktifkan pembatas agar teks tidak keluar kotak buku - scale ke window untuk fullscreen
var _win_w = window_get_width();
var _win_h = window_get_height();
var _sx = (_gw > 0) ? _win_w / _gw : 1;
var _sy = (_gh > 0) ? _win_h / _gh : 1;
gpu_set_scissor(_content_x * _sx, _content_y * _sy, _content_w * _sx, _content_h * _sy);

var _ix = _content_x + 10;
var _iy = _content_y + 15 - scroll;
var _iw = _content_w - 20;

if (tab == 0) {
    // ==================== TAB QUEST ====================
    var _n = array_length(global.quests);
    if (_n == 0) {
        draw_set_color(col_text);
        draw_text(_ix, _iy, "Belum ada quest. Coba ngobrol dengan orang-orang di sekitar...");
    }
    for (var i = 0; i < _n; i++) {
        var _q = global.quests[i];
        
        var _tag = (_q.qtype == "main") ? "[MAIN]" : "[SIDE]";
        draw_set_color(_q.completed ? col_done : col_gold);
        draw_text(_ix, _iy, _tag + " " + _q.name + (_q.completed ? "  (Selesai)" : ""));
        _iy += 24;
        
        draw_set_color(col_text);
        draw_text_ext(_ix + 12, _iy, _q.desc, 18, _iw - 12);
        _iy += string_height_ext(_q.desc, 18, _iw - 12) + 6;
        
        for (var s = 0; s < array_length(_q.steps); s++) {
            var _st = _q.steps[s];
            draw_set_color(_st.done ? col_done : col_text);
            var _box = _st.done ? "[v] " : "[ ] ";
            draw_text(_ix + 20, _iy, _box + _st.txt);
            _iy += 22;
        }
        _iy += 14;
    }
} else {
    // ================= TAB KOLEKSI BEKENERS =================
    draw_set_color(col_gold);
    draw_text(_ix, _iy, "Terkumpul: " + string(global.bekeners_found) + " / " + string(global.bekeners_total));
    _iy += 30;

    for (var b = 0; b < global.bekeners_total; b++) {
        var _got  = (b < array_length(global.bekeners_collected)) ? global.bekeners_collected[b] : false;
        var _name = (_got && variable_global_exists("bekeners_data") && is_array(global.bekeners_data) && array_length(global.bekeners_data) > b) ? global.bekeners_data[b].name : "???";
        // Easter egg: tampilkan edukasi Bekeners sebagai lore saat sudah ditemukan
        var _lore = "Belum ditemukan. Teruslah mencari dengan Kaca Pembesar Logika...";
        if (_got && variable_global_exists("bekeners_data") && is_array(global.bekeners_data) && array_length(global.bekeners_data) > b
        && variable_struct_exists(global.bekeners_data[b], "edu")) {
            _lore = global.bekeners_data[b].edu;
        }

        draw_set_color(_got ? col_gold : col_wood2);
        draw_text(_ix, _iy, string(b + 1) + ". " + _name);
        _iy += 22;
        
        draw_set_color(_got ? col_text : col_wood2);
        draw_text_ext(_ix + 16, _iy, _lore, 18, _iw - 16);
        _iy += string_height_ext(_lore, 18, _iw - 16) + 14;
    }
}

// 🔥 RESET SCISSOR KEMBALI KE UKURAN LAYAR PENUH
gpu_set_scissor(0, 0, window_get_width(), window_get_height());

// ==========================================================

// --- Footer kontrol ---
draw_set_color(col_wood2);
draw_roundrect(_bx, _by + _bh - 32, _bx + _bw, _by + _bh, false);
draw_set_color(col_cream);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_bx + _bw / 2, _by + _bh - 16, "[J] Tutup   [<-][->] Tab   [Atas/Bawah] Scroll   [K] Simpan   [L] Muat");

// --- Pesan simpan/muat ---
if (msg_timer > 0) {
    draw_set_color(col_gold);
    draw_text(_bx + _bw / 2, _by + _bh + 22, msg_text);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);