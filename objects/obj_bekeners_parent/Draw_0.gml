// ========================= DRAW EVENT (parent) =========================
if (!visible) exit;

// Efek berkilau lembut saat tersingkap
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

// Kembalikan alpha agar tidak mempengaruhi objek/teks lain
image_alpha = 1;

// Cek jarak dengan player untuk memunculkan teks interaksi [E] Sapa
if (instance_exists(asset_get_index("obj_Player"))
&&  point_distance(x, y, obj_Player.x, obj_Player.y) <= interact_range) {
    
    // 🔥 Menggunakan offset angka tetap (misal -40 piksel di atas y) 
    // agar tidak terlalu tinggi mengikuti ukuran kanvas sprite yang besar
    var _draw_y = y - 45; 
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
    draw_set_color(c_black);
    draw_text(x + 1, _draw_y + 1, "[E] Sapa");
    
    draw_set_color(c_yellow);
    draw_text(x, _draw_y, "[E] Sapa");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}