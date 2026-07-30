var _w = display_get_gui_width();
var _h = display_get_gui_height();
draw_text(20,20,string(video_get_status()));
draw_set_color(c_black);
draw_rectangle(0, 0, _w, _h, false);
draw_set_color(c_white);

var _status = video_get_status();

if (_status == video_status_playing)
{
    var _v = video_draw();
    if (_v[0] == 0 && _v[1] != -1)
    {
        var _tex = _v[1];
        draw_primitive_begin_texture(pr_trianglestrip, _tex);
        draw_vertex_texture(0,  0,  0, 0);
        draw_vertex_texture(_w, 0,  1, 0);
        draw_vertex_texture(0,  _h, 0, 1);
        draw_vertex_texture(_w, _h, 1, 1);
        draw_primitive_end();
    }
}
else if (_status == video_status_preparing)
{
    draw_text(32, 32, "Loading video...");
}
else
{
    draw_text(32, 32, "Video gagal dibuka / sudah tertutup (status: " + string(_status) + ")");
}

draw_sprite(spr_skip_button, 0, skip_x, skip_y);