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
persistent = true;
// ========================= CREATE EVENT =========================
cell       = 32;                      // samakan dengan ukuran tile
grid_size  = 5;                       // area 5x5
zone_half  = (grid_size * cell) / 2;

fps_       = game_get_speed(gamespeed_fps);
dur_max    = 35  * fps_;
cd_max     = 2.5 * fps_;

active     = false;                   // TIDAK auto nyala, tunggu [Q]
timer      = 0;
cooldown   = 0;

msg_text   = "";
msg_timer  = 0;

fog        = -1;
spr_mag    = asset_get_index("spr_Magnifying"); // -1 jika sprite belum ada