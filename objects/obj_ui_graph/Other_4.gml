audio_stop_sound(snd_bgm_hanoi);

if (!audio_is_playing(snd_bgm_graph)) {
    var _snd = audio_play_sound(snd_bgm_graph, 1, true);

    audio_sound_gain(_snd, 0.3, 0); 
}