draw_self();

if (game_selesai) {
	var _panel_w = 600; 
    var _panel_h = 320; 
    var _mid_x = room_width / 2;
    var _mid_y = room_height / 2;
    
    // 1. Gambar Overlay Gelap (Supaya fokus ke tulisan)
    draw_set_alpha(pesan_alpha * 0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    
    // 2. Gambar Background Bar Transparan di Tengah
    draw_set_alpha(pesan_alpha * 0.8);
    draw_set_color(make_color_rgb(0, 20, 40)); // Biru sangat tua
    draw_rectangle(0, _mid_y - 50, room_width, _mid_y + 50, false);
    
    // 3. Garis Border Neon (Atas & Bawah)
    draw_set_color(c_aqua);
    draw_line_width(0, _mid_y - 50, room_width, _mid_y - 50, 2);
    draw_line_width(0, _mid_y + 50, room_width, _mid_y + 50, 2);
    
    // 4. Gambar Teks
    draw_set_alpha(pesan_alpha);
    draw_set_font(font_hanoi_game_judul); // Gunakan font Sci-Fi kamu
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Teks Utama (Mission Complete)
    draw_set_color(c_blue);
    draw_text_transformed(_mid_x, _mid_y - 15, "MISSION COMPLETE", 1.5, 1.5, 0);
    
    // Teks Sub (Headed to next task)
    draw_set_color(c_yellow);
    draw_set_font(font_hanoi_game_subjudul); // Gunakan font standar yang lebih kecil atau font khusus lain
    draw_text_transformed(_mid_x, _mid_y + 25, "-- Headed to next task --", 0.7, 0.7, 0);

    draw_set_alpha(1); // Reset alpha
}

// Teks Instruksi Keluar
// Teks Instruksi Kembali
if (game_selesai && pesan_alpha >= 1) {
    draw_set_color(c_lime);
    var _blink = (sin(current_time / 150) + 1) / 2;
    draw_set_alpha(_blink);
    
    // Sesuaikan kata-katanya agar pemain tahu mereka akan pindah ruangan
    draw_text(_mid_x, _mid_y + 80, "[ Press Space or Tap to Continue ]");
    
    draw_set_alpha(1);
}