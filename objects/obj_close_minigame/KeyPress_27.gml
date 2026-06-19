room_goto(previous_room);

if (!audio_is_playing(snd_close_button)) {
    audio_play_sound(snd_close_button, 0, false);
}

obj_gameStates.game_state = GameState.EXPLORE;