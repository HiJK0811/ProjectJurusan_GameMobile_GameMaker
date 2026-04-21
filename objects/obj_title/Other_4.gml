// Check if the music is already playing to avoid doubling up
if (!audio_is_playing(snd_menu)) {
    audio_play_sound(snd_menu, 0, true);
}