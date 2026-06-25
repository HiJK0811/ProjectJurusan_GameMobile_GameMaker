draw_self();
if (!game_selesai) {
    // --- 1. GERAK KIRI - KANAN ---
    var _target_x = posisi_x_alas[indeks_alas];
    
    if (keyboard_check_pressed(vk_left)) || keyboard_check_pressed(ord("A"))  indeks_alas = max(0, indeks_alas - 1);
    if (keyboard_check_pressed(vk_right)) || keyboard_check_pressed(ord("D")) indeks_alas = min(2, indeks_alas + 1);

    // Pergerakan halus
    x = lerp(x, _target_x, 0.2);

    // --- 2. INTERAKSI AMBIL / LETAK (SPASI) ---
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
        var _stack_skrg = tumpukan[indeks_alas];

        if (box_terbawa == noone) {
            // LOGIKA AMBIL
            if (array_length(_stack_skrg) > 0) {
                box_terbawa = array_pop(_stack_skrg);
            }
        } else {
            // LOGIKA MELETAKKAN
            var _boleh_letak = false;
            
            if (array_length(_stack_skrg) == 0) {
                _boleh_letak = true; // Alas kosong, boleh taruh apa saja
            } else {
                var _box_atas = _stack_skrg[array_length(_stack_skrg) - 1];
                if (box_terbawa.ukuran < _box_atas.ukuran) {
                    _boleh_letak = true; // Box kecil boleh di atas box besar
                }
            }

			if (_boleh_letak) {
			    var _box = box_terbawa;
			    var _stack_target = tumpukan[indeks_alas];

			    // 1. Masukkan box ke array
			    array_push(_stack_target, _box);
    
			    // 2. RESET & RE-STACK (Hitung ulang posisi semua box di alas ini)
			var _total_h = 0;
			var _persentase_overlap = 0.20; // Berarti box akan masuk 15% ke bawah. Sesuaikan angka ini (0.1 - 0.2)

			var _total_h_akumulasi = 0;  // 18% masuk ke box bawah. Sesuaikan antara 0.15 - 0.20

			for (var i = 0; i < array_length(tumpukan[indeks_alas]); i++) {
			    var _b = tumpukan[indeks_alas][i];
			    var _h_box_visual = sprite_get_height(_b.sprite_index) * _b.image_yscale;
    
			    // 1. Tentukan Posisi X (Tengah Alas)
			    _b.x = posisi_x_alas[indeks_alas];
    
			    // 2. Tentukan Posisi Y
			    // Box pertama (i=0) akan tepat di lantai_permukaan karena _total_h_akumulasi masih 0.
			    _b.y = lantai_permukaan - _total_h_akumulasi - (_h_box_visual / 2) + 15;
    
			    // 3. Update Akumulasi Tinggi untuk Box di Atasnya
			    // Kita hanya menambahkan "tinggi efektif" box ini ke total tumpukan
			    _total_h_akumulasi += (_h_box_visual * (1 - _persentase_overlap));
    
			    // 4. Atur Kedalaman (Depth)
			    _b.depth = -50 - i;
			}	
			    box_terbawa = noone;
			}

			if (!game_selesai) {
				if (indeks_alas == 2 && array_length(tumpukan[2]) == jumlah_box_target) {
					game_selesai = true;
					alarm[1] = 30;
					show_debug_message("MENANG! Menunggu input untuk pindah...");
				 }
			}else {
                // Efek gagal (Opsional: kuku bergetar sedikit)
                x += random_range(-2, 2);
            }
        }
    }
}
if (game_selesai) {
    // Animasi Fade-in Panel
    pesan_alpha = min(pesan_alpha + 0.02, 1);
    // Cek Input untuk Pindah
    var _pencet_spasi = keyboard_check_pressed(vk_alt);
    var _pencet_layar = mouse_check_button_pressed(mb_left);

    if (_pencet_spasi || _pencet_layar) {	
        status_pindah = true; // Panggil Alarm 1 untuk gerakkan box & conveyor
		alarm[2] = 1;
    }
}

// --- 3. MENEMPELKAN BOX KE KUKU ---
if (box_terbawa != noone) {
    // KUNCI: Cek dulu apakah box-nya benar-benar masih ada di room
    if (instance_exists(box_terbawa)) {
        box_terbawa.x = x; 
        box_terbawa.y = y + 48; 
    } else {
        // Jika box tiba-tiba hilang secara misterius, reset kuku jadi kosong
        box_terbawa = noone;
    }
}
