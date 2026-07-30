// ========================= DRAW EVENT (parent) =========================
if (!visible) exit;
// Efek berkilau lembut saat tersingkap
image_alpha = 0.75 + 0.25 * sin(current_time / 180);
discovered = false;
image_alpha = 0.75 + 0.25 * sin(current_time / 180);
if (sprite_index != -1) {
    draw_self();
} else {
    // Cadangan bila sprite belum terpasang: lingkaran tanda tanya
    draw_set_color(c_yellow);
    draw_circle(x, y, 12, false);
    draw_set_color(c_black);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(x, y, "?");
    draw_set_halign(fa_left); draw_set_valign(fa_top);
}
image_alpha = 1;

if (instance_exists(obj_player)
&&  point_distance(x, y, obj_player.x, obj_player.y) <= interact_range) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_black);
    draw_text(x + 1, y - sprite_height - 3, "[E] Sapa");
    draw_set_color(c_yellow);
    draw_text(x, y - sprite_height - 4, "[E] Sapa");
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
