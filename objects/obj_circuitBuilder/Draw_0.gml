depth = 10;

with (obj_switch){
    for (var i = 0; i < array_length(outputsTo); i++){
        var target = outputsTo[i];
        if (currentState == logicState.ON){
            draw_set_color(c_lime);
		}
        else{
            draw_set_color(c_gray);
		}
        draw_line_width(x, y, target.x, target.y, 2);
    }
}

with (obj_logicGate){
    for (var i = 0; i < array_length(outputsTo); i++){
        var target = outputsTo[i];

        if (currentState == logicState.ON){
            draw_set_color(c_lime);
		}
        else{
            draw_set_color(c_gray);
		}
        draw_line_width(x, y, target.x, target.y, 2);
    }
}