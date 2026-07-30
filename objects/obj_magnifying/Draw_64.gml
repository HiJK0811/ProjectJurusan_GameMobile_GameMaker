// ========================= DRAW GUI EVENT =========================
var _gw = display_get_gui_width();

// Progress berburu
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(21, 17, "Bekeners: " + string(global.bekeners_found) + " / " + string(global.bekeners_total));
draw_set_color(c_white);
draw_text(20, 16, "Bekeners: " + string(global.bekeners_found) + " / " + string(global.bekeners_total));

// Bar durasi / status cooldown
var _bx = 20, _by = 42, _bw = 200, _bh = 14;
draw_set_color(c_black);
draw_rectangle(_bx - 1, _by - 1, _bx + _bw + 1, _by + _bh + 1, false);

if (active) {
    draw_set_color(make_color_rgb(70, 50, 30));
    draw_rectangle(_bx, _by, _bx + _bw, _by + _bh, false);
    draw_set_color(make_color_rgb(255, 200, 90));
    draw_rectangle(_bx, _by, _bx + _bw * (timer / dur_max), _by + _bh, false);
    draw_set_color(c_white);
    draw_text(_bx + _bw + 10, _by - 2, string(ceil(timer / fps_)) + " dtk");
} else if (cooldown > 0) {
    draw_set_color(make_color_rgb(60, 60, 60));
    draw_rectangle(_bx, _by, _bx + _bw, _by + _bh, false);
    draw_set_color(make_color_rgb(140, 160, 255));
    draw_rectangle(_bx, _by, _bx + _bw * (1 - cooldown / cd_max), _by + _bh, false);
    draw_set_color(c_white);
    draw_text(_bx + _bw + 10, _by - 2, "Cooldown...");
} else {
    draw_set_color(make_color_rgb(50, 70, 50));
    draw_rectangle(_bx, _by, _bx + _bw, _by + _bh, false);
    draw_set_color(c_white);
    draw_text(_bx + _bw + 10, _by - 2, "[F] Nyalakan kaca pembesar");
}

// Penunjuk "suhu" ke Bekeners terdekat (bonus tracking rasa treasure hunter)
if (active && global.bekeners_found < global.bekeners_total && instance_exists(obj_bekeners_parent)) {
    var _nearest = noone;
    var _best = 999999;
    with (obj_bekeners_parent) {
        if (!found) {
            var _dd = point_distance(x, y, other.x, other.y);
            if (_dd < _best) { _best = _dd; _nearest = id; }
        }
    }
    if (_nearest != noone) {
        var _t;
        if      (_best <= zone_half)  _t = "Sangat panas!! Dia ada di sekitarmu!";
        else if (_best <= 320)        _t = "Hangat... makin dekat!";
        else                          _t = "Masih dingin... teruslah mencari.";
        draw_set_color(c_black);
        draw_text(21, 67, _t);
        draw_set_color(make_color_rgb(255, 230, 160));
        draw_text(20, 66, _t);
    }
}

// Pesan cooldown / info
if (msg_timer > 0) {
    draw_set_halign(fa_center);
    var _mx = _gw / 2, _my = 90;
    draw_set_color(c_black);
    draw_text(_mx + 1, _my + 1, msg_text);
    draw_set_color(make_color_rgb(255, 120, 120));
    draw_text(_mx, _my, msg_text);
    draw_set_halign(fa_left);
}

draw_set_color(c_white);
// ===== Slot equipment ala game RPG (pojok kanan bawah) =====
var _gw2 = display_get_gui_width();
var _gh2 = display_get_gui_height();
var _sx  = _gw2 - 76, _sy = _gh2 - 76, _ss = 56;

draw_set_alpha(0.72);
draw_set_color(make_color_rgb(30, 30, 40));
draw_roundrect(_sx, _sy, _sx + _ss, _sy + _ss, false);
draw_set_alpha(1);
// Bingkai: emas saat siap, abu saat cooldown, kuning menyala saat aktif
if (active)            draw_set_color(make_color_rgb(255, 230, 120));
else if (cooldown > 0) draw_set_color(make_color_rgb(120, 120, 130));
else                   draw_set_color(make_color_rgb(255, 215, 130));
draw_roundrect(_sx, _sy, _sx + _ss, _sy + _ss, true);

// Icon di dalam slot
if (spr_mag != -1) {
    draw_sprite_stretched(spr_mag, 0, _sx + 10, _sy + 10, _ss - 20, _ss - 20);
} else {
    draw_set_color(c_white);
    draw_circle(_sx + _ss/2 - 3, _sy + _ss/2 - 3, 10, true);
    draw_line_width(_sx + _ss/2 + 4, _sy + _ss/2 + 4, _sx + _ss/2 + 14, _sy + _ss/2 + 14, 3);
}

// Overlay gelap + sisa detik saat cooldown
if (cooldown > 0) {
    draw_set_alpha(0.55);
    draw_set_color(c_black);
    draw_roundrect(_sx, _sy, _sx + _ss, _sy + _ss, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(_sx + _ss/2, _sy + _ss/2, string_format(cooldown / fps_, 1, 1));
}

// Badge tombol [Q] di pojok slot
draw_set_color(c_white);
draw_circle(_sx + _ss - 4, _sy + 4, 10, false);
draw_set_color(make_color_rgb(30, 30, 40));
draw_circle(_sx + _ss - 4, _sy + 4, 10, true);
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_text(_sx + _ss - 4, _sy + 4, "F");
draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_set_color(c_white);
