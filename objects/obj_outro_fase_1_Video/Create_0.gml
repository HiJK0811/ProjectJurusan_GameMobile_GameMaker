video_open("Intro_prolouge_gamifikasi.mp4")
// nama file di Included Files

next_room = room_explore_mainRoom;            // GANTI: room tujuan setelah video selesai

// posisi tombol skip (pojok kanan bawah)
skip_w = sprite_get_width(spr_skip_button);
skip_h = sprite_get_height(spr_skip_button);
skip_x = display_get_gui_width()  - skip_w - 32;
skip_y = display_get_gui_height() - skip_h - 32;