// 1. Kosongkan semua array tumpukan dulu agar tidak double
for(var a=0; a<3; a++) {
    tumpukan[a] = [];
}

// 2. Scan SEMUA kotak yang ada di room
with(obj_boxf) {
    var _ditemukan = false;
    
    // Cek satu per satu, kotak ini lebih dekat ke alas mana (0, 1, atau 2)?
    for(var i=0; i<3; i++) {
        // Kita beri toleransi jarak lebih luas (misal 80 pixel)
        if (abs(x - other.posisi_x_alas[i]) < 80) {
            array_push(other.tumpukan[i], id);
            _ditemukan = true;
            break; // Berhenti cek kalau sudah ketemu alasnya
        }
    }
}

// 3. Urutkan dan Rapikan Posisi Visual tiap alas
for(var i=0; i<3; i++) {
    var _stack = tumpukan[i];
    
    // Urutkan (Besar ke Kecil)
    var _f = function(_a, _b) {
        return _b.ukuran - _a.ukuran;
    }
    array_sort(_stack, _f);

    // Tata letak visual kotak agar tidak menumpuk di satu titik/hilang
    for (var j = 0; j < array_length(_stack); j++) {
        var _inst = _stack[j];
        _inst.x = posisi_x_alas[i];
		var _tinggi = 8;
        // Pastikan posisi_y_lantai kamu sudah benar koordinatnya di room!
        _inst.y = other.posisi_y_lantai - (j * _tinggi) - (_tinggi / 2);
    }
}