// 1. Prevent leaving if Logic Gate is beaten
if (instance_exists(obj_circuitBuilder)) {
    if (obj_circuitBuilder.level_completed == true) exit;
}

// 2. Prevent leaving if Tower of Hanoi is beaten
if (instance_exists(obj_clawf)) {
    if (obj_clawf.game_selesai == true) exit;
}

// --- NORMAL CLOSE BEHAVIOR ---
room_goto(target_room);

if (!audio_is_playing(snd_close_button)) {
    audio_play_sound(snd_close_button, 0, false);
}

obj_gameStates.game_state = GameState.EXPLORE;