title = "Binusian Space Lounge"

// 🔥 Cek apakah save file ada
var _has_save = check_save_exists();

// Susun array menu secara dinamis berdasarkan keberadaan save file
menu = [];
if (_has_save) {
    array_push(menu, "Continue"); // Index 0
}
array_push(menu, "Play Game");    // Index 1 (atau 0 jika tidak ada save)
array_push(menu, "Tutorial");     // Index 2 (atau 1)
array_push(menu, "Quit Game");    // Index 3 (atau 2)

options_max = array_length(menu);

width = 200
height = 100
margin = 20

// --- NEW NAVIGATION VARIABLES ---
index = 0; // Starts with the first option selected
last_mouse_x = device_mouse_x_to_gui(0);
last_mouse_y = device_mouse_y_to_gui(0);

// --- FORCE CAMERA RESET ---
// Grab the default camera and physically shove it to X:0, Y:0
var _cam = view_camera[0];
camera_set_view_pos(_cam, 0, 0);

// Ensure it is the correct size for the menu
camera_set_view_size(_cam, 320, 180);