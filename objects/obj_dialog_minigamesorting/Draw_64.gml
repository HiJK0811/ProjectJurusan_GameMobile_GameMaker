/// obj_dialog_minigamesorting : Draw GUI
//----------------------------------------------------
// PLAYER NAME INPUT
//----------------------------------------------------

if(typing_name)
{
    draw_set_alpha(0.6);
    draw_set_color(c_black);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);

    var xx = 300;
    var yx = 180;
    var w = 680;
    var h = 220;

    draw_set_color(make_color_rgb(48,35,25));

    draw_roundrect(
        xx,
        yx,
        xx+w,
        yx+h,
        false
    );

    draw_set_color(make_color_rgb(180,135,75));

    draw_roundrect(
        xx,
        yx,
        xx+w,
        yx+h,
        true
    );

    draw_set_color(c_yellow);

    draw_text(
        x+30,
        y+30,
        "WELCOME TO COSMIC CAFE"
    );

    draw_set_color(c_white);

    draw_text(
        x+30,
        y+80,
        "Masukkan Nama:"
    );

    draw_set_color(c_black);

    draw_rectangle(
        x+30,
        y+120,
        x+w-30,
        y+165,
        false
    );

    draw_set_color(c_white);

    draw_text(
        x+40,
        y+132,
        player_name_input + "|"
    );

    draw_set_color(c_aqua);

    draw_text(
        x+30,
        y+185,
        "ENTER untuk memulai"
    );

    exit;
}
//----------------------------------------------------
// BACKGROUND PANEL
//----------------------------------------------------

draw_set_alpha(0.85);
draw_set_color(make_color_rgb(42,30,22));

draw_roundrect(
    box_x,
    box_y,
    box_x + box_w,
    box_y + box_h,
    false
);

draw_set_alpha(1);

//----------------------------------------------------
// BORDER
//----------------------------------------------------

draw_set_color(make_color_rgb(170,130,75));

draw_roundrect(
    box_x,
    box_y,
    box_x + box_w,
    box_y + box_h,
    true
);

//----------------------------------------------------
// HEADER
//----------------------------------------------------

draw_set_color(make_color_rgb(72,52,35));

draw_rectangle(
    box_x,
    box_y,
    box_x + box_w,
    box_y + 48,
    false
);

//----------------------------------------------------
// PORTRAIT FRAME
//----------------------------------------------------

var px = box_x + 25;
var py = box_y + 70;

draw_set_color(make_color_rgb(170,130,75));

draw_roundrect(
    px,
    py,
    px + 150,
    py + 150,
    false
);

draw_set_color(make_color_rgb(60,45,35));

draw_roundrect(
    px + 3,
    py + 3,
    px + 147,
    py + 147,
    false
);

//----------------------------------------------------
// PORTRAIT
//----------------------------------------------------

if(dialog_portrait != noone)
{
  draw_sprite_ext(
    dialog_portrait,
    0,
    34,
    467,
    0.15,
    0.15,
    0,
    c_white,
    1
);
}

//----------------------------------------------------
// NAMA
//----------------------------------------------------

draw_set_color(c_yellow);

draw_text(
    box_x + 205,
    box_y + 14,
    dialog_name
);

draw_set_color(c_white);

draw_text(
    box_x + 205,
    box_y + 34,
    "Senior Barista"
);

//----------------------------------------------------
// GARIS
//----------------------------------------------------

draw_set_color(make_color_rgb(170,130,75));

draw_line(
    box_x + 195,
    box_y + 60,
    box_x + box_w - 20,
    box_y + 60
);

//----------------------------------------------------
// DIALOG
//----------------------------------------------------

if(array_length(dialog_lines) > 0)
{
   /* var txt = string_copy(
        dialog_lines[dialog_index],
        1,
        floor(text_length)
    );*/
	var full_text = string_replace_all(
    dialog_lines[dialog_index],
    "{player}",
    global.player_name
);

var txt = string_copy(
    full_text,
    1,
    floor(text_length)
);

    draw_set_color(c_white);

    draw_text_ext(
        box_x + 205,
        box_y + 80,
        txt,
        26,
        700
    );
}

//----------------------------------------------------
// SKIP BUTTON
//----------------------------------------------------

draw_set_alpha(0.85);
draw_set_color(make_color_rgb(55,40,30));

draw_roundrect(
    skip_x,
    skip_y,
    skip_x + skip_w,
    skip_y + skip_h,
    false
);

draw_set_alpha(1);

draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    skip_x + skip_w/2,
    skip_y + skip_h/2,
    "SKIP"
);

//----------------------------------------------------
// CONTINUE
//----------------------------------------------------

if(finished_typing)
{
    draw_set_alpha(
        0.6 + abs(sin(current_time/180))*0.4
    );

    draw_set_color(c_aqua);

    draw_text(
        box_x + box_w - 250,
        box_y + box_h - 30,
        "▶ CLICK ANYWHERE"
    );

    draw_set_alpha(1);
}

//----------------------------------------------------
// RESET
//----------------------------------------------------

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_alpha(1);

draw_set_color(c_white);