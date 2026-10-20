
// ================= CREATE EVENT =================

next_room = room_explore_checkIn;

timer_loading = 0;
video_started = false;
video_finished = false;

// Tutup video lama
if (video_get_status() != video_status_closed) {
    video_close();
}

// Buka video dari Included Files
video_open("Intro_prolouge_gamifikasi.mp4");

show_debug_message("[VIDEO] Open dipanggil");

// Tombol Skip
skip_w = sprite_get_width(spr_skip_button);
skip_h = sprite_get_height(spr_skip_button);

skip_x = display_get_gui_width() - skip_w - 32;
skip_y = display_get_gui_height() - skip_h - 32;
