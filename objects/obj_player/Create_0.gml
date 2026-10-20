// 📌 Letakkan di Room Start Event obj_player
if (variable_global_exists("load_data_pending") && global.load_data_pending != undefined) {
    if (global.load_data_pending.has_pos) {
        x = global.load_data_pending.px;
        y = global.load_data_pending.py;
        
        // Paksa kamera langsung snap/teleport ke posisi player agar tidak hitam/delay
        var _cam = view_camera[0];
        if (_cam != -1) {
            var _cam_w = camera_get_view_width(_cam);
            var _cam_h = camera_get_view_height(_cam);
            camera_set_view_pos(_cam, x - (_cam_w / 2), y - (_cam_h / 2));
        }
    }
    // Hapus data pending setelah dipasang
    global.load_data_pending = undefined;
}

event_inherited();

global.transitioning = false;

states = {
	idle:{
		right: spr_Player_Alt_Idle_Right,
		up: spr_Player_Alt_Idle_Up,
		left: spr_Player_Alt_Idle_Left,
		down: spr_Player_Alt_Idle_Down
	},
	walking:{
		right: spr_Player_Alt_Walk_Right,
		up: spr_Player_Alt_Walk_Up,
		left: spr_Player_Alt_Walk_Left,
		down: spr_Player_Alt_Walk_Down
	}
}

state = states.idle;