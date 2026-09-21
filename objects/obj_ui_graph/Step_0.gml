// --- Step Event obj_ui_graph ---

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    
    // === logika untuk halaman 1 ===
    if (menu_stage == 0) {
        var _lebar_box = sprite_get_width(spr_box_easy) * box_scale;
        var _tinggi_box = sprite_get_height(spr_box_easy) * box_scale;

        for (var i = 0; i < 3; i++) {
            var _diff_padding = 300; 
			var _bx = ui_x - _diff_padding + (i * _diff_padding);
            var _by = ui_y;
            
            if (_mx > _bx - (_lebar_box/2) && _mx < _bx + (_lebar_box/2) &&
                _my > _by - (_tinggi_box/2) && _my < _by + (_tinggi_box/2)) {
                
                global.current_difficulty = i; // Simpan pilihan kesulitan (0, 1, 2)
                menu_stage = 1; 
                
                show_debug_message("Masuk ke Sub-Menu Stage untuk tingkat kesulitan: " + string(i + 1));
                break;
            }
        }
    }
    // === Logika halaman 2  (untuk ketika pilih stage dan pindah room)
    else if (menu_stage == 1) {
        for (var i = 0; i < 3; i++) {
            var _stage_padding = 300; // Harus sama dengan Draw GUI
			var _bx = ui_x - _stage_padding + (i * _stage_padding);
            var _by = ui_y;
			
            // Deteksi klik pada area lingkaran sub-stage (menggunakan radius jarak 40 pixel)
            if (mouse_check_button(mb_left) && point_distance(_mx, _my, _bx, _by) < 40) {
				//simpan sub stage
				global.current_sub_stage = i;
				
				//penanda dari stage untuk kembali.
				global.target_menu_stage = 1;
				if(room_exists(room_minigame_graph)){
					room_goto(room_minigame_graph);
				}
				instance_destroy();
                break;
            }
        }
    }
}

// Fitur Tambahan: Tekan ESC untuk kembali ke menu sebelumnya jika sedang di halaman sub-stage
if (keyboard_check_pressed(vk_escape)) {
    if (menu_stage == 1) {
        menu_stage = 0; // Kembali ke menu utama pilih Easy/Med/Hard
    } else {
        instance_destroy(); // Jika di menu utama, langsung tutup UI-nya
    }
}


//Mekanisme Tombol Back
//Mengenal device ke peta minigame.
if(mouse_check_button_pressed(mb_left)){
	//lokasi button di GUI
	var _back_x = ui_x - 500;
	var _back_y = ui_y - 200;
	
	if(point_distance(_mx,_my,_back_x,_back_y)< 20){
	//tes kebenaran sistem
	show_debug_message("bisa ditekan dan success");
	//kalau di UI sublevel 
	if(menu_stage == 1){
		menu_stage = 0;
		show_debug_message("success masuk ke UI Diff") //tes sistem
	} else {
		//kalau masuk ke ruangan.
		if(room_exists(room_explore_interplannetarynetwork)){
			room_goto(room_explore_interplannetarynetwork);
				o_game.game_state = GameState.EXPLORE;
				audio_stop_all();
		}	
		instance_destroy();
		}
	}
}
