/// =====================================================================
/// obj_magnifying
/// Sprite : spr_magnifying (origin di tengah disarankan)
/// "Kaca Pembesar Logika":
///  - Toggle dengan [F]
///  - Mengungkap area 9x9 sel (mengikuti pergerakan player / tracking)
///  - Durasi aktif 35 detik, cooldown 2.5 detik
///  - Jika ditekan saat cooldown: "Harap tunggu, sedang cooldown..."
/// Dibuat otomatis oleh dialog "start_hunt". Depth sebaiknya sangat kecil
/// (mis. -5000) agar fog tergambar di atas segalanya.
/// =====================================================================

// ========================= CREATE EVENT =========================
cell       = 32;                      // ukuran 1 sel grid (sesuaikan tile game-mu)
grid_size  = 9;                       // area 9x9
zone_half  = (grid_size * cell) / 2;  // setengah sisi area reveal (144 px utk sel 32)

fps_       = game_get_speed(gamespeed_fps);
dur_max    = 35  * fps_;              // 35 detik
cd_max     = 2.5 * fps_;              // 2.5 detik

active     = false;
timer      = 0;
cooldown   = 0;

msg_text   = "";
msg_timer  = 0;

fog        = -1;                      // surface fog

// ========================= STEP EVENT =========================
// Selalu mengikuti player (tracking)
if (instance_exists(obj_player)) {
    x = obj_player.x;
    y = obj_player.y;
}

// Pesan sementara
if (msg_timer > 0) msg_timer--;

// Cooldown berjalan (tidak dijeda oleh dialog agar terasa natural)
if (cooldown > 0) cooldown--;

// Input toggle [F]
if (keyboard_check_pressed(ord("F")) && !global.dialog_active && !global.egg_completed) {
    if (active) {
        // Matikan manual -> masuk cooldown
        active   = false;
        cooldown = cd_max;
    } else if (cooldown > 0) {
        msg_text  = "Harap tunggu, sedang cooldown... (" + string_format(cooldown / fps_, 1, 1) + " dtk)";
        msg_timer = fps_ * 1.5;
    } else {
        active = true;
        timer  = dur_max;
    }
}

// Hitung mundur durasi aktif (dijeda saat dialog kuis terbuka biar adil)
if (active && !global.dialog_active) {
    timer--;
    if (timer <= 0) {
        active   = false;
        cooldown = cd_max;
        msg_text  = "Kaca pembesar kehabisan tenaga! Menunggu cooldown...";
        msg_timer = fps_ * 1.5;
    }
}

// Reveal Bekeners dalam area 9x9 (jarak Chebyshev)
with (obj_bekeners_parent) {
    if (!found) {
        visible = other.active
               && (abs(x - other.x) <= other.zone_half)
               && (abs(y - other.y) <= other.zone_half);
    }
}

// ========================= DRAW EVENT =========================
// Fog gelap menutupi view; area 9x9 di sekitar player "dibolongi" saat aktif.
if (global.egg_completed) exit;

var _cam = view_camera[0];
var _cx  = camera_get_view_x(_cam);
var _cy  = camera_get_view_y(_cam);
var _cw  = camera_get_view_width(_cam);
var _ch  = camera_get_view_height(_cam);

if (!surface_exists(fog)) fog = surface_create(_cw, _ch);

surface_set_target(fog);
draw_clear_alpha(c_black, 0);
draw_set_alpha(active ? 0.62 : 0.35);   // saat mati, fog tipis saja
draw_set_color(c_black);
draw_rectangle(0, 0, _cw, _ch, false);
draw_set_alpha(1);

if (active) {
    gpu_set_blendmode(bm_subtract);
    draw_rectangle(x - zone_half - _cx, y - zone_half - _cy,
                   x + zone_half - _cx, y + zone_half - _cy, false);
    gpu_set_blendmode(bm_normal);
}
surface_reset_target();

draw_surface(fog, _cx, _cy);

// Bingkai area reveal + sprite kaca pembesar mengikuti player
if (active) {
    draw_set_color(make_color_rgb(255, 220, 130));
    draw_set_alpha(0.8);
    draw_rectangle(x - zone_half, y - zone_half, x + zone_half, y + zone_half, true);
    draw_set_alpha(1);

    var _bob = sin(current_time / 200) * 3;
    draw_sprite(spr_magnifying, 0, x + 26, y - 30 + _bob);
}

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

// ========================= CLEAN UP EVENT =========================
if (surface_exists(fog)) surface_free(fog);
