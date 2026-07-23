if (instance_exists(obj_clawf)) {
    // If the game is finished, push the close button behind the dark overlay
    if (obj_clawf.game_selesai == true) {
        depth = obj_clawf.depth + 10; 
    } 
    // Otherwise, keep it at the absolute front for the menu
    else {
        depth = -15000; 
    }
} else {
    // Failsafe in case the claw isn't in the room yet
    depth = -15000;
}