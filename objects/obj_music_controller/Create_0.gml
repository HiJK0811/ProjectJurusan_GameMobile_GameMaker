// Main Room Music
if (variable_global_exists("music_id") && audio_is_playing(global.music_id)) {
    audio_stop_sound(global.music_id);
}

global.music_id = audio_play_sound(snd_play, 0, true);