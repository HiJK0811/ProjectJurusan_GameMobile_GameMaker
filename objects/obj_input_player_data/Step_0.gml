// ================= GUI MOUSE =================
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var click = mouse_check_button_pressed(mb_left);

// ================= SHORTCUT =================
var form = global.form;
var ui   = global.ui_state;
var fp   = global.field_pos;

// ================= FIELD TEXT =================
var fields = ["name","age","email","phone"];

// ================= CLICK =================
if(click){

    var found = false;

    // === INPUT FIELD TEXT (name/age/email/phone) ===
    if(point_in_rectangle(mx,my, fp.name.x, fp.name.y, fp.name.x+fp.name.w, fp.name.y+fp.name.h)){
        global.focused_input = "name";
        found = true;
    }
    if(point_in_rectangle(mx,my, fp.age.x, fp.age.y, fp.age.x+fp.age.w, fp.age.y+fp.age.h)){
        global.focused_input = "age";
        found = true;
    }
    if(point_in_rectangle(mx,my, fp.email.x, fp.email.y, fp.email.x+fp.email.w, fp.email.y+fp.email.h)){
        global.focused_input = "email";
        found = true;
    }
    if(point_in_rectangle(mx,my, fp.phone.x, fp.phone.y, fp.phone.x+fp.phone.w, fp.phone.y+fp.phone.h)){
        global.focused_input = "phone";
        found = true;
    }

    // === TOGGLE GENDER DROPDOWN ===
    if(point_in_rectangle(mx,my, fp.gender.x, fp.gender.y, fp.gender.x+fp.gender.w, fp.gender.y+fp.gender.h)){
        
        ui.gender_open = !ui.gender_open;
        ui.edu_open = false;
        ui.major_open = false;
        global.focused_input = noone;
        found = true;
    }

    // === PILIH GENDER ===
    if(ui.gender_open){
        for(var i=0;i<array_length(global.genders);i++){
            var gy1 = fp.gender.y + fp.gender.h + i*fp.gender.h;
            var gy2 = gy1 + fp.gender.h;

            if(point_in_rectangle(mx,my, fp.gender.x, gy1, fp.gender.x+fp.gender.w, gy2)){
                form.gender = global.genders[i];
                ui.gender_open = false;
                found = true;
            }
        }
    }

    // === TOGGLE DROPDOWN EDU ===
    if(point_in_rectangle(mx,my, fp.edu.x, fp.edu.y, fp.edu.x+fp.edu.w, fp.edu.y+fp.edu.h)){
        
        ui.edu_open = !ui.edu_open;
        ui.major_open = false;
        ui.gender_open = false;
        global.focused_input = noone;
        found = true;
    }

    // === PILIH SMA / SMK ===
    if(ui.edu_open){
        
        if(point_in_rectangle(mx,my,
            fp.edu.x, fp.edu.y + fp.edu.h,
            fp.edu.x + fp.edu.w, fp.edu.y + fp.edu.h * 2)){
            
            form.edu = "SMA";
            form.major = "";
            ui.scroll = 0;
            ui.major_open = false;
            ui.edu_open = false;
            found = true;
        }

        if(point_in_rectangle(mx,my,
            fp.edu.x, fp.edu.y + fp.edu.h * 2,
            fp.edu.x + fp.edu.w, fp.edu.y + fp.edu.h * 3)){
            
            form.edu = "SMK";
            form.major = "";
            ui.scroll = 0;
            ui.major_open = false;
            ui.edu_open = false;
            found = true;
        }
    }

    // === TOGGLE MAJOR (SEKARANG PAKAI fp.major LANGSUNG) ===
    if(form.edu != ""){
        
        if(point_in_rectangle(mx,my,
            fp.major.x, fp.major.y,
            fp.major.x + fp.major.w, fp.major.y + fp.major.h)){
            
            ui.major_open = !ui.major_open;
            found = true;
        }
    }

    // === PILIH MAJOR ===
    if(form.edu != "" && ui.major_open){
        
        var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;

        var list_y = fp.major.y + fp.major.h + 6;
        var list_h = fp.major.h * global.config.max_visible;

        for(var i=0;i<array_length(list);i++){
            
            var yy = list_y + i * fp.major.h + ui.scroll;

            if(point_in_rectangle(mx,my,
                fp.major.x, yy,
                fp.major.x + fp.major.w, yy + fp.major.h)){
                
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
        show_debug_message("Gender: " + form.gender);
        show_debug_message("Education: " + form.edu);
        show_debug_message("Major: " + form.major);

        // 🔥 SIMPAN NAME & GENDER KE GLOBAL TERPISAH (buat minigame)
        global.player_name   = form.name;
        global.player_gender = form.gender;

        // 🔥 MASUKIN KE DATABASE ARRAY
       // 🔥 MASUKIN KE DATABASE ARRAY (samakan dengan sidebar debug)
array_push(global.user_data, form);

        // reset form biar bisa input lagi
        global.form = {
            name   : "",
            age    : "",
            email  : "",
            phone  : "",
            gender : "",
            edu    : "",
            major  : ""
        };

        found = true;
    }

    // === CLICK LUAR ===
    if(!found){
        global.focused_input = noone;
        ui.major_open  = false;
        ui.edu_open    = false;
        ui.gender_open = false;
    }

    // === EXPLORE / MIGUEL BUTTON ===
var btn_x = 700;
var btn_y = 340;
var btn_w = 200;
var btn_h = 160;

if(point_in_rectangle(mx, my, btn_x, btn_y, btn_x + btn_w, btn_y + btn_h)){
    audio_play_sound(snd_click, 1, false);
    room_goto(room_explore_mainRoom);
    found = true;
}
}

  


// ================= INPUT TEXT =================
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

// ================= SCROLL MAJOR (SEKARANG PAKAI fp.major LANGSUNG) =================
if(form.edu != "" && ui.major_open){
    
    var list = (form.edu=="SMA") ? global.majors_SMA : global.majors_SMK;

    var list_y = fp.major.y + fp.major.h + 6;
    var list_h = fp.major.h * global.config.max_visible;

    if(point_in_rectangle(mx,my,
        fp.major.x, list_y,
        fp.major.x + fp.major.w, list_y + list_h)){
        
        var scroll = mouse_wheel_up() - mouse_wheel_down();
        ui.scroll += scroll * global.config.scroll_speed;
    }

    var max_scroll = max(0, array_length(list)*fp.major.h - list_h);
    ui.scroll = clamp(ui.scroll, -max_scroll, 0);
}