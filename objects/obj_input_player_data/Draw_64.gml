// ================= DRAW GUI EVENT =================
draw_set_alpha(1);
draw_set_color(c_white);

// Shortcut & State
var form = global.form;
var ui   = global.ui_state;
var fp   = global.field_pos;

// GUI
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var col_border = make_color_rgb(20,40,90);
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ================= 1. PORTRAIT =================
var portrait_x = 145; 
var portrait_y = 380; 
var portrait_box_w = 175; 
var portrait_box_h = 230; 

var spr_name = "";
if(form.gender == "Laki-laki") spr_name = "spr_Input_potrait_male";
else if(form.gender == "Perempuan") spr_name = "spr_Input_potrait_female";

var portrait_spr = (spr_name != "") ? asset_get_index(spr_name) : -1;

if(portrait_spr != -1){
    var spr_w = sprite_get_width(portrait_spr);
    var spr_h = sprite_get_height(portrait_spr);

    var scale_x = portrait_box_w / spr_w;
    var scale_y = portrait_box_h / spr_h;

    gpu_set_scissor(portrait_x, portrait_y, portrait_box_w, portrait_box_h);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_sprite_ext(portrait_spr, 0, portrait_x, portrait_y, scale_x, scale_y, 0, c_white, 1);
    gpu_set_scissor(0, 0, display_get_gui_width(), display_get_gui_height());
}

// ================= 2. HELPER: DRAW INPUT BOX =================
function draw_input_box(_fp, _text, _mx, _my, _placeholder){
    var x1 = _fp.x;
    var y1 = _fp.y;
    var x2 = _fp.x + _fp.w;
    var y2 = _fp.y + _fp.h;

    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_rectangle(x1, y1, x2, y2, false);

    if(point_in_rectangle(_mx,_my,x1,y1,x2,y2)){
        draw_set_alpha(0.2);
        draw_set_color(make_color_rgb(100,150,255));
        draw_rectangle(x1, y1, x2, y2, false);
        draw_set_alpha(1);
    }

    draw_set_color(make_color_rgb(20,40,90));
    draw_rectangle(x1, y1, x2, y2, true);

    draw_set_color(c_black);
    draw_text(x1 + 6, (y1 + y2) / 2, _text == "" ? _placeholder : _text);
}

// ================= 3. DRAW FIELDS & INPUTS (URUTAN DIATUR AGAR EMAIL TIDAK MENUTUPI DROPDOWN) =================

// Email (Dipindah ke atas agar digambar duluan)
draw_text(fp.email.x, fp.email.y - 16, "Email:");
draw_input_box(fp.email, form.email, mx, my, "");

// Gender
draw_set_color(col_border);
draw_text(fp.gender.x, fp.gender.y - 16, "Gender:");
draw_set_color(c_white);
draw_rectangle(fp.gender.x, fp.gender.y, fp.gender.x+fp.gender.w, fp.gender.y+fp.gender.h, false);
draw_set_color(col_border);
draw_rectangle(fp.gender.x, fp.gender.y, fp.gender.x+fp.gender.w, fp.gender.y+fp.gender.h, true);
draw_set_color(c_black);
draw_text(fp.gender.x+6, fp.gender.y+fp.gender.h/2, form.gender=="" ? "Select..." : form.gender);

// Phone
draw_text(fp.phone.x, fp.phone.y - 16, "No. Telepon:");
draw_input_box(fp.phone, form.phone, mx, my, "");

// Nama
draw_text(fp.name.x, fp.name.y - 16, "Nama:");
draw_input_box(fp.name, form.name, mx, my, "");

// Umur
draw_text(fp.age.x, fp.age.y - 16, "Umur:");
draw_input_box(fp.age, form.age, mx, my, "");

// Pendidikan
draw_text(fp.edu.x, fp.edu.y - 16, "Pendidikan:");
draw_set_color(c_white);
draw_rectangle(fp.edu.x, fp.edu.y, fp.edu.x+fp.edu.w, fp.edu.y+fp.edu.h, false);
draw_set_color(col_border);
draw_rectangle(fp.edu.x, fp.edu.y, fp.edu.x+fp.edu.w, fp.edu.y+fp.edu.h, true);
draw_set_color(c_black);
draw_text(fp.edu.x+6, fp.edu.y+fp.edu.h/2, form.edu=="" ? "Select..." : form.edu);

// Jurusan
if(form.edu != ""){
    var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;
    draw_set_color(col_border);
    draw_text(fp.major.x, fp.major.y - 16, "Jurusan:");
    draw_set_color(c_white);
    draw_rectangle(fp.major.x, fp.major.y, fp.major.x+fp.major.w, fp.major.y+fp.major.h, false);
    draw_set_color(col_border);
    draw_rectangle(fp.major.x, fp.major.y, fp.major.x+fp.major.w, fp.major.y+fp.major.h, true);
    draw_set_color(c_black);
    draw_text(fp.major.x+6, fp.major.y+fp.major.h/2, form.major=="" ? "Select Major..." : form.major);
}

