audio_stop_sound(snd_bgm_graph);

if (!audio_is_playing(snd_bgm_hanoi)) {
    var _snd = audio_play_sound(snd_bgm_hanoi, 1, true);

    audio_sound_gain(_snd, 0.3, 0); 
}