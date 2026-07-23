// --- Gabungan Kode Hiasan & Logika Hilang ---

if (menu_aktif) {
    // 1. Tentukan Ukuran dan Posisi Panel
    var _panel_w = 600; 
    var _panel_h = 320; 
    var _menu_x = room_width / 2;
    var _menu_y = room_height / 2;

    var _x1 = _menu_x - (_panel_w / 2);
    var _y1 = _menu_y - (_panel_h / 2);
    var _x2 = _menu_x + (_panel_w / 2);
    var _y2 = _menu_y + (_panel_h / 2);

    // --- BAGIAN 1: Latar Belakang Transparan ---
    draw_set_alpha(0.6);
    draw_set_color(c_black);
    draw_rectangle_color(_x1, _y1, _x2, _y2, c_black, c_black, make_color_rgb(0, 0, 40), make_color_rgb(0, 0, 40), false);
    draw_set_alpha(1);

    // --- BAGIAN 2: Glow Border Sci-Fi ---
    var _border_color = make_color_rgb(0, 255, 255);
    draw_set_color(_border_color);
    for (var i = 1; i <= 3; i++) {
        draw_set_alpha(0.3 / i);
        var _offset = 1 * i;
        draw_rectangle(_x1 - _offset, _y1 - _offset, _x2 + _offset, _y2 + _offset, true);
    }
    draw_set_alpha(1);
    draw_rectangle(_x1, _y1, _x2, _y2, true);

    // --- BAGIAN 3: Hiasan Sudut ---
    var _corner_size = 15;
    draw_line(_x1, _y1, _x1 + _corner_size, _y1); // Atas Kiri
    draw_line(_x1, _y1, _x1, _y1 + _corner_size);
    draw_line(_x2, _y1, _x2 - _corner_size, _y1); // Atas Kanan
    draw_line(_x2, _y1, _x2, _y1 + _corner_size);
    draw_line(_x1, _y2, _x1 + _corner_size, _y2); // Bawah Kiri
    draw_line(_x1, _y2, _x1, _y2 - _corner_size);
    draw_line(_x2, _y2, _x2 - _corner_size, _y2); // Bawah Kanan
    draw_line(_x2, _y2, _x2, _y2 - _corner_size);

    // --- BAGIAN 4: Teks Menu ---
    draw_set_font(font_hanoi_game_judul); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_aqua);
    draw_text(_menu_x, _y1 + 80, "-- Select Difficulty --");

    var _start_y = _y1 + 140; // Disesuaikan agar lebih ke tengah
    var _spacing = 40;

    for (var i = 0; i < array_length(pilihan); i++) {
        var _txt_y = _start_y + (i * _spacing);
        var _base_txt = pilihan[i]; // Ambil nama asli (Easy, Medium, Hard)
        
        // Jika level ini sudah tamat, tambahkan label [DONE]
        if (global.hanoi_beaten[i] == true) {
            _base_txt += " [DONE]";
        }
        
        if (index_pilih == i) {
            var _txt = "> " + _base_txt + " <";
            draw_set_color(c_yellow);
            
            // Efek Glow Teks
            for (var t = 1; t <= 2; t++) {
                draw_set_alpha(0.4 / t);
                draw_text(_menu_x + (1*t), _txt_y + (1*t), _txt);
            }
            draw_set_alpha(1);
            draw_text(_menu_x, _txt_y, _txt);
            
        } else {
            // Jika sudah tamat tapi tidak dipilih, warnanya hijau. Jika belum, putih/aqua.
            if (global.hanoi_beaten[i] == true) {
                draw_set_color(c_lime); 
            } else {
                draw_set_color(c_white); 
            }
            draw_text(_menu_x, _txt_y, _base_txt);
        }
    }
}