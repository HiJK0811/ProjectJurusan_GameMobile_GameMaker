// ================= RESET =================
draw_set_alpha(1);
draw_set_color(c_white);

// ================= SHORTCUT =================
var form = global.form;
var ui   = global.ui_state;

// ================= GUI =================
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var col_bg = make_color_rgb(200,220,255);
var col_border = make_color_rgb(20,40,90);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ================= LAYOUT =================
var start_x = 200;
var input_x = 340;

var box_w = 260;
var box_h = 24;
var gap = 34;

// posisi Y
var pos_y = [];
for(var i=0;i<6;i++){
    pos_y[i] = 460 + i * gap;
}

// ================= LABEL =================
var labels = ["Name","Age","Email","Phone Number","Last-Education"];

draw_set_color(c_black);
for(var i=0;i<array_length(labels);i++){
    draw_text(start_x, pos_y[i], labels[i]);
}

// ================= INPUT =================
for(var i=0;i<4;i++){
    
    var x1 = input_x;
    var y1 = pos_y[i];
    var x2 = input_x + box_w;
    var y2 = pos_y[i] + box_h;

    // hover
    if(point_in_rectangle(mx,my,x1,y1,x2,y2)){
        draw_set_alpha(0.15);
        draw_set_color(make_color_rgb(100,150,255));
        draw_rectangle(x1,y1,x2,y2,false);
        draw_set_alpha(1);
    }

    // bg
    draw_set_alpha(0.25);
    draw_set_color(col_bg);
    draw_rectangle(x1,y1,x2,y2,false);
    draw_set_alpha(1);

    // border
    draw_set_color(col_border);
    draw_rectangle(x1,y1,x2,y2,true);
}

// ================= TEXT =================
draw_set_color(c_black);
draw_text(input_x+6, pos_y[0]+box_h/2, form.name);
draw_text(input_x+6, pos_y[1]+box_h/2, form.age);
draw_text(input_x+6, pos_y[2]+box_h/2, form.email);
draw_text(input_x+6, pos_y[3]+box_h/2, form.phone);

// ================= EDU =================
var edu_y = pos_y[4];

// box
draw_set_color(col_border);
draw_rectangle(input_x,edu_y,input_x+box_w,edu_y+box_h,true);

// text
draw_set_color(c_black);
draw_text(input_x+6, edu_y+box_h/2,
    form.edu=="" ? "Select..." : form.edu
);

// dropdown
if(ui.edu_open){
    
    draw_set_color(c_white);
    draw_rectangle(input_x,edu_y+box_h,input_x+box_w,edu_y+box_h*2,false);
    draw_set_color(c_black);
    draw_text(input_x+6, edu_y+box_h*1.5, "SMA");

    draw_set_color(c_white);
    draw_rectangle(input_x,edu_y+box_h*2,input_x+box_w,edu_y+box_h*3,false);
    draw_set_color(c_black);
    draw_text(input_x+6, edu_y+box_h*2.5, "SMK");
}

// ================= MAJOR =================
if(form.edu != ""){
    
    var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;

    var major_base = pos_y[5] - 10;
    var list_y = major_base + box_h + 6;

    // label
    draw_set_color(c_black);
    draw_text(start_x, major_base, "Major");

    // selected box
    draw_set_color(col_border);
    draw_rectangle(input_x,major_base,input_x+box_w,major_base+box_h,true);

    draw_set_color(c_black);
    draw_text(input_x+6, major_base+box_h/2,
        form.major=="" ? "Select Major..." : form.major
    );

    // ===== LIST =====
    if(ui.major_open){
        
        var list_h = min(box_h * global.config.max_visible, 120);

        draw_set_alpha(0.2);
        draw_set_color(col_bg);
        draw_rectangle(input_x,list_y,input_x+box_w,list_y+list_h,false);
        draw_set_alpha(1);

        draw_set_color(col_border);
        draw_rectangle(input_x,list_y,input_x+box_w,list_y+list_h,true);

        gpu_set_scissor(input_x,list_y,box_w,list_h);

        for(var i=0;i<array_length(list);i++){
            
            var yy = list_y + i*box_h + ui.scroll;

            if(yy + box_h < list_y || yy > list_y + list_h) continue;

            // hover (FIX tidak stuck)
            if(point_in_rectangle(mx,my,input_x,yy,input_x+box_w,yy+box_h)
            && form.major != list[i]){
                
                draw_set_color(make_color_rgb(180,200,255));
                draw_rectangle(input_x,yy,input_x+box_w,yy+box_h,false);
            }

            draw_set_color(col_border);
            draw_rectangle(input_x,yy,input_x+box_w,yy+box_h,true);

            draw_set_color(c_black);
            draw_text(input_x+6, yy+box_h/2, list[i]);
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

// ================= RESET =================
draw_set_alpha(1);
draw_set_color(c_white);