// Inherit the parent event
event_inherited();

if (!audio_is_playing(snd_click_button)) {
    audio_play_sound(snd_click_button, 0, false);
}

if (!instance_exists(obj_fade)) {
        global.quitting = true;
        fadeToRoom(room, 90, c_black);
    }
	
// game_end();