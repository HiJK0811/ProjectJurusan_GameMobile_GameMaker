var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// 1. TENTUKAN AREA MONITOR ATAS (50% dari layar HP)
var max_monitor_h = gui_h * 0.50; 

// 2. GUNAKAN SKALA YANG PROPORSIONAL AGAR TIDAK KEGEDEAN / KEKECILAN
var scale_x = gui_w / room_width;
var scale_y = max_monitor_h / room_height;
var zoom_scale = max(scale_x, scale_y); // Menggunakan max agar memenuhi layar atas dengan pas

var target_w = room_width * zoom_scale;
var target_h = room_height * zoom_scale;

// 3. BUAT / SESUAIKAN SURFACE 
var surf_w = room_width;
var surf_h = room_height;

if (!surface_exists(game_surface)) {
    game_surface = surface_create(surf_w, surf_h);
}

if (surface_get_width(game_surface) != surf_w || surface_get_height(game_surface) != surf_h) {
    surface_free(game_surface);
    game_surface = surface_create(surf_w, surf_h);
}

// Rekam tampilan game asli ke surface
surface_set_target(game_surface);
draw_clear(c_black);
if (surface_exists(application_surface)) {
    draw_surface(application_surface, 0, 0);
}
surface_reset_target();

// 4. POSISIKAN DI TENGAH MONITOR ATAS
var draw_x = (gui_w - target_w) / 2;
var draw_y = (max_monitor_h - target_h) / 2;

// Simpan koordinat untuk sentuhan
global.game_draw_x = draw_x;
global.game_draw_y = draw_y;
global.game_draw_w = target_w;
global.game_draw_h = target_h;

// Gambar layar game hasil zoom
draw_surface_stretched(game_surface, draw_x, draw_y, target_w, target_h);

// 5. GARIS PEMBATAS KONSOL (Tepat di 50%)
draw_set_color(c_dkgrey);
draw_line_width(0, max_monitor_h, gui_w, max_monitor_h, 4);

// 6. TOMBOL GAME BOY DI BAGIAN BAWAH
var dpad_cx  = gui_w * 0.25;
var dpad_cy  = gui_h * 0.75;
var dpad_r   = 65;

var btn_a_cx = gui_w * 0.80;
var btn_a_cy = gui_h * 0.73;
var btn_a_r  = 35;

var btn_b_cx = gui_w * 0.60;
var btn_b_cy = gui_h * 0.77;
var btn_b_r  = 35;

draw_set_alpha(0.6);

// Gambar D-Pad
draw_set_color(c_white);
draw_circle(dpad_cx, dpad_cy, dpad_r, false);

// Gambar Tombol A
draw_set_color(c_red);
draw_circle(btn_a_cx, btn_a_cy, btn_a_r, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(btn_a_cx, btn_a_cy, "A");

// Gambar Tombol B
draw_set_color(c_blue);
draw_circle(btn_b_cx, btn_b_cy, btn_b_r, false);
draw_text(btn_b_cx, btn_b_cy, "B");

draw_set_alpha(1.0);