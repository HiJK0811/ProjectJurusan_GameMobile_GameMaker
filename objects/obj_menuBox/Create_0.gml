// Tutorial by Peyton Burnham
// How to Make a Menu System (with Submenus) in GameMaker Studio 2!
// https://www.youtube.com/watch?v=xLasKr0ekHY

width = 0
height = 0

options_border = 8
options_space = 16

select_position = 0
menu_level = 0;
options_length = 0;

option[0, 0] = "Start Game"
option[0, 1] = "Settings"
option[0, 2] = "Quit Game"

option[1, 0] = "Window Size"
option[1, 1] = "Brightness"
option[1, 2] = "Controls"
option[1, 3] = "< Back"

option[2, 0] = "4096 x 2160"
option[2, 1] = "1920 x 1080"
option[2, 2] = "1440 x 810"
option[2, 3] = "1280 x 720"
option[2, 4] = "< Back"

option[3, 0] = "WASD"
option[3, 1] = "D-Pad"
option[3, 2] = "Circle-Pad"
option[3, 3] = "Touch"
option[3, 4] = "< Back"