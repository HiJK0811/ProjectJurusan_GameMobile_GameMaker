var target_music;

// Decide what music should be playing based on room
switch (room) {
    case room_menu:
        target_music = snd_menu;
        break;
	
	case room_tutorial:
		target_music = snd_menu;
        break;
	
    default:
        target_music = snd_play;
        break;

}

// If music should change
if (target_music != global.current_music) {

    // stop old music safely
    if (global.music_id != -1) {
        audio_stop_sound(global.music_id);
    }

    // play new music (if any)
    if (target_music != noone) {
        global.music_id = audio_play_sound(target_music, 0, true);
    } else {
        global.music_id = -1;
    }

    global.current_music = target_music;
}