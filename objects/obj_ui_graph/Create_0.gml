//lokasi tengah layar
ui_x = display_get_gui_width()/2
ui_y = display_get_gui_height()/2

// jarak setiap level stage
padding = 180;

//skala asset pixel art di layar
box_scale = 1;
show_debug_message("UI sudah bisa dibuat")

//Menu Stage 
menu_stage = 0;


image_speed = 0;

//targeting menu.
menu_stage = global.target_menu_stage;
global.target_menu_stage = 0;