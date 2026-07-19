// ================= RESET =================
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// ================= MOUSE (WAJIB ADA) =================
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ================= BACKGROUND =================
draw_set_color(make_color_rgb(30,30,40));
draw_rectangle(sidebar_x, 0, sidebar_x + sidebar_w, display_get_gui_height(), false);

// ================= TITLE =================
draw_set_color(c_white);
draw_text(sidebar_x + 20, 40, "DEBUG PANEL");

// ================= MENU =================
for(var i=0;i<array_length(menu_list);i++){
    var item_y = 100 + i * 40;

    if(point_in_rectangle(mx,my, sidebar_x, item_y, sidebar_x+sidebar_w, item_y+30)){
        draw_set_color(make_color_rgb(80,120,200));
        draw_rectangle(sidebar_x, item_y, sidebar_x+sidebar_w, item_y+30, false);
    }

    draw_set_color(c_white);
    draw_text(sidebar_x + 20, item_y + 15, menu_list[i]);
}

// ================= INFO =================
draw_set_color(c_lime);
draw_text(sidebar_x + 20, display_get_gui_height() - 40,
    "Total Data: " + string(array_length(global.user_data))
);

// last data
if(array_length(global.user_data) > 0){
    var last = global.user_data[array_length(global.user_data)-1];
    draw_set_color(c_yellow);
    draw_text(sidebar_x + 20, display_get_gui_height() - 20,
        "Last: " + last.name
    );
}