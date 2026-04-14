if (keyboard_check(ord("X"))) {
	room_goto(previous_room);
	o_game.game_state = GameState.EXPLORE;
}