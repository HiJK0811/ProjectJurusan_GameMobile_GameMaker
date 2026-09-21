// Reset variabel kontrol
box_terbawa = noone;
game_selesai = false;
status_pindah = false;
pesan_alpha = 0;
can_move = true;



with (obj_box_parent) {
    instance_destroy();
}


// Daftar Objek
var daftar_objek = [obj_boxW1, obj_boxW2, obj_boxW3, obj_boxW4, obj_boxW5];

//  skala box
var skala_manual = [0.05, 0.07, 0.10, 0.14, 0.19]; 

for (var i = jumlah_box_target; i >= 1; i--) {
    var _obj_pilihan = daftar_objek[i-1];
    var _new_box = instance_create_layer(posisi_x_alas[0], 0, "Instances", _obj_pilihan);
    
    _new_box.ukuran = i;
    
    // Pakai skala dari array skala_manual
    var _s = skala_manual[i-1];
    _new_box.image_xscale = _s;
    _new_box.image_yscale = _s;
    
    array_push(tumpukan[0], _new_box);
}

// 2. Susun Ulang Posisi Visual (Re-Stack khusus untuk Alas 0)
depth = -100;
var _total_h_akumulasi = 0; 
var _persentase_overlap = 0.20; 

for (var j = 0; j < array_length(tumpukan[0]); j++) {
    var _b = tumpukan[0][j];
    var _h_box_visual = sprite_get_height(_b.sprite_index) * _b.image_yscale;
    
    // Paksa ke alas 0 (paling kiri)
    _b.x = posisi_x_alas[0];
    
    
    _b.y = lantai_permukaan - _total_h_akumulasi - (_h_box_visual / 2) + 15;
    
    _total_h_akumulasi += (_h_box_visual * (1 - _persentase_overlap));
    _b.depth = -50 - j;
}

// Set kuku di atas alas pertama
indeks_alas = 1;
x = posisi_x_alas[1];

