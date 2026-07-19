switch(state)
{
    case ORDER_STATE.STAGE_RESULT:

    //------------------------------------------------
    // Background
    //------------------------------------------------

    draw_set_alpha(0.55);
    draw_set_color(c_black);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);

    //------------------------------------------------
    // Panel
    //------------------------------------------------

    var x1 = 220;
    var y1 = 60;

    var x2 = 1060;
    var y2 = 640;

    // Shadow
    draw_set_color(make_color_rgb(25,18,15));

    draw_rectangle(
        x1 + 6,
        y1 + 6,
        x2 + 6,
        y2 + 6,
        false
    );

    // Border
    draw_set_color(make_color_rgb(135,95,60));

    draw_rectangle(
        x1,
        y1,
        x2,
        y2,
        false
    );

    // Fill
    draw_set_color(make_color_rgb(50,36,28));

    draw_rectangle(
        x1+4,
        y1+4,
        x2-4,
        y2-4,
        false
    );

    //------------------------------------------------
    // Header
    //------------------------------------------------

    draw_set_color(c_white);

    draw_text(
        x1 + 260,
        y1 + 25,
        "MISSION REPORT"
    );

    draw_line(
        x1 + 20,
        y1 + 70,
        x2 - 20,
        y1 + 70
    );

    //------------------------------------------------
    // Statistik
    //------------------------------------------------

    draw_text(x1+40,y1+110,"Correct");
    draw_text(x1+220,y1+110,string(correct_count));

    draw_text(x1+40,y1+160,"Wrong");
    draw_text(x1+220,y1+160,string(wrong_count));

    draw_text(x1+40,y1+210,"Timeout");
    draw_text(x1+220,y1+210,string(timeout_count));

    draw_text(x1+40,y1+260,"Accuracy");

    draw_set_color(c_lime);

    draw_text(
        x1+220,
        y1+260,
        string(final_accuracy) + "%"
    );

    draw_set_color(c_white);

    draw_text(x1+40,y1+320,"Rank");

    switch(final_rank)
    {
        case "A":

            draw_set_color(c_yellow);

        break;

        case "B":

            draw_set_color(c_orange);

        break;

        default:

            draw_set_color(c_red);

        break;
    }

    //draw_set_font(fnt_title);

    draw_text(
        x1+220,
        y1+300,
        final_rank
    );

   // draw_set_font(fnt_default);

    draw_set_color(c_white);

    //------------------------------------------------
    // History
    //------------------------------------------------

    draw_text(
        x1+430,
        y1+110,
        "CUSTOMER HISTORY"
    );

    for(var i=0;i<array_length(customer_log);i++)
    {
        var txt = customer_log[i];

        if(string_pos("[BERHASIL]",txt)>0)
            draw_set_color(c_lime);
        else
        if(string_pos("[GAGAL]",txt)>0)
            draw_set_color(c_red);
        else
            draw_set_color(c_yellow);

        draw_text(
            x1+430,
            y1+150 + i*28,
            txt
        );
    }

    //------------------------------------------------
    // Continue
    //------------------------------------------------

    draw_set_color(c_white);

    draw_line(
        x1+20,
        y2-70,
        x2-20,
        y2-70
    );

    draw_text(
        x1+270,
        y2-40,
        "CLICK TO CONTINUE"
    );

    break;
}

//----------------------------------------------------
// CUSTOMER UI
//----------------------------------------------------

if(state == ORDER_STATE.MINIGAME)
{
    draw_sprite_ext(
        spr_Potrait,
        1,
        1,
        1,
        3.9,
        3.9,
        0,
        c_white,
        1
    );

    draw_sprite_ext(
        current_portrait,
        0,
        63,
        35,
        portrait_scale,
        portrait_scale,
        0,
        c_white,
        1
    );

    var name_bar_x = 75;
    var name_bar_y = 185;

    var name_bar_w = 105;
    var name_bar_h = 30;

    draw_set_alpha(0.75);
    draw_set_color(make_color_rgb(18,18,25));

    draw_rectangle(
        name_bar_x,
        name_bar_y,
        name_bar_x + name_bar_w,
        name_bar_y + name_bar_h,
        false
    );

    draw_set_alpha(1);

    draw_set_color(npc_color);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        name_bar_x + name_bar_w * 0.5,
        name_bar_y + name_bar_h * 0.5,
        npc_name
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_set_color(c_white);
}




if(state != ORDER_STATE.MINIGAME || !show_menu)
{
    exit;
}

// =======================
// MULAI DRAW MENU
// =======================

