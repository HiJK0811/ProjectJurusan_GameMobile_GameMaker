title = "Binusian Space Lounge"

menu[0] = "Play Game"
menu[1] = "Tutorial"
menu[2] = "Quit Game"

options_max = array_length(menu);

width = 200
height = 100
margin = 20

// --- NEW NAVIGATION VARIABLES ---
index = 0; // Starts with the first option selected
last_mouse_x = device_mouse_x_to_gui(0);
last_mouse_y = device_mouse_y_to_gui(0);