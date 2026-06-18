// Only initialize these if they haven't been created yet
if (!variable_global_exists("highest_unlocked")) {
    global.current_level = 0; 
    global.total_levels = 10;
    global.highest_unlocked = 0; 
}