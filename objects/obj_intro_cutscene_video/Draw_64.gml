var _w = display_get_gui_width();
var _h = display_get_gui_height();

// latar hitam
draw_set_color(c_black);
draw_rectangle(0, 0, _w, _h, false);
draw_set_color(c_white);

// gambar video full memenuhi layar
var _v = video_draw();
if (_v[0] == 0)
{
    var _tex = _v[1];
    draw_primitive_begin_texture(pr_trianglestrip, _tex);
    draw_vertex_texture(0,  0,  0, 0);
    draw_vertex_texture(_w, 0,  1, 0);
    draw_vertex_texture(0,  _h, 0, 1);
    draw_vertex_texture(_w, _h, 1, 1);
    draw_primitive_end();
}

// tombol skip di atas video
draw_sprite(spr_skip_button, 0, skip_x, skip_y);