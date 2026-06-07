// ================= GUI MOUSE =================
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var click = mouse_check_button_pressed(mb_left);

// ================= LAYOUT =================
var start_x = 200;
var input_x = 340;

var box_w = 260;
var box_h = 24;
var gap = 34;

// posisi Y
var pos_y = [];
for(var i=0;i<6;i++){
    pos_y[i] = 460 + i * gap;
}

// ================= SHORTCUT =================
var form = global.form;
var ui   = global.ui_state;

// ================= FIELD =================
var fields = ["name","age","email","phone"];

// ================= CLICK =================
if(click){

    var found = false;

    // === INPUT FIELD ===
    for(var i=0;i<4;i++){
        if(point_in_rectangle(mx,my,
            input_x, pos_y[i],
            input_x + box_w, pos_y[i] + box_h)){
            
            global.focused_input = fields[i];
            found = true;
        }
    }

    // === DROPDOWN EDU ===
    if(point_in_rectangle(mx,my,
        input_x, pos_y[4],
        input_x + box_w, pos_y[4] + box_h)){
        
        ui.edu_open = !ui.edu_open;
        ui.major_open = false;
        global.focused_input = noone;
        found = true;
    }

    // === PILIH SMA / SMK ===
    if(ui.edu_open){
        
        if(point_in_rectangle(mx,my,
            input_x, pos_y[4] + box_h,
            input_x + box_w, pos_y[4] + box_h * 2)){
            
            form.edu = "SMA";
            form.major = "";
            ui.scroll = 0;
            ui.major_open = false;
            ui.edu_open = false;
            found = true;
        }

        if(point_in_rectangle(mx,my,
            input_x, pos_y[4] + box_h * 2,
            input_x + box_w, pos_y[4] + box_h * 3)){
            
            form.edu = "SMK";
            form.major = "";
            ui.scroll = 0;
            ui.major_open = false;
            ui.edu_open = false;
            found = true;
        }
    }

    // === TOGGLE MAJOR ===
    if(form.edu != ""){
        
        var major_base = pos_y[5];

        if(point_in_rectangle(mx,my,
            input_x, major_base,
            input_x + box_w, major_base + box_h)){
            
            ui.major_open = !ui.major_open;
            found = true;
        }
    }

    // === PILIH MAJOR ===
    if(form.edu != "" && ui.major_open){
        
        var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;

        var major_base = pos_y[5];
        var list_y = major_base + box_h + 8;
        var list_h = box_h * global.config.max_visible;

        for(var i=0;i<array_length(list);i++){
            
            var yy = list_y + i * box_h + ui.scroll;

            if(point_in_rectangle(mx,my,
                input_x, yy,
                input_x + box_w, yy + box_h)){
                
                if(yy >= list_y && yy <= list_y + list_h){
                    form.major = list[i];
                    ui.major_open = false;
                    found = true;
                }
            }
        }
    }

    // === SUBMIT BUTTON ===
    if(point_in_rectangle(mx,my,900,620,1000,680)){
        
        show_debug_message("=== SUBMIT ===");
        show_debug_message("Name: " + form.name);
        show_debug_message("Age: " + form.age);
        show_debug_message("Email: " + form.email);
        show_debug_message("Phone: " + form.phone);
        show_debug_message("Education: " + form.edu);
        show_debug_message("Major: " + form.major);

        // 🔥 MASUKIN KE DATABASE ARRAY
        array_push(global.users, form);

        // reset form biar bisa input lagi
        global.form = {
            name  : "",
            age   : "",
            email : "",
            phone : "",
            edu   : "",
            major : ""
        };

        found = true;
    }

    // === CLICK LUAR ===
    if(!found){
        global.focused_input = noone;
        ui.major_open = false;
        ui.edu_open = false;
    }
}

// ================= INPUT =================
var str = keyboard_string;

if(str != ""){
    
    for(var i=1; i<=string_length(str); i++){
        
        var ch = string_char_at(str, i);
        
        switch(global.focused_input){
            
            case "name":
                if(string_length(form.name) < 20)
                    form.name += ch;
            break;
            
            case "age":
                if(string_digits(ch) != "" && string_length(form.age) < 3)
                    form.age += ch;
            break;
            
            case "email":
                if(ord(ch) >= 32 && ord(ch) <= 126 && string_length(form.email) < 40)
                    form.email += ch;
            break;
            
            case "phone":
                if(string_digits(ch) != "" && string_length(form.phone) < 14)
                    form.phone += ch;
            break;
        }
    }
}

// reset anti spam
keyboard_string = "";

// ================= BACKSPACE =================
if(keyboard_check_pressed(vk_backspace)){
    
    if(global.focused_input=="name" && string_length(form.name)>0)
        form.name = string_delete(form.name,string_length(form.name),1);
        
    if(global.focused_input=="age" && string_length(form.age)>0)
        form.age = string_delete(form.age,string_length(form.age),1);
        
    if(global.focused_input=="email" && string_length(form.email)>0)
        form.email = string_delete(form.email,string_length(form.email),1);
        
    if(global.focused_input=="phone" && string_length(form.phone)>0)
        form.phone = string_delete(form.phone,string_length(form.phone),1);
}

// ================= TAB =================
if(keyboard_check_pressed(vk_tab)){
    var idx = array_index_of(fields, global.focused_input);
    idx = (idx+1) mod 4;
    global.focused_input = fields[idx];
}

// ================= SCROLL =================
if(form.edu != "" && ui.major_open){
    
    var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;

    var major_base = pos_y[5];
    var list_y = major_base + box_h + 8;
    var list_h = box_h * global.config.max_visible;

    if(point_in_rectangle(mx,my,
        input_x, list_y,
        input_x + box_w, list_y + list_h)){
        
        var scroll = mouse_wheel_up() - mouse_wheel_down();
        ui.scroll += scroll * global.config.scroll_speed;
    }

    var max_scroll = max(0, array_length(list)*box_h - list_h);
    ui.scroll = clamp(ui.scroll, -max_scroll, 0);
}