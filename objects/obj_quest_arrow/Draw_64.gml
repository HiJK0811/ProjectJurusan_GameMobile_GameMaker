// Pastikan objek player ada sebelum menggambar panah di GUI
var _player_obj = asset_get_index("obj_player");
if (_player_obj == -1 || instance_number(_player_obj) <= 0) exit;

var _player = instance_find(_player_obj, 0);
if (_player == noone || !instance_exists(_player)) exit;

// Konversi koordinat dunia game (World X, Y) ke koordinat layar (GUI X, Y)
var _gui_x = world_to_gui_x(_player.x);
var _gui_y = world_to_gui_y(_player.y - 40); // Sedikit di atas kepala player

// Tentukan target koordinat dunia berdasarkan quest aktif
var _target_world_x = _player.x;
var _target_world_y = _player.y;

var _q = quest_get("mq_orientasi");
if (_q != nullptr && !_q.completed) {
    if (!_q.steps[0].done) {
        _target_world_x = 800; // Koordinat X target Lounge
        _target_world_y = 300; // Koordinat Y target Lounge
    } else if (!_q.steps[1].done) {
        _target_world_x = 450; // Koordinat X posisi Adhila
        _target_world_y = 200; // Koordinat Y posisi Adhila
    }
}

// Konversi posisi target ke layar GUI juga
var _target_gui_x = world_to_gui_x(_target_world_x);
var _target_gui_y = world_to_gui_y(_target_world_y);

// Hitung arah rotasi panah di layar
var _angle = point_direction(_gui_x, _gui_y, _target_gui_x, _target_gui_y);

// Cek jarak untuk transparansi
var _dist = point_distance(_player.x, _player.y, _target_world_x, _target_world_y);
var _alpha = (_dist < 50) ? 0.3 : 1.0;

// Gambar sprite panah di layar GUI
if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, _gui_x, _gui_y, 1, 1, _angle, c_white, _alpha);
}