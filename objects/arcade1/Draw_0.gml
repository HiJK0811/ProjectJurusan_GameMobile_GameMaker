// ========================= DRAW EVENT =========================
draw_self(); // Menggambar sprite mesin arcade standar

// Pastikan variabel interact_range aman dibaca
var _range = variable_instance_exists(id, "interact_range") ? interact_range : 55;

// Cari player untuk pengecekan jarak visual
var _player = noone;
if (instance_exists(obj_Player)) {
    _player = instance_find(obj_Player, 0);
} else if (instance_exists(obj_player)) {
    _player = instance_find(obj_player, 0);
}

// Jika pemain dekat, tampilkan petunjuk tombol interaksi di atas mesin arcade
if (_player != noone && distance_to_object(_player) <= _range) {
    
    // Cek pengaman agar teks tidak muncul saat dialog/kuis easter egg aktif
    var _is_dialog_open = (variable_global_exists("dialog_active") && global.dialog_active) || instance_exists(obj_dialogBox);
    
    if (!_is_dialog_open) {
        var _text_x = x;
        var _text_y = y - 40; // Posisi teks di atas mesin arcade
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        
        // Efek bayangan teks agar kontras dan mudah dibaca
        draw_set_color(c_black);
        draw_text(_text_x + 1, _text_y + 1, "[Spasi] Periksa Arcade");
        
        // Warna teks utama kuning keemasan
        draw_set_color(make_color_rgb(255, 220, 130));
        draw_text(_text_x, _text_y, "[Spasi] Periksa Arcade");
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
    }
}