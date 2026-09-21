/*/ Matikan lagu Hanoi jika ada, lalu putar lagu Graph secara looping
audio_stop_sound(snd_bgm_hanoi);
if (!audio_is_playing(snd_bgm_graph)) {
    audio_play_sound(snd_bgm_graph, 1, true);
}