//----------------------------------------------------
// TIME
//----------------------------------------------------

var sec   = ceil(time_left / room_speed);
var ratio = clamp(
    time_left / (time_limit * room_speed),
    0,
    1
);


//----------------------------------------------------
// OBJECTIVE PANEL
//----------------------------------------------------

draw_set_alpha(0.55);
draw_set_color(c_black);

draw_roundrect(
    250,
    8,
    620,
    42,
    false
);

draw_set_alpha(1);

draw_set_halign(fa_left);

draw_set_color(c_yellow);

draw_text(
    270,
    18,
    "SORT & SEARCH"
);

draw_set_color(c_white);
// Background Hitam 75%
draw_set_alpha(0.75);
draw_set_color(make_color_rgb(18,18,25));

var obj_x = 390;
var obj_y = 10;
var obj_w = 360;
var obj_h = 45;

// Background
draw_set_alpha(0.75);
draw_set_color(make_color_rgb(32,22,18));

draw_rectangle(
    obj_x,
    obj_y,
    obj_x + obj_w,
    obj_y + obj_h,
    false
);

draw_set_alpha(1);

// Outline
draw_set_color(make_color_rgb(175,135,75));

draw_rectangle(
    obj_x,
    obj_y,
    obj_x + obj_w,
    obj_y + obj_h,
    true
);

// Judul
draw_set_color(c_yellow);

draw_text(
    obj_x + 12,
    obj_y + 6,
    "Task: "
);

// Isi
draw_set_color(c_white);

draw_text(
    obj_x + 12,
    obj_y + 24,
    "Urutkan menu berdasarkan harga"
);


//----------------------------------------------------
// REQUEST
//----------------------------------------------------

var bubble_x = 245;
var bubble_y = 32;

var text_x = bubble_x + 28;
var text_y = bubble_y + 18;
var text_width = 180;

// Judul request
src_draw_text_outline_ext(
    430,
    70,
    req_text,
    18,
    text_width,
    c_yellow
);

// Dialog NPC
src_draw_text_outline_ext(
    bubble_x + 25,
    bubble_y + 50,
    dialog_req,
    23,      // jarak antar baris
    100,     // lebar maksimum bubble
    c_white
);

draw_set_color(c_yellow);

draw_text(
    menu_panel_x + 20,
    menu_panel_y + 18,
    "TIME"
);

draw_set_color(c_white);

draw_text(
    menu_panel_x + 78,
    menu_panel_y + 18,
    string(sec) + " s"
);
var bar_w = 300;
var bar_h = 18;

  draw_set_color(c_maroon);
// HEADER
draw_set_color(c_aqua);

draw_text(menu_start_x + 10,menu_header_y,"MENU");
draw_text(menu_start_x + 145,menu_header_y,"PRICE");
draw_text(menu_start_x + 245,menu_header_y,"TASTE");
draw_text(menu_start_x + 335,menu_header_y,"CATEGORY");

draw_set_color(c_aqua);

draw_line(
    menu_start_x,
    menu_line_y,
    menu_start_x + 400,
    menu_line_y
);
draw_set_color(c_gray);

draw_rectangle(
    menu_panel_x + 20,
    menu_panel_y + 50,
    menu_panel_x + 20 + bar_w,
    menu_panel_y + 50 + bar_h,
    false
);

draw_set_color(c_lime);

draw_rectangle(
    menu_panel_x + 20,
    menu_panel_y + 50,
    menu_panel_x + 20 + (bar_w * ratio),
    menu_panel_y + 50 + bar_h,
    false
);

   /*var start_index =
floor(
    //scroll_offset /
    menu_slot_h
);

var end_index =
min(
    start_index + //visible_rows,
    array_length(menu_data)
);*/

//----------------------------------------------------
// MENU LIST
//----------------------------------------------------

