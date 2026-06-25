//randomise();

//x_speed = 0.3 * choose(-1, 1);
//y_speed = 0.3 * choose(-1, 1);
//rotation_speed = 0.3 * choose(-1, 1);

//cam = view_camera[0];
//cam_x = camera_get_view_x(cam);
//cam_y = camera_get_view_y(cam);
//cam_width = camera_get_view_width(cam);
//cam_height = camera_get_view_height(cam);

//x = random_range(cam_x, cam_x + cam_width);
//y = random_range(cam_y, cam_y + cam_height);

randomise();

x_speed = 0.3 * choose(-1, 1);
y_speed = 0.3 * choose(-1, 1);
rotation_speed = 0.3 * choose(-1, 1);

var _sprite_half_width = sprite_width / 2;
var _sprite_half_height = sprite_height / 2;

// Hardcode the menu dimensions so it NEVER reads the big room's size
var _menu_width = 320;
var _menu_height = 180;

x = random_range(_sprite_half_width, _menu_width - _sprite_half_width);
y = random_range(_sprite_half_height, _menu_height - _sprite_half_height);