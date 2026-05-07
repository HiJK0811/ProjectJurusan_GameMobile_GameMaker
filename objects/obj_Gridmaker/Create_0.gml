room_grid = mp_grid_create(0, 0, room_width/TILESIZE, room_height/TILESIZE, TILESIZE, TILESIZE)

mp_grid_add_instances(room_grid, obj_Wall, 1);