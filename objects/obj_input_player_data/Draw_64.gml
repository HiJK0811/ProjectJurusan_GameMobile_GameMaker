draw_self();

// SETUP
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var col_bg = make_color_rgb(200, 220, 255);
var col_border = make_color_rgb(20, 40, 90);
var start_x = 350;

// === LABEL ===
var labels = [
    label_text1,
    label_text2,
    label_text3,
    label_text4,
    label_text5
];

for(var i = 0; i < array_length(labels); i++){
    draw_set_color(c_black);
    draw_text(start_x, pos_y[i], labels[i]);
}

// === INPUT BOX (TRANSPARAN + BORDER) ===
for(var i = 0; i < 4; i++){
	 if(point_in_rectangle(mouse_x, mouse_y,
        input_x, pos_y[i],
        input_x + box_w, pos_y[i] + box_h)){
        
        draw_set_alpha(0.2);
        draw_set_color(make_color_rgb(100,150,255));
        
        draw_rectangle(
            input_x,
            pos_y[i],
            input_x + box_w,
            pos_y[i] + box_h,
            false
        );
        
        draw_set_alpha(1);
    }
    
    // background transparan
    draw_set_alpha(0.25);
    draw_set_color(col_bg);
    
    draw_rectangle(
        input_x,
        pos_y[i],
        input_x + box_w,
        pos_y[i] + box_h,
        false
    );
    
    // border
    draw_set_alpha(1);
    draw_set_color(col_border);
    
    draw_rectangle(
        input_x,
        pos_y[i],
        input_x + box_w,
        pos_y[i] + box_h,
        true
    );
}

// === INPUT TEXT ===
draw_set_color(c_black);

draw_text(input_x+8, pos_y[0]+6, input_name);
draw_text(input_x+8, pos_y[1]+6, input_age);
draw_text(input_x+8, pos_y[2]+6, input_email);
draw_text(input_x+8, pos_y[3]+6, input_phone);

// === LAST EDUCATION ===
draw_set_color(col_border);
draw_rectangle(input_x, pos_y[4], input_x+box_w, pos_y[4]+box_h, true);

draw_set_color(c_black);
draw_text(input_x+5, pos_y[4]+6, selected_edu == "" ? "Select..." : selected_edu);

// === MAJOR LIST ===
if(selected_edu != ""){
    
    var list = (selected_edu == "SMA") ? majors_SMA : majors_SMK;
    var label_major = (selected_edu == "SMA") ? label_text5_A : label_text5_B;
    
    draw_text(start_x, pos_y[5], label_major);
    
    for(var i = 0; i < array_length(list); i++){
        
        var yy = pos_y[6] + i * box_h;
        
        draw_set_color(col_border);
        draw_rectangle(input_x, yy, input_x+box_w, yy+box_h, true);
        
        draw_set_color(c_black);
        draw_text(input_x+5, yy+5, list[i]);
    }
}