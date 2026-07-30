// ========================= DRAW GUI EVENT =========================
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

var _bw = min(760, _gw - 48);
var _bh = 190;
var _bx = (_gw - _bw) / 2;
var _by = _gh - _bh - 28;

// Bayangan lembut
draw_set_alpha(0.35);
draw_set_color(c_black);
draw_roundrect(_bx + 6, _by + 8, _bx + _bw + 6, _by + _bh + 8, false);
draw_set_alpha(1);

// Papan kayu (bingkai luar)
draw_set_color(col_wood);
draw_roundrect(_bx, _by, _bx + _bw, _by + _bh, false);
// Panel krem (isi)
draw_set_color(col_cream);
draw_roundrect(_bx + 8, _by + 8, _bx + _bw - 8, _by + _bh - 8, false);
// Garis aksen kopi
draw_set_color(col_coffee);
draw_roundrect(_bx + 8, _by + 8, _bx + _bw - 8, _by + _bh - 8, true);

// Papan nama (name tag) ala menu cafe
var _tag_w = max(140, string_width(speaker_name) + 40);
draw_set_color(col_wood2);
draw_roundrect(_bx + 22, _by - 22, _bx + 22 + _tag_w, _by + 12, false);
draw_set_color(col_coffee);
draw_roundrect(_bx + 22, _by - 22, _bx + 22 + _tag_w, _by + 12, true);
draw_set_color(col_cream);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_bx + 22 + _tag_w / 2, _by - 5, speaker_name);

// Isi teks (typewriter)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(col_text);
var _shown = string_copy(pages[page], 1, floor(chars));
draw_text_ext(_bx + 28, _by + 24, _shown, 22, _bw - 56);

// Indikator lanjut "▼"
var _cur2  = pages[page];
var _done  = (chars >= string_length(_cur2));
var _last2 = (page >= array_length(pages) - 1);
if (_done && !(_last2 && is_array(options))) {
    if ((current_time div 400) mod 2 == 0) {
        draw_set_halign(fa_right);
        draw_text(_bx + _bw - 24, _by + _bh - 34, "[F] Lanjut ▼");
    }
}

// Kotak opsi (muncul di atas kotak dialog)
if (_last2 && _done && is_array(options)) {
    var _n     = array_length(options);
    var _oh    = _n * 34 + 20;
    var _ow    = _bw * 0.9;
    var _ox    = _bx + (_bw - _ow) / 2;
    var _oy    = _by - _oh - 12;

    draw_set_alpha(0.95);
    draw_set_color(col_wood);
    draw_roundrect(_ox, _oy, _ox + _ow, _oy + _oh, false);
    draw_set_alpha(1);
    draw_set_color(col_coffee);
    draw_roundrect(_ox, _oy, _ox + _ow, _oy + _oh, true);

    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    for (var i = 0; i < _n; i++) {
        var _ly = _oy + 18 + i * 34;
        if (i == opt_index) {
            draw_set_color(col_coffee);
            draw_roundrect(_ox + 8, _ly - 14, _ox + _ow - 8, _ly + 14, false);
            draw_set_color(col_wood);
            draw_text(_ox + 22, _ly, "> " + options[i][0]);
        } else {
            draw_set_color(col_cream);
            draw_text(_ox + 22, _ly, options[i][0]);
        }
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);

