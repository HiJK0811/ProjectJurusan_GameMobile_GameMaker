
// ================= DRAW GUI EVENT =================

var _w = display_get_gui_width();
var _h = display_get_gui_height();

// ================= BACKGROUND =================
draw_set_color(c_black);
draw_rectangle(0, 0, _w, _h, false);
draw_set_color(c_white);

// ================= RENDER VIDEO =================
var _status = video_get_status();

if (_status == video_status_playing) {
    var _v = video_draw();

    if (is_array(_v) && array_length(_v) >= 2) {
        var _v_status = _v[0];
        var _v_surf = _v[1];

        if (_v_status == 0 && surface_exists(_v_surf)) {
            draw_surface_stretched(
                _v_surf,
                0, 0,
                _w, _h
            );
        }
    }
}

// ================= TOMBOL SKIP =================
draw_sprite(
    spr_skip_button,
    0,
    skip_x,
    skip_y
);

// ================= DEBUG =================
draw_set_color(c_yellow);
draw_text(
    20, 20,
    "Status Video: " + string(_status)
);

draw_set_color(c_white);
