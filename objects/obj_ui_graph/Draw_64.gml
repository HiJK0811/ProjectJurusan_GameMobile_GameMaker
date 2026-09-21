
//background
draw_sprite_ext(spr_ui_background, 0, ui_x, ui_y, 2, 2, 0, c_white, 1);

// === HALAMAN 1: Select Diff
if (menu_stage == 0) {
    var _sprite_box = [spr_box_easy, spr_box_med, spr_box_hard];
	var _diff_name = ["Easy" , "Medium", "Hard"];
	var _diff_color = [c_lime, c_yellow, c_red];
    var _diff_padding = 280; 
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(font_hanoi_game_judul)
	draw_set_colour(c_yellow);
	draw_text_transformed(ui_x, ui_y - 220, "Select Difficulty", 2.5, 2.5, 0);
    for (var i = 0; i < 3; i++) {
        //posisi x
        var _bx = ui_x - _diff_padding + (i * _diff_padding);
        var _by = ui_y; 
		var _frame_box = global.diff_completed[i] ? 1 : 0;
        //gambar kotak diff
        draw_sprite_ext(_sprite_box[i], 0, _bx, _by, box_scale, box_scale, 0, c_white, 1);
        draw_set_font(font_hanoi_game_subjudul);
		draw_set_colour(_diff_color[i]);
		draw_text_transformed(_bx, _by + 150, _diff_name[i],2.0,2.0,0);
		//if 3 bintang centang diff
		var _all_cleared = true
		for(var _s = 0; _s < 3; _s++){
			if(global.graph_sub_stars[i][_s] == 0) {
			_all_cleared = false; 
			break;
			}//kalau stagenya ada yang belum selesai
		}
		//kalau semua kelar.
		var _frame_box = _all_cleared ? 1 : 0;
		//gambar kotak diff.
		draw_sprite_ext(_sprite_box[i], _frame_box, _bx, _by, box_scale, box_scale, 0, c_white, 1);
	}
} else if (menu_stage == 1) {
	var _diff_colors = [c_lime, c_yellow, c_red];
    var _stage_padding = 300; 
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_colour(c_yellow);
	draw_text_transformed(ui_x, ui_y - 220, "Select Level", 2.5, 2.5, 0);
    for (var i = 0; i < 3; i++) {
        var _bx = ui_x - _stage_padding + (i * _stage_padding);
        var _by = ui_y; // Pas di tengah tinggi papan
        
        // Gambar lingkaran sub-stage
        draw_circle_color(_bx, _by, 70, c_teal, c_dkgrey, false);
        
        // Tulis teks angka sub-stagenya tepat di tengah lingkaran
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(_diff_colors[i]);
        var _prefix = string(global.current_difficulty + 1); 
        var _suffix = string(i + 1);
        draw_text_transformed(_bx, _by, _prefix + "-" + _suffix, 1.5,1.5,0);
		
		//mengambilan data array global.
		var _jumlah_bintang =  global.graph_sub_stars[global.current_difficulty][i];
		
		//gambar tabel bintang
		var _startable_scale = 2.2;
        draw_sprite_ext(spr_star_table, _jumlah_bintang, _bx, _by + 95, _startable_scale, _startable_scale, 0, c_white, 1);
    }
}


//lokasi tombol
var _back_x = ui_x - 500;
var _back_y = ui_y - 200;

//skala tombol
var _back_scale = 0.35;

//tombol back
draw_sprite_ext(spr_back_button, 0, _back_x, _back_y, _back_scale, _back_scale, 0, c_white, 1);


