draw_self();

// ===== Notif interaksi ala Genshin =====
if (!global.dialog_active && instance_exists(obj_player)
&&  point_distance(x, y, obj_player.x, obj_player.y) <= interact_range) {

    var _bob = sin(current_time / 300) * 2;
    var _px  = x;
    var _py  = y - sprite_height - 16 + _bob;

    var _label = "Ngobrol";
    var _nama  = "Adhila";
    var _w = max(string_width(_label), string_width(_nama)) + 58;
    var _h = 40;

    // Panel gelap semi transparan (khas Genshin)
    draw_set_alpha(0.72);
    draw_set_color(make_color_rgb(30, 30, 40));
    draw_roundrect(_px - _w/2, _py - _h/2, _px + _w/2, _py + _h/2, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(255, 255, 255));
    draw_roundrect(_px - _w/2, _py - _h/2, _px + _w/2, _py + _h/2, true);

    // Lingkaran tombol [F]
    var _kx = _px - _w/2 + 20;
    draw_set_color(c_white);
    draw_circle(_kx, _py, 12, false);
    draw_set_color(make_color_rgb(30, 30, 40));
    draw_circle(_kx, _py, 12, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_kx, _py, "F");

    // Teks: nama (kecil, emas) + aksi
    draw_set_halign(fa_left);
    draw_set_color(make_color_rgb(255, 215, 130));
    draw_text(_kx + 20, _py - 9, _nama);
    draw_set_color(c_white);
    draw_text(_kx + 20, _py + 9, _label);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}