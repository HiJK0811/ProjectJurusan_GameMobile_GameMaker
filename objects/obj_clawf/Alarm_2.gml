if (room_exists(room_explore_storage)) {
    room_goto(room_explore_storage);
	o_game.game_state = GameState.EXPLORE
	audio_stop_all();
} else {
    // Jika room belum ada, restart saja untuk sementara
    room_restart();
}