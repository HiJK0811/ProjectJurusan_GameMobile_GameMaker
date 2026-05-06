// --- Di Alarm 1 obj_claw ---

// Masukkan nama room tujuan Daniel di sini
if (room_exists(room_explore_security)) {
    room_goto(room_explore_security);
	o_game.game_state = GameState.EXPLORE
} else {
    // Jika room belum ada, restart saja untuk sementara
    room_restart();
}