jumlah_box_target = 0; // Akan diisi dari menu
game_mulai = false;
posisi_x_alas = [85.5, 232.5, 384]; 
posisi_y_lantai = obj_alasbox.y;
posisi_x_conveyor = 640; // Target akhir box dikirim
indeks_alas = 1;
x = posisi_x_alas[indeks_alas];
y = 83;

box_terbawa = noone;

game_selesai = false;
pesan_alpha = 0;
status_pindah = false;

//overlapbox
jarak_overlap = 10;


// Array 2D untuk tumpukan (Alas 0, 1, dan 2)
tumpukan = [[], [], []];

// jeda 1 frame agar Creation Code box terbaca dulu
alarm[0] = 1;


// Kita urutkan berdasarkan ukuran (besar ke kecil)
var _temp_list = ds_list_create();
with (obj_box_parent) {
    ds_list_add(_temp_list, id);
}

// Urutkan box berdasarkan variabel 'ukuran' secara menurun (besar dulu)
// (Pastikan di obj_box kamu sudah buat variabel: ukuran = 3, 2, atau 1)
for (var i = 0; i < ds_list_size(_temp_list); i++) {
    for (var j = 0; j < ds_list_size(_temp_list) - 1; j++) {
        var _b1 = _temp_list[| j];
        var _b2 = _temp_list[| j+1];
        if (_b1.ukuran < _b2.ukuran) {
            _temp_list[| j] = _b2;
            _temp_list[| j+1] = _b1;
        }
    }
}

// Masukkan hasil urutan ke dalam array tumpukan alas kiri
for (var i = 0; i < ds_list_size(_temp_list); i++) {
    var _box = _temp_list[| i];
    array_push(tumpukan[0], _box);
    
    // Atur posisi awal box di room 
    _box.x = posisi_x_alas[0];
    _box.y = posisi_y_lantai - (i); 
}
ds_list_destroy(_temp_list);


// Create Event obj_claw
y_alas_dasar = 281; 
tinggi_alas = sprite_get_height(obj_alasbox.sprite_index);


var _offset_visual_alas = 35;

lantai_permukaan = (y_alas_dasar - (tinggi_alas / 2)) + _offset_visual_alas;