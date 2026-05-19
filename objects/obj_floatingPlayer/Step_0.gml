x += x_speed;
y += y_speed;
image_angle += rotation_speed;

var _sprite_half_width = sprite_width / 2;
var _sprite_half_height = sprite_height / 2;

if (x + _sprite_half_width >= cam_x + cam_width) {
    x = (cam_x + cam_width) - _sprite_half_width;
    x_speed *= -1;
    rotation_speed *= -1;
} else if (x - _sprite_half_width <= cam_x) {
    x = cam_x + _sprite_half_width;
    x_speed *= -1;
    rotation_speed *= -1;
}

if (y + _sprite_half_height >= cam_y + cam_height) {
    y = (cam_y + cam_height) - _sprite_half_height;
    y_speed *= -1;
    rotation_speed *= -1;
} else if (y - _sprite_half_height <= cam_y) {
    y = cam_y + _sprite_half_height;
    y_speed *= -1;
    rotation_speed *= -1;
}