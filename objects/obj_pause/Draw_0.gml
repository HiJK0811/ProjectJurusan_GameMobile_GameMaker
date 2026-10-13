// Only draw the overlay if the game is actually paused
if (paused) {
    // Get the current camera's coordinates and size
    var _cam = view_camera[0];
    var _cam_x = camera_get_view_x(_cam);
    var _cam_y = camera_get_view_y(_cam);
    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
    
    // Set color to black and lower the transparency (alpha)
    draw_set_color(c_black);
    draw_set_alpha(0.7); 
    
    // Draw the rectangle over the camera's view
    draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + _cam_h, false);
    
    // CRITICAL: Always reset alpha and color back to normal!
    draw_set_alpha(1.0);
    draw_set_color(c_white);
}