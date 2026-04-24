// Fix Camera Jitter
with (all) {
	if (!on_ui_layer) depth = -bbox_bottom;	
}

var cam = view_camera[0];
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

var cam_x = x - cam_width / 2;
var cam_y = y - cam_height / 2;

cam_x = clamp(cam_x, 0, room_width - cam_width);
cam_y = clamp(cam_y, 0, room_height - cam_height);

camera_set_view_pos(cam, cam_x, cam_y)