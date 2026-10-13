
// ================= STEP EVENT =================

timer_loading += 1;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Skip dengan keyboard
var is_skipped =
    keyboard_check_pressed(vk_enter) ||
    keyboard_check_pressed(vk_space);

// Skip dengan mouse
var is_clicked =
    mouse_check_button_pressed(mb_left) &&
    point_in_rectangle(
        mx, my,
        skip_x, skip_y,
        skip_x + skip_w,
        skip_y + skip_h
    );

if (is_skipped || is_clicked) {
    video_close();
    room_goto(next_room);
    exit;
}