// ================= 4. DROPDOWN LIST (DIGAMBAR PALING AKHIR AGAR BERADA DI LAPISAN PALING ATAS) =================

// Dropdown Gender List
if(ui.gender_open){
    for(var i=0;i<array_length(global.genders);i++){
        var gy1 = fp.gender.y + fp.gender.h + i*fp.gender.h;
        var gy2 = gy1 + fp.gender.h;
        draw_set_color(c_white);
        draw_rectangle(fp.gender.x, gy1, fp.gender.x+fp.gender.w, gy2, false);
        if(point_in_rectangle(mx,my,fp.gender.x,gy1,fp.gender.x+fp.gender.w,gy2)){
            draw_set_color(make_color_rgb(180,200,255));
            draw_rectangle(fp.gender.x, gy1, fp.gender.x+fp.gender.w, gy2, false);
        }
        draw_set_color(col_border);
        draw_rectangle(fp.gender.x, gy1, fp.gender.x+fp.gender.w, gy2, true);
        draw_set_color(c_black);
        draw_text(fp.gender.x+6, (gy1+gy2)/2, global.genders[i]);
    }
}

// Dropdown Pendidikan List (SMA / SMK)
if(ui.edu_open){
    var edu_y1 = fp.edu.y + fp.edu.h;
    draw_set_color(c_white);
    draw_rectangle(fp.edu.x, edu_y1, fp.edu.x+fp.edu.w, edu_y1 + fp.edu.h, false);
    draw_set_color(col_border);
    draw_rectangle(fp.edu.x, edu_y1, fp.edu.x+fp.edu.w, edu_y1 + fp.edu.h, true);
    draw_set_color(c_black);
    draw_text(fp.edu.x+6, edu_y1 + fp.edu.h/2, "SMA");

    var edu_y2 = edu_y1 + fp.edu.h;
    draw_set_color(c_white);
    draw_rectangle(fp.edu.x, edu_y2, fp.edu.x+fp.edu.w, edu_y2 + fp.edu.h, false);
    draw_set_color(col_border);
    draw_rectangle(fp.edu.x, edu_y2, fp.edu.x+fp.edu.w, edu_y2 + fp.edu.h, true);
    draw_set_color(c_black);
    draw_text(fp.edu.x+6, edu_y2 + fp.edu.h/2, "SMK");
}

// ================= DROPDOWN JURUSAN LIST (SMA & SMK) =================
if(form.edu != "" && ui.major_open){
    var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;
    var list_y = fp.major.y + fp.major.h + 2;
    
    // Tinggi area kotak tampilan yang terlihat di layar (dibatasi max_visible)
    var view_h = fp.major.h * global.config.max_visible;
    
    // Tinggi total seluruh background putih untuk semua item dalam list
    var total_h = fp.major.h * array_length(list);

    // 1. Gambar background putih secara keseluruhan sejumlah total item
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(fp.major.x, list_y, fp.major.x + fp.major.w, list_y + total_h, false);

    draw_set_color(col_border);
    draw_rectangle(fp.major.x, list_y, fp.major.x + fp.major.w, list_y + total_h, true);

    // 2. Batasi area render (scissor) agar yang tampil hanya sepanjang view_h (max_visible)
    gpu_set_scissor(fp.major.x, list_y, fp.major.w, view_h);

    for(var i=0; i<array_length(list); i++){
        var yy = list_y + i * fp.major.h + ui.scroll;
        
        // Cek hover untuk warna biru
        if(point_in_rectangle(mx, my, fp.major.x, yy, fp.major.x + fp.major.w, yy + fp.major.h) && form.major != list[i]){
            draw_set_color(make_color_rgb(180,200,255));
            draw_rectangle(fp.major.x, yy, fp.major.x + fp.major.w, yy + fp.major.h, false);
        }

        draw_set_color(col_border);
        draw_rectangle(fp.major.x, yy, fp.major.x + fp.major.w, yy + fp.major.h, true);

        draw_set_color(c_black);
        draw_text(fp.major.x + 6, yy + fp.major.h / 2, list[i]);
    }
    
    // Matikan scissor kembali ke layar penuh
    gpu_set_scissor(0, 0, display_get_gui_width(), display_get_gui_height());
}

// ================= 5. TOMBOL SUBMIT =================
var btn_x1 = 730;
var btn_y1 = 455;
var btn_x2 = 880;
var btn_y2 = 510;

var hover = point_in_rectangle(mx, my, btn_x1, btn_y1, btn_x2, btn_y2);
if(hover){
    draw_set_color(make_color_rgb(255,220,120));
    draw_rectangle(btn_x1, btn_y1, btn_x2, btn_y2, false);
} else {
    draw_set_color(c_white);
    draw_rectangle(btn_x1, btn_y1, btn_x2, btn_y2, false);
}
draw_set_color(make_color_rgb(200,170,50));
draw_rectangle(btn_x1, btn_y1, btn_x2, btn_y2, true);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text((btn_x1+btn_x2)/2, (btn_y1+btn_y2)/2, "SUBMIT");
draw_set_halign(fa_left);

// ================= RESET =================
draw_set_alpha(1);
draw_set_color(c_white);