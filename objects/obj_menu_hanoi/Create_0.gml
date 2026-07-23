// Create the tracker only if it doesn't exist yet so it doesn't reset when you reopen the menu
if (!variable_global_exists("hanoi_beaten")) {
    global.hanoi_beaten = [false, false, false]; // [0] = Easy, [1] = Medium, [2] = Hard
}

pilihan = ["Easy", "Medium", "Hard"];
index_pilih = 0;
menu_aktif = true;

depth = -5000; // Force the menu to a specific depth