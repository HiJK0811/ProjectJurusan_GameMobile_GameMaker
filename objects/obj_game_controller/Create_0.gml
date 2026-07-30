/// =====================================================================
/// obj_game_controller  (tanpa sprite, taruh 1 buah di room)
/// Menginisialisasi seluruh data game.
/// =====================================================================

// ========================= CREATE EVENT =========================
randomize();
scr_init_game_data();
scr_init_journal();

// Journal selalu ada di setiap room
if (!instance_exists(obj_journal)) {
    instance_create_depth(0, 0, -9000, obj_journal);
}
