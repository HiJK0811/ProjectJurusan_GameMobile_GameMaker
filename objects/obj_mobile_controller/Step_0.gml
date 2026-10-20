// Cek perubahan ukuran room secara dinamis
if (game_width != room_width || game_height != room_height || !surface_exists(game_surface)) {
    game_width  = room_width;
    game_height = room_height;
    if (surface_exists(game_surface)) {
        surface_free(game_surface);
    }
    game_surface = surface_create(game_width, game_height);
}

// Reset input virtual setiap frame
global.v_up    = false;
global.v_down  = false;
global.v_left  = false;
global.v_right = false;
global.v_a     = false;
global.v_b     = false;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Posisi tombol Game Boy di bagian bawah (sesuai koordinat draw GUI)
var dpad_cx  = gui_w * 0.25;
var dpad_cy  = gui_h * 0.75;
var dpad_r   = 70;

var btn_a_cx = gui_w * 0.80;
var btn_a_cy = gui_h * 0.73;
var btn_a_r  = 45;

var btn_b_cx = gui_w * 0.60;
var btn_b_cy = gui_h * 0.77;
var btn_b_r  = 45;

// Deteksi multi-touch sentuhan layar HP
for (var i = 0; i < 5; i++) {
    if (device_mouse_check_button(i, mb_left)) {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

        // Deteksi D-Pad (Area lingkaran D-Pad)
        if (point_distance(mx, my, dpad_cx, dpad_cy) < dpad_r * 1.5) {
            if (mx < dpad_cx - 15) global.v_left  = true;
            if (mx > dpad_cx + 15) global.v_right = true;
            if (my < dpad_cy - 15) global.v_up    = true;
            if (my > dpad_cy + 15) global.v_down  = true;
        }

        // Deteksi Tombol A
        if (point_distance(mx, my, btn_a_cx, btn_a_cy) < btn_a_r) {
            global.v_a = true;
        }

        // Deteksi Tombol B
        if (point_distance(mx, my, btn_b_cx, btn_b_cy) < btn_b_r) {
            global.v_b = true;
        }
    }
}