
// ================= SAFETY CHECK (WAJIB PALING ATAS) =================
if(!variable_global_exists("ui_state")){
    global.ui_state = {
        gender_open : false,
        edu_open    : false,
        major_open  : false,
        scroll      : 0
    };
}
if(!variable_struct_exists(global.ui_state, "gender_open")) global.ui_state.gender_open = false;
if(!variable_struct_exists(global.ui_state, "edu_open"))    global.ui_state.edu_open = false;
if(!variable_struct_exists(global.ui_state, "major_open"))  global.ui_state.major_open = false;
if(!variable_struct_exists(global.ui_state, "scroll"))      global.ui_state.scroll = 0;

if(!variable_global_exists("form")){
    global.form = { name:"", age:"", email:"", phone:"", gender:"", edu:"", major:"" };
}
if(!variable_struct_exists(global.form, "gender")) global.form.gender = "";

if(!variable_global_exists("genders")){
    global.genders = ["Laki-laki","Perempuan"];
}

// ================= RESET =================
draw_set_alpha(1);
draw_set_color(c_white);

// ================= SHORTCUT =================
var form = global.form;
var ui   = global.ui_state;
var fp   = global.field_pos;

// ================= GUI =================
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var col_bg = make_color_rgb(200,220,255);
var col_border = make_color_rgb(20,40,90);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ================= DEBUG: KOORDINAT MOUSE (HAPUS SETELAH SELESAI) =================
draw_set_color(c_yellow);
draw_text(10, 10, "Mouse GUI: " + string(mx) + ", " + string(my));
draw_set_color(c_white);

// ================= PORTRAIT (BERDASARKAN GENDER, AUTO-SCALE) =================
// ================= GUIDE BOX (SEMENTARA, buat cari posisi) =================
var portrait_x = 190;
var portrait_y = 472;
var portrait_box_w =143;
var portrait_box_h = 166;
var portrait_zoom = 4.8;
/*draw_set_color(c_red);
draw_set_alpha(1);
draw_rectangle(portrait_x, portrait_y, portrait_x + portrait_box_w, portrait_y + portrait_box_h, true);
draw_text(portrait_x, portrait_y - 15, "GUIDE: " + string(portrait_x) + "," + string(portrait_y) + " " + string(portrait_box_w) + "x" + string(portrait_box_h));
pengukuran potrait */

var spr_name = "";
if(form.gender == "Laki-laki") spr_name = "spr_Input_potrait_male";
else if(form.gender == "Perempuan") spr_name = "spr_Input_potrait_female";

var portrait_spr = (spr_name != "") ? asset_get_index(spr_name) : -1;

if(portrait_spr != -1){
    draw_set_color(c_white);
    draw_set_alpha(1);

    var spr_w = sprite_get_width(portrait_spr);
    var spr_h = sprite_get_height(portrait_spr);

    var scale_x = (portrait_box_w / spr_w) * portrait_zoom;
    var scale_y = (portrait_box_h / spr_h) * portrait_zoom;

    // biar gambar yang dizoom tetap ke-center di box (gak geser ke kanan-bawah)
    var draw_x = portrait_x - (spr_w * scale_x - portrait_box_w) / 2;
    var draw_y = portrait_y - (spr_h * scale_y - portrait_box_h) / 2;

    draw_sprite_ext(portrait_spr, 0, draw_x, draw_y, scale_x, scale_y, 0, c_white, 1);
} else {
    draw_set_color(make_color_rgb(180,180,180));
    draw_set_halign(fa_center);
    draw_text(portrait_x, portrait_y, spr_name=="" ? "No Photo" : "SPRITE NOT FOUND: " + spr_name);
    draw_set_halign(fa_left);
    draw_set_color(c_black);
}
// ================= HELPER: DRAW INPUT BOX =================
function draw_input_box(_fp, _text, _mx, _my, _placeholder){
    var x1 = _fp.x;
    var y1 = _fp.y;
    var x2 = _fp.x + _fp.w;
    var y2 = _fp.y + _fp.h;

    if(point_in_rectangle(_mx,_my,x1,y1,x2,y2)){
        draw_set_alpha(0.15);
        draw_set_color(make_color_rgb(100,150,255));
        draw_rectangle(x1,y1,x2,y2,false);
        draw_set_alpha(1);
    }

    draw_set_color(make_color_rgb(20,40,90));
    draw_rectangle(x1,y1,x2,y2,true);

    draw_set_color(c_black);
    draw_text(x1+6, (y1+y2)/2, _text=="" ? _placeholder : _text);
}

// ================= NAME / AGE / EMAIL / PHONE =================
draw_input_box(fp.name,  form.name,  mx, my, "");
draw_input_box(fp.age,   form.age,   mx, my, "");
draw_input_box(fp.email, form.email, mx, my, "");
draw_input_box(fp.phone, form.phone, mx, my, "");

