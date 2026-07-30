// Fog HANYA muncul saat kaca pembesar aktif
if (global.egg_completed || !active) exit;

var _cam = view_camera[0];
var _cx  = camera_get_view_x(_cam);
var _cy  = camera_get_view_y(_cam);
var _cw  = camera_get_view_width(_cam);
var _ch  = camera_get_view_height(_cam);

if (!surface_exists(fog)) fog = surface_create(_cw, _ch);

surface_set_target(fog);
draw_clear_alpha(c_black, 0);
draw_set_alpha(0.62);
draw_set_color(c_black);
draw_rectangle(0, 0, _cw, _ch, false);
draw_set_alpha(1);
gpu_set_blendmode(bm_subtract);
draw_rectangle(x - zone_half - _cx, y - zone_half - _cy,
               x + zone_half - _cx, y + zone_half - _cy, false);
gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(fog, _cx, _cy);

// Bingkai area + icon kecil mengikuti player
draw_set_color(make_color_rgb(255, 220, 130));
draw_set_alpha(0.8);
draw_rectangle(x - zone_half, y - zone_half, x + zone_half, y + zone_half, true);
draw_set_alpha(1);

var _bob = sin(current_time / 200) * 2;
if (spr_mag != -1) {
    draw_sprite_ext(spr_mag, 0, x + 18, y - 22 + _bob, 0.45, 0.45, 0, c_white, 1);
} else {
    var _mx = x + 18, _my = y - 22 + _bob;
    draw_circle(_mx, _my, 5, true);
    draw_line_width(_mx + 3, _my + 3, _mx + 8, _my + 8, 2);
}