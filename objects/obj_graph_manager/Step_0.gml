//logika ketika player mau ngeklik planet.
if(mouse_check_button_pressed(mb_left)){
	var _node_diklik = -1;
	for(var i = 0; i < array_length(nodes); i++){
		if(point_distance(mouse_x,mouse_y, nodes[i].xx, nodes[i].yy) < 30){
			_node_diklik = i;
			break;
		}
	}
	
		//ketika saat player sedang ngeklik planet.
	if(_node_diklik != -1 && _node_diklik != roket_node_sekarang){
		//kabel yang edge terhubung ke roket sekarang.
		for(var j = 0; j < array_length(edges_possible); j++){
			var _edge = edges_possible[j];
			
			//Cek kecocokan bolak-balik
			var _jalur_terhubung = 
			(_edge.n1 == roket_node_sekarang && _edge.n2 == _node_diklik) || 
			(_edge.n2 == roket_node_sekarang && _edge.n1 == _node_diklik);
			
			//kalau jalan ada tapi tidak terpilih
			if(_jalur_terhubung && !_edge.terpilih){
				
				//notes : pengaman index supaya ada didalam nodes
				if(_node_diklik >= 0 && _node_diklik < array_length(nodes)){
					//status terpilih lazer nyala
					edges_possible[j].terpilih = true;
				
					//kalkulasi total bobot jalan
					total_bobot_jalan += _edge.bobot;
				
					//jalankan roket ke jalan tujuan
					roket_node_sekarang = _node_diklik;
					roket_x = nodes[roket_node_sekarang].xx;
					roket_y = nodes[roket_node_sekarang].yy;
				
					//tes sistem
					show_debug_message("Roket pindah ke: " + nodes[_node_diklik].nama + " | Total bobot: " + string(total_bobot_jalan));
				
					//kondisi kemenangan ketika sampai ke planet akhir/tujuan
					var _target_akhir = array_length(nodes) - 1;
					if(roket_node_sekarang == _target_akhir){
						show_debug_message("Stage Cleared! sukses membuat jalur untuk keberangkatan");
					}
				}else{
					show_debug_message("Error Bypass : tes akses planet" + string(_node_diklik) + "yang tidak ada di data nodes");
				}
				break;
			}
		}
	}
}
//logika menang
if(roket_node_sekarang == indeks_target && !stage_cleared){
	stage_cleared = true;
	show_debug_message("Completed! True Path has been found!");
	
	//Logika Kasih bintang
	var _bintang_didapat = 0;
	//logika bintang 2
	var _toleransi_maksimal = target_bobot_maksimum + (target_bobot_maksimum * 0.5);
	
	if(total_bobot_jalan <= target_bobot_maksimum){
		_bintang_didapat = 3;
	} else if(total_bobot_jalan <= _toleransi_maksimal){
		_bintang_didapat = 2;
	} else if(total_bobot_jalan > target_bobot_maksimum){
		_bintang_didapat = 1;
	}
	
	//data bintang di simpan ke secara global
	//var _sub_index = 0;
	global.graph_sub_stars[global.current_difficulty][global.current_sub_stage] = _bintang_didapat;
	
	//pengecekan overall sub-level
	var _all_sub_cleared = true;
	for(var _s = 0; _s < 3; _s++){
		if(global.graph_sub_stars[global.current_difficulty][_s] == 0) {
			_all_sub_cleared = false;
			break;
		}
	}
	
	//penandaian diff.
	if(_all_sub_cleared){
		global.diff_completed[global.current_difficulty] = true;
		show_debug_message("Difficulty " + string(global.current_difficulty + 1) + " Fully Completed!");
		}
	show_debug_message("Clearing with Rating: " + string(_bintang_didapat) + " Stars")
}

if(stage_cleared && keyboard_check_pressed(vk_space)){
	if(room_exists(room_menu_testing)){
		room_goto(room_menu_testing);
	}
	instance_destroy();
}

//Skala membesaran window ketika stage selesai (Pop Out)
if(stage_cleared) {
	banner_scale = lerp(banner_scale, 1, 0.15);	
}

//tombol back
if(mouse_check_button_pressed(mb_left)){
	var _dist = point_distance(mouse_x, mouse_y, back_x, back_y);
	//ketika klik diarea
	if(_dist <= back_distance){
		room_goto(room_menu_testing);
	}
}

