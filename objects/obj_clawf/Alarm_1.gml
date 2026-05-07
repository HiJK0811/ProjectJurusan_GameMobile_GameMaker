// Beri perintah ke semua box di alas kanan untuk meluncur

/*
for (var i = 0; i < array_length(tumpukan[2]); i++) {
    var _b = tumpukan[2][i];
    _b.hspeed = 4; // Percepat sedikit agar terasa mantap
}

// Jalankan animasi ban berjalan
with(obj_conveyorbelt) { image_speed = 1; }
*/


// Tunggu box keluar layar (sekitar 2 detik) baru pindah room
alarm[2] = 360; // Waktu tunggu sebelum pindah room