for (var i = 0; i < array_length(menu_data); i++)
{
    var yy = menu_start_y + i * menu_slot_h;

    //----------------------------------
    // HOVER
    //----------------------------------

    if (i == hover_menu)
    {
        draw_set_alpha(0.18);
        draw_set_color(c_yellow);

        draw_roundrect(
            menu_start_x - 8,
            yy - 8,
            menu_start_x + menu_width,
            yy + 30,
            false
        );

        draw_set_alpha(1);
    }

    //----------------------------------
    // SELECTED
    //----------------------------------

    if (i == selected_index)
    {
        draw_set_alpha(0.28);
        draw_set_color(c_aqua);

        draw_roundrect(
            menu_start_x - 8,
            yy - 8,
            menu_start_x + menu_width,
            yy + 30,
            false
        );

        draw_set_alpha(1);
    }

    //----------------------------------
    // DRAGGING
    //----------------------------------

    if (is_dragging && i == drag_index)
    {
        draw_set_alpha(0.30);
        draw_set_color(c_lime);

        draw_roundrect(
            menu_start_x - 8,
            yy - 8,
            menu_start_x + menu_width,
            yy + 30,
            false
        );

        draw_set_alpha(1);
    }

    //----------------------------------
    // DROP TARGET
    //----------------------------------

    if (is_dragging && i == hover_index)
    {
        draw_set_alpha(0.12);
        draw_set_color(c_orange);

        draw_roundrect(
            menu_start_x - 8,
            yy - 8,
            menu_start_x + menu_width,
            yy + 30,
            false
        );

        draw_set_alpha(1);

        draw_set_color(c_orange);

        draw_roundrect(
            menu_start_x - 8,
            yy - 8,
            menu_start_x + menu_width,
            yy + 30,
            true
        );
    }

    //----------------------------------
    // DATA
    //----------------------------------

    draw_set_color(c_white);

    var d = string_split(menu_data[i], "|");

    draw_text(menu_start_x + 10,  yy, d[0]);
    draw_text(menu_start_x + 170, yy, d[1]);
    draw_text(menu_start_x + 260, yy, d[2]);
    draw_text(menu_start_x + 340, yy, d[3]);
}

/*if(i == selected_index)
{
    draw_set_alpha(0.3);
    draw_set_color(c_aqua);

    draw_rectangle(
        menu_start_x - 5,
        yy - 5,
        menu_start_x + menu_width,
        yy + 40,
        false
    );

    draw_set_alpha(1);
}*/
//----------------------------------------------------
// RESULT
//----------------------------------------------------

draw_set_color(c_aqua);

draw_text(
    menu_panel_x + 30,
    menu_panel_y + 390,
    "HASIL"
);

draw_set_color(c_white);

draw_text_ext(
    menu_panel_x + 30,
    menu_panel_y + 415,
    search_result,
    18,
    340
);

draw_set_color(c_lime);

draw_text_ext(
    menu_panel_x + 30,
    menu_panel_y + 445,
    result_message,
    18,
    340
);


//----------------------------------------------------
// BUTTON : SEARCH
//----------------------------------------------------

if (can_search)
{
    draw_set_color(
        hover_search ? c_aqua : c_blue
    );
}
else
{
    draw_set_color(c_gray);
}

draw_roundrect(
    btn_search_x,
    btn_search_y,
    btn_search_x + btn_search_w,
    btn_search_y + btn_search_h,
    false
);

draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    btn_search_x + btn_search_w * 0.5,
    btn_search_y + btn_search_h * 0.5,
    "SEARCH"
);


//----------------------------------------------------
// BUTTON : SUBMIT
//----------------------------------------------------

if (can_submit)
{
    draw_set_color(
        hover_submit ? c_lime : c_green
    );
}
else
{
    draw_set_color(c_gray);
}

draw_roundrect(
    btn_submit_x,
    btn_submit_y,
    btn_submit_x + btn_submit_w,
    btn_submit_y + btn_submit_h,
    false
);

draw_set_color(c_white);

draw_text(
    btn_submit_x + btn_submit_w * 0.5,
    btn_submit_y + btn_submit_h * 0.5,
    "SUBMIT"
);


//----------------------------------------------------
// BUTTON : WIN RATE
//----------------------------------------------------

draw_set_color(
    hover_winrate
    ? c_yellow
    : c_orange
);

draw_roundrect(
    btn_winrate_x,
    btn_winrate_y,
    btn_winrate_x + btn_winrate_w,
    btn_winrate_y + btn_winrate_h,
    false
);

draw_set_color(c_white);

draw_text(
    btn_winrate_x + btn_winrate_w * 0.5,
    btn_winrate_y + btn_winrate_h * 0.5,
    "WIN RATE"
);


//----------------------------------------------------
// BUTTON : BACK
//----------------------------------------------------

draw_set_color(c_teal);

draw_roundrect(
    btn_backmain_x,
    btn_backmain_y,
    btn_backmain_x + btn_backmain_w,
    btn_backmain_y + btn_backmain_h,
    false
);

draw_set_color(c_white);




//----------------------------------------------------
// RESET DRAW STATE
//----------------------------------------------------

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_color(c_white);

draw_text(
    btn_backmain_x + 10,
    btn_backmain_y + 5,
    "back to\nmain Miguel"
);
