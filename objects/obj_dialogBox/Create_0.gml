// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 1: Setup and Typing Effect)
// https://www.youtube.com/watch?v=rEYSi0ahC5Q

// Episode 1
// Dialog Box Parameters
dialogBox_height = 90;
dialogBox_width[0] = 30;

border = 8;
line_separation = 12;
line_width[0] = dialogBox_width[0] - border*2;

dialogBox_image = 0;
dialogBox_image_speed = 0;

// Episode 1
// Text
page = 0
page_number = 0;
text[0] = ""
text_length[0] = string_length(text[0])

draw_character = 0
text_speed = 1

// Episode 3
// [number of characters in page, page number], x and y position
chara[0, 0] = "";
chara_x[0,0] = 0;
chara_y[0,0] = 0;

// Episode 2
// Options
option[0] = ""
option_link_id[0] = -1;
option_pos = 0;
option_number = 0

// Episode 1
setup = false;

// Episode 3
// Effects
scr_set_defaults_for_text();
last_free_space = 0;

// Episode 4