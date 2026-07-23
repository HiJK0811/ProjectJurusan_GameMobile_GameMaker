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
				
				// Increase move count
				moves_made += 1;
			}

			if (!game_selesai) {
				if (indeks_alas == 2 && array_length(tumpukan[2]) == jumlah_box_target) {
					game_selesai = true;
					// alarm[1] = 30;
					show_debug_message("MENANG! Menunggu input untuk pindah...");
					
					// --- MARK LEVEL AS BEATEN ---
					if (jumlah_box_target == 3) global.hanoi_beaten[0] = true;
					else if (jumlah_box_target == 4) global.hanoi_beaten[1] = true;
					else if (jumlah_box_target == 5) global.hanoi_beaten[2] = true;
				 }
			} else {
                // Efek gagal (Opsional: kuku bergetar sedikit)
                x += random_range(-2, 2);
            }
        }
    }
}

if (game_selesai) {
    // Animasi Fade-in Panel
    pesan_alpha = min(pesan_alpha + 0.02, 1);
    
    // HANYA terima input klik jika animasi fade-in sudah selesai (alpha = 1)
    if (pesan_alpha >= 1) {
        if (mouse_check_button_pressed(mb_left)) {
            var _mid_x = room_width / 2;
            var _mid_y = room_height / 2;
            
            var _mx = mouse_x;
            var _my = mouse_y;
            
            // Koordinat Tombol
            var _btn_left_x1 = _mid_x - 170;   var _btn_y1 = _mid_y + 40;
            var _btn_left_x2 = _mid_x - 10;    var _btn_y2 = _mid_y + 100;
            
            var _btn_right_x1 = _mid_x + 10;   var _btn_y1 = _mid_y + 40;
            var _btn_right_x2 = _mid_x + 170;  var _btn_y2 = _mid_y + 100;

            // 1. Cek jika klik tombol MENU (Kiri)
            if (point_in_rectangle(_mx, _my, _btn_left_x1, _btn_y1, _btn_left_x2, _btn_y2)) {
                // Hapus semua box
                with (obj_box_parent) instance_destroy();
                
                // Munculkan menu kembali
                if (instance_exists(obj_menu_hanoi)) {
                    obj_menu_hanoi.menu_aktif = true;
                }
                
                // Reset status claw
                game_selesai = false;
                pesan_alpha = 0;
                box_terbawa = noone;
                moves_made = 0; // Reset counter
                indeks_alas = 1;
                x = posisi_x_alas[1];
                
                for(var a = 0; a < 3; a++) tumpukan[a] = [];
            }
            // 2. Cek jika klik tombol RETURN TO GAME (Kanan)
            else if (point_in_rectangle(_mx, _my, _btn_right_x1, _btn_y1, _btn_right_x2, _btn_y2)) {
                status_pindah = true; 
                alarm[2] = 1; // Pindah room
            }
        }
    }
}

// --- 3. MENEMPELKAN BOX KE KUKU ---
if (box_terbawa != noone) {
    // KUNCI: Cek dulu apakah box-nya benar-benar masih ada di room
    if (instance_exists(box_terbawa)) {
        box_terbawa.x = x; 
        box_terbawa.y = y + 48; 
		
		// box_terbawa.depth = depth - 10; 
    } else {
        // Jika box tiba-tiba hilang secara misterius, reset kuku jadi kosong
        box_terbawa = noone;
    }
}
