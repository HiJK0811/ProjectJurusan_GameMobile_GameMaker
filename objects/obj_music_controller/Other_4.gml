// Main Room Music

// Check if the music is already playing to avoid doubling up
if (!audio_is_playing(snd_play)) {
    audio_play_sound(snd_play, 0, true);
}