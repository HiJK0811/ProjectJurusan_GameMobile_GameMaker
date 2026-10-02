// Box dimensions
box_width = 90;  // Slightly reduced from 100 to ensure it fits nicely
box_height = 90;
padding = 20;

// Calculate the total width and height of the entire 5x2 grid
var _total_columns = 5;
var _total_rows = 2;

var _grid_width = (_total_columns * box_width) + ((_total_columns - 1) * padding);
var _grid_height = (_total_rows * box_height) + ((_total_rows - 1) * padding);

// Automatically calculate start_x and start_y to perfectly center the grid
start_x = (room_width / 2) - (_grid_width / 2);
start_y = (room_height / 2) - (_grid_height / 2);
