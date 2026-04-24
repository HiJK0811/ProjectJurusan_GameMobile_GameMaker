// Check if the music is already playing to avoid doubling up
if (variable_global_exists("music_id") && audio_is_playing(global.music_id)) {
    audio_stop_sound(global.music_id);
}

global.music_id = audio_play_sound(snd_menu, 0, true);
