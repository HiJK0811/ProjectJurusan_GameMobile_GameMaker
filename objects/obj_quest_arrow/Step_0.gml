// 1. Cari player secara aman
var _player_obj = asset_get_index("obj_player");
if (_player_obj == -1 || instance_number(_player_obj) <= 0) {
    visible = false;
    exit;
}
var _player = instance_find(_player_obj, 0);

// 2. Tempelkan posisi panah di atas kepala pemain
if (_player != noone && instance_exists(_player)) {
    x = _player.x;
    y = _player.y - 40; // 40 piksel di atas kepala
    visible = true;
} else {
    visible = false;
    exit;
}

// 3. Tentukan target koordinat tujuan quest
var _target_x = x;
var _target_y = y;

var _q = quest_get("mq_orientasi");
if (_q != undefined && !_q.completed) {
    if (!_q.steps[0].done) {
        _target_x = 800; // Koordinat X target Lounge
        _target_y = 300; // Koordinat Y target Lounge
    } else if (!_q.steps[1].done) {
        _target_x = 450; // Koordinat X posisi Adhila
        _target_y = 200; // Koordinat Y posisi Adhila
    }
}

// 4. Putar panah menghadap target
image_angle = point_direction(x, y, _target_x, _target_y);

// 5. Transparansi jika sudah dekat
if (point_distance(_player.x, _player.y, _target_x, _target_y) < 50) {
    image_alpha = 0.3;
} else {
    image_alpha = 1.0;
}