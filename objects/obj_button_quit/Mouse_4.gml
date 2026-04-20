// Inherit the parent event
event_inherited();

if (!instance_exists(obj_fade)) {
        global.quitting = true;
        fadeToRoom(room, 90, c_black);
    }
	
// game_end();