// ================= GENDER =================
draw_set_color(col_border);
draw_rectangle(fp.gender.x, fp.gender.y, fp.gender.x+fp.gender.w, fp.gender.y+fp.gender.h, true);
draw_set_color(c_black);
draw_text(fp.gender.x+6, fp.gender.y+fp.gender.h/2,
    form.gender=="" ? "Select..." : form.gender
);

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

// ================= EDU (Last-Education) =================
draw_set_color(col_border);
draw_rectangle(fp.edu.x, fp.edu.y, fp.edu.x+fp.edu.w, fp.edu.y+fp.edu.h, true);
draw_set_color(c_black);
draw_text(fp.edu.x+6, fp.edu.y+fp.edu.h/2,
    form.edu=="" ? "Select..." : form.edu
);

if(ui.edu_open){
    draw_set_color(c_white);
    draw_rectangle(fp.edu.x, fp.edu.y+fp.edu.h, fp.edu.x+fp.edu.w, fp.edu.y+fp.edu.h*2, false);
    draw_set_color(c_black);
    draw_text(fp.edu.x+6, fp.edu.y+fp.edu.h*1.5, "SMA");

    draw_set_color(c_white);
    draw_rectangle(fp.edu.x, fp.edu.y+fp.edu.h*2, fp.edu.x+fp.edu.w, fp.edu.y+fp.edu.h*3, false);
    draw_set_color(c_black);
    draw_text(fp.edu.x+6, fp.edu.y+fp.edu.h*2.5, "SMK");
}

// ================= MAJOR (pakai fp.major langsung, independen dari edu) =================
if(form.edu != ""){
    var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;

    draw_set_color(c_black);
    draw_text(fp.major.x, fp.major.y - 15, "Major");

    draw_set_color(col_border);
    draw_rectangle(fp.major.x, fp.major.y, fp.major.x+fp.major.w, fp.major.y+fp.major.h, true);

    draw_set_color(c_black);
    draw_text(fp.major.x+6, fp.major.y+fp.major.h/2,
        form.major=="" ? "Select Major..." : form.major
    );

    if(ui.major_open){
        var list_y = fp.major.y + fp.major.h + 6;
        var list_h = fp.major.h * global.config.max_visible;

        draw_set_alpha(0.2);
        draw_set_color(col_bg);
        draw_rectangle(fp.major.x, list_y, fp.major.x+fp.major.w, list_y+list_h, false);
        draw_set_alpha(1);

        draw_set_color(col_border);
        draw_rectangle(fp.major.x, list_y, fp.major.x+fp.major.w, list_y+list_h, true);

        gpu_set_scissor(fp.major.x, list_y, fp.major.w, list_h);

        for(var i=0;i<array_length(list);i++){
            var yy = list_y + i*fp.major.h + ui.scroll;
            if(yy + fp.major.h < list_y || yy > list_y + list_h) continue;

            if(point_in_rectangle(mx,my,fp.major.x,yy,fp.major.x+fp.major.w,yy+fp.major.h)
            && form.major != list[i]){
                draw_set_color(make_color_rgb(180,200,255));
                draw_rectangle(fp.major.x,yy,fp.major.x+fp.major.w,yy+fp.major.h,false);
            }

            draw_set_color(col_border);
            draw_rectangle(fp.major.x,yy,fp.major.x+fp.major.w,yy+fp.major.h,true);

            draw_set_color(c_black);
            draw_text(fp.major.x+6, yy+fp.major.h/2, list[i]);
        }

        gpu_set_scissor(0,0,display_get_gui_width(),display_get_gui_height());
    }
}

// ================= SUBMIT BUTTON =================
var btn_x1 = 880;
var btn_y1 = 640;
var btn_x2 = 1020;
var btn_y2 = 700;

if(point_in_rectangle(mx,my,btn_x1,btn_y1,btn_x2,btn_y2)){
    draw_set_color(make_color_rgb(255,220,120));
    draw_rectangle(btn_x1,btn_y1,btn_x2,btn_y2,false);
}

draw_set_color(make_color_rgb(200,170,50));
draw_rectangle(btn_x1,btn_y1,btn_x2,btn_y2,true);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text((btn_x1+btn_x2)/2,(btn_y1+btn_y2)/2,"SUBMIT");
draw_set_halign(fa_left);

// ================= MIGUEL BUTTON =================
var btn_x = 700;
var btn_y = 340;
var btn_w = 200;
var btn_h = 160;

var btn_x1 = btn_x;
var btn_y1 = btn_y;
var btn_x2 = btn_x + btn_w;
var btn_y2 = btn_y + btn_h;

if(point_in_rectangle(mx,my,btn_x1,btn_y1,btn_x2,btn_y2)){
    draw_set_color(make_color_rgb(255,220,120));
    draw_rectangle(btn_x1,btn_y1,btn_x2,btn_y2,false);
}

draw_set_color(make_color_rgb(200,170,50));
draw_rectangle(btn_x1,btn_y1,btn_x2,btn_y2,true);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text((btn_x1+btn_x2)/2,(btn_y1+btn_y2)/2,"Miguel");
draw_set_halign(fa_left);

// ================= RESET =================
draw_set_alpha(1);
draw_set_color(c_white);