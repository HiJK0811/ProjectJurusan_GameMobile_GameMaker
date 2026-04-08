// --- Inside obj_claw -> Other -> User Event 0 ---

tumpukan = [[], [], []]; 
with(obj_boxf) instance_destroy(); 

// 1. Spawn Box (dari ukuran terbesar ke terkecil)
for (var i = jumlah_box_target; i >= 1; i--) {
    var _new_box = instance_create_layer(posisi_x_alas[0], 0, "Instances", obj_boxf);
    _new_box.ukuran = i;
    
    // Terapkan skala manual kamu
    var skala_manual = [0.05, 0.07, 0.10, 0.14, 0.19];
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
    
    // Gunakan lantai_permukaan yang sudah kita buat tadi (281 - offset)
    _b.y = lantai_permukaan - _total_h_akumulasi - (_h_box_visual / 2) + 15;
    
    _total_h_akumulasi += (_h_box_visual * (1 - _persentase_overlap));
    _b.depth = -50 - j;
}

// Set kuku di atas alas pertama
indeks_alas = 1;
x = posisi_x_alas[1];

//var _tinggi_tumpukan_saat_ini = 0;
//var _y_alas_pusat = 281; 
//var _tinggi_alas = sprite_get_height(obj_alasbox.sprite_index);
//var _lantai_permukaan = _y_alas_pusat - (_tinggi_alas / 2); // Ini permukaan atas alas

//for (var j = 0; j < array_length(tumpukan[0]); j++) {
    //var _b = tumpukan[0][j];
    
    // 1. Hitung tinggi visual box ini (Tinggi Sprite Asli * image_yscale)
    //var _tinggi_visual_b = sprite_get_height(_b.sprite_index) * _b.image_yscale;
    
    // 2. Set Posisi X ke Tengah Alas (Simetris)
    //_b.x = posisi_x_alas[0];
    
    // 3. Set Posisi Y 
    // Mulai dari Lantai Permukaan, kurangi tinggi box di bawahnya, 
    // lalu kurangi setengah tinggi box ini (karena Origin di tengah)
    //_b.y = _lantai_permukaan - _tinggi_tumpukan_saat_ini - (_tinggi_visual_b -75);
    
    // 4. Update tinggi tumpukan untuk box selanjutnya
    //_tinggi_tumpukan_saat_ini += _tinggi_visual_b;
    
    //_b.depth = -50 - j;
//}