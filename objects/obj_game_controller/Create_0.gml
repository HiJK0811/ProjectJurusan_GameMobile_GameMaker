/// =====================================================================
/// obj_game_controller  (tanpa sprite, taruh 1 buah di room)
/// Menginisialisasi seluruh data game.
/// =====================================================================

randomize();
if (!variable_global_exists("game_data_ready") || !global.game_data_ready) {
    scr_init_game_data();
    scr_init_journal();
	init_quest_md_orientasi()
}



// Journal selalu ada di setiap room
if (!instance_exists(obj_journal)) {
    instance_create_depth(0, 0, -9000, obj_journal);
}
// 🔥 Pastikan panah penunjuk quest otomatis dibuat jika belum ada
if (!instance_exists(obj_quest_arrow)) {
    instance_create_depth(x, y, -8000, obj_quest_arrow);
}

// Hanya set default jika belum ada (agar tidak menimpa hasil load/save)
if (!variable_global_exists("egg_started")) global.egg_started = false;
if (!variable_global_exists("egg_completed")) global.egg_completed = false;
if (!variable_global_exists("bekeners_found")) global.bekeners_found = 0;
if (!variable_global_exists("bekeners_total")) global.bekeners_total = 7;