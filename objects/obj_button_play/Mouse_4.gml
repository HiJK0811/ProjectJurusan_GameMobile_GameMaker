// Inherit the parent event
event_inherited();

if (!audio_is_playing(snd_click_button)) {
    audio_play_sound(snd_click_button, 0, false);
}

room_goto(room_explore_mainRoom);
audio_stop_sound(snd_menu);
