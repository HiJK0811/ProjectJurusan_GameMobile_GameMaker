if (surface_exists(game_surface)) {
    surface_free(game_surface);
}
game_width  = room_width;
game_height = room_height;
game_surface = surface_create(game_width, game_height);