draw_self();

// --- DRAW MOVE COUNTER ---
draw_set_color(c_white);
draw_set_font(font_hanoi_game_subjudul); 
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(20, 20, "Moves: " + string(moves_made));

if (game_selesai) {
    var _mid_x = room_width / 2;
    var _mid_y = room_height / 2;
    
    // 1. Overlay Gelap
    draw_set_alpha(pesan_alpha * 0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    
    // 2. Background Bar Transparan (Centered and Expanded)
    draw_set_alpha(pesan_alpha * 0.8);
    draw_set_color(make_color_rgb(0, 20, 40)); 
    draw_rectangle(0, _mid_y - 100, room_width, _mid_y + 140, false); // Taller background bar
    
    // 3. Garis Border Neon
    draw_set_color(c_aqua);
    draw_line_width(0, _mid_y - 100, room_width, _mid_y - 100, 2);
    draw_line_width(0, _mid_y + 140, room_width, _mid_y + 140, 2);   
    
    // --- APPLY ALPHA TO EVERYTHING BELOW ---
    draw_set_alpha(pesan_alpha);
    
    // 4. Teks Utama (Shifted Up)
    draw_set_font(font_hanoi_game_judul); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_color(c_yellow);
    draw_text_transformed(_mid_x, _mid_y - 40, "MISSION COMPLETE", 1.5, 1.5, 0); // Shifted up
    
    draw_set_color(c_white);
    draw_set_font(font_hanoi_game_subjudul); 
    draw_text_transformed(_mid_x, _mid_y + 5, "-- Headed to next task --", 0.7, 0.7, 0); // Shifted up

    // 5. GAMBAR TOMBOL KELUAR (No longer restricted by alpha = 1)
    var _btn_left_x1 = _mid_x - 170;   var _btn_y1 = _mid_y + 40;
    var _btn_left_x2 = _mid_x - 10;    var _btn_y2 = _mid_y + 100;
    
    var _btn_right_x1 = _mid_x + 10;   var _btn_y1 = _mid_y + 40;
    var _btn_right_x2 = _mid_x + 170;  var _btn_y2 = _mid_y + 100;
    
    var _mx = mouse_x;
    var _my = mouse_y;
    
    // --- DRAW LEFT BUTTON (Menu) ---
    if (point_in_rectangle(_mx, _my, _btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2)) {
        draw_set_color(c_silver);
    } else {
        draw_set_color(c_dkgray);
    }
    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, false);
    
    draw_set_color(c_white);
    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, true);
    draw_text(_btn_left_x1 + 80, _mid_y + 70, "Menu");

    // --- DRAW RIGHT BUTTON (Return to Game) ---
    if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
        draw_set_color(c_aqua); 
    } else {
        draw_set_color(c_teal); 
    }
    draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, false);
    
    draw_set_color(c_white);
    draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, true);
    draw_text(_btn_right_x1 + 80, _mid_y + 70, "Return to Game");
    
    // Reset properties
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}

//// Teks Instruksi Keluar
//// Teks Instruksi Kembali
//if (game_selesai && pesan_alpha >= 1) {
//    draw_set_color(c_lime);
//    var _blink = (sin(current_time / 150) + 1) / 2;
//    draw_set_alpha(_blink);
    
//    // Sesuaikan kata-katanya agar pemain tahu mereka akan pindah ruangan
//    draw_text(_mid_x, _mid_y + 80, "[ Press Space or Enter or Tap to Continue ]");
    
//    draw_set_alpha(1);
//}

// --- GAMBAR TOMBOL KELUAR ---
//if (game_selesai && pesan_alpha >= 1) {
//    var _btn_left_x1 = _mid_x - 170;   var _btn_y1 = _mid_y + 40;
//    var _btn_left_x2 = _mid_x - 10;    var _btn_y2 = _mid_y + 100;
    
//    var _btn_right_x1 = _mid_x + 10;   var _btn_y1 = _mid_y + 40;
//    var _btn_right_x2 = _mid_x + 170;  var _btn_y2 = _mid_y + 100;
    
//    var _mx = mouse_x;
//    var _my = mouse_y;
    
//    draw_set_font(font_hanoi_game_subjudul);
//    draw_set_halign(fa_center);
//    draw_set_valign(fa_middle);

//    // --- DRAW LEFT BUTTON (Menu) ---
//    if (point_in_rectangle(_mx, _my, _btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2)) {
//        draw_set_color(c_silver);
//    } else {
//        draw_set_color(c_dkgray);
//    }
//    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, false);
    
//    draw_set_color(c_white);
//    draw_rectangle(_btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2, true);
//    draw_text(_btn_left_x1 + 80, _mid_y + 70, "Menu");

//    // --- DRAW RIGHT BUTTON (Return to Game) ---
//    if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
//        draw_set_color(c_aqua); 
//    } else {
//        draw_set_color(c_teal); 
//    }
//    draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, false);
    
//    draw_set_color(c_white);
//    draw_rectangle(_btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2, true);
//    draw_text(_btn_right_x1 + 80, _mid_y + 70, "Return to Game");
    
//    // Reset alignment
//    draw_set_halign(fa_left);
//    draw_set_valign(fa_top);
//}