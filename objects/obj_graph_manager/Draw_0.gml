
if(array_length(nodes) == 0){
	exit;
}

if(instance_exists(obj_ui_graph)){
	exit;
}

draw_clear(c_black);
 
//gambar background
draw_sprite(spr_ui_background, 0, ui_x, ui_y)


//Looping : kabel/lazer sirkuit
for(var i = 0; i < array_length(edges_possible); i++){
	var _edge = edges_possible[i];

	//koordinat planet awal, planet tujuan
	var _p1 = nodes[_edge.n1];
	var _p2 = nodes[_edge.n2];
	
	//warna dan ketebalan laser
	var _warna_laser = _edge.terpilih? c_aqua : c_dkgray;
	var _tebal_laser = _edge.terpilih? 4 : 2;
	
	//Gambar garis lazer
	draw_line_width_colour(_p1.xx, _p1.yy, _p2.xx, _p2.yy, _tebal_laser, _warna_laser, _warna_laser);
	
	//gambar angka bobot di tengah garis laser
	var _tengah_x = (_p1.xx + _p2.xx)/2;
	var _tengah_y = (_p1.yy + _p2.yy)/2;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_colour(c_yellow); //warna teks
	draw_text(_tengah_x, _tengah_y - 15, string(_edge.bobot)); //textnya
}

//Looping : planet (nodes)
for(var i = 0; i <array_length(nodes); i++){
	//gambar planet
	var _node = nodes[i]
	draw_circle_colour(_node.xx, _node.yy, 25, c_purple, c_black, false);
	
	//nama + lore kecil.
	draw_set_colour(c_white);
	draw_text(_node.xx, _node.yy, _node.nama);
}

if(variable_instance_exists(id,"roket_x") && variable_instance_exists(id,"roket_y")){
	//gambar roket di atas planet
	draw_sprite_ext(spr_roket_graph, 0, roket_x, roket_y, 1, 1, 0, c_white, 1);
}else {
	show_debug_message("tidak ada target planet")
}
//chat dikemenangan dan total bobot dll
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//NOTE : bobot toleransi
var _toleransi_maksimal = target_bobot_maksimum + (target_bobot_maksimum * 0.5);

var _target_tampilan = target_bobot_maksimum;
var _label_target = "Target Max Weight (3 Stars) : ";




//total bobot
if(total_bobot_jalan <= target_bobot_maksimum) {
	draw_set_colour(c_lime);
	_target_tampilan = target_bobot_maksimum;
	_label_target = "Target Max Weight (3 Stars) : ";
} else if(total_bobot_jalan <= _toleransi_maksimal){
	draw_set_colour(c_yellow);
	_target_tampilan = _toleransi_maksimal;
	_label_target = "Tolerance Target (2 Stars)  : ";
} else {
	draw_set_colour(c_red);
	_target_tampilan = _toleransi_maksimal;
	_label_target = "Target Exceeded (1 Star)    : " 
}
draw_text(20, 20, "Circuit Weight: " + string(total_bobot_jalan));
draw_text(20, 40, "Mission		 :  Connect " + nodes[indeks_start].nama + " -> " + nodes[indeks_target].nama);
draw_text(320, 320, _label_target + string(_target_tampilan));

if(sprite_exists(spr_back_button)){
	draw_sprite_ext(spr_back_button, 0, back_x , back_y, back_size, back_scale, 0 ,c_white, 1);
}	

//Tampilan banner jika sudah menang
if(stage_cleared){
	
	//titik pusat pop out
	var _cx = 320;
	var _cy = 180;
	//transformasi matriks untuk semua penghuni didalam window
	var _matrix_banner = matrix_build(_cx, _cy, 0, 0, 0, 0, banner_scale, banner_scale ,1);
	matrix_set(matrix_world, _matrix_banner);
	
	//tambah border
	draw_set_alpha(0.30 * banner_scale)
	draw_rectangle_colour(-241, -101, 241, 101, c_aqua, c_aqua, c_aqua, c_aqua, false);
	
	//gambar background half transparent.
	draw_set_alpha(0.75 * banner_scale);
	//kotak banner digambar relatif dari pusat (-260 --> 260)
	draw_rectangle_colour(-240, -100, 240, 100, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1.0);
	
	
	//notif berhasil
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	//Judul Banner
	draw_set_colour(c_aqua);
	draw_text(0, -60, "--- Network Connected ---");
	
	//logika target dan Teks Bintang banner.
	var _stars = global.graph_sub_stars[global.current_difficulty][global.current_sub_stage];
	var _target_banner = (_stars == 3) ? target_bobot_maksimum : _toleransi_maksimal;
	var _bintang_teks = (_stars == 1) ? "Star!" : "Stars!";
	
	//Teks Perhitungan bobot
	draw_set_colour(c_white);
	draw_text(0, -20, "Final Weight: " + string(total_bobot_jalan) + " / " + string(_target_banner));
	
	//tampilan jumlah bintang dalam bentuk teks sementara
	//var _sub_index = 0;
	draw_set_colour(c_yellow)
	draw_text(0, 20, " Rating: " + string(_stars)+ " " +  _bintang_teks);
	
	draw_set_colour(c_lime);
	draw_text(0, 60, "Press Space / Tap to return to Meeting Room");
	
	//Netral Matrix (Note : Wajib dilakukan)
	matrix_set(matrix_world, matrix_build_identity());
}


