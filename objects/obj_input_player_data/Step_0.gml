if(global.focused_input == noone){
    keyboard_string = "";
}
if(mouse_check_button_pressed(mb_left)){
    
    if(point_in_rectangle(mouse_x, mouse_y, input_x, pos_y[0], input_x+box_w, pos_y[0]+box_h)){
        global.focused_input = "name";
        keyboard_string = "";
    }
    else if(point_in_rectangle(mouse_x, mouse_y, input_x, pos_y[1], input_x+box_w, pos_y[1]+box_h)){
        global.focused_input = "age";
        keyboard_string = input_age;
    }
    else if(point_in_rectangle(mouse_x, mouse_y, input_x, pos_y[2], input_x+box_w, pos_y[2]+box_h)){
        global.focused_input = "email";
        keyboard_string = input_email;
    }
    else if(point_in_rectangle(mouse_x, mouse_y, input_x, pos_y[3], input_x+box_w, pos_y[3]+box_h)){
        global.focused_input = "phone";
        keyboard_string = input_phone;
    }
    else{
        global.focused_input = noone;
        keyboard_string = "";
    }
}
var key = keyboard_lastchar;

// NAME
if(global.focused_input == "name"){
    input_name = string_copy(keyboard_string, 1, 20);
}

// AGE (filter angka)
if(global.focused_input == "age"){
    
    var temp = "";
    
    for(var i = 1; i <= string_length(keyboard_string); i++){
        var c = string_char_at(keyboard_string, i);
        if(string_digits(c) != "") temp += c;
    }
    
    input_age = string_copy(temp, 1, 3);
}

// EMAIL
if(global.focused_input == "email"){
    input_email = string_copy(keyboard_string, 1, 30);
}

// PHONE
if(global.focused_input == "phone"){
    
    var temp = "";
    
    for(var i = 1; i <= string_length(keyboard_string); i++){
        var c = string_char_at(keyboard_string, i);
        if(string_digits(c) != "") temp += c;
    }
    
    input_phone = string_copy(temp, 1, 14);
}
// BACKSPACE
if(keyboard_check_pressed(vk_backspace)){
    if(global.focused_input == "name"){
        input_name = string_delete(input_name, string_length(input_name), 1);
    }
    if(global.focused_input == "age"){
        input_age = string_delete(input_age, string_length(input_age), 1);
    }
    if(global.focused_input == "email"){
        input_email = string_delete(input_email, string_length(input_email), 1);
    }
    if(global.focused_input == "phone"){
        input_phone = string_delete(input_phone, string_length(input_phone), 1);
    }
}
// klik Last Education
if(mouse_check_button_pressed(mb_left)){
    
    // box Last Education
    if(point_in_rectangle(mouse_x, mouse_y,
        input_x, pos_y[4],
        input_x + box_w, pos_y[4] + box_h)){
        
        edu_open = !edu_open;
    }
}
if(edu_open && mouse_check_button_pressed(mb_left)){
    
    // SMA
    if(point_in_rectangle(mouse_x, mouse_y,
        input_x, pos_y[4] + box_h,
        input_x + box_w, pos_y[4] + box_h * 2)){
        
        selected_edu = "SMA";
        selected_major = "";
    }
    
    // SMK
    if(point_in_rectangle(mouse_x, mouse_y,
        input_x, pos_y[4] + box_h * 2,
        input_x + box_w, pos_y[4] + box_h * 3)){
        
        selected_edu = "SMK";
        selected_major = "";
    }
}
if(mouse_check_button_pressed(mb_left)){
    
    var list = (selected_edu == "SMA") ? majors_SMA : majors_SMK;
    
    for(var i = 0; i < array_length(list); i++){
        
        var yes = pos_y[5] + i * box_h;
        
        if(point_in_rectangle(mouse_x, mouse_y,
            input_x, yes,
            input_x + box_w, yes+box_h)){
            
            selected_major = list[i];
            edu_open = false;
        }
    }
}
if(mouse_check_button_pressed(mb_left)){
    
    if(!point_in_rectangle(mouse_x, mouse_y,
        input_x, pos_y[4],
        input_x+box_w, pos_y[4]+box_h*3)){
        
        edu_open = false;
    }
}

if(global.focused_input == "name"){
    input_name += key;
}
global.name = input_name;
global.phone = input_phone;
global.email = input_email;